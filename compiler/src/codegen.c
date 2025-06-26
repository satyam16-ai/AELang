// codegen.c - NASM code generator for ÆLang
#define _GNU_SOURCE
#include "codegen.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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
        case VALUE_INT:
            fprintf(out, "%d", val.as.int_val);
            break;
        case VALUE_STRING:
            fprintf(out, "\"%s\"", val.as.str_val);
            break;
        case VALUE_BOOL:
            fprintf(out, "%d", val.as.bool_val);
            break;
        case VALUE_FLOAT:
            fprintf(out, "%f", val.as.float_val);
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

// --- String literal collection ---
#define MAX_STRINGS 128
static const char *string_literals[MAX_STRINGS];
static int string_literal_count = 0;
static int float_const_count = 0;  // Counter for float constants
static int float_var_count = 0;    // Counter for float variables

// Simple variable mapping
#define MAX_VARS 64
static const char *var_names[MAX_VARS];
static int var_indices[MAX_VARS];
static int var_types[MAX_VARS];  // 0 = int, 1 = float
static int var_map_count = 0;
static int int_var_count = 0;    // Counter for integer variables

// Float constants collection
#define MAX_FLOAT_CONSTS 64
static float float_constants[MAX_FLOAT_CONSTS];
static int float_constants_count = 0;

// Helper to find existing float variable index
static int find_float_var_index(const char *name) {
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0 && var_types[i] == 1) {
            return var_indices[i];
        }
    }
    return -1; // Not found
}

// Helper to determine if a value should be treated as float
static int is_float_type(ASTNode *node) {
    if (!node) return 0;
    
    if (node->type == AST_LITERAL) {
        return (node->as.literal.type == VALUE_FLOAT || 
                (node->as.literal.type == VALUE_NUM && node->as.literal.as.num_val.is_float));
    }
    
    // Check if identifier is a float/num variable
    if (node->type == AST_IDENTIFIER) {
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
    
    // Function calls that return floats
    if (node->type == AST_FUNC_CALL) {
        if (strcmp(node->as.func_call.name, "read_float") == 0 || 
            strcmp(node->as.func_call.name, "read_num_safe") == 0) {
            return 1;
        }
    }
    
    return 0;
}

// Helper to store a variable (both int and float)
static int store_var(const char *name, int is_float) {
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
    
    if (var_map_count < MAX_VARS) {
        var_names[var_map_count] = strdup(name);
        var_indices[var_map_count] = idx;
        var_types[var_map_count] = is_float ? 1 : 0;
        var_map_count++;
    }
    return idx;
}

// Helper to store a float variable
static int store_float_var(const char *name) {
    return store_var(name, 1);  // 1 = float
}

// Helper to store an integer variable
static int store_int_var(const char *name) {
    return store_var(name, 0);  // 0 = int
}

// Helper to emit float variable load
static void emit_float_var_load(const char *name, FILE *out) {
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0 && var_types[i] == 1) {
            fprintf(out, "    fld dword [float_var_%d]  ; load %s\n", var_indices[i], name);
            return;
        }
    }
    fprintf(stderr, "Warning: float var %s not found\n", name);
}

