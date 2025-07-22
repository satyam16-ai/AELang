// parser.h - Enhanced Type System
#ifndef PARSER_H
#define PARSER_H

#include "lexer.h"
#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

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
    AST_IF_STMT,
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
    AST_TRACE,
    AST_FREED = 0xFFFF  // Marker for freed nodes
} ASTNodeType;

// Value types - Enhanced Type System
typedef enum {
    // Integer value types
    VALUE_I8,       // 8-bit signed integer
    VALUE_I16,      // 16-bit signed integer
    VALUE_I32,      // 32-bit signed integer (legacy VALUE_INT)
    VALUE_I64,      // 64-bit signed integer
    VALUE_U8,       // 8-bit unsigned integer
    VALUE_U16,      // 16-bit unsigned integer
    VALUE_U32,      // 32-bit unsigned integer
    VALUE_U64,      // 64-bit unsigned integer
    
    // Floating point value types
    VALUE_F8,       // 8-bit custom float
    VALUE_F16,      // 16-bit half-precision float
    VALUE_F32,      // 32-bit float (legacy VALUE_FLOAT)
    VALUE_F64,      // 64-bit double
    
    // Special value types
    VALUE_NUM,      // Dynamic numeric type
    VALUE_STR,      // String value (enhanced)
    VALUE_CHAR,     // Character value (enhanced)
    VALUE_BOOL,     // Boolean value
    
    // Legacy compatibility (deprecated)
    VALUE_INT = VALUE_I32,      // For backward compatibility
    VALUE_FLOAT = VALUE_F32,    // For backward compatibility
    VALUE_STRING = VALUE_STR    // For backward compatibility
} ValueType;

// Dynamic number type for 'num'
typedef struct {
    int is_float;  // 0 = int, 1 = float
    union {
        int int_val;
        double float_val;
    } value;
} NumValue;

// AST Literal Value - Enhanced Type System
typedef struct {
    ValueType type;
    union {
        // Integer values
        int8_t i8_val;
        int16_t i16_val;
        int32_t i32_val;
        int64_t i64_val;
        uint8_t u8_val;
        uint16_t u16_val;
        uint32_t u32_val;
        uint64_t u64_val;
        
        // Floating point values
        uint8_t f8_val;         // 8-bit float bits
        uint16_t f16_val;       // 16-bit float bits
        float f32_val;
        double f64_val;
        
        // Special values
        char *str_val;          // Enhanced string support
        char char_val;          // Enhanced character support
        int bool_val;           // Boolean value
        NumValue num_val;       // Dynamic number type
        
        // Legacy compatibility
        int int_val;            // Maps to i32_val
        double float_val;       // Maps to f64_val
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
        struct { char *name; char **param_names; char **param_types; size_t param_count; char *return_type; } extern_func;

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

        // If Statement
        struct { 
            ASTNode *condition; 
            ASTNode **then_body; 
            size_t then_count;
            ASTNode **else_body; 
            size_t else_count;
        } if_stmt;

        // Return Statement
        struct { ASTNode *value; } ret;

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
    size_t capacity;
} AST;

AST *parse(TokenList *tokens);
void free_ast(AST *ast);

#endif // PARSER_H

