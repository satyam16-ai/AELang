// ir.c - Intermediate Representation Generation for ÆLang
#define _GNU_SOURCE  // For strdup
#include "ir.h"
#include "semantic.h"  // For Type enum
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Create IR context
IRContext *create_ir_context(void) {
    IRContext *ctx = calloc(1, sizeof(IRContext));
    if (!ctx) return NULL;
    
    ctx->program = calloc(1, sizeof(IRProgram));
    ctx->temp_counter = 0;
    ctx->label_counter = 0;
    ctx->current_function = NULL;
    
    return ctx;
}

// Create IR operands
IROperand *create_temp_operand(IRContext *ctx, SemanticType type) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_TEMP;
    operand->value.temp_id = ctx->temp_counter++;
    operand->data_type = type;
    return operand;
}

IROperand *create_var_operand(const char *name, SemanticType type) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_VAR;
    operand->value.name = strdup(name);
    operand->data_type = type;
    return operand;
}

IROperand *create_const_int_operand(int value) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_CONST_INT;
    operand->value.int_val = value;
    operand->data_type = TYPE_I32;
    return operand;
}

IROperand *create_const_float_operand(float value) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_CONST_FLOAT;
    operand->value.float_val = value;
    operand->data_type = TYPE_F32;
    return operand;
}

IROperand *create_const_str_operand(const char *value) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_CONST_STR;
    operand->value.str_val = strdup(value);
    operand->data_type = TYPE_STR;
    return operand;
}

IROperand *create_label_operand(const char *name) {
    IROperand *operand = calloc(1, sizeof(IROperand));
    operand->type = OPERAND_LABEL;
    operand->value.name = strdup(name);
    operand->data_type = TYPE_VOID;
    return operand;
}

// Create IR instruction
IRInstruction *create_instruction(IROpcode opcode, IROperand *dest, 
                                  IROperand *src1, IROperand *src2, int line) {
    IRInstruction *instr = calloc(1, sizeof(IRInstruction));
    instr->opcode = opcode;
    instr->dest = dest;
    instr->src1 = src1;
    instr->src2 = src2;
    instr->line_number = line;
    instr->next = NULL;
    instr->params = NULL;
    instr->param_count = 0;
    return instr;
}

// Append instruction to current function
void append_instruction(IRContext *ctx, IRInstruction *instr) {
    if (!ctx->current_function) {
        // Global instruction
        if (!ctx->program->global_instructions) {
            ctx->program->global_instructions = instr;
        } else {
            IRInstruction *last = ctx->program->global_instructions;
            while (last->next) last = last->next;
            last->next = instr;
        }
    } else {
        // Function instruction
        if (!ctx->current_function->instructions) {
            ctx->current_function->instructions = instr;
        } else {
            IRInstruction *last = ctx->current_function->instructions;
            while (last->next) last = last->next;
            last->next = instr;
        }
    }
}

// Generate unique label name
static char *generate_label(IRContext *ctx, const char *prefix) {
    // Calculate required size: prefix + "_" + counter digits + null terminator
    int counter_digits = snprintf(NULL, 0, "%d", ctx->label_counter);
    int needed_size = strlen(prefix) + 1 + counter_digits + 1;
    char *label = malloc(needed_size);
    snprintf(label, needed_size, "%s_%d", prefix, ctx->label_counter++);
    return label;
}

// Forward declarations
static IROperand *generate_expression_ir(AnnotatedASTNode *node, IRContext *ctx);
static IROperand *generate_expression_ir_with_type(AnnotatedASTNode *node, IRContext *ctx, SemanticType expected_type);
static void generate_statement_ir(AnnotatedASTNode *node, IRContext *ctx);

