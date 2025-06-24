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

    // Literals
    TOKEN_FLOAT,
    
    // Type tokens
    TOKEN_TYPE_F32,  // float type

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

    // Types
    TOKEN_TYPE_U8,
    TOKEN_TYPE_U16,
    TOKEN_TYPE_U32,
    TOKEN_TYPE_I8,
    TOKEN_TYPE_I16,
    TOKEN_TYPE_I32,
    TOKEN_TYPE_PTR,
    TOKEN_TYPE_STR,
    TOKEN_TYPE_BOOL,
    TOKEN_TYPE_VOID,

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
