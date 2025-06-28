// semantic.c - Semantic Analysis Implementation for ÆLang
#define _GNU_SOURCE  // For strdup
#include "semantic.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

// Hash function for symbol table
static unsigned int hash(const char *str) {
    unsigned int hash = 5381;
    int c;
    while ((c = *str++)) {
        hash = ((hash << 5) + hash) + c;
    }
    return hash % 256;
}

// Create semantic analysis context
SemanticContext *create_semantic_context(void) {
    SemanticContext *ctx = calloc(1, sizeof(SemanticContext));
    if (!ctx) return NULL;
    
    // Create global scope
    ctx->global_scope = calloc(1, sizeof(Scope));
    ctx->current_scope = ctx->global_scope;
    ctx->scope_counter = 0;
    ctx->error_count = 0;
    ctx->warning_count = 0;
    ctx->current_function = NULL;
    
    // Add built-in functions to global scope
    define_symbol(ctx, "print", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_int", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_float", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_bool", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_num", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "read_int", SYMBOL_FUNCTION, TYPE_I32, 0);
    define_symbol(ctx, "read_float", SYMBOL_FUNCTION, TYPE_F32, 0);
    define_symbol(ctx, "read_num", SYMBOL_FUNCTION, TYPE_NUM, 0);
    define_symbol(ctx, "read_num_safe", SYMBOL_FUNCTION, TYPE_NUM, 0);
    
    return ctx;
}

// Convert string type to semantic type
SemanticType string_to_semantic_type(const char *type_str) {
    if (!type_str) return TYPE_UNKNOWN;
    
    if (strcmp(type_str, "i32") == 0) return TYPE_I32;
    if (strcmp(type_str, "f32") == 0) return TYPE_F32;
    if (strcmp(type_str, "num") == 0) return TYPE_NUM;
    if (strcmp(type_str, "bool") == 0) return TYPE_BOOL;
    if (strcmp(type_str, "str") == 0) return TYPE_STR;
    if (strcmp(type_str, "char") == 0) return TYPE_CHAR;
    if (strcmp(type_str, "void") == 0) return TYPE_VOID;
    
    return TYPE_UNKNOWN;
}

// Convert AST literal type to semantic type
static SemanticType literal_to_semantic_type(LiteralValue *literal) {
    switch (literal->type) {
        case VALUE_INT: return TYPE_I32;
        case VALUE_FLOAT: return TYPE_F32;
        case VALUE_BOOL: return TYPE_BOOL;
        case VALUE_CHAR: return TYPE_CHAR;
        case VALUE_STRING: return TYPE_STR;
        case VALUE_NUM: return TYPE_NUM;
        default: return TYPE_UNKNOWN;
    }
}

// Symbol table operations
Symbol *lookup_symbol(SemanticContext *ctx, const char *name) {
    Scope *scope = ctx->current_scope;
    
    // Search from current scope up to global scope
    while (scope) {
        unsigned int index = hash(name);
        Symbol *symbol = scope->symbols[index];
        
        while (symbol) {
            if (strcmp(symbol->name, name) == 0) {
                symbol->is_used = true;
                return symbol;
            }
            symbol = symbol->next;
        }
        scope = scope->parent;
    }
    return NULL;
}

bool define_symbol(SemanticContext *ctx, const char *name, SymbolType sym_type, 
                   SemanticType data_type, int line) {
    // Check if symbol already exists in current scope
    unsigned int index = hash(name);
    Symbol *existing = ctx->current_scope->symbols[index];
    
    while (existing) {
        if (strcmp(existing->name, name) == 0) {
            semantic_error(ctx, line, "Symbol '%s' already defined in current scope (line %d)", 
                          name, existing->line_declared);
            return false;
        }
        existing = existing->next;
    }
    
    // Create new symbol
    Symbol *symbol = calloc(1, sizeof(Symbol));
    symbol->name = strdup(name);
    symbol->symbol_type = sym_type;
    symbol->data_type = data_type;
    symbol->line_declared = line;
    symbol->is_used = false;
    symbol->is_initialized = (sym_type == SYMBOL_FUNCTION || sym_type == SYMBOL_PARAMETER);
    
    // Add to hash table
    symbol->next = ctx->current_scope->symbols[index];
    ctx->current_scope->symbols[index] = symbol;
    
    return true;
}

