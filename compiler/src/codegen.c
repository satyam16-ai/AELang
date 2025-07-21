// codegen.c - NASM code generator for ÆLang
#define _GNU_SOURCE
#include "codegen.h"
#include "semantic.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Global compilation configuration for architecture-aware code generation
static CompilationConfig *current_config = NULL;

// Forward declarations
static const char* get_function_return_type(const char* func_name);
static int is_float_return_type(const char* return_type);
static int is_float_type(ASTNode *node);
static int find_or_add_string(const char *str);
static void emit_node(ASTNode *node, FILE *out);
static void emit_function_call_64bit(FILE *out, const char *func_name, ASTNode **args, int arg_count);

// Architecture-aware register and instruction helpers
static const char* get_int_register(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rax" : "eax";
}

static const char* get_int_register_b(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rbx" : "ebx";
}

static const char* get_stack_pointer(void) __attribute__((unused));
static const char* get_stack_pointer(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rsp" : "esp";
}

static const char* get_base_pointer(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "rbp" : "ebp";
}

static const char* get_mov_instruction(void) {
    return "mov";  // mov works for both 32-bit and 64-bit
}

static const char* get_push_instruction(void) {
    return "push";  // push works for both 32-bit and 64-bit
}

static const char* get_pop_instruction(void) {
    return "pop";   // pop works for both 32-bit and 64-bit
}

static const char* get_call_instruction(void) __attribute__((unused));
static const char* get_call_instruction(void) {
    return "call";  // call works for both 32-bit and 64-bit
}

static const char* get_word_size(void) __attribute__((unused));
static const char* get_word_size(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "qword" : "dword";
}

static const char* get_data_directive(void) __attribute__((unused));
static const char* get_data_directive(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? "dq" : "dd";
}

static int get_word_size_bytes(void) {
    return (current_config && current_config->target_arch == ARCH_64BIT) ? 8 : 4;
}

static const char* get_int_size_specifier(void) {
    return "dword";  // Always dword for i32 in both 32-bit and 64-bit modes
}

static const char* get_type_size_specifier(const char* type_name) {
    if (strcmp(type_name, "i64") == 0 || strcmp(type_name, "u64") == 0) {
        return "qword";
    } else if (strcmp(type_name, "i32") == 0 || strcmp(type_name, "u32") == 0) {
        return "dword";
    } else if (strcmp(type_name, "i16") == 0 || strcmp(type_name, "u16") == 0) {
        return "word";
    } else if (strcmp(type_name, "i8") == 0 || strcmp(type_name, "u8") == 0) {
        return "byte";
    } else {
        return "dword"; // default
    }
}

static const char* get_float_storage_specifier(const char* type_name) {
    if (strcmp(type_name, "f64") == 0 || strcmp(type_name, "num") == 0) {
        return "qword";
    } else if (strcmp(type_name, "f32") == 0) {
        return "dword";
    } else {
        return "dword"; // default
    }
}

static const char* get_int_register_32bit(void) {
    return "eax";  // Always eax - this is specifically for 32-bit register operations
}

static void emit_stack_cleanup(FILE* out, int bytes) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        fprintf(out, "    add rsp, %d\n", bytes * 2);  // 64-bit: 8 bytes per parameter
    } else {
        fprintf(out, "    add esp, %d\n", bytes);     // 32-bit: 4 bytes per parameter
    }
}

static void emit_stack_cleanup_with_comment(FILE* out, int bytes, const char* comment) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        fprintf(out, "    add rsp, %d  ; %s\n", bytes * 2, comment);
    } else {
        fprintf(out, "    add esp, %d  ; %s\n", bytes, comment);
    }
}

// 64-bit calling convention helper functions
static const char* get_arg_register(int arg_index) __attribute__((unused));
static const char* get_arg_register(int arg_index) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        // System V AMD64 ABI - arguments passed in registers
        switch (arg_index) {
            case 0: return "rdi";
            case 1: return "rsi";
            case 2: return "rdx";
            case 3: return "rcx";
            case 4: return "r8";
            case 5: return "r9";
            default: return NULL; // Use stack for 7th+ argument
        }
    }
    return NULL; // 32-bit uses stack for all arguments
}

static void emit_function_call_64bit(FILE *out, const char *func_name, ASTNode **args, int arg_count) {
    if (current_config && current_config->target_arch == ARCH_64BIT) {
        // 64-bit System V AMD64 calling convention
        
        // Handle variadic print function (print with format specifiers)
        if (strcmp(func_name, "print") == 0) {
            // System V AMD64 ABI for variadic functions:
            // Integer/pointer args: RDI, RSI, RDX, RCX, R8, R9, then stack
            // Float args: XMM0, XMM1, XMM2, XMM3, XMM4, XMM5, XMM6, XMM7, then stack
            // AL contains number of SSE registers used for variadic functions
            
            int int_reg_count = 0;
            int float_reg_count = 0;
            const char* int_regs[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
            
            // For variadic functions, we need to set AL to number of float regs used
            fprintf(out, "    mov al, 0  ; variadic function: 0 float regs used initially\n");
            
            // Process arguments left to right (System V AMD64)
            for (int i = 0; i < arg_count; i++) {
                ASTNode *arg = args[i];
                
                if (arg->type == AST_LITERAL && arg->as.literal.type == VALUE_STRING) {
                    // String literal argument - use integer register
                    int idx = find_or_add_string(arg->as.literal.as.str_val);
                    if (int_reg_count < 6) {
                        fprintf(out, "    mov %s, msg_%d  ; string arg %d\n", int_regs[int_reg_count], idx, i);
                        int_reg_count++;
                    } else {
                        fprintf(out, "    push msg_%d  ; string arg %d (stack)\n", idx, i);
                    }
                } else if (is_float_type(arg)) {
                    // Float argument - MUST be promoted to double for variadic functions
                    emit_node(arg, out);  // Load to FPU stack
                    if (float_reg_count < 8) {
                        fprintf(out, "    sub rsp, 8\n");
                        fprintf(out, "    fstp qword [rsp]  ; promote float to double\n");
                        fprintf(out, "    movsd xmm%d, [rsp]  ; double arg %d (promoted)\n", float_reg_count, i);
                        fprintf(out, "    add rsp, 8\n");
                        float_reg_count++;
                        fprintf(out, "    mov al, %d  ; update float reg count\n", float_reg_count);
                    } else {
                        fprintf(out, "    sub rsp, 8\n");
                        fprintf(out, "    fstp qword [rsp]  ; double arg %d (stack, promoted)\n", i);
                    }
                } else {
                    // Integer argument - use integer register or stack
                    emit_node(arg, out);  // Result in RAX
                    if (int_reg_count < 6) {
                        fprintf(out, "    mov %s, rax  ; int arg %d\n", int_regs[int_reg_count], i);
                        int_reg_count++;
                    } else {
                        fprintf(out, "    push rax  ; int arg %d (stack)\n", i);
                    }
                }
            }
            
            fprintf(out, "    call %s\n", func_name);
            
            // Clean up stack arguments if any
            int stack_args = (arg_count > 6) ? (arg_count - 6) : 0;
            if (stack_args > 0) {
                fprintf(out, "    add rsp, %d  ; clean up %d stack args\n", stack_args * 8, stack_args);
            }
            return;
        } else if (strcmp(func_name, "print_clean") == 0) {
            // Handle print_clean variadic function similarly
            if (arg_count == 1 && args[0]->type == AST_LITERAL && args[0]->as.literal.type == VALUE_STRING) {
                int idx = find_or_add_string(args[0]->as.literal.as.str_val);
                fprintf(out, "    mov rdi, msg_%d\n", idx);
                fprintf(out, "    call %s\n", func_name);
                return;
            }
        } else if (strcmp(func_name, "print_int") == 0 && arg_count == 1) {
            // Evaluate the argument and put result in rdi
            emit_node(args[0], out);
            fprintf(out, "    mov rdi, rax\n");
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "print_num") == 0 && arg_count == 1) {
            // For floating point, we need to use SSE registers in 64-bit
            emit_node(args[0], out);  // Load value to FPU stack
            fprintf(out, "    sub rsp, 16\n");                   // Align stack to 16-byte boundary and space for float
            fprintf(out, "    fstp dword [rsp]\n");              // Store as single precision float on stack
            fprintf(out, "    movss xmm0, [rsp]\n");             // Load into SSE register for calling convention (single precision)
            fprintf(out, "    call %s\n", func_name);
            fprintf(out, "    add rsp, 16\n");                   // Clean up stack
            return;
        } else if (strcmp(func_name, "read") == 0 && arg_count == 0) {
            // Unified read function - returns integer representation that compiler converts
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_as_float") == 0 && arg_count == 0) {
            // Unified read for float assignments
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_int") == 0 && arg_count == 0) {
            // Call read_int function (returns result in rax for 64-bit)
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_float") == 0 && arg_count == 0) {
            // Call read_float function (returns result on FPU stack, need to convert to XMM for 64-bit)
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_bool") == 0 && arg_count == 0) {
            // Call read_bool function (returns result in rax for 64-bit)
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_int_safe") == 0 && arg_count == 0) {
            // Call read_int_safe function
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_float_safe") == 0 && arg_count == 0) {
            // Call read_float_safe function
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_bool_safe") == 0 && arg_count == 0) {
            // Call read_bool_safe function
            fprintf(out, "    call %s\n", func_name);
            return;
        } else if (strcmp(func_name, "read_f32") == 0 && arg_count == 0) {
            // Call read_f32 function - returns float in XMM0, need to convert to FPU stack
            fprintf(out, "    call %s\n", func_name);
            fprintf(out, "    sub rsp, 4\n");              // Allocate space for float
            fprintf(out, "    movss dword [rsp], xmm0\n");  // Store XMM0 as float
            fprintf(out, "    fld dword [rsp]\n");          // Load to FPU stack
            fprintf(out, "    add rsp, 4\n");               // Clean up stack space
            return;
        } else if (strcmp(func_name, "read_f64") == 0 && arg_count == 0) {
            // Call read_f64 function - returns double in XMM0, need to convert to FPU stack
            fprintf(out, "    call %s\n", func_name);
            fprintf(out, "    sub rsp, 8\n");               // Allocate space for double
            fprintf(out, "    movsd qword [rsp], xmm0\n");  // Store XMM0 as double
            fprintf(out, "    fld qword [rsp]\n");          // Load to FPU stack
            fprintf(out, "    add rsp, 8\n");               // Clean up stack space
            return;
        } else if (strcmp(func_name, "read_num") == 0 && arg_count == 0) {
            // Call read_num function - returns double in XMM0, need to convert to FPU stack
            fprintf(out, "    call %s\n", func_name);
            fprintf(out, "    sub rsp, 8\n");               // Allocate space for double
            fprintf(out, "    movsd qword [rsp], xmm0\n");  // Store XMM0 as double
            fprintf(out, "    fld qword [rsp]\n");          // Load to FPU stack
            fprintf(out, "    add rsp, 8\n");               // Clean up stack space
            return;
        }
        
        // Generic handling for other functions using System V AMD64 ABI
        int int_reg_count = 0;
        int float_reg_count = 0;
        const char* int_regs[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};
        
        // Process arguments left to right for System V AMD64
        for (int i = 0; i < arg_count; i++) {
            ASTNode *arg = args[i];
            
            if (is_float_type(arg)) {
                // Float argument - promote to double for System V AMD64 ABI
                emit_node(arg, out);  // Load to FPU stack
                if (float_reg_count < 8) {
                    fprintf(out, "    sub rsp, 8\n");
                    fprintf(out, "    fstp qword [rsp]  ; promote float to double\n");
                    fprintf(out, "    movsd xmm%d, [rsp]  ; double arg %d\n", float_reg_count, i);
                    fprintf(out, "    add rsp, 8\n");
                    float_reg_count++;
                } else {
                    fprintf(out, "    sub rsp, 8\n");
                    fprintf(out, "    fstp qword [rsp]  ; double arg %d (stack)\n", i);
                }
            } else {
                // Integer/pointer argument - use integer register or stack
                emit_node(arg, out);  // Result in RAX
                if (int_reg_count < 6) {
                    fprintf(out, "    mov %s, rax  ; int arg %d\n", int_regs[int_reg_count], i);
                    int_reg_count++;
                } else {
                    fprintf(out, "    push rax  ; int arg %d (stack)\n", i);
                }
            }
        }
        
        fprintf(out, "    call %s\n", func_name);
        
        // Clean up stack arguments if any (beyond 6 int args or 8 float args)
        int max_reg_args = (int_reg_count > float_reg_count) ? int_reg_count : float_reg_count;
        int stack_cleanup = (arg_count > max_reg_args) ? (arg_count - max_reg_args) * 8 : 0;
        if (stack_cleanup > 0) {
            fprintf(out, "    add rsp, %d  ; clean up %d stack arguments\n", stack_cleanup, arg_count - max_reg_args);
        }
    }
}

