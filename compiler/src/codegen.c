// codegen.c - NASM code generator for ÆLang
#include "codegen.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Debug: AST node names
static const char *ast_type_str(int type) {
    switch(type) {
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
    }
}

// Expression emitter (used for debugging only)
static void emit_expr(ASTNode *expr, FILE *out) {
    switch (expr->type) {
        case AST_LITERAL:
            emit_literal(out, expr->as.literal);
            break;
        case AST_IDENTIFIER:
            fprintf(out, "%s", expr->as.ident);
            break;
        case AST_BIN_OP:
            emit_expr(expr->as.bin_op.left, out);
            fprintf(out, " %s ", expr->as.bin_op.op);
            emit_expr(expr->as.bin_op.right, out);
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

// Emit NASM node
static void emit_node(ASTNode *node, FILE *out) {
    switch (node->type) {
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            fprintf(out, "; let %s:%s = ", node->as.var_decl.name, node->as.var_decl.type_name);
            emit_expr(node->as.var_decl.value, out);
            fprintf(out, "\n");
            emit_node(node->as.var_decl.value, out);  // Generate actual code
            break;

        case AST_ASSIGN:
            fprintf(out, "; %s = ", node->as.assign.target);
            emit_expr(node->as.assign.value, out);
            fprintf(out, "\n");
            emit_node(node->as.assign.value, out);  // Generate actual code
            break;

        case AST_LITERAL:
            if (node->as.literal.type == VALUE_INT) {
                fprintf(out, "    mov eax, %d\n", node->as.literal.as.int_val);
            } else if (node->as.literal.type == VALUE_BOOL) {
                fprintf(out, "    mov eax, %d\n", node->as.literal.as.bool_val);
            }
            break;

        case AST_BIN_OP: {
            ASTNode *left = node->as.bin_op.left;
            ASTNode *right = node->as.bin_op.right;
            const char *op = node->as.bin_op.op;

            // Evaluate left operand
            emit_node(left, out);
            fprintf(out, "    push eax\n");

            // Evaluate right operand
            emit_node(right, out);

            // Pop left operand to ebx
            fprintf(out, "    mov ebx, eax\n");
            fprintf(out, "    pop eax\n");

            if (strcmp(op, "+") == 0) {
                fprintf(out, "    add eax, ebx\n");
            } else if (strcmp(op, "-") == 0) {
                fprintf(out, "    sub eax, ebx\n");
            } else if (strcmp(op, "*") == 0) {
                fprintf(out, "    imul eax, ebx\n");
            } else if (strcmp(op, "/") == 0) {
                fprintf(out, "    xor edx, edx\n");       // Clear remainder
                fprintf(out, "    mov ecx, ebx\n");
                fprintf(out, "    div ecx\n");            // eax / ecx → eax
            } else {
                fprintf(out, "; Unsupported binary operator: %s\n", op);
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

        default:
            fprintf(out, "; Unhandled node type %s\n", ast_type_str(node->type));
            break;
    }
}

// --- Main entry: generate_code() ---
void generate_code(AST *ast, FILE *out) {
    string_literal_count = 0;

    // First pass: collect strings
    for (size_t i = 0; i < ast->count; ++i)
        collect_strings(ast->nodes[i]);

    fprintf(out, "; Generated NASM by ÆLang Compiler\n");

    // Emit data section if we have strings
    if (string_literal_count > 0) {
        fprintf(out, "section .data\n");
        for (int i = 0; i < string_literal_count; ++i)
            fprintf(out, "msg_%d db \"%s\",0\n", i, string_literals[i]);
        fprintf(out, "\n");
    }

    // Emit text section with main
    fprintf(out, "section .text\n");
    fprintf(out, "    global main\n\n");

    // First emit all externs and function definitions
    for (size_t i = 0; i < ast->count; ++i) {
        if (ast->nodes[i]->type == AST_EXTERN_FUNC || ast->nodes[i]->type == AST_FUNC_DEF) {
            emit_node(ast->nodes[i], out);
        }
    }

    // Top-level statements are emitted in the function bodies
}