void enter_scope(SemanticContext *ctx) {
    Scope *new_scope = calloc(1, sizeof(Scope));
    new_scope->parent = ctx->current_scope;
    new_scope->scope_level = ctx->scope_counter++;
    ctx->current_scope = new_scope;
}

void exit_scope(SemanticContext *ctx) {
    if (!ctx->current_scope || !ctx->current_scope->parent) {
        return; // Can't exit global scope
    }
    
    Scope *old_scope = ctx->current_scope;
    ctx->current_scope = old_scope->parent;
    
    // Check for unused variables
    for (int i = 0; i < 256; i++) {
        Symbol *symbol = old_scope->symbols[i];
        while (symbol) {
            if (symbol->symbol_type == SYMBOL_VARIABLE && !symbol->is_used) {
                semantic_warning(ctx, symbol->line_declared, 
                               "Variable '%s' declared but never used", symbol->name);
            }
            Symbol *next = symbol->next;
            free(symbol->name);
            free(symbol);
            symbol = next;
        }
    }
    
    free(old_scope);
}

// Type checking functions
bool types_compatible(SemanticType left, SemanticType right) {
    if (left == right) return true;
    
    // Special compatibility rules
    if (left == TYPE_NUM || right == TYPE_NUM) {
        // num is compatible with i32 and f32
        return (left == TYPE_I32 || left == TYPE_F32 || left == TYPE_NUM) &&
               (right == TYPE_I32 || right == TYPE_F32 || right == TYPE_NUM);
    }
    
    // i32 and f32 are compatible in mixed arithmetic
    if ((left == TYPE_I32 && right == TYPE_F32) || 
        (left == TYPE_F32 && right == TYPE_I32)) {
        return true;
    }
    
    return false;
}

SemanticType get_binary_op_result_type(SemanticType left, SemanticType right, const char *op) {
    // Comparison operators always return bool
    if (strcmp(op, "==") == 0 || strcmp(op, "!=") == 0 ||
        strcmp(op, "<") == 0 || strcmp(op, ">") == 0 ||
        strcmp(op, "<=") == 0 || strcmp(op, ">=") == 0) {
        return TYPE_BOOL;
    }
    
    // Logical operators work with bool
    if (strcmp(op, "&&") == 0 || strcmp(op, "||") == 0) {
        return TYPE_BOOL;
    }
    
    // Arithmetic operators
    if (left == TYPE_NUM || right == TYPE_NUM) return TYPE_NUM;
    if (left == TYPE_F32 || right == TYPE_F32) return TYPE_F32;
    if (left == TYPE_I32 && right == TYPE_I32) return TYPE_I32;
    
    return TYPE_ERROR;
}

// Error reporting
void semantic_error(SemanticContext *ctx, int line, const char *format, ...) {
    va_list args;
    va_start(args, format);
    
    fprintf(stderr, "Semantic Error (line %d): ", line);
    vfprintf(stderr, format, args);
    fprintf(stderr, "\n");
    
    va_end(args);
    ctx->error_count++;
}

void semantic_warning(SemanticContext *ctx, int line, const char *format, ...) {
    va_list args;
    va_start(args, format);
    
    fprintf(stderr, "Semantic Warning (line %d): ", line);
    vfprintf(stderr, format, args);
    fprintf(stderr, "\n");
    
    va_end(args);
    ctx->warning_count++;
}

// Forward declarations for semantic analysis
static AnnotatedASTNode *analyze_node(ASTNode *node, SemanticContext *ctx);
static SemanticType analyze_expression(ASTNode *node, SemanticContext *ctx);

// Create annotated AST node
static AnnotatedASTNode *create_annotated_node(ASTNode *original) {
    AnnotatedASTNode *node = calloc(1, sizeof(AnnotatedASTNode));
    node->original_node = original;
    node->resolved_type = TYPE_UNKNOWN;
    node->symbol_ref = NULL;
    node->is_lvalue = false;
    node->is_constant = false;
    node->children = NULL;
    node->child_count = 0;
    return node;
}

