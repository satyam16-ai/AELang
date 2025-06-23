// parser.h
#ifndef PARSER_H
#define PARSER_H

#include "lexer.h"
#include <stddef.h>

// AST Node Types
typedef enum {
    AST_VAR_DECL,
    AST_CONST_DECL,
    AST_ASSIGN,
    AST_BIN_OP,
    AST_UNARY_OP,
    AST_LITERAL,
    AST_IDENTIFIER,
    AST_FUNC_CALL,
    AST_EXTERN_FUNC,
    AST_FUNC_DEF,
    AST_IF_GOTO,
    AST_LABEL,
    AST_GOTO,
    AST_HALT,
    AST_INLINE_ASM,
    AST_RETURN,
    AST_LOAD,
    AST_STORE,
    AST_IO,
    AST_DEBUG,
    AST_TRACE
} ASTNodeType;

// Value types
typedef enum {
    VALUE_INT,
    VALUE_STRING,
    VALUE_BOOL
} ValueType;

// AST Literal Value
typedef struct {
    ValueType type;
    union {
        int int_val;
        char *str_val;
        int bool_val;
    } as;
} LiteralValue;

// Forward declare node
typedef struct ASTNode ASTNode;

struct ASTNode {
    ASTNodeType type;
    int line;

    union {
        // Variable/Const Declaration
        struct { char *name; char *type_name; ASTNode *value; } var_decl;

        // Assignment
        struct { char *target; ASTNode *value; } assign;

        // Binary Op
        struct { char op[3]; ASTNode *left; ASTNode *right; } bin_op;

        // Unary Op
        struct { char op; ASTNode *expr; } unary_op;

        // Literal
        LiteralValue literal;

        // Identifier
        char *ident;

        // Function Call
        struct { char *name; ASTNode **args; size_t arg_count; } func_call;

        // Extern Declaration
        struct { char *name; char **param_names; char **param_types; size_t param_count; } extern_func;

        // Function Definition
        struct {
            char *name;
            char **param_names;
            char **param_types;
            size_t param_count;
            char *return_type;
            ASTNode **body;
            size_t body_count;
        } func_def;

        // Label
        char *label_name;

        // If Goto
        struct { ASTNode *condition; char *label; } if_goto;

        // IO
        struct { int port; char *var; int is_in; } io;

        // Memory
        struct { char *dest; char *addr; char *type; } load;
        struct { char *addr; char *src; } store;

        // Debug
        struct { char *var; } debug;
        struct { char *message; } trace;
    } as;
};

// AST container
typedef struct {
    ASTNode **nodes;
    size_t count;
} AST;

AST *parse(TokenList *tokens);
void free_ast(AST *ast);

#endif // PARSER_H

