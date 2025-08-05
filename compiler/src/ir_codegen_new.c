// ir_codegen.c - IR-to-Assembly Code Generator for ÆLang
#define _GNU_SOURCE
#include "ir_codegen.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Global state for code generation
static CompilationConfig *current_config = NULL;
static int temp_offset_map[1000];  // Map temp IDs to stack offsets
static int var_offset_map[1000];   // Map variable hashes to stack offsets
static int current_stack_offset = 0;
static int string_literal_count = 0;
static char *string_literals[1000];
static int float_const_count = 0;
static float float_constants[1000];
static int label_counter = 0;

// Architecture-aware helpers
static const char* get_int_register(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rax" : "eax";
}

static const char* get_int_register_b(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rbx" : "ebx";
}

static const char* get_stack_pointer(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rsp" : "esp";
}

static const char* get_base_pointer(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rbp" : "ebp";
}

static int get_word_size(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? 8 : 4;
}

static const char* get_word_directive(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "dq" : "dd";
}

static const char* get_mov_instruction(void) {
    return "mov";
}

// String and constant management
static int find_or_add_string(const char *str) {
    for (int i = 0; i < string_literal_count; i++) {
        if (strcmp(string_literals[i], str) == 0) {
            return i;
        }
    }
    string_literals[string_literal_count] = strdup(str);
    return string_literal_count++;
}

static int find_or_add_float(float val) {
    for (int i = 0; i < float_const_count; i++) {
        if (float_constants[i] == val) {
            return i;
        }
    }
    float_constants[float_const_count] = val;
    return float_const_count++;
}

// Initialize temp and variable offset mappings
static void init_offset_mappings(IRProgram *ir_program) {
    // Reset mappings
    for (int i = 0; i < 1000; i++) {
        temp_offset_map[i] = -1;
        var_offset_map[i] = -1;
    }
    
    current_stack_offset = -get_word_size(); // Start below base pointer
    
    // Find maximum temp ID used in the program
    int max_temp_id = -1;
    for (IRFunction *func = ir_program->functions; func; func = func->next) {
        for (IRInstruction *instr = func->instructions; instr; instr = instr->next) {
            if (instr->dest && instr->dest->type == OPERAND_TEMP) {
                if (instr->dest->value.temp_id > max_temp_id) {
                    max_temp_id = instr->dest->value.temp_id;
                }
            }
            if (instr->src1 && instr->src1->type == OPERAND_TEMP) {
                if (instr->src1->value.temp_id > max_temp_id) {
                    max_temp_id = instr->src1->value.temp_id;
                }
            }
            if (instr->src2 && instr->src2->type == OPERAND_TEMP) {
                if (instr->src2->value.temp_id > max_temp_id) {
                    max_temp_id = instr->src2->value.temp_id;
                }
            }
        }
    }
    
    // Assign stack offsets to temporaries
    for (int i = 0; i <= max_temp_id; i++) {
        temp_offset_map[i] = current_stack_offset;
        current_stack_offset -= get_word_size();
    }
    
    // Assign stack offsets to variables (using hash for mapping)
    int var_offset = current_stack_offset;
    for (int i = 0; i <= max_temp_id; i++) {
        if (var_offset_map[i] == -1) {
            var_offset_map[i] = var_offset;
            var_offset -= get_word_size();
        }
    }
}