// Analyze expression and return its type
static SemanticType analyze_expression(ASTNode *node, SemanticContext *ctx) {
    if (!node) return TYPE_ERROR;
    
    switch (node->type) {
        case AST_LITERAL:
            return literal_to_semantic_type(&node->as.literal);
            
        case AST_IDENTIFIER: {
            Symbol *symbol = lookup_symbol(ctx, node->as.ident);
            if (!symbol) {
                semantic_error(ctx, node->line, "Undefined identifier '%s'", node->as.ident);
                return TYPE_ERROR;
            }
            if (symbol->symbol_type == SYMBOL_VARIABLE && !symbol->is_initialized) {
                semantic_warning(ctx, node->line, "Variable '%s' used before initialization", 
                               node->as.ident);
            }
            return symbol->data_type;
        }
        
        case AST_BIN_OP: {
            SemanticType left_type = analyze_expression(node->as.bin_op.left, ctx);
            SemanticType right_type = analyze_expression(node->as.bin_op.right, ctx);
            
            if (left_type == TYPE_ERROR || right_type == TYPE_ERROR) {
                return TYPE_ERROR;
            }
            
            // Special handling for logical operators
            if (strcmp(node->as.bin_op.op, "&&") == 0 || strcmp(node->as.bin_op.op, "||") == 0) {
                // Logical operators require boolean operands
                if (left_type != TYPE_BOOL || right_type != TYPE_BOOL) {
                    semantic_error(ctx, node->line, 
                                 "Logical operator '%s' requires boolean operands, got %d and %d", 
                                 node->as.bin_op.op, left_type, right_type);
                    return TYPE_ERROR;
                }
                return TYPE_BOOL;
            }
            
            if (!types_compatible(left_type, right_type)) {
                semantic_error(ctx, node->line, "Type mismatch in binary operation '%s': %d vs %d", 
                             node->as.bin_op.op, left_type, right_type);
                return TYPE_ERROR;
            }
            
            return get_binary_op_result_type(left_type, right_type, node->as.bin_op.op);
        }
        
        case AST_UNARY_OP: {
            SemanticType operand_type = analyze_expression(node->as.unary_op.expr, ctx);
            
            if (operand_type == TYPE_ERROR) {
                return TYPE_ERROR;
            }
            
            // Handle logical NOT operator
            if (node->as.unary_op.op == '!') {
                if (operand_type != TYPE_BOOL) {
                    semantic_error(ctx, node->line, 
                                 "Logical NOT operator '!' requires boolean operand, got %d", 
                                 operand_type);
                    return TYPE_ERROR;
                }
                return TYPE_BOOL;
            }
            
            // Handle unary minus operator
            if (node->as.unary_op.op == '-') {
                if (operand_type != TYPE_I32 && operand_type != TYPE_F32 && operand_type != TYPE_NUM) {
                    semantic_error(ctx, node->line, 
                                 "Unary minus operator '-' requires numeric operand, got %d", 
                                 operand_type);
                    return TYPE_ERROR;
                }
                return operand_type; // Return the same type as operand
            }
            
            semantic_error(ctx, node->line, "Unknown unary operator '%c'", node->as.unary_op.op);
            return TYPE_ERROR;
        }
        
        case AST_FUNC_CALL: {
            Symbol *func_symbol = lookup_symbol(ctx, node->as.func_call.name);
            if (!func_symbol) {
                semantic_error(ctx, node->line, "Undefined function '%s'", node->as.func_call.name);
                return TYPE_ERROR;
            }
            
            if (func_symbol->symbol_type != SYMBOL_FUNCTION) {
                semantic_error(ctx, node->line, "'%s' is not a function", node->as.func_call.name);
                return TYPE_ERROR;
            }
            
            // Analyze arguments
            for (size_t i = 0; i < node->as.func_call.arg_count; i++) {
                analyze_expression(node->as.func_call.args[i], ctx);
            }
            
            return func_symbol->data_type;
        }
        
        default:
            return TYPE_UNKNOWN;
    }
}