// Generate IR for expressions with type context
static IROperand *generate_expression_ir_with_type(AnnotatedASTNode *node, IRContext *ctx, SemanticType expected_type) {
    if (!node || !node->original_node) {
        return NULL;
    }
    
    ASTNode *ast_node = node->original_node;
    
    switch (ast_node->type) {
        case AST_FUNC_CALL: {
            // Generate parameter operands
            IROperand **args = calloc(ast_node->as.func_call.arg_count, sizeof(IROperand*));
            for (size_t i = 0; i < ast_node->as.func_call.arg_count; i++) {
                args[i] = generate_expression_ir(node->children[i], ctx);
            }
            
            // Special handling for unified read() function
            if (strcmp(ast_node->as.func_call.name, "read") == 0 && ast_node->as.func_call.arg_count == 0) {
                SemanticType target_type = expected_type != TYPE_UNKNOWN ? expected_type : node->resolved_type;
                
                // Create parameters array for read_with_type
                IROperand **read_args = calloc(1, sizeof(IROperand*));
                read_args[0] = create_const_int_operand((int)target_type);
                
                // Generate call to read_with_type instead of read
                IROperand *result = create_temp_operand(ctx, target_type);
                IROperand *func_op = calloc(1, sizeof(IROperand));
                func_op->type = OPERAND_FUNCTION;
                func_op->value.name = strdup("read_with_type");
                
                printf("[IR Debug] Transformed read() to read_with_type(%d) for expected type %d\n", (int)target_type, target_type);
                
                IRInstruction *call = create_instruction(IR_CALL, result, func_op, NULL, ast_node->line);
                call->param_count = 1;
                call->params = read_args;
                append_instruction(ctx, call);
                
                free(args); // Free the empty args array
                return result;
            }
            
            // Regular function call handling
            IROperand *result = create_temp_operand(ctx, expected_type != TYPE_UNKNOWN ? expected_type : node->resolved_type);
            IROperand *func_op = calloc(1, sizeof(IROperand));
            func_op->type = OPERAND_FUNCTION;
            func_op->value.name = strdup(ast_node->as.func_call.name);
            
            printf("[IR Debug] Function call: %s with expected type %d\n", func_op->value.name, expected_type != TYPE_UNKNOWN ? expected_type : node->resolved_type);
            
            IRInstruction *call = create_instruction(IR_CALL, result, func_op, NULL, ast_node->line);
            call->param_count = ast_node->as.func_call.arg_count;
            call->params = args; // Transfer ownership of args array
            append_instruction(ctx, call);
            return result;
        }
        
        default:
            // For other expressions, fall back to regular generation
            return generate_expression_ir(node, ctx);
    }
}