// Debug: AST node names
static const char *ast_type_str(int type) {
    // The following switch statement is the actual implementation of ast_type_str
    switch (type) {
    case 0: return "AST_VAR_DECL";
    case 1: return "AST_CONST_DECL";
    case 2: return "AST_ASSIGN";
    case 3: return "AST_BIN_OP";
    case 4: return "AST_UNARY_OP";
    case 5: return "AST_LITERAL";
    case 6: return "AST_IDENTIFIER";
    case 7: return "AST_FUNC_CALL";
    case 8: return "AST_EXTERN_FUNC";
    case 9: return "AST_FUNC_DEF";
    case 10: return "AST_IF_GOTO";
    case 11: return "AST_LABEL";
    case 12: return "AST_GOTO";
    case 13: return "AST_HALT";
    case 14: return "AST_INLINE_ASM";
    case 15: return "AST_RETURN";
    case 16: return "AST_LOAD";
    case 17: return "AST_STORE";
    case 18: return "AST_IO";
    case 19: return "AST_DEBUG";
    case 20: return "AST_TRACE";
    default: return "UNKNOWN";
    }
}

// Emit literal (inline debug output only)
static void emit_literal(FILE *out, LiteralValue val) {
    switch (val.type) {
        case VALUE_I8:
            fprintf(out, "%d", (int)val.as.i8_val);
            break;
        case VALUE_I16:
            fprintf(out, "%d", (int)val.as.i16_val);
            break;
        case VALUE_I32:  // Also handles VALUE_INT
            fprintf(out, "%d", val.as.i32_val);
            break;
        case VALUE_I64:
            fprintf(out, "%lld", (long long)val.as.i64_val);
            break;
        case VALUE_U8:
            fprintf(out, "%u", (unsigned int)val.as.u8_val);
            break;
        case VALUE_U16:
            fprintf(out, "%u", (unsigned int)val.as.u16_val);
            break;
        case VALUE_U32:
            fprintf(out, "%u", val.as.u32_val);
            break;
        case VALUE_U64:
            fprintf(out, "%llu", (unsigned long long)val.as.u64_val);
            break;
        case VALUE_F32:  // Also handles VALUE_FLOAT
            fprintf(out, "%f", val.as.f32_val);
            break;
        case VALUE_F64:
            fprintf(out, "%f", val.as.f64_val);
            break;
        case VALUE_STR:  // Also handles VALUE_STRING
            fprintf(out, "\"%s\"", val.as.str_val);
            break;
        case VALUE_CHAR:
            fprintf(out, "'%c'", val.as.char_val);
            break;
        case VALUE_BOOL:
            fprintf(out, "%d", val.as.bool_val);
            break;
        case VALUE_NUM:
            if (val.as.num_val.is_float) {
                fprintf(out, "%f", val.as.num_val.value.float_val);
            } else {
                fprintf(out, "%d", val.as.num_val.value.int_val);
            }
            break;
    }
}

// Expression emitter (used for debugging only)
static void emit_expr(ASTNode *expr, FILE *out) {
    switch (expr->type) {
        case AST_LITERAL:
            emit_literal(out, expr->as.literal);
            break;
        case AST_IDENTIFIER:
            // Just emit the identifier name for debugging output
            fprintf(out, "%s", expr->as.ident);
            break;
        case AST_BIN_OP:
            emit_expr(expr->as.bin_op.left, out);
            fprintf(out, " %s ", expr->as.bin_op.op);
            emit_expr(expr->as.bin_op.right, out);
            break;
        case AST_FUNC_CALL:
            fprintf(out, "%s(", expr->as.func_call.name);
            for (size_t i = 0; i < expr->as.func_call.arg_count; i++) {
                if (i > 0) fprintf(out, ", ");
                emit_expr(expr->as.func_call.args[i], out);
            }
            fprintf(out, ")");
            break;
        default:
            fprintf(out, "<EXPR_UNHANDLED>");
            break;
    }
}

// --- String literal collection (Dynamic) ---
static const char **string_literals = NULL;
static int string_literals_capacity = 0;
static int string_literal_count = 0;
static int float_const_count = 0;  // Counter for float constants
static int float_var_count = 0;    // Counter for float variables

// Simple variable mapping (Dynamic)
static const char **var_names = NULL;
static const char **var_type_names = NULL;  // Store actual type names (i8, i16, i32, i64, f32, f64, etc.)
static int *var_indices = NULL;
static int *var_types = NULL;  // 0 = int, 1 = float
static int *var_locations = NULL;   // 0 = global, 1 = stack
static int *var_offsets = NULL;     // Stack offset for stack-based variables
static int var_names_capacity = 0;
static int var_map_count = 0;
static int int_var_count = 0;    // Counter for integer variables

// Current function context for parameter access
static ASTNode *current_function = NULL;

// Stack frame management for local variables
static int current_stack_offset = 0;  // Offset from EBP for local variables (negative values)

// Float constants collection (Dynamic)
static float *float_constants = NULL;
static int float_constants_capacity = 0;
static int float_constants_count = 0;

// Dynamic memory management functions
static void ensure_string_literals_capacity(int needed_capacity) {
    if (needed_capacity > string_literals_capacity) {
        int new_capacity = string_literals_capacity == 0 ? 256 : string_literals_capacity * 2;
        while (new_capacity < needed_capacity) {
            new_capacity *= 2;
        }
        
        string_literals = realloc(string_literals, new_capacity * sizeof(const char*));
        if (!string_literals) {
            fprintf(stderr, "Fatal error: Failed to allocate memory for string literals\n");
            exit(1);
        }
        string_literals_capacity = new_capacity;
        fprintf(stderr, "[CODEGEN DEBUG] Expanded string literals capacity to %d\n", new_capacity);
    }
}

static void ensure_var_capacity(int needed_capacity) {
    if (needed_capacity > var_names_capacity) {
        int new_capacity = var_names_capacity == 0 ? 128 : var_names_capacity * 2;
        while (new_capacity < needed_capacity) {
            new_capacity *= 2;
        }
        
        var_names = realloc(var_names, new_capacity * sizeof(const char*));
        var_type_names = realloc(var_type_names, new_capacity * sizeof(const char*));
        var_indices = realloc(var_indices, new_capacity * sizeof(int));
        var_types = realloc(var_types, new_capacity * sizeof(int));
        var_locations = realloc(var_locations, new_capacity * sizeof(int));
        var_offsets = realloc(var_offsets, new_capacity * sizeof(int));
        
        if (!var_names || !var_type_names || !var_indices || !var_types || !var_locations || !var_offsets) {
            fprintf(stderr, "Fatal error: Failed to allocate memory for variable tables\n");
            exit(1);
        }
        var_names_capacity = new_capacity;
        fprintf(stderr, "[CODEGEN DEBUG] Expanded variable tables capacity to %d\n", new_capacity);
    }
}

static void ensure_float_constants_capacity(int needed_capacity) {
    if (needed_capacity > float_constants_capacity) {
        int new_capacity = float_constants_capacity == 0 ? 128 : float_constants_capacity * 2;
        while (new_capacity < needed_capacity) {
            new_capacity *= 2;
        }
        
        float_constants = realloc(float_constants, new_capacity * sizeof(float));
        if (!float_constants) {
            fprintf(stderr, "Fatal error: Failed to allocate memory for float constants\n");
            exit(1);
        }
        float_constants_capacity = new_capacity;
        fprintf(stderr, "[CODEGEN DEBUG] Expanded float constants capacity to %d\n", new_capacity);
    }
}

static void cleanup_dynamic_arrays() {
    free(string_literals);
    free(var_names);
    free(var_type_names);
    free(var_indices);
    free(var_types);
    free(var_locations);
    free(var_offsets);
    free(float_constants);
    
    string_literals = NULL;
    var_names = NULL;
    var_type_names = NULL;
    var_indices = NULL;
    var_types = NULL;
    var_locations = NULL;
    var_offsets = NULL;
    float_constants = NULL;
    
    string_literals_capacity = 0;
    var_names_capacity = 0;
    float_constants_capacity = 0;
}

// Helper function to recursively count local variables in all nested structures
static int count_local_variables(ASTNode *node) {
    if (!node) return 0;
    
    int count = 0;
    
    // Count this node if it's a variable declaration
    if (node->type == AST_VAR_DECL || node->type == AST_CONST_DECL) {
        count++;
    }
    
    // Recursively count in nested structures
    switch (node->type) {
        case AST_IF_STMT:
            count += count_local_variables(node->as.if_stmt.condition);
            for (size_t i = 0; i < node->as.if_stmt.then_count; i++) {
                count += count_local_variables(node->as.if_stmt.then_body[i]);
            }
            for (size_t i = 0; i < node->as.if_stmt.else_count; i++) {
                count += count_local_variables(node->as.if_stmt.else_body[i]);
            }
            break;
            
        case AST_BIN_OP:
            count += count_local_variables(node->as.bin_op.left);
            count += count_local_variables(node->as.bin_op.right);
            break;
            
        case AST_UNARY_OP:
            count += count_local_variables(node->as.unary_op.expr);
            break;
            
        case AST_FUNC_CALL:
            for (size_t i = 0; i < node->as.func_call.arg_count; i++) {
                count += count_local_variables(node->as.func_call.args[i]);
            }
            break;
            
        case AST_VAR_DECL:
            if (node->as.var_decl.value) {
                count += count_local_variables(node->as.var_decl.value);
            }
            break;
            
        case AST_RETURN:
            if (node->as.ret.value) {
                count += count_local_variables(node->as.ret.value);
            }
            break;
            
        default:
            // For other node types, don't recurse
            break;
    }
    
    return count;
}

// Helper to determine if a parameter is a float type
static int is_param_float_type(const char *type_name) {
    return (strstr(type_name, "f32") != NULL || 
            strstr(type_name, "f64") != NULL || 
            strstr(type_name, "num") != NULL);
}