// Analyze individual AST node
static AnnotatedASTNode *analyze_node(ASTNode *node, SemanticContext *ctx) {
    if (!node) return NULL;
    
    AnnotatedASTNode *annotated = create_annotated_node(node);
    
    switch (node->type) {
        case AST_VAR_DECL: {
            SemanticType var_type = string_to_semantic_type(node->as.var_decl.type_name);
            if (var_type == TYPE_UNKNOWN) {
                semantic_error(ctx, node->line, "Unknown type '%s'", node->as.var_decl.type_name);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Check if variable already exists in current scope
            if (!define_symbol(ctx, node->as.var_decl.name, SYMBOL_VARIABLE, var_type, node->line)) {
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Analyze initializer if present
            if (node->as.var_decl.value) {
                SemanticType init_type = analyze_expression(node->as.var_decl.value, ctx);
                if (!types_compatible(var_type, init_type)) {
                    semantic_error(ctx, node->line, 
                                 "Type mismatch in variable initialization: expected %d, got %d", 
                                 var_type, init_type);
                    annotated->resolved_type = TYPE_ERROR;
                    break;
                }
                
                // Store the initializer as a child
                annotated->children = malloc(sizeof(AnnotatedASTNode*));
                annotated->children[0] = analyze_node(node->as.var_decl.value, ctx);
                annotated->child_count = 1;
                
                // Mark variable as initialized
                Symbol *symbol = lookup_symbol(ctx, node->as.var_decl.name);
                if (symbol) symbol->is_initialized = true;
            }
            
            annotated->resolved_type = var_type;
            break;
        }
        
        case AST_CONST_DECL: {
            SemanticType const_type = string_to_semantic_type(node->as.var_decl.type_name);
            if (const_type == TYPE_UNKNOWN) {
                semantic_error(ctx, node->line, "Unknown type '%s'", node->as.var_decl.type_name);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Constants must have an initializer
            if (!node->as.var_decl.value) {
                semantic_error(ctx, node->line, "Constant '%s' must be initialized", node->as.var_decl.name);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Check if constant already exists in current scope
            if (!define_symbol(ctx, node->as.var_decl.name, SYMBOL_CONSTANT, const_type, node->line)) {
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Analyze initializer
            SemanticType init_type = analyze_expression(node->as.var_decl.value, ctx);
            if (!types_compatible(const_type, init_type)) {
                semantic_error(ctx, node->line, 
                             "Type mismatch in constant initialization: expected %d, got %d", 
                             const_type, init_type);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Store the initializer as a child
            annotated->children = malloc(sizeof(AnnotatedASTNode*));
            annotated->children[0] = analyze_node(node->as.var_decl.value, ctx);
            annotated->child_count = 1;
            
            // Mark constant as initialized
            Symbol *symbol = lookup_symbol(ctx, node->as.var_decl.name);
            if (symbol) symbol->is_initialized = true;
            
            annotated->resolved_type = const_type;
            break;
        }
        
        case AST_ASSIGN: {
            Symbol *symbol = lookup_symbol(ctx, node->as.assign.target);
            if (!symbol) {
                semantic_error(ctx, node->line, "Undefined variable '%s'", node->as.assign.target);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            if (symbol->symbol_type != SYMBOL_VARIABLE && symbol->symbol_type != SYMBOL_PARAMETER) {
                if (symbol->symbol_type == SYMBOL_CONSTANT) {
                    semantic_error(ctx, node->line, "Cannot assign to constant '%s'", node->as.assign.target);
                } else {
                    semantic_error(ctx, node->line, "'%s' is not a variable", node->as.assign.target);
                }
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            SemanticType value_type = analyze_expression(node->as.assign.value, ctx);
            if (!types_compatible(symbol->data_type, value_type)) {
                semantic_error(ctx, node->line, 
                             "Type mismatch in assignment: expected %d, got %d", 
                             symbol->data_type, value_type);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Store the value as a child
            annotated->children = malloc(sizeof(AnnotatedASTNode*));
            annotated->children[0] = analyze_node(node->as.assign.value, ctx);
            annotated->child_count = 1;
            
            symbol->is_initialized = true;
            annotated->resolved_type = symbol->data_type;
            break;
        }
        
        case AST_FUNC_DEF: {
            SemanticType return_type = string_to_semantic_type(node->as.func_def.return_type);
            if (return_type == TYPE_UNKNOWN) {
                semantic_error(ctx, node->line, "Unknown return type '%s'", 
                             node->as.func_def.return_type);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Check if function is already defined (skip if already done in first pass)
            Symbol *existing = lookup_symbol(ctx, node->as.func_def.name);
            if (!existing) {
                if (!define_symbol(ctx, node->as.func_def.name, SYMBOL_FUNCTION, return_type, node->line)) {
                    annotated->resolved_type = TYPE_ERROR;
                    break;
                }
            }
            
            // Enter function scope
            enter_scope(ctx);
            ASTNode *prev_function = ctx->current_function;
            ctx->current_function = node;
            
            // Define parameters
            for (size_t i = 0; i < node->as.func_def.param_count; i++) {
                SemanticType param_type = string_to_semantic_type(node->as.func_def.param_types[i]);
                define_symbol(ctx, node->as.func_def.param_names[i], SYMBOL_PARAMETER, 
                            param_type, node->line);
            }
            
            // Analyze function body and store as children
            if (node->as.func_def.body_count > 0) {
                annotated->children = malloc(node->as.func_def.body_count * sizeof(AnnotatedASTNode*));
                annotated->child_count = node->as.func_def.body_count;
                
                for (size_t i = 0; i < node->as.func_def.body_count; i++) {
                    annotated->children[i] = analyze_node(node->as.func_def.body[i], ctx);
                }
            }
            
            // Exit function scope
            ctx->current_function = prev_function;
            exit_scope(ctx);
            
            annotated->resolved_type = return_type;
            break;
        }
        
        case AST_IF_STMT: {
            SemanticType cond_type = analyze_expression(node->as.if_stmt.condition, ctx);
            if (cond_type != TYPE_BOOL && cond_type != TYPE_I32) {
                semantic_warning(ctx, node->line, 
                               "Condition should be boolean type, got %d", cond_type);
            }
            
            // Store the condition as the first child
            size_t total_children = 1 + node->as.if_stmt.then_count + node->as.if_stmt.else_count;
            annotated->children = malloc(total_children * sizeof(AnnotatedASTNode*));
            annotated->child_count = total_children;
            
            // First child is the condition
            annotated->children[0] = analyze_node(node->as.if_stmt.condition, ctx);
            size_t child_index = 1;
            
            // Analyze then body
            enter_scope(ctx);
            for (size_t i = 0; i < node->as.if_stmt.then_count; i++) {
                annotated->children[child_index++] = analyze_node(node->as.if_stmt.then_body[i], ctx);
            }
            exit_scope(ctx);
            
            // Analyze else body if present
            if (node->as.if_stmt.else_count > 0) {
                enter_scope(ctx);
                for (size_t i = 0; i < node->as.if_stmt.else_count; i++) {
                    annotated->children[child_index++] = analyze_node(node->as.if_stmt.else_body[i], ctx);
                }
                exit_scope(ctx);
            }
            
            annotated->resolved_type = TYPE_VOID;
            break;
        }
        
        case AST_RETURN: {
            if (!ctx->current_function) {
                semantic_error(ctx, node->line, "Return statement outside function");
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            SemanticType expected_type = string_to_semantic_type(ctx->current_function->as.func_def.return_type);
            
            if (node->as.ret.value) {
                SemanticType return_type = analyze_expression(node->as.ret.value, ctx);
                if (!types_compatible(expected_type, return_type)) {
                    semantic_error(ctx, node->line, 
                                 "Return type mismatch: expected %d, got %d", 
                                 expected_type, return_type);
                    annotated->resolved_type = TYPE_ERROR;
                    break;
                }
                // Analyze the return value as a child node
                annotated->children = malloc(sizeof(AnnotatedASTNode*));
                annotated->children[0] = analyze_node(node->as.ret.value, ctx);
                annotated->child_count = 1;
            }
            
            annotated->resolved_type = TYPE_VOID;
            break;
        }
        
        case AST_BIN_OP: {
            // Analyze operands
            AnnotatedASTNode *left = analyze_node(node->as.bin_op.left, ctx);
            AnnotatedASTNode *right = analyze_node(node->as.bin_op.right, ctx);
            
            // Set up children
            annotated->children = malloc(2 * sizeof(AnnotatedASTNode*));
            annotated->children[0] = left;
            annotated->children[1] = right;
            annotated->child_count = 2;
            
            // Determine result type
            annotated->resolved_type = analyze_expression(node, ctx);
            break;
        }
        
        case AST_UNARY_OP: {
            // Analyze operand
            AnnotatedASTNode *operand = analyze_node(node->as.unary_op.expr, ctx);
            
            // Set up children
            annotated->children = malloc(sizeof(AnnotatedASTNode*));
            annotated->children[0] = operand;
            annotated->child_count = 1;
            
            // Determine result type
            annotated->resolved_type = analyze_expression(node, ctx);
            break;
        }
        
        case AST_IDENTIFIER: {
            // Check if identifier exists
            Symbol *symbol = lookup_symbol(ctx, node->as.ident);
            if (!symbol) {
                semantic_error(ctx, node->line, "Undefined identifier '%s'", node->as.ident);
                annotated->resolved_type = TYPE_ERROR;
            } else {
                annotated->resolved_type = symbol->data_type;
                annotated->symbol_ref = symbol;
                annotated->is_lvalue = (symbol->symbol_type == SYMBOL_VARIABLE);
                annotated->is_constant = (symbol->symbol_type == SYMBOL_CONSTANT);
            }
            break;
        }
        
        case AST_LITERAL: {
            annotated->resolved_type = literal_to_semantic_type(&node->as.literal);
            break;
        }
        
        case AST_FUNC_CALL: {
            Symbol *func_symbol = lookup_symbol(ctx, node->as.func_call.name);
            if (!func_symbol) {
                semantic_error(ctx, node->line, "Undefined function '%s'", node->as.func_call.name);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            if (func_symbol->symbol_type != SYMBOL_FUNCTION) {
                semantic_error(ctx, node->line, "'%s' is not a function", node->as.func_call.name);
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Analyze arguments and set up children
            if (node->as.func_call.arg_count > 0) {
                annotated->children = malloc(node->as.func_call.arg_count * sizeof(AnnotatedASTNode*));
                annotated->child_count = node->as.func_call.arg_count;
                
                for (size_t i = 0; i < node->as.func_call.arg_count; i++) {
                    annotated->children[i] = analyze_node(node->as.func_call.args[i], ctx);
                }
            }
            
            annotated->resolved_type = func_symbol->data_type;
            annotated->symbol_ref = func_symbol;
            break;
        }
        
        default:
            // For other node types, just analyze expression if it's an expression
            annotated->resolved_type = analyze_expression(node, ctx);
            break;
    }
    
    return annotated;
}

// Main semantic analysis function
AnnotatedAST *semantic_analyze(AST *ast, SemanticContext *ctx) {
    if (!ast || !ctx) return NULL;
    
    AnnotatedAST *annotated_ast = calloc(1, sizeof(AnnotatedAST));
    annotated_ast->nodes = calloc(ast->count, sizeof(AnnotatedASTNode*));
    annotated_ast->count = ast->count;
    annotated_ast->capacity = ast->count;
    
    // First pass: collect all function declarations
    for (size_t i = 0; i < ast->count; i++) {
        if (ast->nodes[i]->type == AST_FUNC_DEF) {
            SemanticType return_type = string_to_semantic_type(ast->nodes[i]->as.func_def.return_type);
            if (!lookup_symbol(ctx, ast->nodes[i]->as.func_def.name)) {
                define_symbol(ctx, ast->nodes[i]->as.func_def.name, SYMBOL_FUNCTION, 
                            return_type, ast->nodes[i]->line);
            }
        } else if (ast->nodes[i]->type == AST_EXTERN_FUNC) {
            // Only add if not already defined
            if (!lookup_symbol(ctx, ast->nodes[i]->as.extern_func.name)) {
                define_symbol(ctx, ast->nodes[i]->as.extern_func.name, SYMBOL_FUNCTION, 
                            TYPE_VOID, ast->nodes[i]->line);
            }
        }
    }
    
    // Second pass: analyze all nodes
    for (size_t i = 0; i < ast->count; i++) {
        annotated_ast->nodes[i] = analyze_node(ast->nodes[i], ctx);
    }
    
    printf("[Semantic Analysis] Completed with %d errors, %d warnings\n", 
           ctx->error_count, ctx->warning_count);
    
    return annotated_ast;
}

// Cleanup functions
void free_semantic_context(SemanticContext *ctx) {
    if (!ctx) return;
    
    // Free all scopes safely
    while (ctx->current_scope) {
        Scope *scope_to_free = ctx->current_scope;
        
        if (scope_to_free->parent) {
            // Not global scope, use normal exit
            exit_scope(ctx);
        } else {
            // Global scope - free it manually
            for (int i = 0; i < 256; i++) {
                Symbol *symbol = scope_to_free->symbols[i];
                while (symbol) {
                    Symbol *next = symbol->next;
                    free(symbol->name);
                    free(symbol);
                    symbol = next;
                }
            }
            free(scope_to_free);
            ctx->current_scope = NULL;
        }
    }
    
    free(ctx);
}

void free_annotated_ast(AnnotatedAST *ast) {
    if (!ast) return;
    
    for (size_t i = 0; i < ast->count; i++) {
        if (ast->nodes[i]) {
            free(ast->nodes[i]->children);
            free(ast->nodes[i]);
        }
    }
    
    free(ast->nodes);
    free(ast);
}