// Generate IR for expressions
static IROperand *generate_expression_ir(AnnotatedASTNode *node, IRContext *ctx) {
    if (!node || !node->original_node) {
        return NULL;
    }
    
    ASTNode *ast_node = node->original_node;
    
    switch (ast_node->type) {
        case AST_LITERAL: {
            switch (ast_node->as.literal.type) {
                case VALUE_INT: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.int_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_FLOAT: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_F32);
                    IROperand *const_op = create_const_float_operand(ast_node->as.literal.as.float_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_BOOL: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_BOOL);
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.bool_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_STRING: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_STR);
                    IROperand *const_op = create_const_str_operand(ast_node->as.literal.as.str_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_CHAR: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_CHAR);
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.char_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_NUM: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_NUM);
                    IROperand *const_op;
                    
                    if (ast_node->as.literal.as.num_val.is_float) {
                        const_op = create_const_float_operand(ast_node->as.literal.as.num_val.value.float_val);
                    } else {
                        const_op = create_const_int_operand(ast_node->as.literal.as.num_val.value.int_val);
                    }
                    
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                // Handle additional integer types
                case VALUE_I8: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Promote to i32 for IR
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.i8_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_I16: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Promote to i32 for IR
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.i16_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_I64: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Truncate to i32 for now
                    IROperand *const_op = create_const_int_operand((int32_t)ast_node->as.literal.as.i64_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_U8: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Promote to i32 for IR
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.u8_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_U16: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Promote to i32 for IR
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.u16_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_U32: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Map to i32 for IR
                    IROperand *const_op = create_const_int_operand((int32_t)ast_node->as.literal.as.u32_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_U64: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_I32);  // Truncate to i32 for now
                    IROperand *const_op = create_const_int_operand((int32_t)ast_node->as.literal.as.u64_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_F8: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_F32);  // Promote f8 to f32 for IR
                    // f8_val contains bit pattern, need to convert to float
                    // For now, treat as direct bit pattern (will need runtime conversion)
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.f8_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_F16: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_F32);  // Promote f16 to f32 for IR
                    // f16_val contains bit pattern, need to convert to float  
                    // For now, treat as direct bit pattern (will need runtime conversion)
                    IROperand *const_op = create_const_int_operand(ast_node->as.literal.as.f16_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
                case VALUE_F64: {
                    IROperand *temp = create_temp_operand(ctx, TYPE_F32);  // Map to f32 for now
                    IROperand *const_op = create_const_float_operand((float)ast_node->as.literal.as.f64_val);
                    IRInstruction *instr = create_instruction(IR_LOAD_CONST, temp, const_op, NULL, ast_node->line);
                    append_instruction(ctx, instr);
                    return temp;
                }
            }
            break;
        }
        
        case AST_IDENTIFIER: {
            IROperand *temp = create_temp_operand(ctx, node->resolved_type);
            IROperand *var_op = create_var_operand(ast_node->as.ident, node->resolved_type);
            IRInstruction *instr = create_instruction(IR_LOAD_VAR, temp, var_op, NULL, ast_node->line);
            append_instruction(ctx, instr);
            return temp;
        }
        
        case AST_BIN_OP: {
            IROperand *left = generate_expression_ir(node->children[0], ctx);
            IROperand *right = generate_expression_ir(node->children[1], ctx);
            IROperand *result = create_temp_operand(ctx, node->resolved_type);
            
            IROpcode opcode;
            const char *op = ast_node->as.bin_op.op;
            
            if (strcmp(op, "+") == 0) opcode = IR_ADD;
            else if (strcmp(op, "-") == 0) opcode = IR_SUB;
            else if (strcmp(op, "*") == 0) opcode = IR_MUL;
            else if (strcmp(op, "/") == 0) opcode = IR_DIV;
            else if (strcmp(op, "%") == 0) opcode = IR_MOD;
            else if (strcmp(op, "==") == 0) opcode = IR_EQ;
            else if (strcmp(op, "!=") == 0) opcode = IR_NEQ;
            else if (strcmp(op, "<") == 0) opcode = IR_LT;
            else if (strcmp(op, ">") == 0) opcode = IR_GT;
            else if (strcmp(op, "<=") == 0) opcode = IR_LEQ;
            else if (strcmp(op, ">=") == 0) opcode = IR_GEQ;
            else if (strcmp(op, "&&") == 0) opcode = IR_AND;
            else if (strcmp(op, "||") == 0) opcode = IR_OR;
            else {
                fprintf(stderr, "Unknown binary operator: %s\n", op);
                return NULL;
            }
            
            // Handle type conversions if needed
            if (left->data_type != right->data_type) {
                if (left->data_type == TYPE_I32 && right->data_type == TYPE_F32) {
                    IROperand *converted = create_temp_operand(ctx, TYPE_F32);
                    IRInstruction *conv = create_instruction(IR_INT_TO_FLOAT, converted, left, NULL, ast_node->line);
                    append_instruction(ctx, conv);
                    left = converted;
                } else if (left->data_type == TYPE_F32 && right->data_type == TYPE_I32) {
                    IROperand *converted = create_temp_operand(ctx, TYPE_F32);
                    IRInstruction *conv = create_instruction(IR_INT_TO_FLOAT, converted, right, NULL, ast_node->line);
                    append_instruction(ctx, conv);
                    right = converted;
                }
            }
            
            IRInstruction *instr = create_instruction(opcode, result, left, right, ast_node->line);
            append_instruction(ctx, instr);
            return result;
        }
        
        case AST_UNARY_OP: {
            if (!node->children || node->child_count == 0) {
                fprintf(stderr, "Error: Unary operation has no children\n");
                fprintf(stderr, "  original_node_type: %d, resolved_type: %d\n", 
                       node->original_node ? (int)node->original_node->type : -1, (int)node->resolved_type);
                return NULL;
            }
            
            IROperand *operand = generate_expression_ir(node->children[0], ctx);
            IROperand *result = create_temp_operand(ctx, node->resolved_type);
            
            IROpcode opcode;
            char op = ast_node->as.unary_op.op;
            
            if (op == '!') {
                opcode = IR_NOT;
            } else if (op == '-') {
                opcode = IR_NEG;
            } else {
                fprintf(stderr, "Unknown unary operator: %c\n", op);
                return NULL;
            }
            
            IRInstruction *instr = create_instruction(opcode, result, operand, NULL, ast_node->line);
            append_instruction(ctx, instr);
            return result;
        }
        
        case AST_FUNC_CALL: {
            // Generate parameter operands
            IROperand **args = calloc(ast_node->as.func_call.arg_count, sizeof(IROperand*));
            for (size_t i = 0; i < ast_node->as.func_call.arg_count; i++) {
                args[i] = generate_expression_ir(node->children[i], ctx);
            }
            
            // Generate call instruction with parameters embedded
            IROperand *result = create_temp_operand(ctx, node->resolved_type);
            IROperand *func_op = calloc(1, sizeof(IROperand));
            func_op->type = OPERAND_FUNCTION;
            
            // Create call instruction
            IRInstruction *call = create_instruction(IR_CALL, result, func_op, NULL, ast_node->line);
            
            // Store parameters directly in the call instruction
            call->param_count = ast_node->as.func_call.arg_count;
            call->params = args; // Transfer ownership of args array to the instruction
            
            // Transform universal read() calls to type-specific calls based on resolved type
            if (strcmp(ast_node->as.func_call.name, "read") == 0 && ast_node->as.func_call.arg_count == 0) {
                switch (node->resolved_type) {
                    case TYPE_I8:
                        func_op->value.name = strdup("read_i8");
                        break;
                    case TYPE_I16:
                        func_op->value.name = strdup("read_i16");
                        break;
                    case TYPE_I32:
                        func_op->value.name = strdup("read_i32");
                        break;
                    case TYPE_I64:
                        func_op->value.name = strdup("read_i64");
                        break;
                    case TYPE_U8:
                        func_op->value.name = strdup("read_u8");
                        break;
                    case TYPE_U16:
                        func_op->value.name = strdup("read_u16");
                        break;
                    case TYPE_U32:
                        func_op->value.name = strdup("read_u32");
                        break;
                    case TYPE_U64:
                        func_op->value.name = strdup("read_u64");
                        break;
                    case TYPE_F32:
                        func_op->value.name = strdup("read_f32");
                        break;
                    case TYPE_F64:
                        func_op->value.name = strdup("read_f64");
                        break;
                    case TYPE_NUM:
                        func_op->value.name = strdup("read_num");
                        break;
                    case TYPE_CHAR:
                        func_op->value.name = strdup("read_char");
                        break;
                    default:
                        // Fall back to generic read for unknown types
                        func_op->value.name = strdup("read");
                        break;
                }
                printf("[IR Debug] Transformed read() to %s for type %d\n", func_op->value.name, node->resolved_type);
            } else {
                func_op->value.name = strdup(ast_node->as.func_call.name);
            }
            
            // Append the call instruction (which already has parameters embedded)
            append_instruction(ctx, call);
            return result;
        }
        
        default:
            return NULL;
    }
    
    return NULL;
}