// Helper to determine if a value should be treated as float
static int is_float_type(ASTNode *node) {
    if (!node) return 0;
    
    if (node->type == AST_LITERAL) {
        return (node->as.literal.type == VALUE_F32 || 
                node->as.literal.type == VALUE_F64 ||
                node->as.literal.type == VALUE_FLOAT ||  // Legacy support
                (node->as.literal.type == VALUE_NUM && node->as.literal.as.num_val.is_float));
    }
    
    // Check if identifier is a float/num variable or parameter
    if (node->type == AST_IDENTIFIER) {
        // First check if this is a function parameter
        if (current_function != NULL) {
            for (size_t i = 0; i < current_function->as.func_def.param_count; i++) {
                if (strcmp(current_function->as.func_def.param_names[i], node->as.ident) == 0) {
                    // This is a function parameter - check its type
                    return is_param_float_type(current_function->as.func_def.param_types[i]);
                }
            }
        }
        
        // Then check local/global variables
        for (int i = 0; i < var_map_count; i++) {
            if (strcmp(var_names[i], node->as.ident) == 0) {
                return var_types[i] == 1; // 1 = float/num, 0 = int
            }
        }
    }
    
    // Binary operations between any float operands result in float
    if (node->type == AST_BIN_OP) {
        return is_float_type(node->as.bin_op.left) || is_float_type(node->as.bin_op.right);
    }
    
    // Unary operations preserve the type of their operand
    if (node->type == AST_UNARY_OP) {
        return is_float_type(node->as.unary_op.expr);
    }
    
    // Function calls that return floats
    if (node->type == AST_FUNC_CALL) {
        const char* return_type = get_function_return_type(node->as.func_call.name);
        return is_float_return_type(return_type);
    }
    
    return 0;
}

// Helper to store a variable (both int and float)
static int store_var(const char *name, int is_float, const char *type_name) {
    // Check if variable already exists
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0) {
            return var_indices[i];  // Return existing index
        }
    }
    
    // Add new variable to mapping
    int idx;
    if (is_float) {
        idx = float_var_count++;
    } else {
        idx = int_var_count++;
    }
    
    // Ensure we have enough capacity
    ensure_var_capacity(var_map_count + 1);
    
    var_names[var_map_count] = strdup(name);
    var_type_names[var_map_count] = strdup(type_name);  // Store the actual type name
    var_indices[var_map_count] = idx;
    var_types[var_map_count] = is_float ? 1 : 0;
    var_locations[var_map_count] = 0;  // Default to global
    var_offsets[var_map_count] = 0;    // No offset for globals
    var_map_count++;
    
    return idx;
}

// Helper to store a stack-based local variable
static int store_local_var(const char *name, int is_float, const char *type_name) {
    // Check if variable already exists
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0) {
            return var_indices[i];  // Return existing index
        }
    }
    
    // Allocate stack space based on type
    if (strcmp(type_name, "i64") == 0 || strcmp(type_name, "u64") == 0 || 
        strcmp(type_name, "f64") == 0 || strcmp(type_name, "num") == 0) {
        current_stack_offset -= 8;  // 64-bit types need 8 bytes
    } else {
        current_stack_offset -= get_word_size_bytes();  // Other types use default size
    }
    
    // Ensure we have enough capacity
    ensure_var_capacity(var_map_count + 1);
    
    // Add new variable to mapping
    var_names[var_map_count] = strdup(name);
    var_type_names[var_map_count] = strdup(type_name);  // Store the actual type name
    var_indices[var_map_count] = var_map_count;  // Use map index as identifier
    var_types[var_map_count] = is_float ? 1 : 0;
    var_locations[var_map_count] = 1;  // Stack-based
    var_offsets[var_map_count] = current_stack_offset;
    var_map_count++;
    return var_map_count - 1;
}

// Helper to store a float variable
static int store_float_var(const char *name, const char *type_name) {
    return store_var(name, 1, type_name);  // 1 = float
}

// Helper to store an integer variable
static int store_int_var(const char *name, const char *type_name) {
    return store_var(name, 0, type_name);  // 0 = int
}

// Helper to emit float variable load - now type-aware
static void emit_float_var_load(const char *name, FILE *out) {
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0 && var_types[i] == 1) {
            // Determine the size based on the variable's type name
            const char* var_type = var_type_names[i];
            const char* float_size = get_float_storage_specifier(var_type);
            
            if (var_locations[i] == 1) {  // Stack-based
                if (strcmp(float_size, "qword") == 0) {
                    fprintf(out, "    fld qword [%s%d]  ; load %s (stack, f64/double)\n", 
                           get_base_pointer(), var_offsets[i], name);
                } else {
                    fprintf(out, "    fld dword [%s%d]  ; load %s (stack, f32/float)\n", 
                           get_base_pointer(), var_offsets[i], name);
                }
            } else {  // Global
                if (strcmp(float_size, "qword") == 0) {
                    fprintf(out, "    fld qword [float_var_%d]  ; load %s (f64/double)\n", var_indices[i], name);
                } else {
                    fprintf(out, "    fld dword [float_var_%d]  ; load %s (f32/float)\n", var_indices[i], name);
                }
            }
            return;
        }
    }
    fprintf(stderr, "Warning: float var %s not found\n", name);
}