// Get stack location for operand
static void emit_operand_location(IROperand *operand, FILE *out) {
    if (!operand) return;
    
    switch (operand->type) {
        case OPERAND_TEMP:
            fprintf(out, "[%s%+d]", get_base_pointer(), temp_offset_map[operand->value.temp_id]);
            break;
        case OPERAND_VAR: {
            int hash = 0;
            for (const char *c = operand->value.name; *c; c++) {
                hash = (hash * 31 + *c) % 1000; // Simple hash function
            }
            if (var_offset_map[hash] != -1) {
                fprintf(out, "[%s%+d]", get_base_pointer(), var_offset_map[hash]);
            } else {
                fprintf(out, "[UNKNOWN_VAR]"); // Debugging fallback
            }
            break;
        }
        case OPERAND_CONST_INT:
            fprintf(out, "%d", operand->value.int_val);
            break;
        case OPERAND_CONST_FLOAT: {
            int float_idx = find_or_add_float(operand->value.float_val);
            fprintf(out, "float_%d", float_idx);
            break;
        }
        case OPERAND_CONST_STR: {
            int str_idx = find_or_add_string(operand->value.str_val);
            fprintf(out, "msg_%d", str_idx);
            break;
        }
        case OPERAND_LABEL:
            fprintf(out, "%s", operand->value.name);
            break;
        case OPERAND_FUNCTION:
            fprintf(out, "%s", operand->value.name);
            break;
    }
}

// Emit arithmetic operations
static void emit_arithmetic_op(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    const char *rbx = get_int_register_b();
    
    // Load first operand into rax
    fprintf(out, "    mov %s, ", rax);
    emit_operand_location(instr->src1, out);
    fprintf(out, "\n");
    
    // Load second operand into rbx (if needed)
    if (instr->src2) {
        fprintf(out, "    mov %s, ", rbx);
        emit_operand_location(instr->src2, out);
        fprintf(out, "\n");
        
        // Perform operation
        switch (instr->opcode) {
            case IR_ADD:
                fprintf(out, "    add %s, %s\n", rax, rbx);
                break;
            case IR_SUB:
                fprintf(out, "    sub %s, %s\n", rax, rbx);
                break;
            case IR_MUL:
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    imul %s, %s\n", rax, rbx);
                } else {
                    fprintf(out, "    imul %s\n", rbx);
                }
                break;
            case IR_DIV:
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    xor rdx, rdx\n");
                    fprintf(out, "    idiv %s\n", rbx);
                } else {
                    fprintf(out, "    xor edx, edx\n");
                    fprintf(out, "    idiv %s\n", rbx);
                }
                break;
            case IR_MOD:
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    xor rdx, rdx\n");
                    fprintf(out, "    idiv %s\n", rbx);
                    fprintf(out, "    mov %s, rdx\n", rax);
                } else {
                    fprintf(out, "    xor edx, edx\n");
                    fprintf(out, "    idiv %s\n", rbx);
                    fprintf(out, "    mov %s, edx\n", rax);
                }
                break;
            default:
                break;
        }
    }
    
    // Store result
    fprintf(out, "    mov ");
    emit_operand_location(instr->dest, out);
    fprintf(out, ", %s\n", rax);
}

// Emit comparison operations
static void emit_comparison_op(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    const char *rbx = get_int_register_b();
    
    // Load operands
    fprintf(out, "    mov %s, ", rax);
    emit_operand_location(instr->src1, out);
    fprintf(out, "\n");
    
    fprintf(out, "    mov %s, ", rbx);
    emit_operand_location(instr->src2, out);
    fprintf(out, "\n");
    
    // Compare
    fprintf(out, "    cmp %s, %s\n", rax, rbx);
    
    // Set result based on comparison
    switch (instr->opcode) {
        case IR_EQ:
            fprintf(out, "    sete al\n");
            break;
        case IR_NEQ:
            fprintf(out, "    setne al\n");
            break;
        case IR_LT:
            fprintf(out, "    setl al\n");
            break;
        case IR_GT:
            fprintf(out, "    setg al\n");
            break;
        case IR_LEQ:
            fprintf(out, "    setle al\n");
            break;
        case IR_GEQ:
            fprintf(out, "    setge al\n");
            break;
        default:
            break;
    }
    
    // Zero-extend to full register
    fprintf(out, "    movzx %s, al\n", rax);
    
    // Store result
    fprintf(out, "    mov ");
    emit_operand_location(instr->dest, out);
    fprintf(out, ", %s\n", rax);
}