// Generate IR for statements
static void generate_statement_ir(AnnotatedASTNode *node, IRContext *ctx) {
    if (!node || !node->original_node) {
        printf("[IR Debug] generate_statement_ir: NULL node\n");
        return;
    }
    
    ASTNode *ast_node = node->original_node;
    printf("[IR Debug] Processing statement type: %d\n", ast_node->type);
    
    switch (ast_node->type) {
        case AST_VAR_DECL: {
            printf("[IR Debug] Variable declaration: %s\n", ast_node->as.var_decl.name);
            if (ast_node->as.var_decl.value) {
                // Pass the variable's declared type as context to the expression
                IROperand *value = generate_expression_ir_with_type(node->children[0], ctx, node->resolved_type);
                IROperand *var_op = create_var_operand(ast_node->as.var_decl.name, node->resolved_type);
                IRInstruction *store = create_instruction(IR_STORE_VAR, NULL, var_op, value, ast_node->line);
                append_instruction(ctx, store);
                printf("[IR Debug] Generated STORE_VAR instruction\n");
            } else {
                printf("[IR Debug] Variable declaration without initial value\n");
            }
            break;
        }
        
        case AST_CONST_DECL: {
            printf("[IR Debug] Constant declaration: %s\n", ast_node->as.var_decl.name);
            if (ast_node->as.var_decl.value) {
                // Constants are treated like variables in IR but marked as constant in semantic analysis
                IROperand *value = generate_expression_ir_with_type(node->children[0], ctx, node->resolved_type);
                IROperand *const_op = create_var_operand(ast_node->as.var_decl.name, node->resolved_type);
                IRInstruction *store = create_instruction(IR_STORE_VAR, NULL, const_op, value, ast_node->line);
                append_instruction(ctx, store);
                printf("[IR Debug] Generated STORE_VAR instruction for constant\n");
            }
            break;
        }
        
        case AST_ASSIGN: {
            IROperand *value = generate_expression_ir(node->children[0], ctx);
            IROperand *var_op = create_var_operand(ast_node->as.assign.target, node->resolved_type);
            IRInstruction *store = create_instruction(IR_STORE_VAR, NULL, var_op, value, ast_node->line);
            append_instruction(ctx, store);
            printf("[IR Debug] Generated STORE_VAR instruction for assignment\n");
            break;
        }
        
        case AST_IF_STMT: {
            IROperand *condition = generate_expression_ir(node->children[0], ctx);
            
            char *else_label = generate_label(ctx, "else");
            char *end_label = generate_label(ctx, "end_if");
            
            // if !condition goto else_label
            IROperand *else_op = create_label_operand(else_label);
            IRInstruction *if_false = create_instruction(IR_IF_FALSE_GOTO, else_op, condition, NULL, ast_node->line);
            append_instruction(ctx, if_false);
            printf("[IR Debug] Generated IF_FALSE_GOTO instruction\n");
            
            // Generate then body
            for (size_t i = 1; i < node->child_count; i++) {
                if (i <= ast_node->as.if_stmt.then_count) {
                    generate_statement_ir(node->children[i], ctx);
                }
            }
            
            // goto end_label
            IROperand *end_op = create_label_operand(end_label);
            IRInstruction *goto_end = create_instruction(IR_GOTO, end_op, NULL, NULL, ast_node->line);
            append_instruction(ctx, goto_end);
            printf("[IR Debug] Generated GOTO instruction to end label\n");
            
            // else_label:
            IRInstruction *else_label_instr = create_instruction(IR_LABEL, else_op, NULL, NULL, ast_node->line);
            append_instruction(ctx, else_label_instr);
            printf("[IR Debug] Generated LABEL instruction for else label\n");
            
            // Generate else body if present
            if (ast_node->as.if_stmt.else_count > 0) {
                size_t else_start = ast_node->as.if_stmt.then_count + 1;
                for (size_t i = else_start; i < node->child_count; i++) {
                    generate_statement_ir(node->children[i], ctx);
                }
            }
            
            // end_label:
            IRInstruction *end_label_instr = create_instruction(IR_LABEL, end_op, NULL, NULL, ast_node->line);
            append_instruction(ctx, end_label_instr);
            printf("[IR Debug] Generated LABEL instruction for end label\n");
            
            free(else_label);
            free(end_label);
            break;
        }
        
        case AST_RETURN: {
            if (ast_node->as.ret.value) {
                IROperand *return_value = generate_expression_ir(node->children[0], ctx);
                IRInstruction *ret = create_instruction(IR_RETURN, NULL, return_value, NULL, ast_node->line);
                append_instruction(ctx, ret);
                printf("[IR Debug] Generated RETURN instruction with value\n");
            } else {
                IRInstruction *ret = create_instruction(IR_RETURN, NULL, NULL, NULL, ast_node->line);
                append_instruction(ctx, ret);
                printf("[IR Debug] Generated RETURN instruction without value\n");
            }
            break;
        }
        
        case AST_FUNC_CALL: {
            // Function call as statement (ignore return value)
            generate_expression_ir(node, ctx);
            printf("[IR Debug] Ignored return value of function call\n");
            break;
        }
        
        default:
            break;
    }
}