// Helper to emit integer variable load
static void emit_int_var_load(const char *name, FILE *out) {
    for (int i = 0; i < var_map_count; i++) {
        if (strcmp(var_names[i], name) == 0 && var_types[i] == 0) {
            fprintf(out, "    mov eax, [int_var_%d]  ; load %s\n", var_indices[i], name);
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
    if (string_literal_count < MAX_STRINGS) {
        fprintf(stderr, "[CODEGEN DEBUG] Adding string literal: %s\n", str);
        string_literals[string_literal_count] = str;
        return string_literal_count++;
    }
    return -1;
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
        default: break;
    }
}

// --- New: Collect float constants and variables ---
static void collect_floats(ASTNode *node) {
    if (!node) return;

    if (node->type == AST_LITERAL) {
        if (node->as.literal.type == VALUE_FLOAT) {
            if (float_constants_count < MAX_FLOAT_CONSTS) {
                float_constants[float_constants_count] = node->as.literal.as.float_val;
                float_constants_count++;
            }
        } else if (node->as.literal.type == VALUE_NUM && node->as.literal.as.num_val.is_float) {
            // Handle num type literals that contain float values
            if (float_constants_count < MAX_FLOAT_CONSTS) {
                float_constants[float_constants_count] = node->as.literal.as.num_val.value.float_val;
                float_constants_count++;
            }
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
            // Count variables by type
            if (strstr(node->as.var_decl.type_name, "f32")) {
                store_float_var(node->as.var_decl.name);
            } else if (strstr(node->as.var_decl.type_name, "num")) {
                // num type can be either int or float, start as float for flexibility
                store_float_var(node->as.var_decl.name);
            } else if (strstr(node->as.var_decl.type_name, "i32")) {
                store_int_var(node->as.var_decl.name);
            }
            break;
        case AST_ASSIGN:
            collect_floats(node->as.assign.value);
            break;
        case AST_BIN_OP:
            collect_floats(node->as.bin_op.left);
            collect_floats(node->as.bin_op.right);
            break;
        default: break;
    }
}

// Helper to find float constant index
static int find_float_const_index(float value) {
    for (int i = 0; i < float_constants_count; i++) {
        if (float_constants[i] == value) {
            return i;
        }
    }
    return -1; // Not found
}

// Helper to find existing string index
static int find_string_index(const char *str) {
    for (int i = 0; i < string_literal_count; ++i) {
        if (strcmp(string_literals[i], str) == 0)
            return i;
    }
    return -1; // Not found
}

// Emit NASM node
static void emit_node(ASTNode *node, FILE *out) {
    switch (node->type) {
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            fprintf(out, "; let %s:%s = ", node->as.var_decl.name, node->as.var_decl.type_name);
            emit_expr(node->as.var_decl.value, out);
            fprintf(out, "\n");
            
            // Handle variables by type
            if (strstr(node->as.var_decl.type_name, "f32")) {
                int var_idx = find_float_var_index(node->as.var_decl.name);
                if (var_idx < 0) {
                    fprintf(stderr, "Error: float variable %s not found in mapping\n", node->as.var_decl.name);
                    var_idx = 0; // fallback
                }
                emit_node(node->as.var_decl.value, out);  // This will load value to FPU stack
                fprintf(out, "    fstp dword [float_var_%d]  ; store %s\n", var_idx, node->as.var_decl.name);
            } else if (strstr(node->as.var_decl.type_name, "num")) {
                // num type - handle dynamically based on the value type
                int var_idx = find_float_var_index(node->as.var_decl.name);
                if (var_idx < 0) {
                    fprintf(stderr, "Error: num variable %s not found in mapping\n", node->as.var_decl.name);
                    var_idx = 0; // fallback
                }
                
                // Check if the value being assigned is a float or should be treated as float
                ASTNode *value = node->as.var_decl.value;
                int value_is_float = is_float_type(value);
                
                if (value_is_float) {
                    emit_node(value, out);  // This will load value to FPU stack
                    fprintf(out, "    fstp dword [float_var_%d]  ; store %s as num (float)\n", var_idx, node->as.var_decl.name);
                } else {
                    emit_node(value, out);  // This will load value to EAX
                    // Convert integer to float for storage in float variable space
                    fprintf(out, "    mov [temp_int], eax\n");
                    fprintf(out, "    fild dword [temp_int]  ; convert int to float\n");
                    fprintf(out, "    fstp dword [float_var_%d]  ; store %s as num (converted from int)\n", var_idx, node->as.var_decl.name);
                }
            } else if (strstr(node->as.var_decl.type_name, "i32")) {
                // Find integer variable index
                int var_idx = -1;
                for (int i = 0; i < var_map_count; i++) {
                    if (strcmp(var_names[i], node->as.var_decl.name) == 0 && var_types[i] == 0) {
                        var_idx = var_indices[i];
                        break;
                    }
                }
                if (var_idx < 0) {
                    fprintf(stderr, "Error: int variable %s not found in mapping\n", node->as.var_decl.name);
                    var_idx = 0; // fallback
                }
                emit_node(node->as.var_decl.value, out);  // This will load value to eax
                fprintf(out, "    mov [int_var_%d], eax  ; store %s\n", var_idx, node->as.var_decl.name);
            } else {
                emit_node(node->as.var_decl.value, out);  // Generate code for non-float types
            }
            break;

        case AST_ASSIGN:
            fprintf(out, "; %s = ", node->as.assign.target);
            emit_expr(node->as.assign.value, out);
            fprintf(out, "\n");
            emit_node(node->as.assign.value, out);  // Generate actual code
            break;

        case AST_LITERAL:
            if (node->as.literal.type == VALUE_FLOAT) {
                // Find the constant index and emit load
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
                    fprintf(out, "    mov eax, %d\n", node->as.literal.as.num_val.value.int_val);
                }
            } else if (node->as.literal.type == VALUE_INT) {
                fprintf(out, "    mov eax, %d\n", node->as.literal.as.int_val);
            } else if (node->as.literal.type == VALUE_BOOL) {
                fprintf(out, "    mov eax, %d\n", node->as.literal.as.bool_val);
            }
            break;

        case AST_BIN_OP: {
            ASTNode *left = node->as.bin_op.left;
            ASTNode *right = node->as.bin_op.right;
            const char *op = node->as.bin_op.op;

            // Check if either operand is float
            int is_float_op = is_float_type(left) || is_float_type(right);

            if (is_float_op) {
                // Float operations using FPU
                emit_node(left, out);   // Push left operand to FPU stack
                emit_node(right, out);  // Push right operand to FPU stack
                
                // Perform operation (ST0 = right, ST1 = left)
                if (strcmp(op, "+") == 0) {
                    fprintf(out, "    faddp\n");         // Add ST0 to ST1, pop
                } else if (strcmp(op, "-") == 0) {
                    fprintf(out, "    fsubp\n");        // Subtract ST0 from ST1, pop
                } else if (strcmp(op, "*") == 0) {
                    fprintf(out, "    fmulp\n");        // Multiply ST0 with ST1, pop
                } else if (strcmp(op, "/") == 0) {
                    fprintf(out, "    fdivp\n");        // Divide ST1 by ST0, pop
                }
                // Result is now in ST0
            } else {
                // Integer operations
                emit_node(left, out);
                fprintf(out, "    push eax\n");

                emit_node(right, out);
                fprintf(out, "    mov ebx, eax\n");
                fprintf(out, "    pop eax\n");

                if (strcmp(op, "+") == 0) {
                    fprintf(out, "    add eax, ebx\n");
                } else if (strcmp(op, "-") == 0) {
                    fprintf(out, "    sub eax, ebx\n");
                } else if (strcmp(op, "*") == 0) {
                    fprintf(out, "    imul eax, ebx\n");
                } else if (strcmp(op, "/") == 0) {
                    fprintf(out, "    xor edx, edx\n");
                    fprintf(out, "    mov ecx, ebx\n");
                    fprintf(out, "    div ecx\n");
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

        case AST_FUNC_CALL: {
            if (strcmp(node->as.func_call.name, "print") == 0 && node->as.func_call.arg_count == 1) {
                ASTNode *arg = node->as.func_call.args[0];
                if (arg->type == AST_LITERAL && arg->as.literal.type == VALUE_STRING) {
                    fprintf(stderr, "[CODEGEN DEBUG] emit_node: print call with string literal: %s\n", arg->as.literal.as.str_val);
                    int idx = find_or_add_string(arg->as.literal.as.str_val);
                    fprintf(out, "    push msg_%d\n", idx);
                    fprintf(out, "    call print\n");
                    fprintf(out, "    add esp, 4\n");
                    break;
                }
            } else if (strcmp(node->as.func_call.name, "print_int") == 0 && node->as.func_call.arg_count == 1) {
                // Evaluate the argument and put result in eax
                emit_node(node->as.func_call.args[0], out);
                fprintf(out, "    push eax\n");
                fprintf(out, "    call print_int\n");
                fprintf(out, "    add esp, 4\n");
                break;
            } else if (strcmp(node->as.func_call.name, "print_float") == 0 && node->as.func_call.arg_count == 1) {
                ASTNode *arg = node->as.func_call.args[0];

                // Evaluate the float expression (puts result on FPU stack)
                emit_node(arg, out);
                
                // Call printf with the float
                fprintf(out, "    sub esp, 8\n");          // Space for double
                fprintf(out, "    fstp qword [esp]\n");    // Store as double
                fprintf(out, "    push fmt_float\n");      // Format string
                fprintf(out, "    call printf\n");
                fprintf(out, "    add esp, 12\n");         // Clean up (4 + 8)
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
                fprintf(out, "    sub esp, 4\n");           // Space for float (32-bit)
                fprintf(out, "    fstp dword [esp]\n");     // Store as single precision float
                fprintf(out, "    call print_num\n");
                fprintf(out, "    add esp, 4\n");           // Clean up (4 bytes)
                break;
            } else if (strcmp(node->as.func_call.name, "print_clean") == 0 && node->as.func_call.arg_count == 1) {
                // Call print_clean function with string literal
                ASTNode *arg = node->as.func_call.args[0];
                if (arg->type == AST_LITERAL && arg->as.literal.type == VALUE_STRING) {
                    int idx = find_string_index(arg->as.literal.as.str_val);
                    if (idx >= 0) {
                        fprintf(out, "    push msg_%d\n", idx);
                        fprintf(out, "    call print_clean\n");
                        fprintf(out, "    add esp, 4\n");
                    }
                }
                break;
            }

            // Handle other function calls
            for (size_t i = 0; i < node->as.func_call.arg_count; ++i)
                emit_node(node->as.func_call.args[i], out);

            fprintf(out, "    call %s\n", node->as.func_call.name);
            break;
        }

        case AST_EXTERN_FUNC:
            fprintf(out, "extern %s\n", node->as.extern_func.name);
            break;

        case AST_FUNC_DEF:
            fprintf(out, "; CODEGEN TEST MARKER: emitting function %s\n", node->as.func_def.name);
            fprintf(stderr, "[CODEGEN DEBUG] func %s body_count=%zu\n", node->as.func_def.name, node->as.func_def.body_count);
            for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
                if (node->as.func_def.body[i])
                    fprintf(stderr, "[CODEGEN DEBUG]   body[%zu] type=%d\n", i, node->as.func_def.body[i]->type);
            }
            fprintf(out, "%s:\n", node->as.func_def.name);
            fprintf(out, "    push ebp\n    mov ebp, esp\n");
            for (size_t i = 0; i < node->as.func_def.body_count; ++i)
                emit_node(node->as.func_def.body[i], out);
            fprintf(out, "    pop ebp\n    ret\n");
            break;

        case AST_IDENTIFIER:
            // Load variable value based on type
            {
                int found = 0;
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
                if (!found) {
                    fprintf(stderr, "Warning: variable %s not found\n", node->as.ident);
                }
            }
            break;

        default:
            fprintf(out, "; Unhandled node type %s\n", ast_type_str(node->type));
            break;
    }
}

// --- Main entry: generate_code() ---
void generate_code(AST *ast, FILE *out) {
    string_literal_count = 0;
    float_const_count = 0;
    float_var_count = 0;
    int_var_count = 0;
    var_map_count = 0;
    float_constants_count = 0;

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
        
        // String literals
        for (int i = 0; i < string_literal_count; ++i)
            fprintf(out, "msg_%d db \"%s\",0\n", i, string_literals[i]);
        
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
        fprintf(out, "    align 4\n");
        fprintf(out, "    temp_int: resd 1  ; temporary for int to float conversion\n");
        
        // Emit float variables
        for (int i = 0; i < var_map_count; i++) {
            if (var_types[i] == 1) { // float
                fprintf(out, "    float_var_%d: resd 1  ; %s\n", var_indices[i], var_names[i]);
            }
        }
        
        // Emit integer variables
        for (int i = 0; i < var_map_count; i++) {
            if (var_types[i] == 0) { // int
                fprintf(out, "    int_var_%d: resd 1  ; %s\n", var_indices[i], var_names[i]);
            }
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
    fprintf(out, "    extern read_integer_only\n\n");

    // First emit all externs and function definitions
    for (size_t i = 0; i < ast->count; ++i) {
        if (ast->nodes[i]->type == AST_EXTERN_FUNC || ast->nodes[i]->type == AST_FUNC_DEF) {
            emit_node(ast->nodes[i], out);
        }
    }

    // Top-level statements are emitted in the function bodies
}