// Emit control flow operations
static void emit_control_flow(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    
    switch (instr->opcode) {
        case IR_LABEL:
            fprintf(out, "%s:\n", instr->dest->value.name);
            break;
        case IR_GOTO:
            fprintf(out, "    jmp %s\n", instr->dest->value.name);
            break;
        case IR_IF_GOTO:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    test %s, %s\n", rax, rax);
            fprintf(out, "    jnz %s\n", instr->dest->value.name);
            break;
        case IR_IF_FALSE_GOTO:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    test %s, %s\n", rax, rax);
            fprintf(out, "    jz %s\n", instr->dest->value.name);
            break;
        default:
            break;
    }
}

// Emit function operations
static void emit_function_ops(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    
    switch (instr->opcode) {
        case IR_PARAM:
            fprintf(out, "    push ");
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            break;
        case IR_CALL:
            fprintf(out, "    call %s\n", instr->src1->value.name);
            if (instr->dest) {
                fprintf(out, "    mov ");
                emit_operand_location(instr->dest, out);
                fprintf(out, ", %s\n", rax);
            }
            break;
        case IR_RETURN:
            if (instr->src1) {
                fprintf(out, "    mov %s, ", rax);
                emit_operand_location(instr->src1, out);
                fprintf(out, "\n");
            }
            fprintf(out, "    mov %s, %s\n", get_stack_pointer(), get_base_pointer());
            fprintf(out, "    pop %s\n", get_base_pointer());
            fprintf(out, "    ret\n");
            break;
        default:
            break;
    }
}

// Emit variable operations
static void emit_variable_ops(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    
    switch (instr->opcode) {
        case IR_LOAD_CONST:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    mov ");
            emit_operand_location(instr->dest, out);
            fprintf(out, ", %s\n", rax);
            break;
        case IR_ASSIGN:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    mov ");
            emit_operand_location(instr->dest, out);
            fprintf(out, ", %s\n", rax);
            break;
        case IR_LOAD_VAR:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    mov ");
            emit_operand_location(instr->dest, out);
            fprintf(out, ", %s\n", rax);
            break;
        case IR_STORE_VAR:
            fprintf(out, "    mov %s, ", rax);
            emit_operand_location(instr->src1, out);
            fprintf(out, "\n");
            fprintf(out, "    mov ");
            emit_operand_location(instr->dest, out);
            fprintf(out, ", %s\n", rax);
            break;
        default:
            break;
    }
}

// Main instruction emission function
void emit_ir_instruction(IRInstruction *instr, FILE *out, CompilationConfig *config) {
    if (!instr) return;
    
    current_config = config;
    
    // Emit comment for debugging
    fprintf(out, "    ; IR: %s", opcode_to_string(instr->opcode));
    if (instr->dest) fprintf(out, " dest");
    if (instr->src1) fprintf(out, " src1");
    if (instr->src2) fprintf(out, " src2");
    fprintf(out, "\n");
    
    // Handle different instruction categories
    if (instr->opcode >= IR_ADD && instr->opcode <= IR_MOD) {
        emit_arithmetic_op(instr, out);
    } else if (instr->opcode >= IR_EQ && instr->opcode <= IR_GEQ) {
        emit_comparison_op(instr, out);
    } else if (instr->opcode >= IR_LABEL && instr->opcode <= IR_IF_FALSE_GOTO) {
        emit_control_flow(instr, out);
    } else if (instr->opcode >= IR_PARAM && instr->opcode <= IR_RETURN) {
        emit_function_ops(instr, out);
    } else {
        emit_variable_ops(instr, out);
    }
}

// Emit function prologue
void emit_ir_prologue(FILE *out, CompilationConfig *config) {
    current_config = config;
    const char *rbp = get_base_pointer();
    const char *rsp = get_stack_pointer();
    
    fprintf(out, "    push %s\n", rbp);
    fprintf(out, "    mov %s, %s\n", rbp, rsp);
    
    // Allocate stack space for local variables
    int stack_space = -current_stack_offset;
    if (stack_space > 0) {
        fprintf(out, "    sub %s, %d\n", rsp, stack_space);
    }
}