// Create annotated node from AST node
static AnnotatedASTNode *create_annotated_node(ASTNode *ast_node) {
    if (!ast_node) return NULL;
    
    AnnotatedASTNode *annotated = calloc(1, sizeof(AnnotatedASTNode));
    annotated->original_node = ast_node;
    annotated->resolved_type = TYPE_VOID; // Default, should be set by semantic analysis
    
    // Count and create children based on node type
    size_t child_count = 0;
    ASTNode **child_nodes = NULL;
    
    switch (ast_node->type) {
        case AST_VAR_DECL:
            if (ast_node->as.var_decl.value) {
                child_count = 1;
                child_nodes = &ast_node->as.var_decl.value;
            }
            break;
        case AST_CONST_DECL:
            if (ast_node->as.var_decl.value) {
                child_count = 1;
                child_nodes = &ast_node->as.var_decl.value;
            }
            break;
        case AST_ASSIGN:
            child_count = 1;
            child_nodes = &ast_node->as.assign.value;
            break;
        case AST_BIN_OP:
            child_count = 2;
            // For binary ops, we need to handle the children manually
            if (child_count > 0) {
                annotated->children = calloc(child_count, sizeof(AnnotatedASTNode*));
                annotated->child_count = child_count;
                annotated->children[0] = create_annotated_node(ast_node->as.bin_op.left);
                annotated->children[1] = create_annotated_node(ast_node->as.bin_op.right);
            }
            return annotated;
        case AST_FUNC_CALL:
            child_count = ast_node->as.func_call.arg_count;
            if (child_count > 0) {
                annotated->children = calloc(child_count, sizeof(AnnotatedASTNode*));
                annotated->child_count = child_count;
                for (size_t i = 0; i < child_count; i++) {
                    annotated->children[i] = create_annotated_node(ast_node->as.func_call.args[i]);
                }
            }
            return annotated;
        case AST_IF_STMT:
            child_count = 1 + ast_node->as.if_stmt.then_count + ast_node->as.if_stmt.else_count;
            if (child_count > 0) {
                annotated->children = calloc(child_count, sizeof(AnnotatedASTNode*));
                annotated->child_count = child_count;
                
                // Condition
                annotated->children[0] = create_annotated_node(ast_node->as.if_stmt.condition);
                
                // Then statements
                for (size_t i = 0; i < ast_node->as.if_stmt.then_count; i++) {
                    annotated->children[1 + i] = create_annotated_node(ast_node->as.if_stmt.then_body[i]);
                }
                
                // Else statements
                for (size_t i = 0; i < ast_node->as.if_stmt.else_count; i++) {
                    annotated->children[1 + ast_node->as.if_stmt.then_count + i] = 
                        create_annotated_node(ast_node->as.if_stmt.else_body[i]);
                }
            }
            return annotated;
        case AST_RETURN:
            if (ast_node->as.ret.value) {
                child_count = 1;
                child_nodes = &ast_node->as.ret.value;
            }
            break;
        default:
            break;
    }
    
    // Handle simple cases with single child pointer
    if (child_count > 0 && child_nodes) {
        annotated->children = calloc(child_count, sizeof(AnnotatedASTNode*));
        annotated->child_count = child_count;
        annotated->children[0] = create_annotated_node(*child_nodes);
    }
    
    return annotated;
}