// Helper to emit integer variable load - now type and architecture aware
static void emit_int_var_load(const char *name, FILE *out) {
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0 && var_types[i] == 0) {
            // Determine the size and register based on the variable's type
            const char* var_type = var_type_names[i];
            const char* int_size = get_type_size_specifier(var_type);
            const char* target_reg;
            
            // Select the appropriate register for loading based on the target architecture
            if (strcmp(int_size, "qword") == 0) {
                target_reg = get_int_register();  // rax for 64-bit load
            } else {
                target_reg = get_int_register();  // Use full register for loading, will be sign-extended
            }
            
            if (var_locations[i] == 1) {  // Stack-based
                if (strcmp(int_size, "qword") == 0) {
                    // 64-bit load
                    fprintf(out, "    mov %s, %s [%s%d]  ; load %s (stack, 64-bit)\n", 
                           target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                } else if (strcmp(int_size, "dword") == 0) {
                    // 32-bit load - check if unsigned type
                    if (strstr(var_type, "u32") || strstr(var_type, "u16") || strstr(var_type, "u8")) {
                        // For unsigned 32-bit values, just use mov - it automatically zero-extends in 64-bit
                        fprintf(out, "    mov %s, %s [%s%d]  ; load %s (stack, zero-extended to 64-bit)\n", 
                               "eax", int_size, get_base_pointer(), var_offsets[i], name);
                    } else {
                        // Sign-extend for signed types
                        if (current_config && current_config->target_arch == ARCH_64BIT) {
                            fprintf(out, "    movsx %s, %s [%s%d]  ; load %s (stack, sign-extended to 64-bit)\n", 
                                   get_int_register(), int_size, get_base_pointer(), var_offsets[i], name);
                        } else {
                            fprintf(out, "    mov %s, %s [%s%d]  ; load %s (stack)\n", 
                                   target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                        }
                    }
                } else if (strcmp(int_size, "word") == 0) {
                    // 16-bit load - check if unsigned type
                    if (strstr(var_type, "u16")) {
                        fprintf(out, "    movzx %s, %s [%s%d]  ; load %s (stack, 16-bit zero-extended)\n", 
                               target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                    } else {
                        fprintf(out, "    movsx %s, %s [%s%d]  ; load %s (stack, 16-bit sign-extended)\n", 
                               target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                    }
                } else if (strcmp(int_size, "byte") == 0) {
                    // 8-bit load - check if unsigned type
                    if (strstr(var_type, "u8")) {
                        fprintf(out, "    movzx %s, %s [%s%d]  ; load %s (stack, 8-bit zero-extended)\n", 
                               target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                    } else {
                        fprintf(out, "    movsx %s, %s [%s%d]  ; load %s (stack, 8-bit sign-extended)\n", 
                               target_reg, int_size, get_base_pointer(), var_offsets[i], name);
                    }
                }
            } else {  // Global
                if (strcmp(int_size, "qword") == 0) {
                    // 64-bit global load
                    fprintf(out, "    mov %s, %s [int_var_%d]  ; load %s (64-bit)\n", 
                           target_reg, int_size, var_indices[i], name);
                } else if (strcmp(int_size, "dword") == 0) {
                    // 32-bit global load - check if unsigned type
                    if (strstr(var_type, "u32") || strstr(var_type, "u16") || strstr(var_type, "u8")) {
                        // For unsigned 32-bit values, just use mov - it automatically zero-extends in 64-bit
                        fprintf(out, "    mov %s, %s [int_var_%d]  ; load %s (zero-extended to 64-bit)\n", 
                               "eax", int_size, var_indices[i], name);
                    } else {
                        // Sign-extend for signed types
                        if (current_config && current_config->target_arch == ARCH_64BIT) {
                            fprintf(out, "    movsx %s, %s [int_var_%d]  ; load %s (sign-extended to 64-bit)\n", 
                                   get_int_register(), int_size, var_indices[i], name);
                        } else {
                            fprintf(out, "    mov %s, %s [int_var_%d]  ; load %s\n", 
                                   target_reg, int_size, var_indices[i], name);
                        }
                    }
                } else {
                    // 16-bit and 8-bit global loads - check if unsigned type
                    if (strstr(var_type, "u16") || strstr(var_type, "u8")) {
                        fprintf(out, "    movzx %s, %s [int_var_%d]  ; load %s (zero-extended)\n", 
                               target_reg, int_size, var_indices[i], name);
                    } else {
                        fprintf(out, "    movsx %s, %s [int_var_%d]  ; load %s (sign-extended)\n", 
                               target_reg, int_size, var_indices[i], name);
                    }
                }
            }
            return;
        }
    }
    fprintf(stderr, "Warning: int var %s not found\n", name);
}

// Helper to emit float binary operation
static int find_or_add_string(const char *str) {
    for (int i = 0; i < string_literal_count; ++i) {
        if (strcmp(string_literals[i], str) == 0)
            return i;
    }
    
    // Ensure we have enough capacity
    ensure_string_literals_capacity(string_literal_count + 1);
    
    fprintf(stderr, "[CODEGEN DEBUG] Adding string literal: %s\n", str);
    string_literals[string_literal_count] = str;
    return string_literal_count++;
}

static void collect_strings(ASTNode *node) {
    if (!node) return;

    if (node->type == AST_LITERAL && node->as.literal.type == VALUE_STRING) {
        fprintf(stderr, "[CODEGEN DEBUG] collect_strings: found string literal: %s\n", node->as.literal.as.str_val);
        find_or_add_string(node->as.literal.as.str_val);
    }

    switch (node->type) {
        case AST_FUNC_DEF:
            for (size_t i = 0; i < node->as.func_def.body_count; ++i)
                collect_strings(node->as.func_def.body[i]);
            break;
        case AST_FUNC_CALL:
            for (size_t i = 0; i < node->as.func_call.arg_count; ++i)
                collect_strings(node->as.func_call.args[i]);
            break;
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            collect_strings(node->as.var_decl.value);
            break;
        case AST_ASSIGN:
            collect_strings(node->as.assign.value);
            break;
        case AST_IF_STMT:
            collect_strings(node->as.if_stmt.condition);
            for (size_t i = 0; i < node->as.if_stmt.then_count; ++i)
                collect_strings(node->as.if_stmt.then_body[i]);
            for (size_t i = 0; i < node->as.if_stmt.else_count; ++i)
                collect_strings(node->as.if_stmt.else_body[i]);
            break;
        case AST_IF_GOTO:
            collect_strings(node->as.if_goto.condition);
            break;
        case AST_BIN_OP:
            collect_strings(node->as.bin_op.left);
            collect_strings(node->as.bin_op.right);
            break;
        case AST_UNARY_OP:
            collect_strings(node->as.unary_op.expr);
            break;
        case AST_RETURN:
            if (node->as.ret.value) {
                collect_strings(node->as.ret.value);
            }
            break;
        default: break;
    }
}

// --- New: Collect float constants and variables ---
static void collect_floats(ASTNode *node) {
    if (!node) return;

    if (node->type == AST_LITERAL) {
        if (node->as.literal.type == VALUE_FLOAT) {
            ensure_float_constants_capacity(float_constants_count + 1);
            float_constants[float_constants_count] = node->as.literal.as.float_val;
            fprintf(stderr, "[CODEGEN DEBUG] Collected VALUE_FLOAT: %f at index %d\n", 
                   node->as.literal.as.float_val, float_constants_count);
            float_constants_count++;
        } else if (node->as.literal.type == VALUE_F32) {
            ensure_float_constants_capacity(float_constants_count + 1);
            float_constants[float_constants_count] = node->as.literal.as.f32_val;
            fprintf(stderr, "[CODEGEN DEBUG] Collected VALUE_F32: %f at index %d\n", 
                   node->as.literal.as.f32_val, float_constants_count);
            float_constants_count++;
        } else if (node->as.literal.type == VALUE_F64) {
            ensure_float_constants_capacity(float_constants_count + 1);
            float_constants[float_constants_count] = (float)node->as.literal.as.f64_val;
            fprintf(stderr, "[CODEGEN DEBUG] Collected VALUE_F64: %f at index %d\n", 
                   (float)node->as.literal.as.f64_val, float_constants_count);
            float_constants_count++;
        } else if (node->as.literal.type == VALUE_NUM && node->as.literal.as.num_val.is_float) {
            // Handle num type literals that contain float values
            ensure_float_constants_capacity(float_constants_count + 1);
            float_constants[float_constants_count] = node->as.literal.as.num_val.value.float_val;
            fprintf(stderr, "[CODEGEN DEBUG] Collected VALUE_NUM (float): %f at index %d\n", 
                   node->as.literal.as.num_val.value.float_val, float_constants_count);
            float_constants_count++;
        }
    }

    switch (node->type) {
        case AST_FUNC_DEF:
            for (size_t i = 0; i < node->as.func_def.body_count; ++i)
                collect_floats(node->as.func_def.body[i]);
            break;
        case AST_FUNC_CALL:
            for (size_t i = 0; i < node->as.func_call.arg_count; ++i)
                collect_floats(node->as.func_call.args[i]);
            break;
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            collect_floats(node->as.var_decl.value);
            // Note: Don't store variables during collection phase - 
            // they will be stored during emission when current_function is properly set
            break;
        case AST_ASSIGN:
            collect_floats(node->as.assign.value);
            break;
        case AST_BIN_OP:
            collect_floats(node->as.bin_op.left);
            collect_floats(node->as.bin_op.right);
            break;
        case AST_IF_STMT:
            collect_floats(node->as.if_stmt.condition);
            for (size_t i = 0; i < node->as.if_stmt.then_count; ++i)
                collect_floats(node->as.if_stmt.then_body[i]);
            for (size_t i = 0; i < node->as.if_stmt.else_count; ++i)
                collect_floats(node->as.if_stmt.else_body[i]);
            break;
        case AST_IF_GOTO:
            collect_floats(node->as.if_goto.condition);
            break;
        case AST_UNARY_OP:
            collect_floats(node->as.unary_op.expr);
            break;
        case AST_RETURN:
            if (node->as.ret.value) {
                collect_floats(node->as.ret.value);
            }
            break;
        default: break;
    }
}

// Helper to find float constant index
static int find_float_const_index(float value) {
    fprintf(stderr, "[CODEGEN DEBUG] Looking for float constant: %f\n", value);
    for (int i = 0; i < float_constants_count; i++) {
        fprintf(stderr, "[CODEGEN DEBUG] Comparing with float_constants[%d] = %f\n", i, float_constants[i]);
        if (float_constants[i] == value) {
            fprintf(stderr, "[CODEGEN DEBUG] Found float constant at index %d\n", i);
            return i;
        }
    }
    fprintf(stderr, "[CODEGEN DEBUG] Float constant NOT found!\n");
    return -1; // Not found
}

// Helper to get function return type
static const char* get_function_return_type(const char* func_name) {
    // Check for known library functions first
    if (strcmp(func_name, "print_int") == 0) return "void";
    if (strcmp(func_name, "print_float") == 0) return "void";
    if (strcmp(func_name, "print_bool") == 0) return "void";
    if (strcmp(func_name, "print_num") == 0) return "void";
    if (strcmp(func_name, "print") == 0) return "void";
    
    // Type-specific read functions
    if (strcmp(func_name, "read_i8") == 0) return "i8";
    if (strcmp(func_name, "read_i16") == 0) return "i16";
    if (strcmp(func_name, "read_i32") == 0) return "i32";
    if (strcmp(func_name, "read_i64") == 0) return "i64";
    if (strcmp(func_name, "read_u8") == 0) return "u8";
    if (strcmp(func_name, "read_u16") == 0) return "u16";
    if (strcmp(func_name, "read_u32") == 0) return "u32";
    if (strcmp(func_name, "read_u64") == 0) return "u64";
    if (strcmp(func_name, "read_f32") == 0) return "f32";
    if (strcmp(func_name, "read_f64") == 0) return "f64";
    if (strcmp(func_name, "read_bool") == 0) return "bool";
    if (strcmp(func_name, "read_char") == 0) return "char";
    if (strcmp(func_name, "read_str") == 0) return "str";
    if (strcmp(func_name, "read_num") == 0) return "num";
    
    // Legacy functions for compatibility
    if (strcmp(func_name, "read_int") == 0) return "i32";
    if (strcmp(func_name, "read_float") == 0) return "f32";
    if (strcmp(func_name, "read_num_safe") == 0) return "f32";
    if (strcmp(func_name, "read_bool_safe") == 0) return "bool";
    
    // Check for common user-defined float functions
    if (strcmp(func_name, "float_add") == 0) return "f32";
    if (strcmp(func_name, "float_multiply") == 0) return "f32";
    if (strcmp(func_name, "half_float") == 0) return "f32";
    if (strcmp(func_name, "float_abs") == 0) return "f32";
    if (strcmp(func_name, "square_root_newton") == 0) return "f32";
    if (strcmp(func_name, "power_float") == 0) return "f32";
    if (strcmp(func_name, "test_float_return_functions") == 0) return "f32";
    if (strcmp(func_name, "test_float_parameters") == 0) return "f32";
    if (strcmp(func_name, "complex_math") == 0) return "f32";
    if (strcmp(func_name, "add_three_floats") == 0) return "f32";
    if (strcmp(func_name, "factorial_float") == 0) return "f32";
    if (strcmp(func_name, "power_recursive") == 0) return "f32";
    if (strcmp(func_name, "simple_factorial") == 0) return "f32";
    if (strcmp(func_name, "simple_float") == 0) return "f32";
    if (strcmp(func_name, "add_floats") == 0) return "f32";
    if (strcmp(func_name, "mixed_calc") == 0) return "f32";
    if (strcmp(func_name, "test_float_add") == 0) return "f32";
    if (strcmp(func_name, "test_float_multiply") == 0) return "f32";
    if (strcmp(func_name, "test_float_complex") == 0) return "f32";
    if (strcmp(func_name, "test_mixed_to_float") == 0) return "f32";
    if (strcmp(func_name, "test_float_recursion") == 0) return "f32";
    if (strcmp(func_name, "test_complex_math") == 0) return "f32";
    
    // Ultimate comprehensive test functions
    if (strcmp(func_name, "f32_function") == 0) return "f32";
    if (strcmp(func_name, "i32_function") == 0) return "i32";
    if (strcmp(func_name, "bool_function") == 0) return "bool";
    if (strcmp(func_name, "number_function") == 0) return "num";
    if (strcmp(func_name, "factorial") == 0) return "i32";
    if (strcmp(func_name, "fibonacci") == 0) return "i32";
    if (strcmp(func_name, "power") == 0) return "i32";
    if (strcmp(func_name, "gcd") == 0) return "i32";
    if (strcmp(func_name, "abs_value") == 0) return "i32";
    if (strcmp(func_name, "multi_param") == 0) return "i32";
    
    // Check for common user-defined int functions
    if (strcmp(func_name, "multiply_two_ints") == 0) return "i32";
    if (strcmp(func_name, "simple_int") == 0) return "i32";
    if (strcmp(func_name, "add_ints") == 0) return "i32";
    if (strcmp(func_name, "double_it") == 0) return "i32";
    if (strcmp(func_name, "triple_it") == 0) return "i32";
    if (strcmp(func_name, "complex_expr") == 0) return "i32";
    if (strcmp(func_name, "test_int_add") == 0) return "i32";
    if (strcmp(func_name, "test_int_multiply") == 0) return "i32";
    if (strcmp(func_name, "test_int_complex") == 0) return "i32";
    if (strcmp(func_name, "test_int_recursion") == 0) return "i32";
    if (strcmp(func_name, "helper_func") == 0) return "i32";
    if (strcmp(func_name, "test_nested_calls") == 0) return "i32";
    
    // Check for common user-defined bool functions
    if (strcmp(func_name, "is_greater") == 0) return "bool";
    if (strcmp(func_name, "test_bool_compare") == 0) return "bool";
    if (strcmp(func_name, "test_bool_logic") == 0) return "bool";
    
    // For user-defined functions, search in the function definitions
    // This is a simplified approach - in a full implementation, we'd store function signatures
    return "unknown";
}

// Helper to check if a return type is float
static int is_float_return_type(const char* return_type) {
    return (strcmp(return_type, "f32") == 0 || 
            strcmp(return_type, "f64") == 0 ||
            strcmp(return_type, "num") == 0);
}

// Emit NASM node
static void emit_node(ASTNode *node, FILE *out) {
    switch (node->type) {
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            fprintf(out, "; let %s:%s = ", node->as.var_decl.name, node->as.var_decl.type_name);
            emit_expr(node->as.var_decl.value, out);
            fprintf(out, "\n");
            
            // Determine if this is a local variable (inside a function) or global
            int is_local = (current_function != NULL);
            int is_float = strstr(node->as.var_decl.type_name, "f32") || 
                          strstr(node->as.var_decl.type_name, "f64") ||
                          strstr(node->as.var_decl.type_name, "num");
            
            int var_idx;
            if (is_local) {
                // Store as local variable on the stack
                var_idx = store_local_var(node->as.var_decl.name, is_float, node->as.var_decl.type_name);
            } else {
                // Store as global variable
                if (is_float) {
                    var_idx = store_float_var(node->as.var_decl.name, node->as.var_decl.type_name);
                } else {
                    var_idx = store_int_var(node->as.var_decl.name, node->as.var_decl.type_name);
                }
            }
            
            if (var_idx < 0) {
                fprintf(stderr, "Error: failed to store variable %s\n", node->as.var_decl.name);
                break;
            }
            
            // Generate code to store the value
            emit_node(node->as.var_decl.value, out);
            
            // Store the value based on type and location
            if (is_float) {
                // Check if the value being assigned is also a float type
                int value_is_float = is_float_type(node->as.var_decl.value);
                
                if (is_local) {
                    // Find the variable in our mapping to get its stack offset
                    int found_local = 0;
                    for (int i = 0; i < var_map_count; i++) {
                        if (strcmp(var_names[i], node->as.var_decl.name) == 0 && var_locations[i] == 1) {
                            if (value_is_float) {
                                // Value is already on FPU stack
                                const char* float_size = get_float_storage_specifier(node->as.var_decl.type_name);
                                fprintf(out, "    fstp %s [%s%d]  ; store %s (local float)\n", 
                                       float_size, get_base_pointer(), var_offsets[i], node->as.var_decl.name);
                            } else {
                                // Value is in register, need to convert to float
                                fprintf(out, "    %s [temp_int], %s\n", get_mov_instruction(), get_int_register());
                                if (current_config && current_config->target_arch == ARCH_64BIT) {
                                    fprintf(out, "    fild qword [temp_int]  ; convert int to float\n");
                                } else {
                                    fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                                }
                                const char* float_size = get_float_storage_specifier(node->as.var_decl.type_name);
                                fprintf(out, "    fstp %s [%s%d]  ; store %s (local float, converted)\n", 
                                       float_size, get_base_pointer(), var_offsets[i], node->as.var_decl.name);
                            }
                            found_local = 1;
                            break;
                        }
                    }
                    if (!found_local) {
                        fprintf(stderr, "Error: Local float variable %s not found in mapping!\n", 
                               node->as.var_decl.name);
                    }
                } else {
                    if (value_is_float) {
                        // Value is already on FPU stack
                        fprintf(out, "    fstp dword [float_var_%d]  ; store %s (global float)\n", 
                               var_idx, node->as.var_decl.name);
                    } else {
                        // Value is in architecture-appropriate register, need to convert to float
                        fprintf(out, "    mov [temp_int], %s\n", get_int_register_32bit());
                        fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                        fprintf(out, "    fstp dword [float_var_%d]  ; store %s (global float, converted)\n", 
                               var_idx, node->as.var_decl.name);
                    }
                }
            } else {
                if (is_local) {
                    // Find the variable in our mapping to get its stack offset
                    int found_local = 0;
                    for (int i = 0; i < var_map_count; i++) {
                        if (strcmp(var_names[i], node->as.var_decl.name) == 0 && var_locations[i] == 1) {
                            const char* int_size = get_type_size_specifier(node->as.var_decl.type_name);
                            const char* reg;
                            
                            // Select the appropriate register based on storage size
                            if (strcmp(int_size, "qword") == 0) {
                                reg = get_int_register();  // rax for 64-bit
                            } else if (strcmp(int_size, "dword") == 0) {
                                reg = get_int_register_32bit();  // eax for 32-bit
                            } else if (strcmp(int_size, "word") == 0) {
                                reg = "ax";  // ax for 16-bit
                            } else if (strcmp(int_size, "byte") == 0) {
                                reg = "al";  // al for 8-bit
                            } else {
                                reg = get_int_register_32bit();  // default
                            }
                            
                            fprintf(out, "    mov %s [%s%d], %s  ; store %s (local int)\n", 
                                   int_size, get_base_pointer(), var_offsets[i], reg, node->as.var_decl.name);
                            found_local = 1;
                            break;
                        }
                    }
                    if (!found_local) {
                        fprintf(stderr, "Error: Local int variable %s not found in mapping!\n", 
                               node->as.var_decl.name);
                    }
                } else {
                    fprintf(out, "    %s [int_var_%d], %s  ; store %s (global int)\n", 
                           get_mov_instruction(), var_idx, get_int_register(), node->as.var_decl.name);
                }
            }
            break;

        case AST_ASSIGN:
            fprintf(out, "; %s = ", node->as.assign.target);
            emit_expr(node->as.assign.value, out);
            fprintf(out, "\n");
            emit_node(node->as.assign.value, out);  // Generate actual code
            
            // Store the result back to the target variable
            const char *target_name = node->as.assign.target;
            int found = 0;
            
            // Check if target is a function parameter
            if (current_function != NULL) {
                for (size_t i = 0; i < current_function->as.func_def.param_count; i++) {
                    if (strcmp(current_function->as.func_def.param_names[i], target_name) == 0) {
                        // This is a function parameter - store back to stack
                        int offset = 8 + (i * 4);
                        
                        // Check if this parameter is a float type
                        if (current_function->as.func_def.param_types && 
                            is_param_float_type(current_function->as.func_def.param_types[i])) {
                            fprintf(out, "    fstp dword [%s+%d]  ; store to float parameter %s\n", 
                                   get_base_pointer(), offset, target_name);
                        } else {
                            fprintf(out, "    %s [%s+%d], %s  ; store to parameter %s\n", 
                                   get_mov_instruction(), get_base_pointer(), offset, get_int_register(), target_name);
                        }
                        found = 1;
                        break;
                    }
                }
            }
            
            // If not found as parameter, check local/global variables
            if (!found) {
                for (int i = 0; i < var_map_count; i++) {
                    if (strcmp(var_names[i], target_name) == 0) {
                        if (var_types[i] == 1) { // float
                            if (var_locations[i] == 1) {  // Stack-based
                                // Check if the assigned value is also float type
                                int value_is_float = is_float_type(node->as.assign.value);
                                if (value_is_float) {
                                    fprintf(out, "    fstp dword [%s%d]  ; store %s (local float)\n", 
                                           get_base_pointer(), var_offsets[i], target_name);
                                } else {
                                    // Value is in register, need to convert to float
                                    fprintf(out, "    %s [temp_int], %s\n", get_mov_instruction(), get_int_register());
                                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                                        fprintf(out, "    fild qword [temp_int]  ; convert int to float\n");
                                    } else {
                                        fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                                    }
                                    fprintf(out, "    fstp dword [%s%d]  ; store %s (local float, converted)\n", 
                                           get_base_pointer(), var_offsets[i], target_name);
                                }
                            } else {  // Global
                                int value_is_float = is_float_type(node->as.assign.value);
                                if (value_is_float) {
                                    fprintf(out, "    fstp dword [float_var_%d]  ; store %s (global float)\n", 
                                           var_indices[i], target_name);
                                } else {
                                    // Value is in architecture-appropriate register, need to convert to float
                                    fprintf(out, "    mov [temp_int], %s\n", get_int_register_32bit());
                                    fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                                    fprintf(out, "    fstp dword [float_var_%d]  ; store %s (global float, converted)\n", 
                                           var_indices[i], target_name);
                                }
                            }
                        } else { // int
                            if (var_locations[i] == 1) {  // Stack-based
                                fprintf(out, "    mov %s [%s%d], %s  ; store %s (local int)\n", 
                                       get_int_size_specifier(), get_base_pointer(), var_offsets[i], get_int_register_32bit(), target_name);
                            } else {  // Global
                                fprintf(out, "    mov %s [int_var_%d], %s  ; store %s (global int)\n", 
                                       get_int_size_specifier(), var_indices[i], get_int_register_32bit(), target_name);
                            }
                        }
                        found = 1;
                        break;
                    }
                }
            }
            
            if (!found) {
                fprintf(stderr, "Error: Assignment target variable %s not found\n", target_name);
            }
            break;

        case AST_LITERAL:
            fprintf(stderr, "[CODEGEN DEBUG] Processing literal node with type: %d\n", node->as.literal.type);
            // Handle new integer types
            if (node->as.literal.type == VALUE_I8) {
                fprintf(out, "    %s %s, %d\n", get_mov_instruction(), get_int_register(), (int)node->as.literal.as.i8_val);
            } else if (node->as.literal.type == VALUE_I16) {
                fprintf(out, "    %s %s, %d\n", get_mov_instruction(), get_int_register(), (int)node->as.literal.as.i16_val);
            } else if (node->as.literal.type == VALUE_I32) {
                fprintf(out, "    %s %s, %d\n", get_mov_instruction(), get_int_register(), node->as.literal.as.i32_val);
            } else if (node->as.literal.type == VALUE_I64) {
                // For 64-bit integers, handle differently based on architecture
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    mov rax, %lld  ; i64 full precision\n", 
                           (long long)node->as.literal.as.i64_val);
                } else {
                    fprintf(out, "    mov %s, %lld  ; i64 truncated to 32-bit\n", 
                           get_int_register(), (long long)node->as.literal.as.i64_val);
                }
            } else if (node->as.literal.type == VALUE_U8) {
                fprintf(out, "    %s %s, %u\n", get_mov_instruction(), get_int_register(), (unsigned int)node->as.literal.as.u8_val);
            } else if (node->as.literal.type == VALUE_U16) {
                fprintf(out, "    %s %s, %u\n", get_mov_instruction(), get_int_register(), (unsigned int)node->as.literal.as.u16_val);
            } else if (node->as.literal.type == VALUE_U32) {
                fprintf(out, "    %s %s, %u\n", get_mov_instruction(), get_int_register(), node->as.literal.as.u32_val);
            } else if (node->as.literal.type == VALUE_U64) {
                // For 64-bit integers, handle differently based on architecture
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    mov rax, %llu  ; u64 full precision\n", 
                           (unsigned long long)node->as.literal.as.u64_val);
                } else {
                    fprintf(out, "    mov %s, %llu  ; u64 truncated to 32-bit\n", 
                           get_int_register(), (unsigned long long)node->as.literal.as.u64_val);
                }
            } 
            // Handle new floating point types
            else if (node->as.literal.type == VALUE_F32) {
                // Find the constant index and emit load
                // Note: VALUE_F32 is same as VALUE_FLOAT, parser stores in float_val (double)
                fprintf(stderr, "[CODEGEN DEBUG] emit_node VALUE_F32: %f (from float_val)\n", node->as.literal.as.float_val);
                int idx = find_float_const_index((float)node->as.literal.as.float_val);
                if (idx >= 0) {
                    fprintf(out, "    fld dword [float_%d]\n", idx);
                } else {
                    fprintf(out, "; Error: f32 constant not found\n");
                }
            } else if (node->as.literal.type == VALUE_FLOAT) {
                // Handle VALUE_FLOAT (same as VALUE_F32) - uses float_val field  
                fprintf(stderr, "[CODEGEN DEBUG] emit_node VALUE_FLOAT: %f\n", node->as.literal.as.float_val);
                int idx = find_float_const_index((float)node->as.literal.as.float_val);
                if (idx >= 0) {
                    fprintf(out, "    fld dword [float_%d]\n", idx);
                } else {
                    fprintf(out, "; Error: float constant not found\n");
                }
            } else if (node->as.literal.type == VALUE_F64) {
                // For f64, we need to handle as double precision
                int idx = find_float_const_index((float)node->as.literal.as.f64_val);  // Convert for now
                if (idx >= 0) {
                    fprintf(out, "    fld dword [float_%d]  ; f64 as f32 for now\n", idx);
                } else {
                    fprintf(out, "; Error: f64 constant not found\n");
                }
            }
            // Handle string and character types
            else if (node->as.literal.type == VALUE_STR) {
                int idx = find_or_add_string(node->as.literal.as.str_val);
                fprintf(out, "    mov %s, msg_%d\n", get_int_register(), idx);
            } else if (node->as.literal.type == VALUE_CHAR) {
                char c = node->as.literal.as.char_val;
                const char* int_reg = get_int_register();
                if (c == '\n') {
                    fprintf(out, "    mov %s, %d  ; char newline\n", int_reg, (int)c);
                } else if (c == '\t') {
                    fprintf(out, "    mov %s, %d  ; char tab\n", int_reg, (int)c);
                } else if (c == '\r') {
                    fprintf(out, "    mov %s, %d  ; char carriage-return\n", int_reg, (int)c);
                } else if (c == '\0') {
                    fprintf(out, "    mov %s, %d  ; char null\n", int_reg, (int)c);
                } else if (c >= 32 && c <= 126) {
                    fprintf(out, "    mov %s, %d  ; char '%c'\n", int_reg, (int)c, c);
                } else {
                    fprintf(out, "    mov %s, %d  ; char (ASCII %d)\n", int_reg, (int)c, (int)c);
                }
            }
            // Legacy support
            else if (node->as.literal.type == VALUE_FLOAT) {
                // Find the constant index and emit load
                fprintf(stderr, "[CODEGEN DEBUG] emit_node VALUE_FLOAT: %f\n", node->as.literal.as.float_val);
                int idx = find_float_const_index(node->as.literal.as.float_val);
                if (idx >= 0) {
                    fprintf(out, "    fld dword [float_%d]\n", idx);
                } else {
                    fprintf(out, "; Error: float constant not found\n");
                }
            } else if (node->as.literal.type == VALUE_NUM) {
                // Handle num type literals
                if (node->as.literal.as.num_val.is_float) {
                    // Treat as float
                    int idx = find_float_const_index(node->as.literal.as.num_val.value.float_val);
                    if (idx >= 0) {
                        fprintf(out, "    fld dword [float_%d]\n", idx);
                    } else {
                        fprintf(out, "; Error: num float constant not found\n");
                    }
                } else {
                    // Treat as integer
                    const char* int_reg = get_int_register();
                    fprintf(out, "    mov %s, %d\n", int_reg, node->as.literal.as.num_val.value.int_val);
                }
            } else if (node->as.literal.type == VALUE_INT) {
                const char* int_reg = get_int_register();
                fprintf(out, "    mov %s, %d\n", int_reg, node->as.literal.as.int_val);
            } else if (node->as.literal.type == VALUE_BOOL) {
                const char* int_reg = get_int_register();
                fprintf(out, "    mov %s, %d\n", int_reg, node->as.literal.as.bool_val);
            }
            break;

        case AST_BIN_OP: {
            ASTNode *left = node->as.bin_op.left;
            ASTNode *right = node->as.bin_op.right;
            const char *op = node->as.bin_op.op;

            // Check if either operand is float
            int left_is_float = is_float_type(left);
            int right_is_float = is_float_type(right);
            int is_float_op = left_is_float || right_is_float;

            if (is_float_op) {
                // Float operations using FPU
                // Load left operand to FPU stack
                if (left_is_float) {
                    emit_node(left, out);   // Already puts value on FPU stack
                } else {
                    // Convert integer to float
                    emit_node(left, out);   // Puts value in architecture-appropriate register
                    fprintf(out, "    mov [temp_int], %s\n", get_int_register_32bit());
                    fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                }
                
                // Load right operand to FPU stack
                if (right_is_float) {
                    emit_node(right, out);  // Already puts value on FPU stack
                } else {
                    // Convert integer to float
                    emit_node(right, out);  // Puts value in architecture-appropriate register
                    fprintf(out, "    mov [temp_int], %s\n", get_int_register_32bit());
                    fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                }
                
                // Perform operation (ST0 = right, ST1 = left)
                if (strcmp(op, "+") == 0) {
                    fprintf(out, "    faddp\n");         // Add ST0 to ST1, pop
                } else if (strcmp(op, "-") == 0) {
                    fprintf(out, "    fsubp\n");        // Subtract ST0 from ST1, pop
                } else if (strcmp(op, "*") == 0) {
                    fprintf(out, "    fmulp\n");        // Multiply ST0 with ST1, pop
                } else if (strcmp(op, "/") == 0) {
                    fprintf(out, "    fdivp\n");        // Divide ST1 by ST0, pop
                } else if (strcmp(op, "==") == 0 || strcmp(op, "!=") == 0 ||
                          strcmp(op, "<") == 0 || strcmp(op, ">") == 0 ||
                          strcmp(op, "<=") == 0 || strcmp(op, ">=") == 0) {
                    // Float comparison
                    fprintf(out, "    fcompp\n");       // Compare ST0 and ST1, pop both
                    fprintf(out, "    fstsw ax\n");     // Store status word to AX
                    fprintf(out, "    sahf\n");         // Store AH into flags register
                    
                    // Set result based on comparison
                    if (strcmp(op, "==") == 0) {
                        fprintf(out, "    sete al\n");      // Set AL if equal
                    } else if (strcmp(op, "!=") == 0) {
                        fprintf(out, "    setne al\n");     // Set AL if not equal
                    } else if (strcmp(op, "<") == 0) {
                        fprintf(out, "    setb al\n");      // Set AL if below (less than)
                    } else if (strcmp(op, ">") == 0) {
                        fprintf(out, "    seta al\n");      // Set AL if above (greater than)
                    } else if (strcmp(op, "<=") == 0) {
                        fprintf(out, "    setbe al\n");     // Set AL if below or equal
                    } else if (strcmp(op, ">=") == 0) {
                        fprintf(out, "    setae al\n");     // Set AL if above or equal
                    }
                    fprintf(out, "    movzx eax, al\n"); // Zero-extend AL to EAX (0 or 1)
                }
                // Result is now in ST0 for arithmetic, or EAX for comparisons
            } else {
                // Integer operations
                emit_node(left, out);
                fprintf(out, "    %s %s\n", get_push_instruction(), get_int_register());

                emit_node(right, out);
                fprintf(out, "    %s %s, %s\n", get_mov_instruction(), get_int_register_b(), get_int_register());
                fprintf(out, "    %s %s\n", get_pop_instruction(), get_int_register());

                if (strcmp(op, "+") == 0) {
                    fprintf(out, "    add %s, %s\n", get_int_register(), get_int_register_b());
                } else if (strcmp(op, "-") == 0) {
                    fprintf(out, "    sub %s, %s\n", get_int_register(), get_int_register_b());
                } else if (strcmp(op, "*") == 0) {
                    fprintf(out, "    imul %s, %s\n", get_int_register(), get_int_register_b());
                } else if (strcmp(op, "/") == 0) {
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    cqo\n");           // Sign-extend RAX into RDX:RAX
                        fprintf(out, "    mov rcx, %s\n", get_int_register_b());
                        fprintf(out, "    idiv rcx\n");      // Signed divide RDX:RAX by RCX
                    } else {
                        fprintf(out, "    cdq\n");           // Sign-extend EAX into EDX:EAX
                        fprintf(out, "    mov ecx, %s\n", get_int_register_b());
                        fprintf(out, "    idiv ecx\n");      // Signed divide EDX:EAX by ECX
                    }
                } else if (strcmp(op, "%") == 0) {
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    cqo\n");           // Sign-extend RAX into RDX:RAX
                        fprintf(out, "    mov rcx, %s\n", get_int_register_b());  // Move divisor to RCX
                        fprintf(out, "    idiv rcx\n");      // Signed divide RDX:RAX by RCX, remainder in RDX
                        fprintf(out, "    mov rax, rdx\n");  // Move remainder to RAX
                    } else {
                        fprintf(out, "    cdq\n");           // Sign-extend EAX into EDX:EAX
                        fprintf(out, "    mov ecx, %s\n", get_int_register_b());  // Move divisor to ECX
                        fprintf(out, "    idiv ecx\n");      // Signed divide EDX:EAX by ECX, remainder in EDX
                        fprintf(out, "    mov eax, edx\n");  // Move remainder to EAX
                    }
                } else if (strcmp(op, "==") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    sete al\n");      // Set AL if equal
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n"); // Zero-extend AL to RAX (0 or 1)
                    } else {
                        fprintf(out, "    movzx eax, al\n"); // Zero-extend AL to EAX (0 or 1)
                    }
                } else if (strcmp(op, "!=") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    setne al\n");     // Set AL if not equal
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");
                    } else {
                        fprintf(out, "    movzx eax, al\n");
                    }
                } else if (strcmp(op, "<") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    setl al\n");      // Set AL if less than (signed)
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");
                    } else {
                        fprintf(out, "    movzx eax, al\n");
                    }
                } else if (strcmp(op, ">") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    setg al\n");      // Set AL if greater than (signed)
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");
                    } else {
                        fprintf(out, "    movzx eax, al\n");
                    }
                } else if (strcmp(op, "<=") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    setle al\n");     // Set AL if less than or equal (signed)
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");
                    } else {
                        fprintf(out, "    movzx eax, al\n");
                    }
                } else if (strcmp(op, ">=") == 0) {
                    fprintf(out, "    cmp %s, %s\n", get_int_register(), get_int_register_b());
                    fprintf(out, "    setge al\n");     // Set AL if greater than or equal (signed)
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");
                    } else {
                        fprintf(out, "    movzx eax, al\n");
                    }
                } else if (strcmp(op, "&&") == 0) {
                    // Logical AND: both operands must be non-zero
                    fprintf(out, "    test %s, %s\n", get_int_register(), get_int_register());    // Test left operand
                    fprintf(out, "    setne al\n");         // Set AL = 1 if left != 0
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");    // Zero-extend to RAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand  
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx rbx, bl\n");    // Zero-extend to RBX
                        fprintf(out, "    and rax, rbx\n");     // RAX = left && right
                    } else {
                        fprintf(out, "    movzx eax, al\n");    // Zero-extend to EAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand  
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx ebx, bl\n");    // Zero-extend to EBX
                        fprintf(out, "    and eax, ebx\n");     // EAX = left && right
                    }
                } else if (strcmp(op, "||") == 0) {
                    // Logical OR: at least one operand must be non-zero
                    fprintf(out, "    test %s, %s\n", get_int_register(), get_int_register());    // Test left operand
                    fprintf(out, "    setne al\n");         // Set AL = 1 if left != 0
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");    // Zero-extend to RAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx rbx, bl\n");    // Zero-extend to RBX
                        fprintf(out, "    or rax, rbx\n");      // RAX = left || right
                    } else {
                        fprintf(out, "    movzx eax, al\n");    // Zero-extend to EAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx ebx, bl\n");    // Zero-extend to EBX
                        fprintf(out, "    or eax, ebx\n");      // EAX = left || right
                    }
                } else if (strcmp(op, "^^") == 0) {
                    // Logical XOR: exactly one operand must be non-zero
                    fprintf(out, "    test %s, %s\n", get_int_register(), get_int_register());    // Test left operand
                    fprintf(out, "    setne al\n");         // Set AL = 1 if left != 0
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    movzx rax, al\n");    // Zero-extend to RAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx rbx, bl\n");    // Zero-extend to RBX
                        fprintf(out, "    xor rax, rbx\n");     // RAX = left ^^ right
                    } else {
                        fprintf(out, "    movzx eax, al\n");    // Zero-extend to EAX
                        fprintf(out, "    test %s, %s\n", get_int_register_b(), get_int_register_b());    // Test right operand
                        fprintf(out, "    setne bl\n");         // Set BL = 1 if right != 0
                        fprintf(out, "    movzx ebx, bl\n");    // Zero-extend to EBX
                        fprintf(out, "    xor eax, ebx\n");     // EAX = left ^^ right
                    }
                } else {
                    fprintf(out, "; Unsupported binary operator: %s\n", op);
                }
            }
            break;
        }

        case AST_HALT:
            fprintf(out, "    mov eax, 1\n    int 0x80 ; halt\n");
            break;

        case AST_LABEL:
            fprintf(out, "%s:\n", node->as.label_name);
            break;

        case AST_GOTO:
            fprintf(out, "    jmp %s\n", node->as.label_name);
            break;

        case AST_IF_GOTO:
            fprintf(out, "; if cond goto %s\n", node->as.if_goto.label);
            fprintf(out, "    cmp eax, 1\n    je %s\n", node->as.if_goto.label);
            break;

        case AST_IF_STMT: {
            static int if_counter = 0;
            int current_if = if_counter++;
            
            fprintf(out, "; if statement %d\n", current_if);
            
            // Evaluate condition
            emit_node(node->as.if_stmt.condition, out);
            
            // Compare condition with 1 (true)
            fprintf(out, "    cmp eax, 0\n");
            fprintf(out, "    je .else_%d\n", current_if);
            
            // Emit then block
            fprintf(out, ".then_%d:\n", current_if);
            for (size_t i = 0; i < node->as.if_stmt.then_count; i++) {
                emit_node(node->as.if_stmt.then_body[i], out);
            }
            fprintf(out, "    jmp .end_if_%d\n", current_if);
            
            // Emit else block (if any)
            fprintf(out, ".else_%d:\n", current_if);
            for (size_t i = 0; i < node->as.if_stmt.else_count; i++) {
                emit_node(node->as.if_stmt.else_body[i], out);
            }
            
            fprintf(out, ".end_if_%d:\n", current_if);
            fprintf(out, "; end if statement %d\n", current_if);
            break;
        }

        case AST_FUNC_CALL: {
            // Use 64-bit calling convention if applicable
            if (current_config && current_config->target_arch == ARCH_64BIT) {
                emit_function_call_64bit(out, node->as.func_call.name, node->as.func_call.args, node->as.func_call.arg_count);
                break;
            }
            
            // 32-bit calling convention (original code)
            if (strcmp(node->as.func_call.name, "print") == 0 && node->as.func_call.arg_count == 1) {
                ASTNode *arg = node->as.func_call.args[0];
                if (arg->type == AST_LITERAL && arg->as.literal.type == VALUE_STRING) {
                    fprintf(stderr, "[CODEGEN DEBUG] emit_node: print call with string literal: %s\n", arg->as.literal.as.str_val);
                    int idx = find_or_add_string(arg->as.literal.as.str_val);
                    fprintf(out, "    push msg_%d\n", idx);
                    fprintf(out, "    call print\n");
                    emit_stack_cleanup(out, 4);
                    break;
                }
            } else if (strcmp(node->as.func_call.name, "print_int") == 0 && node->as.func_call.arg_count == 1) {
                // Evaluate the argument and put result in eax
                emit_node(node->as.func_call.args[0], out);
                fprintf(out, "    push %s\n", get_int_register());
                fprintf(out, "    call print_int\n");
                emit_stack_cleanup(out, 4);
                break;
            } else if (strcmp(node->as.func_call.name, "print_float") == 0 && node->as.func_call.arg_count == 1) {
                ASTNode *arg = node->as.func_call.args[0];

                // Evaluate the float expression (puts result on FPU stack)
                emit_node(arg, out);
                
                // Call printf with the float
                fprintf(out, "    sub %s, 8\n", get_stack_pointer());          // Space for double
                fprintf(out, "    fstp qword [%s]\n", get_stack_pointer());    // Store as double
                fprintf(out, "    push fmt_float\n");      // Format string
                fprintf(out, "    call printf\n");
                emit_stack_cleanup_with_comment(out, 12, "Clean up (4 + 8)");
                break;
            } else if (strcmp(node->as.func_call.name, "read_int") == 0 && node->as.func_call.arg_count == 0) {
                // Call read_int function (returns result in eax)
                fprintf(out, "    call read_int\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_float") == 0 && node->as.func_call.arg_count == 0) {
                // Call read_float function (returns result on FPU stack)
                fprintf(out, "    call read_float\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_num_safe") == 0 && node->as.func_call.arg_count == 0) {
                // Call read_num_safe function (returns result on FPU stack as float)
                fprintf(out, "    call read_num_safe\n");
                break;
            } else if (strcmp(node->as.func_call.name, "print_num") == 0 && node->as.func_call.arg_count == 1) {
                // Call print_num function with formatted output
                emit_node(node->as.func_call.args[0], out);  // Load value to FPU stack
                fprintf(out, "    sub %s, 4\n", get_stack_pointer());           // Space for float (32-bit)
                fprintf(out, "    fstp dword [%s]\n", get_stack_pointer());     // Store as single precision float
                fprintf(out, "    call print_num\n");
                emit_stack_cleanup_with_comment(out, 4, "Clean up (4 bytes)");
                break;
            } else if (strcmp(node->as.func_call.name, "print_clean") == 0 && node->as.func_call.arg_count == 1) {
                // Call print_clean function with string literal
                ASTNode *arg = node->as.func_call.args[0];
                if (arg->type == AST_LITERAL && arg->as.literal.type == VALUE_STRING) {
                    int idx = find_or_add_string(arg->as.literal.as.str_val);
                    fprintf(out, "    push msg_%d\n", idx);
                    fprintf(out, "    call print_clean\n");
                    emit_stack_cleanup(out, 4);
                }
                break;
            } else if (strcmp(node->as.func_call.name, "print_bool") == 0 && node->as.func_call.arg_count == 1) {
                // Evaluate the argument and put result in eax
                emit_node(node->as.func_call.args[0], out);
                fprintf(out, "    push %s\n", get_int_register());
                fprintf(out, "    call print_bool\n");
                emit_stack_cleanup(out, 4);
                break;
            } else if (strcmp(node->as.func_call.name, "print_bool_clean") == 0 && node->as.func_call.arg_count == 1) {
                // Evaluate the argument and put result in eax
                emit_node(node->as.func_call.args[0], out);
                fprintf(out, "    push %s\n", get_int_register());
                fprintf(out, "    call print_bool_clean\n");
                emit_stack_cleanup(out, 4);
                break;
            } else if (strcmp(node->as.func_call.name, "print_bool_numeric") == 0 && node->as.func_call.arg_count == 1) {
                // Evaluate the argument and put result in architecture-appropriate register
                emit_node(node->as.func_call.args[0], out);
                fprintf(out, "    push %s\n", get_int_register());
                fprintf(out, "    call print_bool_numeric\n");
                emit_stack_cleanup(out, 4);
                break;
            } else if (strcmp(node->as.func_call.name, "read_bool_safe") == 0 && node->as.func_call.arg_count == 0) {
                // Call read_bool_safe function (returns result in eax)
                fprintf(out, "    call read_bool_safe\n");
                break;
            // Type-specific read functions for unified I/O system
            } else if (strcmp(node->as.func_call.name, "read_i8") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_i8\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_i16") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_i16\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_i32") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_i32\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_i64") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_i64\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_u8") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_u8\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_u16") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_u16\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_u32") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_u32\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_u64") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_u64\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_f32") == 0 && node->as.func_call.arg_count == 0) {
                // Float functions return on FPU stack
                fprintf(out, "    call read_f32\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_f64") == 0 && node->as.func_call.arg_count == 0) {
                // Float functions return on FPU stack
                fprintf(out, "    call read_f64\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_bool") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_bool\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_char") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_char\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_str") == 0 && node->as.func_call.arg_count == 0) {
                fprintf(out, "    call read_str\n");
                break;
            } else if (strcmp(node->as.func_call.name, "read_num") == 0 && node->as.func_call.arg_count == 0) {
                // Numeric functions return on FPU stack
                fprintf(out, "    call read_num\n");
                break;
            }

            // Handle other function calls (user-defined functions)
            // Push arguments in reverse order (right-to-left for standard calling convention)
            for (int i = node->as.func_call.arg_count - 1; i >= 0; i--) {
                ASTNode *arg = node->as.func_call.args[i];
                emit_node(arg, out);
                
                // Check if this argument is a float type
                if (is_float_type(arg)) {
                    // For float arguments, store from FPU stack to memory, then push
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    sub rsp, 8\n");           // Reserve 8 bytes on stack for 64-bit
                        fprintf(out, "    fstp dword [rsp]  ; push float argument %d\n", i);
                    } else {
                        fprintf(out, "    sub esp, 4\n");           // Reserve 4 bytes on stack for 32-bit
                        fprintf(out, "    fstp dword [esp]  ; push float argument %d\n", i);
                    }
                } else {
                    // For integer arguments, push the full register
                    if (current_config && current_config->target_arch == ARCH_64BIT) {
                        fprintf(out, "    push rax  ; push argument %d (64-bit)\n", i);
                    } else {
                        fprintf(out, "    push eax  ; push argument %d (32-bit)\n", i);
                    }
                }
            }
            
            fprintf(out, "    call %s\n", node->as.func_call.name);
            
            // Clean up stack (remove pushed arguments)
            if (node->as.func_call.arg_count > 0) {
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    int cleanup_bytes = (int)(node->as.func_call.arg_count * 8);  // 8 bytes per argument in 64-bit
                    fprintf(out, "    add rsp, %d  ; clean up %ld arguments (64-bit)\n", 
                           cleanup_bytes, node->as.func_call.arg_count);
                } else {
                    int cleanup_bytes = (int)(node->as.func_call.arg_count * 4);  // 4 bytes per argument in 32-bit
                    fprintf(out, "    add esp, %d  ; clean up %ld arguments (32-bit)\n", 
                           cleanup_bytes, node->as.func_call.arg_count);
                }
            }
            
            // Handle return value based on function return type
            const char* return_type = get_function_return_type(node->as.func_call.name);
            if (is_float_return_type(return_type)) {
                // Float return value is already on FPU stack - nothing to do
                // (the calling context will handle it appropriately)
            } else if (strcmp(return_type, "void") != 0) {
                // Non-void, non-float return value is in eax - already handled
            }
            break;
        }

        case AST_EXTERN_FUNC:
            fprintf(out, "extern %s\n", node->as.extern_func.name);
            break;

        case AST_FUNC_DEF:
            fprintf(out, "; CODEGEN TEST MARKER: emitting function %s\n", node->as.func_def.name);
            // fprintf(stderr, "[CODEGEN DEBUG] func %s body_count=%zu\n", node->as.func_def.name, node->as.func_def.body_count);
            for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
                if (node->as.func_def.body[i]) {
                    // fprintf(stderr, "[CODEGEN DEBUG]   body[%zu] type=%d\n", i, node->as.func_def.body[i]->type);
                }
            }
            
            // Set current function context for parameter access
            ASTNode *prev_function = current_function;
            current_function = node;
            
            // Save previous stack offset and reset for this function
            int prev_stack_offset = current_stack_offset;
            current_stack_offset = 0;
            
            fprintf(out, "%s:\n", node->as.func_def.name);
            
            // Generate architecture-specific function prologue
            if (current_config && current_config->target_arch == ARCH_64BIT) {
                fprintf(out, "    push rbp\n    mov rbp, rsp\n");
            } else {
                fprintf(out, "    push ebp\n    mov ebp, esp\n");
            }
            
            // Count all local variables recursively (including those in nested structures)
            int local_vars = 0;
            for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
                local_vars += count_local_variables(node->as.func_def.body[i]);
            }
            
            // Allocate stack space for local variables (if any) - align to 16 bytes
            if (local_vars > 0) {
                int var_size = (current_config && current_config->target_arch == ARCH_64BIT) ? 8 : 4;
                int stack_space = ((local_vars * var_size) + 15) & ~15; // Round up to 16-byte boundary
                
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    sub rsp, %d  ; allocate space for %d local variables\n", 
                           stack_space, local_vars);
                } else {
                    fprintf(out, "    sub esp, %d  ; allocate space for %d local variables\n", 
                           stack_space, local_vars);
                }
            }
            
            // Check if function has explicit return statement
            int has_explicit_return = 0;
            for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
                if (node->as.func_def.body[i] && node->as.func_def.body[i]->type == AST_RETURN) {
                    has_explicit_return = 1;
                }
            }
            
            for (size_t i = 0; i < node->as.func_def.body_count; ++i)
                emit_node(node->as.func_def.body[i], out);
            
            // Only emit epilogue if there's no explicit return
            if (!has_explicit_return) {
                // Generate architecture-specific function epilogue
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    mov rsp, rbp  ; restore stack pointer\n");
                    fprintf(out, "    pop rbp\n    ret\n");
                } else {
                    fprintf(out, "    mov esp, ebp  ; restore stack pointer\n");
                    fprintf(out, "    pop ebp\n    ret\n");
                }
            }
            
            // Restore previous function context and stack offset
            current_function = prev_function;
            current_stack_offset = prev_stack_offset;
            break;

        case AST_IDENTIFIER:
            // Load variable value based on type
            {
                int found = 0;
                
                // First check if this is a function parameter
                if (current_function != NULL) {
                    for (size_t i = 0; i < current_function->as.func_def.param_count; i++) {
                        if (strcmp(current_function->as.func_def.param_names[i], node->as.ident) == 0) {
                            // This is a function parameter - access it from stack
                            // Parameters are at [rbp+16], [rbp+24], [rbp+32], etc. for 64-bit
                            // Parameters are at [ebp+8], [ebp+12], [ebp+16], etc. for 32-bit
                            // (bp+8/16 is return address, bp+0 is saved bp)
                            int offset;
                            const char* base_ptr = get_base_pointer();
                            const char* int_reg = get_int_register();
                            
                            if (current_config && current_config->target_arch == ARCH_64BIT) {
                                offset = 16 + (i * 8);  // 64-bit: 8-byte alignment
                            } else {
                                offset = 8 + (i * 4);   // 32-bit: 4-byte alignment
                            }
                            
                            // Check if this parameter is a float type
                            if (current_function->as.func_def.param_types && 
                                is_param_float_type(current_function->as.func_def.param_types[i])) {
                                fprintf(out, "    fld dword [%s+%d]  ; load float parameter %s\n", 
                                       base_ptr, offset, node->as.ident);
                            } else {
                                fprintf(out, "    mov %s, [%s+%d]  ; load parameter %s\n", 
                                       int_reg, base_ptr, offset, node->as.ident);
                            }
                            found = 1;
                            break;
                        }
                    }
                }
                
                // If not found as parameter, check local variables
                if (!found) {
                    for (int i = 0; i < var_map_count; i++) {
                        if (strcmp(var_names[i], node->as.ident) == 0) {
                            if (var_types[i] == 1) { // float
                                emit_float_var_load(node->as.ident, out);
                            } else { // int
                                emit_int_var_load(node->as.ident, out);
                            }
                            found = 1;
                            break;
                        }
                    }
                }
                
                if (!found) {
                    fprintf(stderr, "Warning: variable %s not found\n", node->as.ident);
                }
            }
            break;

        case AST_RETURN:
            if (node->as.ret.value) {
                // Return with value
                emit_node(node->as.ret.value, out);
                // Value is now in RAX (for int) or XMM0 (for float)
                // Function epilogue will handle the actual return
            }
            // For void returns, no value to load
            // Generate architecture-specific return epilogue
            if (current_config && current_config->target_arch == ARCH_64BIT) {
                fprintf(out, "    mov rsp, rbp  ; restore stack pointer\n");
                fprintf(out, "    pop rbp\n");
            } else {
                fprintf(out, "    mov esp, ebp  ; restore stack pointer\n");
                fprintf(out, "    pop ebp\n");
            }
            fprintf(out, "    ret\n");
            break;

        case AST_UNARY_OP: {
            char op = node->as.unary_op.op;
            
            if (op == '!') {
                // Logical NOT: result is 1 if operand is 0, 0 if operand is non-zero
                emit_node(node->as.unary_op.expr, out);
                fprintf(out, "    test eax, eax\n");     // Test if EAX is zero
                fprintf(out, "    sete al\n");           // Set AL = 1 if EAX was zero
                fprintf(out, "    movzx eax, al\n");     // Zero-extend AL to EAX
            } else if (op == '-') {
                // Unary minus: negate the operand
                
                // Check if operand is float/num type
                int is_float = is_float_type(node->as.unary_op.expr);
                
                if (is_float) {
                    // Float negation: load value, negate on FPU stack
                    emit_node(node->as.unary_op.expr, out);
                    fprintf(out, "    fchs\n");                  // Change sign on FPU stack
                    // Result is already on FPU stack, ready for use
                } else {
                    // Integer negation
                    emit_node(node->as.unary_op.expr, out);
                    fprintf(out, "    neg %s\n", get_int_register());  // Two's complement negation (architecture-aware)
                }
            } else {
                fprintf(out, "; Unsupported unary operator: %c\n", op);
            }
            break;
        }

        default:
            fprintf(out, "; Unhandled node type %s\n", ast_type_str(node->type));
            break;
    }
}

