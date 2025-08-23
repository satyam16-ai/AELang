// ir_codegen.c - IR-to-Assembly Code Generator for ÆLang
#include "ir_codegen.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Global state for code generation
static CompilationConfig *current_config = NULL;
static int temp_offset_map[1000];  // Map temp IDs to stack offsets
static char *variable_names[1000]; // Map variable indices to names
static int variable_offsets[1000]; // Map variable indices to stack offsets
static int variable_count = 0;
static int current_stack_offset = 0;
static int string_literal_count = 0;
static char *string_literals[1000];
static int float_const_count = 0;
static float float_constants[1000];
// static int current_arg_count = 0; // Track arguments for current function call - UNUSED

// Parameter collection for correct calling convention
// static IROperand *param_buffer[100];  // Buffer to collect parameters - UNUSED
// static int param_buffer_count = 0;    // Number of parameters in buffer - UNUSED

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

// Get argument register for System V ABI (x86-64) - UNUSED
/*
static const char* get_argument_register(int arg_index) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        const char* arg_regs[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
        if (arg_index < 6) {
            return arg_regs[arg_index];
        }
    }
    return NULL; // Use stack for additional args or 32-bit
}
*/

// String and constant management
static int find_or_add_string(const char *str) {
    // Just store the raw string - escape processing will happen during assembly output
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

// Get or create variable offset
static int get_variable_offset(const char *var_name) {
    // Check if variable already exists
    for (int i = 0; i < variable_count; i++) {
        if (strcmp(variable_names[i], var_name) == 0) {
            return variable_offsets[i];
        }
    }
    
    // Create new variable mapping
    if (variable_count < 1000) {
        variable_names[variable_count] = strdup(var_name);
        variable_offsets[variable_count] = current_stack_offset;
        current_stack_offset -= get_word_size();
        return variable_offsets[variable_count++];
    }
    
    return -get_word_size(); // Fallback
}

// Initialize temp and variable offset mappings
static void init_offset_mappings(IRProgram *ir_program) {
    // Reset mappings
    for (int i = 0; i < 1000; i++) {
        temp_offset_map[i] = -1;
    }
    
    // Reset variable mappings
    for (int i = 0; i < variable_count; i++) {
        free(variable_names[i]);
    }
    variable_count = 0;
    
    // Reset string and float constants
    for (int i = 0; i < string_literal_count; i++) {
        free(string_literals[i]);
    }
    string_literal_count = 0;
    float_const_count = 0;
    
    current_stack_offset = -get_word_size(); // Start below base pointer
    
    // First pass: collect all string literals and float constants from global instructions
    if (ir_program->global_instructions) {
        for (IRInstruction *instr = ir_program->global_instructions; instr; instr = instr->next) {
            if (instr->src1 && instr->src1->type == OPERAND_CONST_STR) {
                find_or_add_string(instr->src1->value.str_val);
            }
            if (instr->src2 && instr->src2->type == OPERAND_CONST_STR) {
                find_or_add_string(instr->src2->value.str_val);
            }
            if (instr->src1 && instr->src1->type == OPERAND_CONST_FLOAT) {
                find_or_add_float(instr->src1->value.float_val);
            }
            if (instr->src2 && instr->src2->type == OPERAND_CONST_FLOAT) {
                find_or_add_float(instr->src2->value.float_val);
            }
        }
    }
    
    // First pass: collect all string literals and float constants from function instructions
    for (IRFunction *func = ir_program->functions; func; func = func->next) {
        for (IRInstruction *instr = func->instructions; instr; instr = instr->next) {
            if (instr->src1 && instr->src1->type == OPERAND_CONST_STR) {
                find_or_add_string(instr->src1->value.str_val);
            }
            if (instr->src2 && instr->src2->type == OPERAND_CONST_STR) {
                find_or_add_string(instr->src2->value.str_val);
            }
            if (instr->src1 && instr->src1->type == OPERAND_CONST_FLOAT) {
                find_or_add_float(instr->src1->value.float_val);
            }
            if (instr->src2 && instr->src2->type == OPERAND_CONST_FLOAT) {
                find_or_add_float(instr->src2->value.float_val);
            }
        }
    }
    
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
            
            // Pre-allocate variables
            if (instr->src1 && instr->src1->type == OPERAND_VAR) {
                get_variable_offset(instr->src1->value.name);
            }
            if (instr->src2 && instr->src2->type == OPERAND_VAR) {
                get_variable_offset(instr->src2->value.name);
            }
        }
    }
    
    // Assign stack offsets to temporaries
    for (int i = 0; i <= max_temp_id; i++) {
        temp_offset_map[i] = current_stack_offset;
        current_stack_offset -= get_word_size();
    }
}