// Generate IR from annotated AST
IRProgram *generate_ir(AnnotatedAST *ast, SemanticContext *sem_ctx) {
    (void)sem_ctx;  // Mark as unused for now
    if (!ast) return NULL;
    
    IRContext *ctx = create_ir_context();
    
    // Process all top-level nodes
    for (size_t i = 0; i < ast->count; i++) {
        AnnotatedASTNode *node = ast->nodes[i];
        if (!node || !node->original_node) continue;
        
        ASTNode *original = node->original_node;
        
        if (original->type == AST_FUNC_DEF) {
            // Create new function
            IRFunction *func = calloc(1, sizeof(IRFunction));
            func->name = strdup(original->as.func_def.name);
            func->param_count = original->as.func_def.param_count;
            func->return_type = node->resolved_type;
            func->temp_counter = 0;
            
            // Set as current function
            IRFunction *prev_func = ctx->current_function;
            ctx->current_function = func;
            
            // Generate parameter operands
            if (func->param_count > 0) {
                func->parameters = calloc(func->param_count, sizeof(IROperand*));
                for (int j = 0; j < func->param_count; j++) {
                    SemanticType param_type = string_to_semantic_type(original->as.func_def.param_types[j]);
                    func->parameters[j] = create_var_operand(original->as.func_def.param_names[j], param_type);
                }
            }
            
            // Generate IR for function body
            for (size_t j = 0; j < original->as.func_def.body_count; j++) {
                // Use the existing annotated node for body statements from semantic analysis
                if (j < node->child_count) {
                    generate_statement_ir(node->children[j], ctx);
                } else {
                    // Fallback: create annotated node if not available
                    AnnotatedASTNode *body_node = create_annotated_node(original->as.func_def.body[j]);
                    generate_statement_ir(body_node, ctx);
                }
            }
            
            // Link function to program
            func->next = ctx->program->functions;
            ctx->program->functions = func;
            
            ctx->current_function = prev_func;
        } else {
            // Global statement - use the existing annotated node from semantic analysis
            generate_statement_ir(node, ctx);
        }
    }
    
    IRProgram *program = ctx->program;
    ctx->program = NULL;  // Prevent double-free
    
    // Count functions and instructions for debug output
    int func_count = 0;
    int total_instructions = 0;
    
    IRFunction *func = program->functions;
    while (func) {
        func_count++;
        IRInstruction *instr = func->instructions;
        while (instr) {
            total_instructions++;
            instr = instr->next;
        }
        func = func->next;
    }
    
    IRInstruction *global_instr = program->global_instructions;
    while (global_instr) {
        total_instructions++;
        global_instr = global_instr->next;
    }
    
    printf("[IR Generation] Generated IR with %d functions and %d instructions\n", 
           func_count, total_instructions);
    
    free_ir_context(ctx);
    
    return program;
}

