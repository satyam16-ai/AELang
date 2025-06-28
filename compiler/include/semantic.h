// semantic.h - Semantic Analysis Phase for ÆLang
#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "parser.h"
#include <stdbool.h>

// Symbol types
typedef enum {
    SYMBOL_VARIABLE,
    SYMBOL_FUNCTION,
    SYMBOL_PARAMETER,
    SYMBOL_CONSTANT
} SymbolType;

// Data types for semantic analysis
typedef enum {
    TYPE_I32,
    TYPE_F32,
    TYPE_NUM,
    TYPE_BOOL,
    TYPE_STR,
    TYPE_CHAR,
    TYPE_VOID,
    TYPE_UNKNOWN,
    TYPE_ERROR
} SemanticType;

// Symbol table entry
typedef struct Symbol {
    char *name;
    SymbolType symbol_type;
    SemanticType data_type;
    int line_declared;
    bool is_used;
    bool is_initialized;
    struct Symbol *next;  // For chaining in hash table
} Symbol;

// Scope for symbol table
typedef struct Scope {
    Symbol *symbols[256];  // Hash table
    struct Scope *parent;
    int scope_level;
} Scope;

// Semantic analysis context
typedef struct {
    Scope *current_scope;
    Scope *global_scope;
    int scope_counter;
    int error_count;
    int warning_count;
    ASTNode *current_function;
} SemanticContext;

// Annotated AST node (extends original AST)
typedef struct AnnotatedASTNode {
    ASTNode *original_node;
    SemanticType resolved_type;
    Symbol *symbol_ref;
    bool is_lvalue;
    bool is_constant;
    struct AnnotatedASTNode **children;
    size_t child_count;
} AnnotatedASTNode;

// Annotated AST container
typedef struct {
    AnnotatedASTNode **nodes;
    size_t count;
    size_t capacity;
} AnnotatedAST;

// Public API
SemanticContext *create_semantic_context(void);
AnnotatedAST *semantic_analyze(AST *ast, SemanticContext *ctx);
void free_semantic_context(SemanticContext *ctx);
void free_annotated_ast(AnnotatedAST *ast);

// Symbol table operations
Symbol *lookup_symbol(SemanticContext *ctx, const char *name);
bool define_symbol(SemanticContext *ctx, const char *name, SymbolType sym_type, 
                   SemanticType data_type, int line);
void enter_scope(SemanticContext *ctx);
void exit_scope(SemanticContext *ctx);

// Type checking
SemanticType get_expression_type(AnnotatedASTNode *node, SemanticContext *ctx);
bool types_compatible(SemanticType left, SemanticType right);
SemanticType get_binary_op_result_type(SemanticType left, SemanticType right, const char *op);
SemanticType string_to_semantic_type(const char *type_str);  // Convert string to semantic type

// Error reporting
void semantic_error(SemanticContext *ctx, int line, const char *format, ...);
void semantic_warning(SemanticContext *ctx, int line, const char *format, ...);

#endif // SEMANTIC_H
