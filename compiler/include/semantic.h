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

// Data types for semantic analysis - Enhanced Type System
typedef enum {
    // Signed Integer Types
    TYPE_I8,        // 8-bit signed integer (-128 to 127)
    TYPE_I16,       // 16-bit signed integer (-32,768 to 32,767)
    TYPE_I32,       // 32-bit signed integer (-2^31 to 2^31-1)
    TYPE_I64,       // 64-bit signed integer (-2^63 to 2^63-1)
    
    // Unsigned Integer Types
    TYPE_U8,        // 8-bit unsigned integer (0 to 255)
    TYPE_U16,       // 16-bit unsigned integer (0 to 65,535)
    TYPE_U32,       // 32-bit unsigned integer (0 to 2^32-1)
    TYPE_U64,       // 64-bit unsigned integer (0 to 2^64-1)
    
    // Floating Point Types
    TYPE_F8,        // 8-bit custom float (1 sign + 4 exp + 3 mantissa)
    TYPE_F16,       // 16-bit IEEE-754 binary16 half-precision
    TYPE_F32,       // 32-bit IEEE-754 single precision
    TYPE_F64,       // 64-bit IEEE-754 double precision
    
    // Special Types
    TYPE_NUM,       // Universal dynamic numeric type
    TYPE_STR,       // String type (enhanced with variables)
    TYPE_CHAR,      // Character type (enhanced with operations)
    TYPE_BOOL,      // Boolean type
    TYPE_VOID,      // Void type
    
    // System Types
    TYPE_UNKNOWN,
    TYPE_ERROR
} SemanticType;

// Compilation target configuration
typedef enum {
    ARCH_INVALID = -1,  // Invalid/unset architecture
    ARCH_32BIT,         // 32-bit target architecture
    ARCH_64BIT          // 64-bit target architecture
} TargetArchitecture;

typedef struct CompilationConfig {
    TargetArchitecture target_arch;
    bool enable_string_variables;  // Enable str variable declarations
    bool enable_char_operations;   // Enable char arithmetic and comparisons
    bool strict_integer_sizes;     // Enforce strict integer size checking
    bool optimize_for_size;        // Optimize for binary size vs speed
} CompilationConfig;

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
    CompilationConfig *config;      // Compilation configuration
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
SemanticContext *create_semantic_context_with_config(CompilationConfig *config);
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
const char* semantic_type_to_string(SemanticType type);      // Convert type to string

// Architecture validation
bool validate_type_for_architecture(SemanticType type, TargetArchitecture arch, const char *context);

// Error reporting
void semantic_error(SemanticContext *ctx, int line, const char *format, ...);
void semantic_warning(SemanticContext *ctx, int line, const char *format, ...);

#endif // SEMANTIC_H