// Opcode to string conversion
const char *opcode_to_string(IROpcode opcode) {
    switch (opcode) {
        case IR_ADD: return "ADD";
        case IR_SUB: return "SUB";
        case IR_MUL: return "MUL";
        case IR_DIV: return "DIV";
        case IR_MOD: return "MOD";
        case IR_EQ: return "EQ";
        case IR_NEQ: return "NEQ";
        case IR_LT: return "LT";
        case IR_GT: return "GT";
        case IR_LEQ: return "LEQ";
        case IR_GEQ: return "GEQ";
        case IR_AND: return "AND";
        case IR_OR: return "OR";
        case IR_NOT: return "NOT";
        case IR_ASSIGN: return "ASSIGN";
        case IR_LOAD_CONST: return "LOAD_CONST";
        case IR_LOAD_VAR: return "LOAD_VAR";
        case IR_STORE_VAR: return "STORE_VAR";
        case IR_INT_TO_FLOAT: return "INT_TO_FLOAT";
        case IR_FLOAT_TO_INT: return "FLOAT_TO_INT";
        case IR_LABEL: return "LABEL";
        case IR_GOTO: return "GOTO";
        case IR_IF_GOTO: return "IF_GOTO";
        case IR_IF_FALSE_GOTO: return "IF_FALSE_GOTO";
        case IR_CALL: return "CALL";
        case IR_RETURN: return "RETURN";
        case IR_PARAM: return "PARAM";
        case IR_NOP: return "NOP";
        default: return "UNKNOWN";
    }
}

