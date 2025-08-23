// semantic.c - Semantic Analysis Implementation for ÆLang
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
    CompilationConfig default_config = {
        .target_arch = ARCH_INVALID,
        .enable_string_variables = false,
        .enable_char_operations = false,
        .strict_integer_sizes = false,
        .optimize_for_size = false
    };
    return create_semantic_context_with_config(&default_config);
}

SemanticContext *create_semantic_context_with_config(CompilationConfig *config) {
    SemanticContext *ctx = calloc(1, sizeof(SemanticContext));
    if (!ctx) return NULL;
    
    // Store configuration
    ctx->config = malloc(sizeof(CompilationConfig));
    if (!ctx->config) {
        free(ctx);
        return NULL;
    }
    *ctx->config = *config;
    
    // Create global scope
    ctx->global_scope = calloc(1, sizeof(Scope));
    ctx->current_scope = ctx->global_scope;
    ctx->scope_counter = 0;
    ctx->error_count = 0;
    ctx->warning_count = 0;
    ctx->current_function = NULL;
    
    // Add built-in functions to global scope (enhanced for all types)
    define_symbol(ctx, "print", SYMBOL_FUNCTION, TYPE_VOID, 0);
    
    // =============================================================================
    // UNIFIED PRINT/READ SYSTEM
    // =============================================================================
    
    // Core unified functions
    define_symbol(ctx, "print_with_format", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "read_with_validation", SYMBOL_FUNCTION, TYPE_I32, 0);
    
    // Simplified wrapper functions - Print
    define_symbol(ctx, "print_clean", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "printf_format", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_precision", SYMBOL_FUNCTION, TYPE_VOID, 0);
    
    // Simplified wrapper functions - Read
    define_symbol(ctx, "read_value", SYMBOL_FUNCTION, TYPE_I32, 0);
    define_symbol(ctx, "read_with_prompt", SYMBOL_FUNCTION, TYPE_I32, 0);
    define_symbol(ctx, "read_unsafe", SYMBOL_FUNCTION, TYPE_I32, 0);
    
    // Advanced format functions
    define_symbol(ctx, "print_formatted", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "scan_formatted", SYMBOL_FUNCTION, TYPE_I32, 0);
    
    // =============================================================================
    // LEGACY COMPATIBILITY FUNCTIONS
    // =============================================================================
    
    // Integer print functions
    define_symbol(ctx, "print_i8", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_i16", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_i32", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_i64", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_u8", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_u16", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_u32", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_u64", SYMBOL_FUNCTION, TYPE_VOID, 0);
    
    // Floating point print functions
    define_symbol(ctx, "print_f32", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_f64", SYMBOL_FUNCTION, TYPE_VOID, 0);
    
    // Legacy compatibility
    define_symbol(ctx, "print_int", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_float", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_bool", SYMBOL_FUNCTION, TYPE_VOID, 0);
    define_symbol(ctx, "print_num", SYMBOL_FUNCTION, TYPE_VOID, 0);
    
    // Enhanced I/O functions
    if (config->enable_string_variables) {
        define_symbol(ctx, "print_str", SYMBOL_FUNCTION, TYPE_VOID, 0);
        define_symbol(ctx, "print_clean_str", SYMBOL_FUNCTION, TYPE_VOID, 0);
        define_symbol(ctx, "read_str", SYMBOL_FUNCTION, TYPE_STR, 0);
        define_symbol(ctx, "read_string", SYMBOL_FUNCTION, TYPE_VOID, 0);
    }
    
    if (config->enable_char_operations) {
        define_symbol(ctx, "print_char", SYMBOL_FUNCTION, TYPE_VOID, 0);
        define_symbol(ctx, "read_char", SYMBOL_FUNCTION, TYPE_CHAR, 0);
    }
    
    // Legacy read functions
    define_symbol(ctx, "read_i8", SYMBOL_FUNCTION, TYPE_I8, 0);
    define_symbol(ctx, "read_i16", SYMBOL_FUNCTION, TYPE_I16, 0);
    define_symbol(ctx, "read_i32", SYMBOL_FUNCTION, TYPE_I32, 0);
    define_symbol(ctx, "read_i64", SYMBOL_FUNCTION, TYPE_I64, 0);
    define_symbol(ctx, "read_u8", SYMBOL_FUNCTION, TYPE_U8, 0);
    define_symbol(ctx, "read_u16", SYMBOL_FUNCTION, TYPE_U16, 0);
    define_symbol(ctx, "read_u32", SYMBOL_FUNCTION, TYPE_U32, 0);
    define_symbol(ctx, "read_u64", SYMBOL_FUNCTION, TYPE_U64, 0);
    define_symbol(ctx, "read_f32", SYMBOL_FUNCTION, TYPE_F32, 0);
    define_symbol(ctx, "read_f64", SYMBOL_FUNCTION, TYPE_F64, 0);
    define_symbol(ctx, "read_num", SYMBOL_FUNCTION, TYPE_NUM, 0);
    define_symbol(ctx, "read_int", SYMBOL_FUNCTION, TYPE_I32, 0);
    define_symbol(ctx, "read_float", SYMBOL_FUNCTION, TYPE_F32, 0);
    define_symbol(ctx, "read_bool", SYMBOL_FUNCTION, TYPE_BOOL, 0);
    define_symbol(ctx, "read_num_safe", SYMBOL_FUNCTION, TYPE_NUM, 0);
    
    // UNIFIED READ FUNCTION - Polymorphic (resolved at compile time)
    define_symbol(ctx, "read", SYMBOL_FUNCTION, TYPE_UNKNOWN, 0);
    
    return ctx;
}

// Convert string type to semantic type - Enhanced Type System
SemanticType string_to_semantic_type(const char *type_str) {
    if (!type_str) return TYPE_UNKNOWN;
    
    // Signed integer types
    if (strcmp(type_str, "i8") == 0) return TYPE_I8;
    if (strcmp(type_str, "i16") == 0) return TYPE_I16;
    if (strcmp(type_str, "i32") == 0) return TYPE_I32;
    if (strcmp(type_str, "i64") == 0) return TYPE_I64;
    
    // Unsigned integer types
    if (strcmp(type_str, "u8") == 0) return TYPE_U8;
    if (strcmp(type_str, "u16") == 0) return TYPE_U16;
    if (strcmp(type_str, "u32") == 0) return TYPE_U32;
    if (strcmp(type_str, "u64") == 0) return TYPE_U64;
    
    // Floating point types
    if (strcmp(type_str, "f8") == 0) return TYPE_F8;
    if (strcmp(type_str, "f16") == 0) return TYPE_F16;
    if (strcmp(type_str, "f32") == 0) return TYPE_F32;
    if (strcmp(type_str, "f64") == 0) return TYPE_F64;
    
    // Special types
    if (strcmp(type_str, "num") == 0) return TYPE_NUM;
    if (strcmp(type_str, "str") == 0) return TYPE_STR;
    if (strcmp(type_str, "char") == 0) return TYPE_CHAR;
    if (strcmp(type_str, "bool") == 0) return TYPE_BOOL;
    if (strcmp(type_str, "void") == 0) return TYPE_VOID;
    
    return TYPE_UNKNOWN;
}

// Convert AST literal type to semantic type - Enhanced Type System
static SemanticType literal_to_semantic_type(LiteralValue *literal) {
    switch (literal->type) {
        // Integer types
        case VALUE_I8: return TYPE_I8;
        case VALUE_I16: return TYPE_I16;
        case VALUE_I32: return TYPE_I32;  // Also handles VALUE_INT
        case VALUE_I64: return TYPE_I64;
        case VALUE_U8: return TYPE_U8;
        case VALUE_U16: return TYPE_U16;
        case VALUE_U32: return TYPE_U32;
        case VALUE_U64: return TYPE_U64;
        
        // Floating point types
        case VALUE_F8: return TYPE_F8;
        case VALUE_F16: return TYPE_F16;
        case VALUE_F32: return TYPE_F32;  // Also handles VALUE_FLOAT
        case VALUE_F64: return TYPE_F64;
        
        // Special types
        case VALUE_NUM: return TYPE_NUM;
        case VALUE_STR: return TYPE_STR;  // Also handles VALUE_STRING
        case VALUE_CHAR: return TYPE_CHAR;
        case VALUE_BOOL: return TYPE_BOOL;
        
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
    if (!ctx || !name) {
        return false;
    }
    
    // Check if symbol already exists in current scope
    unsigned int index = hash(name);
    Symbol *existing = ctx->current_scope->symbols[index];
    
    while (existing) {
        if (existing->name && strcmp(existing->name, name) == 0) {
            semantic_error(ctx, line, "Symbol '%s' already defined in current scope (line %d)", 
                          name, existing->line_declared);
            return false;
        }
        existing = existing->next;
    }
    
    // Create new symbol
    Symbol *symbol = calloc(1, sizeof(Symbol));
    if (!symbol) {
        return false;
    }
    symbol->name = strdup(name);
    if (!symbol->name) {
        free(symbol);
        return false;
    }
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

// Enhanced Type checking functions
bool is_integer_type(SemanticType type) {
    return type == TYPE_I8 || type == TYPE_I16 || type == TYPE_I32 || type == TYPE_I64 ||
           type == TYPE_U8 || type == TYPE_U16 || type == TYPE_U32 || type == TYPE_U64;
}

bool is_unsigned_type(SemanticType type) {
    return type == TYPE_U8 || type == TYPE_U16 || type == TYPE_U32 || type == TYPE_U64;
}

bool is_signed_type(SemanticType type) {
    return type == TYPE_I8 || type == TYPE_I16 || type == TYPE_I32 || type == TYPE_I64;
}

bool is_floating_type(SemanticType type) {
    return type == TYPE_F8 || type == TYPE_F16 || type == TYPE_F32 || type == TYPE_F64;
}

bool is_numeric_type(SemanticType type) {
    return is_integer_type(type) || is_floating_type(type) || type == TYPE_NUM;
}

int get_type_size_bits(SemanticType type) {
    switch (type) {
        case TYPE_I8:
        case TYPE_U8:
        case TYPE_F8: return 8;
        case TYPE_I16:
        case TYPE_U16:
        case TYPE_F16: return 16;
        case TYPE_I32:
        case TYPE_U32:
        case TYPE_F32: return 32;
        case TYPE_I64:
        case TYPE_U64:
        case TYPE_F64: return 64;
        case TYPE_CHAR: return 8;
        case TYPE_BOOL: return 8;
        default: return 0;
    }
}

// Enhanced type compatibility checking
bool types_compatible(SemanticType left, SemanticType right) {
    if (left == right) return true;
    
    // UNIFIED READ SYSTEM: TYPE_UNKNOWN (from read()) is compatible with any assignment target
    if (left == TYPE_UNKNOWN || right == TYPE_UNKNOWN) {
        return true;  // read() can be assigned to any type - transformation happens in assignment analysis
    }
    
    // Special compatibility rules for NUM type
    if (left == TYPE_NUM || right == TYPE_NUM) {
        // num is compatible with all numeric types
        return is_numeric_type(left) && is_numeric_type(right);
    }
    
    // Integer types are compatible within signedness groups
    if (is_integer_type(left) && is_integer_type(right)) {
        // Allow conversions within same signedness
        if (is_signed_type(left) && is_signed_type(right)) {
            return true; // Allow implicit conversions between signed types
        }
        if (is_unsigned_type(left) && is_unsigned_type(right)) {
            return true; // Allow implicit conversions between unsigned types
        }
        // Allow signed literals to unsigned types (common case: let x: u8 = 255)
        if (is_signed_type(right) && is_unsigned_type(left)) {
            return true; // Allow signed literals to be assigned to unsigned variables
        }
        // Allow unsigned to signed for completeness
        if (is_unsigned_type(right) && is_signed_type(left)) {
            return true;
        }
        return false;
    }
    
    // Floating point types are compatible with implicit widening
    if (is_floating_type(left) && is_floating_type(right)) {
        return true;  // Allow all float conversions for now
    }
    
    // Integer to floating point conversion allowed
    if (is_integer_type(left) && is_floating_type(right)) {
        return true;
    }
    
    // Character type is compatible with u8/i8
    if (left == TYPE_CHAR && (right == TYPE_U8 || right == TYPE_I8)) {
        return true;
    }
    if (right == TYPE_CHAR && (left == TYPE_U8 || left == TYPE_I8)) {
        return true;
    }
    
    return false;
}

SemanticType promote_numeric_types(SemanticType left, SemanticType right) {
    // NUM type takes precedence
    if (left == TYPE_NUM || right == TYPE_NUM) return TYPE_NUM;
    
    // Floating point promotion (largest precision wins)
    if (left == TYPE_F64 || right == TYPE_F64) return TYPE_F64;
    if (left == TYPE_F32 || right == TYPE_F32) return TYPE_F32;
    if (left == TYPE_F16 || right == TYPE_F16) return TYPE_F16;
    if (left == TYPE_F8 || right == TYPE_F8) return TYPE_F8;
    
    // Integer promotion - promote to largest type
    if (is_integer_type(left) && is_integer_type(right)) {
        int left_size = get_type_size_bits(left);
        int right_size = get_type_size_bits(right);
        
        if (left_size > right_size) return left;
        if (right_size > left_size) return right;
        
        // Same size - prefer unsigned
        if (is_unsigned_type(left)) return left;
        return right;
    }
    
    // Default to larger type
    return get_type_size_bits(left) >= get_type_size_bits(right) ? left : right;
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
    
    // Modulo operator - only works with integer types
    if (strcmp(op, "%") == 0) {
        if (is_integer_type(left) && is_integer_type(right)) {
            return promote_numeric_types(left, right);
        }
        return TYPE_ERROR;
    }
    
    // Arithmetic operators - use type promotion
    if (strcmp(op, "+") == 0 || strcmp(op, "-") == 0 || 
        strcmp(op, "*") == 0 || strcmp(op, "/") == 0) {
        if (is_numeric_type(left) && is_numeric_type(right)) {
            return promote_numeric_types(left, right);
        }
        
        // String concatenation (if both are strings)
        if (left == TYPE_STR && right == TYPE_STR && strcmp(op, "+") == 0) {
            return TYPE_STR;
        }
        
        return TYPE_ERROR;
    }
    
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
            
            // Special handling for bitwise operators
            if (strcmp(node->as.bin_op.op, "&") == 0 || strcmp(node->as.bin_op.op, "|") == 0 || 
                strcmp(node->as.bin_op.op, "^") == 0 || strcmp(node->as.bin_op.op, "<<") == 0 || 
                strcmp(node->as.bin_op.op, ">>") == 0) {
                // Bitwise operators require integer operands
                if (!is_integer_type(left_type) || !is_integer_type(right_type)) {
                    semantic_error(ctx, node->line, 
                                 "Bitwise operator '%s' requires integer operands, got %d and %d", 
                                 node->as.bin_op.op, left_type, right_type);
                    return TYPE_ERROR;
                }
                return left_type; // Result has the same type as left operand
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
            
            // Handle bitwise NOT operator
            if (node->as.unary_op.op == '~') {
                if (!is_integer_type(operand_type)) {
                    semantic_error(ctx, node->line, 
                                 "Bitwise NOT operator '~' requires integer operand, got %d", 
                                 operand_type);
                    return TYPE_ERROR;
                }
                return operand_type;
            }
            
            // Handle unary minus operator
            if (node->as.unary_op.op == '-') {
                // Check if operand is any numeric type
                if (operand_type != TYPE_I8 && operand_type != TYPE_I16 && operand_type != TYPE_I32 && operand_type != TYPE_I64 &&
                    operand_type != TYPE_U8 && operand_type != TYPE_U16 && operand_type != TYPE_U32 && operand_type != TYPE_U64 &&
                    operand_type != TYPE_F8 && operand_type != TYPE_F16 && operand_type != TYPE_F32 && operand_type != TYPE_F64 &&
                    operand_type != TYPE_NUM) {
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
            
            // SPECIAL CASE: Unified read() function with polymorphic return type
            if (strcmp(node->as.func_call.name, "read") == 0 && node->as.func_call.arg_count == 0) {
                // For unified read(), return TYPE_UNKNOWN to signal it needs context resolution
                // The actual type transformation will happen in assignment analysis
                return TYPE_UNKNOWN;
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
            
            // Architecture validation: Check if 64-bit types are used in 32-bit mode
            if (ctx->config && ctx->config->target_arch == ARCH_32BIT) {
                bool is_64bit_type = (var_type == TYPE_I64 || var_type == TYPE_U64 || var_type == TYPE_F64);
                if (is_64bit_type) {
                    semantic_error(ctx, node->line, 
                        "64-bit type '%s' cannot be used in 32-bit architecture mode. "
                        "Use --arch64 flag or use 32-bit equivalent types (i32, u32, f32).", 
                        semantic_type_to_string(var_type));
                    annotated->resolved_type = TYPE_ERROR;
                    break;
                }
            }
            
            // Check if variable already exists in current scope
            if (!define_symbol(ctx, node->as.var_decl.name, SYMBOL_VARIABLE, var_type, node->line)) {
                annotated->resolved_type = TYPE_ERROR;
                break;
            }
            
            // Analyze initializer if present
            if (node->as.var_decl.value) {
                // TRULY UNIVERSAL READ SYSTEM: No transformation - keep read() as universal
                if (node->as.var_decl.value->type == AST_FUNC_CALL &&
                    strcmp(node->as.var_decl.value->as.func_call.name, "read") == 0 &&
                    node->as.var_decl.value->as.func_call.arg_count == 0) {
                    
                    printf("[Semantic] Universal read() call preserved for variable %s (expected type %d)\n", 
                           node->as.var_decl.name, var_type);
                    
                    // Note: The code generator will handle type-specific code generation
                    // based on the expected type context from the variable declaration
                }
                
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
            
            // Architecture validation: Check if 64-bit types are used in 32-bit mode
            if (ctx->config && ctx->config->target_arch == ARCH_32BIT) {
                bool is_64bit_type = (const_type == TYPE_I64 || const_type == TYPE_U64 || const_type == TYPE_F64);
                if (is_64bit_type) {
                    semantic_error(ctx, node->line, 
                        "64-bit type '%s' cannot be used in 32-bit architecture mode. "
                        "Use --arch64 flag or use 32-bit equivalent types (i32, u32, f32).", 
                        semantic_type_to_string(const_type));
                    annotated->resolved_type = TYPE_ERROR;
                    break;
                }
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
            
            // TRULY UNIVERSAL READ SYSTEM: No transformation - keep read() as universal
            if (node->as.assign.value && node->as.assign.value->type == AST_FUNC_CALL &&
                strcmp(node->as.assign.value->as.func_call.name, "read") == 0 &&
                node->as.assign.value->as.func_call.arg_count == 0) {
                
                printf("[Semantic] Universal read() call preserved for assignment to %s (expected type %d)\n", 
                       node->as.assign.target, symbol->data_type);
                
                // Note: The code generator will handle type-specific implementation
                // based on the expected type context from the target variable
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

// Convert semantic type to string for error messages
const char* semantic_type_to_string(SemanticType type) {
    switch (type) {
        case TYPE_I8: return "i8";
        case TYPE_I16: return "i16";
        case TYPE_I32: return "i32";
        case TYPE_I64: return "i64";
        case TYPE_U8: return "u8";
        case TYPE_U16: return "u16";
        case TYPE_U32: return "u32";
        case TYPE_U64: return "u64";
        case TYPE_F8: return "f8";
        case TYPE_F16: return "f16";
        case TYPE_F32: return "f32";
        case TYPE_F64: return "f64";
        case TYPE_NUM: return "num";
        case TYPE_STR: return "str";
        case TYPE_CHAR: return "char";
        case TYPE_BOOL: return "bool";
        case TYPE_VOID: return "void";
        case TYPE_UNKNOWN: return "unknown";
        case TYPE_ERROR: return "error";
        default: return "unknown";
    }
}

// Architecture-specific type validation
bool validate_type_for_architecture(SemanticType type, TargetArchitecture arch, const char *context) {
    bool has_64bit_types = (type == TYPE_I64 || type == TYPE_U64 || type == TYPE_F64);
    bool has_specialized_float = (type == TYPE_F8 || type == TYPE_F16);
    
    if (arch == ARCH_32BIT) {
        if (has_64bit_types) {
            printf("Warning: Using 64-bit type (%s) in 32-bit architecture in %s\n", 
                   semantic_type_to_string(type), context);
            printf("  Suggestion: Consider using 32-bit equivalent or compile with --arch64\n");
            return true; // Warning, but allowed
        }
        if (has_specialized_float) {
            printf("Note: Using specialized float type (%s) in 32-bit mode in %s\n",
                   semantic_type_to_string(type), context);
            return true;
        }
    } else if (arch == ARCH_64BIT) {
        bool has_only_32bit_types = !has_64bit_types && !has_specialized_float &&
                                   (type == TYPE_I32 || type == TYPE_U32 || type == TYPE_F32 ||
                                    type == TYPE_I16 || type == TYPE_U16 ||
                                    type == TYPE_I8 || type == TYPE_U8 ||
                                    type == TYPE_BOOL || type == TYPE_CHAR);
        
        if (has_only_32bit_types) {
            printf("Note: Program uses only 32-bit types in 64-bit mode in %s\n", context);
            printf("  Suggestion: Consider compiling with --arch32 for better performance\n");
            return true;
        }
    }
    
    return true;
}
