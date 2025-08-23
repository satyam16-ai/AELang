#ifndef LEXER_H
#define LEXER_H

#include <stddef.h>

// Token types
typedef enum {
    TOKEN_EOF,
    TOKEN_LET,
    TOKEN_CONST,
    TOKEN_FUNC,
    TOKEN_EXTERN,
    TOKEN_RETURN,
    TOKEN_IF,
    TOKEN_ELSE,
    TOKEN_ELIF,
    TOKEN_GOTO,
    TOKEN_ASM,
    TOKEN_HALT,
    TOKEN_IN,
    TOKEN_OUT,
    TOKEN_LOAD,
    TOKEN_STORE,

    // Symbols
    TOKEN_COLON,
    TOKEN_SEMICOLON,
    TOKEN_COMMA,
    TOKEN_LPAREN,
    TOKEN_RPAREN,
    TOKEN_LBRACE,
    TOKEN_RBRACE,
    TOKEN_EQUAL,
    TOKEN_LBRACKET,
    TOKEN_RBRACKET,

    // Operators
    TOKEN_PLUS,
    TOKEN_MINUS,
    TOKEN_MUL,
    TOKEN_DIV,
    TOKEN_MOD,
    TOKEN_AND,
    TOKEN_OR,
    TOKEN_XOR,
    TOKEN_SHL,
    TOKEN_SHR,

    // Logical operators
    TOKEN_LOGICAL_AND,  // &&
    TOKEN_LOGICAL_OR,   // ||
    TOKEN_LOGICAL_NOT,  // !
    TOKEN_BITWISE_NOT,  // ~

    // Literals
    TOKEN_FLOAT,
    
    // Comparisons
    TOKEN_EQ,
    TOKEN_NEQ,
    TOKEN_LT,
    TOKEN_GT,
    TOKEN_LEQ,
    TOKEN_GEQ,

    // Literals and identifiers
    TOKEN_IDENT,
    TOKEN_INT,
    TOKEN_STRING,
    TOKEN_BOOL,
    TOKEN_CHAR,

    // Types - Extended Integer Types
    TOKEN_TYPE_I8,      // 8-bit signed integer (-128 to 127)
    TOKEN_TYPE_I16,     // 16-bit signed integer (-32,768 to 32,767)
    TOKEN_TYPE_I32,     // 32-bit signed integer (-2^31 to 2^31-1)
    TOKEN_TYPE_I64,     // 64-bit signed integer (-2^63 to 2^63-1)
    TOKEN_TYPE_U8,      // 8-bit unsigned integer (0 to 255)
    TOKEN_TYPE_U16,     // 16-bit unsigned integer (0 to 65,535)
    TOKEN_TYPE_U32,     // 32-bit unsigned integer (0 to 2^32-1)
    TOKEN_TYPE_U64,     // 64-bit unsigned integer (0 to 2^64-1)
    
    // Floating Point Types
    TOKEN_TYPE_F8,      // 8-bit custom float (1 sign + 4 exponent + 3 mantissa)
    TOKEN_TYPE_F16,     // 16-bit IEEE-754 binary16 half-precision float
    TOKEN_TYPE_F32,     // 32-bit IEEE-754 float
    TOKEN_TYPE_F64,     // 64-bit IEEE-754 double
    
    // Special Types
    TOKEN_TYPE_NUM,     // Universal dynamic numeric type
    TOKEN_TYPE_STR,     // String type (enhanced)
    TOKEN_TYPE_CHAR,    // Character type (enhanced)
    TOKEN_TYPE_BOOL,    // Boolean type
    TOKEN_TYPE_PTR,     // Pointer type
    TOKEN_TYPE_VOID,    // Void type

    // Debug
    TOKEN_DEBUG,
    TOKEN_TRACE

} TokenType;

// Token structure
typedef struct {
    TokenType type;
    char *text;
    int line;
} Token;

// Token list
typedef struct {
    Token *tokens;
    size_t count;
    size_t capacity;
} TokenList;

// Public interface
TokenList *lex(const char *source);
void free_token_list(TokenList *list);
const char *token_type_to_str(TokenType type);

#endif // LEXER_H