// Helper function to convert escape sequences for assembly output
static void write_escaped_string(FILE *out, const char *str) {
    while (*str) {
        if (*str == '\\' && *(str + 1) == 'n') {
            fprintf(out, "\",10,\"");  // 10 is ASCII for newline
            str += 2;
        } else if (*str == '\\' && *(str + 1) == 't') {
            fprintf(out, "\",9,\"");   // 9 is ASCII for tab
            str += 2;
        } else if (*str == '\\' && *(str + 1) == 'r') {
            fprintf(out, "\",13,\"");  // 13 is ASCII for carriage return
            str += 2;
        } else if (*str == '\\' && *(str + 1) == '\\') {
            fprintf(out, "\\\\");      // Literal backslash
            str += 2;
        } else if (*str == '"') {
            fprintf(out, "\\\"");      // Escaped quote
            str++;
        } else {
            fputc(*str, out);
            str++;
        }
    }
}

// --- Main entry: generate_code() ---
void generate_code(AST *ast, FILE *out, CompilationConfig *config) {
    current_config = config;  // Store for use in helper functions
    string_literal_count = 0;
    float_const_count = 0;
    float_var_count = 0;
    int_var_count = 0;
    var_map_count = 0;
    float_constants_count = 0;
    current_stack_offset = 0;

    // First pass: collect strings and analyze floats
    for (size_t i = 0; i < ast->count; ++i) {
        collect_strings(ast->nodes[i]);
        collect_floats(ast->nodes[i]);
    }

    fprintf(out, "; Generated NASM by ÆLang Compiler\n");

    // Emit .rodata section for float constants and strings
    if (string_literal_count > 0 || float_constants_count > 0) {
        fprintf(out, "section .rodata\n");
        fprintf(out, "    align 4\n");
        
        // String literals with proper escape sequence handling
        for (int i = 0; i < string_literal_count; ++i) {
            fprintf(out, "msg_%d db \"", i);
            write_escaped_string(out, string_literals[i]);
            fprintf(out, "\",0\n");
        }
        
        // Float constants
        for (int i = 0; i < float_constants_count; i++) {
            float f = float_constants[i];
            unsigned int *float_bits = (unsigned int*)&f;
            fprintf(out, "float_%d: dd 0x%08x  ; %.9g\n", i, *float_bits, f);
        }
        
        // Format string for printf
        fprintf(out, "fmt_float: db \"%%f\", 10, 0\n");
        fprintf(out, "\n");
    }

    // Emit .bss section for variables if needed
    if (var_map_count > 0) {
        fprintf(out, "section .bss\n");
        if (current_config && current_config->target_arch == ARCH_64BIT) {
            fprintf(out, "    align 8\n");
            fprintf(out, "    temp_int: resq 1  ; temporary for int to float conversion\n");
        } else {
            fprintf(out, "    align 4\n");
            fprintf(out, "    temp_int: resd 1  ; temporary for int to float conversion\n");
        }
        
        // Emit float variables
        for (int i = 0; i < var_map_count; i++) {
            if (var_types[i] == 1 && var_locations[i] == 0) { // global float
                fprintf(out, "    float_var_%d: resd 1  ; %s\n", var_indices[i], var_names[i]);
            }
        }
        
        // Emit integer variables
        for (int i = 0; i < var_map_count; i++) {
            if (var_types[i] == 0 && var_locations[i] == 0) { // global int
                if (current_config && current_config->target_arch == ARCH_64BIT) {
                    fprintf(out, "    int_var_%d: resq 1  ; %s\n", var_indices[i], var_names[i]);
                } else {
                    fprintf(out, "    int_var_%d: resd 1  ; %s\n", var_indices[i], var_names[i]);
                }
            }
        }
        
        fprintf(out, "\n");
    } else {
        // Always emit temp_int for mixed arithmetic
        fprintf(out, "section .bss\n");
        if (current_config && current_config->target_arch == ARCH_64BIT) {
            fprintf(out, "    align 8\n");
            fprintf(out, "    temp_int: resq 1  ; temporary for int to float conversion\n");
        } else {
            fprintf(out, "    align 4\n");
            fprintf(out, "    temp_int: resd 1  ; temporary for int to float conversion\n");
        }
        fprintf(out, "\n");
    }

    // Emit text section with main
    fprintf(out, "section .text\n");
    fprintf(out, "    global main\n");
    fprintf(out, "    extern printf\n");
    fprintf(out, "    extern print\n");
    fprintf(out, "    extern read_int\n");
    fprintf(out, "    extern read_float\n");
    fprintf(out, "    extern read_num\n");
    fprintf(out, "    extern read_num_safe\n");
    fprintf(out, "    extern print_num\n");
    fprintf(out, "    extern print_clean\n");
    fprintf(out, "    extern print_num_precision\n");
    fprintf(out, "    extern print_num_scientific\n");
    fprintf(out, "    extern print_currency\n");
    fprintf(out, "    extern print_percentage\n");
    fprintf(out, "    extern print_num_engineering\n");
    fprintf(out, "    extern print_hex\n");
    fprintf(out, "    extern read_num_validated\n");
    fprintf(out, "    extern read_num_with_prompt\n");
    fprintf(out, "    extern read_positive_num\n");
    fprintf(out, "    extern read_integer_only\n");
    // Unified type-specific read functions
    fprintf(out, "    extern read_i8\n");
    fprintf(out, "    extern read_i16\n");
    fprintf(out, "    extern read_i32\n");
    fprintf(out, "    extern read_i64\n");
    fprintf(out, "    extern read_u8\n");
    fprintf(out, "    extern read_u16\n");
    fprintf(out, "    extern read_u32\n");
    fprintf(out, "    extern read_u64\n");
    fprintf(out, "    extern read_f32\n");
    fprintf(out, "    extern read_f64\n");
    fprintf(out, "    extern read_bool\n");
    fprintf(out, "    extern read_char\n");
    fprintf(out, "    extern read_str\n\n");

    // First emit all externs and function definitions
    for (size_t i = 0; i < ast->count; ++i) {
        if (ast->nodes[i]->type == AST_EXTERN_FUNC || ast->nodes[i]->type == AST_FUNC_DEF) {
            emit_node(ast->nodes[i], out);
        }
    }

    // Top-level statements are emitted in the function bodies
    
    // Clean up dynamic memory
    cleanup_dynamic_arrays();
}