// Get memory size specifier for architecture
static const char* get_memory_size(void) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        return "qword";
    } else {
        return "dword";
    }
}

// Get stack location for operand with size specifier
static void emit_operand_location_with_size(IROperand *operand, FILE *out) {
    if (!operand) return;
    
    switch (operand->type) {
        case OPERAND_TEMP:
            fprintf(out, "%s [%s%+d]", get_memory_size(), get_base_pointer(), temp_offset_map[operand->value.temp_id]);
            break;
        case OPERAND_VAR: {
            int offset = get_variable_offset(operand->value.name);
            fprintf(out, "%s [%s%+d]", get_memory_size(), get_base_pointer(), offset);
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

// Get stack location for operand
static void emit_operand_location(IROperand *operand, FILE *out) {
    if (!operand) return;
    
    switch (operand->type) {
        case OPERAND_TEMP:
            fprintf(out, "[%s%+d]", get_base_pointer(), temp_offset_map[operand->value.temp_id]);
            break;
        case OPERAND_VAR: {
            int offset = get_variable_offset(operand->value.name);
            fprintf(out, "[%s%+d]", get_base_pointer(), offset);
            break;
        }
        case OPERAND_CONST_INT:
            fprintf(out, "%d", operand->value.int_val);
            break;
        case OPERAND_CONST_FLOAT: {
            int float_idx = find_or_add_float(operand->value.float_val);
            fprintf(out, "dword [float_%d]", float_idx);
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
    const char *reg_a = get_int_register();
    const char *reg_b = get_int_register_b();
    
    // Load first operand with proper memory size handling
    fprintf(out, "    mov %s, ", reg_a);
    if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
        emit_operand_location_with_size(instr->src1, out);
    } else {
        emit_operand_location(instr->src1, out);
    }
    fprintf(out, "\n");
    
    if (instr->src2) {
        // Load second operand with proper memory size handling
        fprintf(out, "    mov %s, ", reg_b);
        if (instr->src2->type == OPERAND_TEMP || instr->src2->type == OPERAND_VAR) {
            emit_operand_location_with_size(instr->src2, out);
        } else {
            emit_operand_location(instr->src2, out);
        }
        fprintf(out, "\n");
        
        // Perform integer arithmetic operation
        switch (instr->opcode) {
            case IR_ADD:
                fprintf(out, "    add %s, %s\n", reg_a, reg_b);
                break;
            case IR_SUB:
                fprintf(out, "    sub %s, %s\n", reg_a, reg_b);
                break;
            case IR_MUL:
                // Use imul for signed multiplication
                fprintf(out, "    imul %s, %s\n", reg_a, reg_b);
                break;
            case IR_DIV:
                // For division, need to use idiv instruction
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    cqo\n");  // Sign extend rax to rdx:rax
                } else {
                    fprintf(out, "    cdq\n");  // Sign extend eax to edx:eax
                }
                fprintf(out, "    idiv %s\n", reg_b);
                break;
            case IR_MOD:
                // For modulo, use idiv and take remainder (in rdx/edx)
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    cqo\n");  // Sign extend rax to rdx:rax
                } else {
                    fprintf(out, "    cdq\n");  // Sign extend eax to edx:eax
                }
                fprintf(out, "    idiv %s\n", reg_b);
                fprintf(out, "    mov %s, %s\n", reg_a, 
                       current_config && current_config->target_arch == ARCH_64BIT ? "rdx" : "edx");
                break;
            default:
                break;
        }
    }
    
    // Store result with proper size specifier
    fprintf(out, "    mov ");
    emit_operand_location_with_size(instr->dest, out);
    fprintf(out, ", %s\n", reg_a);
}

// Emit comparison operations
static void emit_comparison_op(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    const char *rbx = get_int_register_b();
    
    // Load operands with proper memory size handling
    fprintf(out, "    mov %s, ", rax);
    if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
        emit_operand_location_with_size(instr->src1, out);
    } else {
        emit_operand_location(instr->src1, out);
    }
    fprintf(out, "\n");
    
    fprintf(out, "    mov %s, ", rbx);
    if (instr->src2->type == OPERAND_TEMP || instr->src2->type == OPERAND_VAR) {
        emit_operand_location_with_size(instr->src2, out);
    } else {
        emit_operand_location(instr->src2, out);
    }
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
    
    // Store result with proper size specifier
    fprintf(out, "    mov ");
    emit_operand_location_with_size(instr->dest, out);
    fprintf(out, ", %s\n", rax);
}

// Emit logical operations
static void emit_logical_op(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    const char *rbx = get_int_register_b();
    
    switch (instr->opcode) {
        case IR_LOGICAL_AND:
            // Load first operand
            fprintf(out, "    mov %s, ", rax);
            if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src1, out);
            } else {
                emit_operand_location(instr->src1, out);
            }
            fprintf(out, "\n");
            
            // Load second operand
            fprintf(out, "    mov %s, ", rbx);
            if (instr->src2->type == OPERAND_TEMP || instr->src2->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src2, out);
            } else {
                emit_operand_location(instr->src2, out);
            }
            fprintf(out, "\n");
            
            // Logical AND: result = (a != 0) && (b != 0)
            fprintf(out, "    test %s, %s\n", rax, rax);
            fprintf(out, "    setne al\n");
            fprintf(out, "    test %s, %s\n", rbx, rbx);
            fprintf(out, "    setne bl\n");
            fprintf(out, "    and al, bl\n");
            fprintf(out, "    movzx %s, al\n", rax);
            break;
            
        case IR_LOGICAL_OR:
            // Load first operand
            fprintf(out, "    mov %s, ", rax);
            if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src1, out);
            } else {
                emit_operand_location(instr->src1, out);
            }
            fprintf(out, "\n");
            
            // Load second operand
            fprintf(out, "    mov %s, ", rbx);
            if (instr->src2->type == OPERAND_TEMP || instr->src2->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src2, out);
            } else {
                emit_operand_location(instr->src2, out);
            }
            fprintf(out, "\n");
            
            // Logical OR: result = (a != 0) || (b != 0)
            fprintf(out, "    test %s, %s\n", rax, rax);
            fprintf(out, "    setne al\n");
            fprintf(out, "    test %s, %s\n", rbx, rbx);
            fprintf(out, "    setne bl\n");
            fprintf(out, "    or al, bl\n");
            fprintf(out, "    movzx %s, al\n", rax);
            break;
            
        case IR_NOT:
            // Load operand
            fprintf(out, "    mov %s, ", rax);
            if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src1, out);
            } else {
                emit_operand_location(instr->src1, out);
            }
            fprintf(out, "\n");
            
            // Logical NOT: result = !(a != 0)
            fprintf(out, "    test %s, %s\n", rax, rax);
            fprintf(out, "    sete al\n");
            fprintf(out, "    movzx %s, al\n", rax);
            break;
            
        case IR_NEG:
            // Load operand
            fprintf(out, "    mov %s, ", rax);
            if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src1, out);
            } else {
                emit_operand_location(instr->src1, out);
            }
            fprintf(out, "\n");
            
            // Arithmetic negation: result = -operand
            fprintf(out, "    neg %s\n", rax);
            break;
            
        default:
            break;
    }
    
    // Store result
    fprintf(out, "    mov ");
    emit_operand_location_with_size(instr->dest, out);
    fprintf(out, ", %s\n", rax);
}