// Emit function epilogue
void emit_ir_epilogue(FILE *out, CompilationConfig *config) {
    (void)config; // Suppress unused parameter warning
    fprintf(out, "\n; End of generated code\n");
}

// Write escaped string to output
static void write_escaped_string(FILE *out, const char *str) {
    while (*str) {
        if (*str == '\\' && *(str + 1)) {
            str++;
            switch (*str) {
                case 'n': fprintf(out, "\\n"); break;
                case 't': fprintf(out, "\\t"); break;
                case 'r': fprintf(out, "\\r"); break;
                case '\\': fprintf(out, "\\\\"); break;
                case '"': fprintf(out, "\\\""); break;
                default: fputc(*str, out); break;
            }
            str++;
        } else {
            fputc(*str, out);
            str++;
        }
    }
}

// Main IR to assembly generation function
bool generate_asm_from_ir(IRProgram *ir_program, FILE *out, CompilationConfig *config) {
    if (!ir_program || !out || !config) {
        return false;
    }
    
    current_config = config;
    
    // Initialize offset mappings
    init_offset_mappings(ir_program);
    
    // Emit NASM header
    fprintf(out, "; Generated NASM by ÆLang IR-to-Assembly Compiler\n");
    fprintf(out, "; Target Architecture: %s\n", 
            config->target_arch == ARCH_64BIT ? "64-bit" : "32-bit");
    fprintf(out, "\n");
    
    // Emit data sections
    if (string_literal_count > 0 || float_const_count > 0) {
        fprintf(out, "section .rodata\n");
        fprintf(out, "    align %d\n", get_word_size());
        
        // String literals
        for (int i = 0; i < string_literal_count; i++) {
            fprintf(out, "msg_%d db \"", i);
            write_escaped_string(out, string_literals[i]);
            fprintf(out, "\",0\n");
        }
        
        // Float constants
        for (int i = 0; i < float_const_count; i++) {
            float f = float_constants[i];
            unsigned int *float_bits = (unsigned int*)&f;
            fprintf(out, "float_%d: dd 0x%08x  ; %.9g\n", i, *float_bits, f);
        }
        
        fprintf(out, "\n");
    }
    
    // Emit BSS section for temporary storage
    fprintf(out, "section .bss\n");
    fprintf(out, "    align %d\n", get_word_size());
    fprintf(out, "    temp_storage: res%c 1  ; temporary storage\n", 
            config->target_arch == ARCH_64BIT ? 'q' : 'd');
    fprintf(out, "\n");
    
    // Emit text section
    fprintf(out, "section .text\n");
    fprintf(out, "    global main\n");
    fprintf(out, "    extern printf\n");
    fprintf(out, "    extern print\n");
    fprintf(out, "    extern read\n");
    fprintf(out, "    extern read_int\n");
    fprintf(out, "    extern read_float\n");
    fprintf(out, "    extern read_num\n");
    fprintf(out, "\n");
    
    // Emit functions
    for (IRFunction *func = ir_program->functions; func; func = func->next) {
        fprintf(out, "%s:\n", func->name);
        
        // Only emit prologue for main function (simplified)
        if (strcmp(func->name, "main") == 0) {
            emit_ir_prologue(out, config);
        }
        
        // Emit instructions
        for (IRInstruction *instr = func->instructions; instr; instr = instr->next) {
            emit_ir_instruction(instr, out, config);
        }
        
        // Only emit epilogue for main function (simplified)
        if (strcmp(func->name, "main") == 0) {
            fprintf(out, "    mov %s, 0\n", get_int_register());
            fprintf(out, "    mov %s, %s\n", get_stack_pointer(), get_base_pointer());
            fprintf(out, "    pop %s\n", get_base_pointer());
            fprintf(out, "    ret\n");
        }
        
        fprintf(out, "\n");
    }
    
    emit_ir_epilogue(out, config);
    return true;
}