// Print IR instruction
void print_ir_instruction(IRInstruction *instr) {
    if (!instr) return;
    
    printf("    %s", opcode_to_string(instr->opcode));
    
    if (instr->dest) {
        printf(" t%d", instr->dest->value.temp_id);
        if (instr->src1 || instr->src2) printf(" =");
    }
    
    if (instr->src1) {
        switch (instr->src1->type) {
            case OPERAND_TEMP:
                printf(" t%d", instr->src1->value.temp_id);
                break;
            case OPERAND_VAR:
                printf(" %s", instr->src1->value.name);
                break;
            case OPERAND_CONST_INT:
                printf(" %d", instr->src1->value.int_val);
                break;
            case OPERAND_CONST_FLOAT:
                printf(" %.2f", instr->src1->value.float_val);
                break;
            case OPERAND_CONST_STR:
                printf(" \"%s\"", instr->src1->value.str_val);
                break;
            case OPERAND_LABEL:
                printf(" %s", instr->src1->value.name);
                break;
            case OPERAND_FUNCTION:
                printf(" %s", instr->src1->value.name);
                break;
        }
    }
    
    if (instr->src2) {
        switch (instr->src2->type) {
            case OPERAND_TEMP:
                printf(", t%d", instr->src2->value.temp_id);
                break;
            case OPERAND_VAR:
                printf(", %s", instr->src2->value.name);
                break;
            case OPERAND_CONST_INT:
                printf(", %d", instr->src2->value.int_val);
                break;
            case OPERAND_CONST_FLOAT:
                printf(", %.2f", instr->src2->value.float_val);
                break;
            case OPERAND_LABEL:
                printf(", %s", instr->src2->value.name);
                break;
            default:
                break;
        }
    }
    
    printf("\n");
}

// Print IR program
void print_ir_program(IRProgram *program) {
    if (!program) return;
    
    printf("; ÆLang Intermediate Representation\n\n");
    
    // Print global instructions
    if (program->global_instructions) {
        printf("GLOBAL:\n");
        IRInstruction *instr = program->global_instructions;
        while (instr) {
            print_ir_instruction(instr);
            instr = instr->next;
        }
        printf("\n");
    }
    
    // Print functions
    IRFunction *func = program->functions;
    while (func) {
        printf("FUNCTION %s(", func->name);
        for (int i = 0; i < func->param_count; i++) {
            if (i > 0) printf(", ");
            printf("%s", func->parameters[i]->value.name);
        }
        printf("):\n");
        
        IRInstruction *instr = func->instructions;
        while (instr) {
            print_ir_instruction(instr);
            instr = instr->next;
        }
        printf("\n");
        
        func = func->next;
    }
}

// Cleanup functions
void free_ir_context(IRContext *ctx) {
    if (!ctx) return;
    
    if (ctx->program) {
        free_ir_program(ctx->program);
    }
    
    free(ctx);
}

void free_ir_program(IRProgram *program) {
    if (!program) return;
    
    // Free global instructions
    IRInstruction *instr = program->global_instructions;
    while (instr) {
        IRInstruction *next = instr->next;
        // Free operands...
        free(instr);
        instr = next;
    }
    
    // Free functions
    IRFunction *func = program->functions;
    while (func) {
        IRFunction *next_func = func->next;
        
        // Free function instructions
        IRInstruction *func_instr = func->instructions;
        while (func_instr) {
            IRInstruction *next_instr = func_instr->next;
            // Free operands...
            free(func_instr);
            func_instr = next_instr;
        }
        
        free(func->name);
        free(func->parameters);
        free(func);
        func = next_func;
    }
    
    free(program);
}