// Emit control flow operations
static void emit_control_flow(IRInstruction *instr, FILE *out) {
    const char *rax = get_int_register();
    
    // Safety check
    if (!instr) {
        fprintf(stderr, "Error: NULL instruction in emit_control_flow\n");
        return;
    }
    
    switch (instr->opcode) {
        case IR_LABEL:
            if (instr->dest && instr->dest->value.name) {
                fprintf(out, "%s:\n", instr->dest->value.name);
            } else {
                fprintf(stderr, "Error: NULL label name in IR_LABEL\n");
            }
            break;
        case IR_GOTO:
            if (instr->dest && instr->dest->value.name) {
                fprintf(out, "    jmp %s\n", instr->dest->value.name);
            } else {
                fprintf(stderr, "Error: NULL destination in IR_GOTO\n");
            }
            break;
        case IR_IF_GOTO:
            if (instr->src1 && instr->dest && instr->dest->value.name) {
                fprintf(out, "    mov %s, ", rax);
                if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                    emit_operand_location_with_size(instr->src1, out);
                } else {
                    emit_operand_location(instr->src1, out);
                }
                fprintf(out, "\n");
                fprintf(out, "    test %s, %s\n", rax, rax);
                fprintf(out, "    jnz %s\n", instr->dest->value.name);
            } else {
                fprintf(stderr, "Error: NULL operands in IR_IF_GOTO\n");
            }
            break;
        case IR_IF_FALSE_GOTO:
            if (instr->src1 && instr->dest && instr->dest->value.name) {
                fprintf(out, "    mov %s, ", rax);
                if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                    emit_operand_location_with_size(instr->src1, out);
                } else {
                    emit_operand_location(instr->src1, out);
                }
                fprintf(out, "\n");
                fprintf(out, "    test %s, %s\n", rax, rax);
                fprintf(out, "    jz %s\n", instr->dest->value.name);
            } else {
                fprintf(stderr, "Error: NULL operands in IR_IF_FALSE_GOTO\n");
            }
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
            // Emit parameter comment only - actual parameter passing handled in IR_CALL
            fprintf(out, "    ; IR: PARAM src1\n");
            break;
        case IR_CALL: {
            // Use parameters embedded in the call instruction
            IROperand **call_params = instr->params;
            int call_param_count = instr->param_count;
            
            // Architecture-aware function calling with proper parameter handling
            if (current_config && current_config->target_arch == ARCH_64BIT) {
                // For 64-bit, emit parameters in normal order using registers then stack
                const char *arg_regs[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
                for (int i = 0; i < call_param_count; i++) {
                    if (i < 6) {
                        // Use registers for first 6 arguments
                        fprintf(out, "    mov %s, ", arg_regs[i]);
                        if (call_params[i]->type == OPERAND_CONST_INT) {
                            fprintf(out, "%d", call_params[i]->value.int_val);
                        } else if (call_params[i]->type == OPERAND_CONST_STR) {
                            int str_idx = find_or_add_string(call_params[i]->value.str_val);
                            fprintf(out, "msg_%d", str_idx);
                        } else {
                            emit_operand_location(call_params[i], out);
                        }
                        fprintf(out, "\n");
                    } else {
                        // Use stack for additional arguments
                        fprintf(out, "    push ");
                        if (call_params[i]->type == OPERAND_CONST_INT || call_params[i]->type == OPERAND_CONST_STR) {
                            emit_operand_location(call_params[i], out);
                        } else {
                            emit_operand_location_with_size(call_params[i], out);
                        }
                        fprintf(out, "\n");
                    }
                }
                
                // For System V ABI variadic functions, set %al to 0 (no XMM registers used for integers)
                fprintf(out, "    mov rax, 0  ; no XMM registers used\n");
                // Align stack for System V ABI (16-byte alignment)
                fprintf(out, "    and rsp, -16  ; align stack\n");
            } else {
                // For 32-bit, emit parameters in REVERSE order (right-to-left for stack)
                for (int i = call_param_count - 1; i >= 0; i--) {
                    if (call_params[i]->type == OPERAND_CONST_INT || call_params[i]->type == OPERAND_CONST_STR) {
                        fprintf(out, "    push ");
                        emit_operand_location(call_params[i], out);
                        fprintf(out, "\n");
                    } else {
                        // For memory operands, push with size specifier
                        fprintf(out, "    push ");
                        emit_operand_location_with_size(call_params[i], out);
                        fprintf(out, "\n");
                    }
                }
            }
            
            // Map ÆLang function names to C library function names
            const char *actual_function_name = instr->src1->value.name;
            if (strcmp(actual_function_name, "print") == 0) {
                actual_function_name = "printf";
            }
            
            fprintf(out, "    call %s\n", actual_function_name);
            
            // Clean up stack for 32-bit calling convention
            if (current_config && current_config->target_arch == ARCH_32BIT && call_param_count > 0) {
                fprintf(out, "    add esp, %d  ; clean up stack\n", call_param_count * 4);
            }
            
            if (instr->dest) {
                // Store return value with proper type handling
                fprintf(out, "    mov ");
                emit_operand_location_with_size(instr->dest, out);
                fprintf(out, ", %s\n", get_int_register());
            }
            
            // No need to reset global counters since we're using local parameters
            break;
        }
        case IR_RETURN:
            if (instr->src1) {
                fprintf(out, "    mov %s, ", rax);
                if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                    emit_operand_location_with_size(instr->src1, out);
                } else {
                    emit_operand_location(instr->src1, out);
                }
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
        case IR_LOAD_CONST: {
            // Use appropriate register and memory size for float constants
            if (instr->src1->type == OPERAND_CONST_FLOAT) {
                fprintf(out, "    mov eax, ");
                emit_operand_location(instr->src1, out);
                fprintf(out, "\n");
                // For float destinations, use dword size
                if (instr->dest->type == OPERAND_TEMP) {
                    fprintf(out, "    mov dword [%s%+d], eax\n", get_base_pointer(), temp_offset_map[instr->dest->value.temp_id]);
                } else if (instr->dest->type == OPERAND_VAR) {
                    int offset = get_variable_offset(instr->dest->value.name);
                    fprintf(out, "    mov dword [%s%+d], eax\n", get_base_pointer(), offset);
                }
            } else {
                fprintf(out, "    mov %s, ", rax);
                if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                    emit_operand_location_with_size(instr->src1, out);
                } else {
                    emit_operand_location(instr->src1, out);
                }
                fprintf(out, "\n");
                fprintf(out, "    mov ");
                emit_operand_location_with_size(instr->dest, out);
                fprintf(out, ", %s\n", rax);
            }
            break;
        }
        case IR_ASSIGN:
            fprintf(out, "    mov %s, ", rax);
            if (instr->src1->type == OPERAND_TEMP || instr->src1->type == OPERAND_VAR) {
                emit_operand_location_with_size(instr->src1, out);
            } else {
                emit_operand_location(instr->src1, out);
            }
            fprintf(out, "\n");
            fprintf(out, "    mov ");
            emit_operand_location_with_size(instr->dest, out);
            fprintf(out, ", %s\n", rax);
            break;
        case IR_LOAD_VAR: {
            // Check if we're loading a float variable
            if (instr->src1->data_type == TYPE_F32 || instr->src1->data_type == TYPE_F64) {
                fprintf(out, "    mov eax, ");
                if (instr->src1->type == OPERAND_TEMP) {
                    fprintf(out, "dword [%s%+d]", get_base_pointer(), temp_offset_map[instr->src1->value.temp_id]);
                } else if (instr->src1->type == OPERAND_VAR) {
                    int offset = get_variable_offset(instr->src1->value.name);
                    fprintf(out, "dword [%s%+d]", get_base_pointer(), offset);
                }
                fprintf(out, "\n");
                fprintf(out, "    mov ");
                if (instr->dest->type == OPERAND_TEMP) {
                    fprintf(out, "dword [%s%+d], eax\n", get_base_pointer(), temp_offset_map[instr->dest->value.temp_id]);
                } else if (instr->dest->type == OPERAND_VAR) {
                    int offset = get_variable_offset(instr->dest->value.name);
                    fprintf(out, "dword [%s%+d], eax\n", get_base_pointer(), offset);
                }
            } else {
                fprintf(out, "    mov %s, ", rax);
                emit_operand_location_with_size(instr->src1, out);
                fprintf(out, "\n");
                fprintf(out, "    mov ");
                emit_operand_location_with_size(instr->dest, out);
                fprintf(out, ", %s\n", rax);
            }
            break;
        }
        case IR_STORE_VAR: {
            // Check if we're storing to a float variable
            if (instr->src1->data_type == TYPE_F32 || instr->src1->data_type == TYPE_F64) {
                fprintf(out, "    mov eax, ");
                if (instr->src2->type == OPERAND_TEMP) {
                    fprintf(out, "dword [%s%+d]", get_base_pointer(), temp_offset_map[instr->src2->value.temp_id]);
                } else if (instr->src2->type == OPERAND_VAR) {
                    int offset = get_variable_offset(instr->src2->value.name);
                    fprintf(out, "dword [%s%+d]", get_base_pointer(), offset);
                } else {
                    emit_operand_location_with_size(instr->src2, out);
                }
                fprintf(out, "\n");
                fprintf(out, "    mov ");
                if (instr->src1->type == OPERAND_TEMP) {
                    fprintf(out, "dword [%s%+d], eax\n", get_base_pointer(), temp_offset_map[instr->src1->value.temp_id]);
                } else if (instr->src1->type == OPERAND_VAR) {
                    int offset = get_variable_offset(instr->src1->value.name);
                    fprintf(out, "dword [%s%+d], eax\n", get_base_pointer(), offset);
                }
            } else {
                fprintf(out, "    mov %s, ", rax);
                emit_operand_location_with_size(instr->src2, out);  // src2 is the value to store
                fprintf(out, "\n");
                fprintf(out, "    mov ");
                emit_operand_location_with_size(instr->src1, out);  // src1 is the variable location
                fprintf(out, ", %s\n", rax);
            }
            break;
        }
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
    } else if (instr->opcode >= IR_LOGICAL_AND && instr->opcode <= IR_SHR) {
        emit_logical_op(instr, out);
    } else if (instr->opcode >= IR_LABEL && instr->opcode <= IR_IF_FALSE_GOTO) {
        emit_control_flow(instr, out);
    } else if (instr->opcode == IR_CALL || instr->opcode == IR_RETURN || instr->opcode == IR_PARAM) {
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
        
        // String literals - handle special characters properly
        for (int i = 0; i < string_literal_count; i++) {
            fprintf(out, "msg_%d db ", i);
            
            const char *str = string_literals[i];
            bool first = true;
            
            while (*str) {
                if (!first) fprintf(out, ",");
                first = false;
                
                if (*str == '\\' && *(str + 1)) {
                    str++;
                    switch (*str) {
                        case 'n': fprintf(out, "10"); break;    // Newline
                        case 't': fprintf(out, "9"); break;     // Tab  
                        case 'r': fprintf(out, "13"); break;    // Carriage return
                        case '\\': fprintf(out, "92"); break;   // Backslash
                        case '"': fprintf(out, "34"); break;    // Quote
                        default: 
                            fprintf(out, "92,%d", (unsigned char)*str); // Backslash + char
                            break;
                    }
                    str++;
                } else {
                    // Regular character - group consecutive ones in quotes
                    fprintf(out, "\"");
                    while (*str && !(*str == '\\' && *(str + 1))) {
                        fputc(*str, out);
                        str++;
                    }
                    fprintf(out, "\"");
                }
            }
            fprintf(out, ",0\n");
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
    
    // External function declarations - architecture aware
    if (config->target_arch == ARCH_32BIT) {
        fprintf(out, "    extern printf\n");
        fprintf(out, "    extern read\n");
        fprintf(out, "    extern read_with_type\n");
    } else {
        fprintf(out, "    extern printf\n");
        fprintf(out, "    extern read\n");
        fprintf(out, "    extern read_with_type\n");
    }
    fprintf(out, "\n");
    
    // Emit functions
    for (IRFunction *func = ir_program->functions; func; func = func->next) {
        fprintf(out, "%s:\n", func->name);
        
        // Emit prologue for ALL functions
        emit_ir_prologue(out, config);
        
        // Store function parameters from registers to stack for non-main functions
        if (strcmp(func->name, "main") != 0 && func->param_count > 0) {
            if (config->target_arch == ARCH_64BIT) {
                // 64-bit uses register-based parameter passing
                const char *param_regs_64[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
                int max_reg_params = 6;
                
                for (int i = 0; i < func->param_count && i < max_reg_params; i++) {
                    if (func->parameters[i]) {
                        int param_offset = get_variable_offset(func->parameters[i]->value.name);
                        fprintf(out, "    ; Store parameter %s from %s\n", 
                               func->parameters[i]->value.name, param_regs_64[i]);
                        fprintf(out, "    mov %s [%s%d], %s\n", 
                               get_memory_size(), get_base_pointer(), param_offset, param_regs_64[i]);
                    }
                }
            } else {
                // 32-bit uses stack-based parameter passing (starting at ebp+8)
                for (int i = 0; i < func->param_count; i++) {
                    if (func->parameters[i]) {
                        int param_offset = get_variable_offset(func->parameters[i]->value.name);
                        int stack_offset = 8 + (i * 4);  // ebp+8, ebp+12, ebp+16, etc.
                        fprintf(out, "    ; Store parameter %s from stack [ebp+%d]\n", 
                               func->parameters[i]->value.name, stack_offset);
                        fprintf(out, "    mov eax, [ebp+%d]\n", stack_offset);
                        fprintf(out, "    mov [%s%d], eax\n", 
                               get_base_pointer(), param_offset);
                    }
                }
            }
        }
        
        // Emit global instructions only at the start of main function
        if (strcmp(func->name, "main") == 0 && ir_program->global_instructions) {
            for (IRInstruction *global_instr = ir_program->global_instructions; 
                 global_instr; global_instr = global_instr->next) {
                emit_ir_instruction(global_instr, out, config);
            }
        }
        
        // Emit function instructions
        for (IRInstruction *instr = func->instructions; instr; instr = instr->next) {
            emit_ir_instruction(instr, out, config);
        }
        
        // Emit epilogue for ALL functions
        if (strcmp(func->name, "main") == 0) {
            fprintf(out, "    mov %s, 0\n", get_int_register());
        }
        fprintf(out, "    mov %s, %s\n", get_stack_pointer(), get_base_pointer());
        fprintf(out, "    pop %s\n", get_base_pointer());
        fprintf(out, "    ret\n");
        
        fprintf(out, "\n");
    }
    
    emit_ir_epilogue(out, config);
    return true;
}
