// lexer.c - Fixed version
#define _GNU_SOURCE
#include <string.h>

#include "lexer.h"
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>

#define INITIAL_CAPACITY 128

static Token make_token(TokenType type, const char *text, int line) {
    Token token;
    token.type = type;
    token.text = strdup(text);
    token.line = line;
    return token;
}

static void add_token(TokenList *list, Token token) {
    if (list->count >= list->capacity) {
        list->capacity *= 2;
        list->tokens = realloc(list->tokens, list->capacity * sizeof(Token));
    }
    list->tokens[list->count++] = token;
}

static int match_keyword(const char *word) {
    struct { const char *word; TokenType type; } keywords[] = {
        {"let", TOKEN_LET}, {"const", TOKEN_CONST}, {"func", TOKEN_FUNC},
        {"extern", TOKEN_EXTERN}, {"return", TOKEN_RETURN},
        {"if", TOKEN_IF}, {"else", TOKEN_ELSE}, {"elif", TOKEN_ELIF}, {"goto", TOKEN_GOTO}, {"asm", TOKEN_ASM},
        {"halt", TOKEN_HALT}, {"in", TOKEN_IN}, {"out", TOKEN_OUT},
        {"load", TOKEN_LOAD}, {"store", TOKEN_STORE},
        {"u8", TOKEN_TYPE_U8}, {"u16", TOKEN_TYPE_U16}, {"u32", TOKEN_TYPE_U32},
        {"i8", TOKEN_TYPE_I8}, {"i16", TOKEN_TYPE_I16}, {"i32", TOKEN_TYPE_I32},
        {"f32", TOKEN_TYPE_F32}, {"num", TOKEN_TYPE_NUM},
        {"ptr", TOKEN_TYPE_PTR}, {"str", TOKEN_TYPE_STR}, {"bool", TOKEN_TYPE_BOOL}, {"char", TOKEN_TYPE_CHAR},
        {"true", TOKEN_BOOL}, {"false", TOKEN_BOOL},
        {"@debug", TOKEN_DEBUG}, {"@trace", TOKEN_TRACE},
        {"void", TOKEN_TYPE_VOID},
    };
    for (size_t i = 0; i < sizeof(keywords)/sizeof(keywords[0]); ++i) {
        if (strcmp(word, keywords[i].word) == 0)
            return keywords[i].type;
    }
    return -1;
}

TokenList *lex(const char *source) {
    TokenList *list = malloc(sizeof(TokenList));
    list->tokens = malloc(INITIAL_CAPACITY * sizeof(Token));
    list->count = 0;
    list->capacity = INITIAL_CAPACITY;

    int line = 1;

    while (*source) {
        while (isspace(*source)) {
            if (*source == '\n') line++;
            source++;
        }

        if (source[0] == '/' && source[1] == '/') {
            source += 2;
            while (*source && *source != '\n') source++;
            continue;
        }

        if (*source == '\0') break;
        const char *token_start = source;

        if (isalpha(*source) || *source == '_' || *source == '@') {
            while (isalnum(*source) || *source == '_' || *source == '@') source++;
            char *word = strndup(token_start, source - token_start);
            int kw = match_keyword(word);
            add_token(list, make_token(kw != -1 ? kw : TOKEN_IDENT, word, line));
            free(word);
            continue;
        }

        if (isdigit(*source)) {
            int is_float = 0;
            while (isdigit(*source)) source++;
            if (*source == '.') {
                is_float = 1;
                source++;
                while (isdigit(*source)) source++;
            }
            add_token(list, make_token(is_float ? TOKEN_FLOAT : TOKEN_INT, 
                                     strndup(token_start, source - token_start), line));
            continue;
        }

        if (*source == '"') {
            source++;
            const char *str_start = source;
            while (*source && *source != '"') {
                if (*source == '\n') line++;
                source++;
            }
            char *str_val = strndup(str_start, source - str_start);
            add_token(list, make_token(TOKEN_STRING, str_val, line));
            free(str_val);
            if (*source == '"') source++;
            continue;
        }

        switch (*source) {
            case ':': add_token(list, make_token(TOKEN_COLON, ":", line)); source++; break;
            case ';': add_token(list, make_token(TOKEN_SEMICOLON, ";", line)); source++; break;
            case ',': add_token(list, make_token(TOKEN_COMMA, ",", line)); source++; break;
            case '(': add_token(list, make_token(TOKEN_LPAREN, "(", line)); source++; break;
            case ')': add_token(list, make_token(TOKEN_RPAREN, ")", line)); source++; break;
            case '{': add_token(list, make_token(TOKEN_LBRACE, "{", line)); source++; break;
            case '}': add_token(list, make_token(TOKEN_RBRACE, "}", line)); source++; break;
            case '[': add_token(list, make_token(TOKEN_LBRACKET, "[", line)); source++; break;
            case ']': add_token(list, make_token(TOKEN_RBRACKET, "]", line)); source++; break;
            case '=':
                if (*(source + 1) == '=') { add_token(list, make_token(TOKEN_EQ, "==", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_EQUAL, "=", line)); source++; }
                break;
            case '!':
                if (*(source + 1) == '=') { add_token(list, make_token(TOKEN_NEQ, "!=", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_LOGICAL_NOT, "!", line)); source++; }
                break;
            case '<':
                if (*(source + 1) == '=') { add_token(list, make_token(TOKEN_LEQ, "<=", line)); source += 2; }
                else if (*(source + 1) == '<') { add_token(list, make_token(TOKEN_SHL, "<<", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_LT, "<", line)); source++; }
                break;
            case '>':
                if (*(source + 1) == '=') { add_token(list, make_token(TOKEN_GEQ, ">=", line)); source += 2; }
                else if (*(source + 1) == '>') { add_token(list, make_token(TOKEN_SHR, ">>", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_GT, ">", line)); source++; }
                break;
            case '+': add_token(list, make_token(TOKEN_PLUS, "+", line)); source++; break;
            case '-': add_token(list, make_token(TOKEN_MINUS, "-", line)); source++; break;
            case '*': add_token(list, make_token(TOKEN_MUL, "*", line)); source++; break;
            case '/': add_token(list, make_token(TOKEN_DIV, "/", line)); source++; break;
            case '%': add_token(list, make_token(TOKEN_MOD, "%", line)); source++; break;
            case '&': 
                if (*(source + 1) == '&') { add_token(list, make_token(TOKEN_LOGICAL_AND, "&&", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_AND, "&", line)); source++; }
                break;
            case '|': 
                if (*(source + 1) == '|') { add_token(list, make_token(TOKEN_LOGICAL_OR, "||", line)); source += 2; }
                else { add_token(list, make_token(TOKEN_OR, "|", line)); source++; }
                break;
            case '^': add_token(list, make_token(TOKEN_XOR, "^", line)); source++; break;
            default: source++; break;
        }
    }

    add_token(list, make_token(TOKEN_EOF, "<eof>", line));
    return list;
}

void free_token_list(TokenList *list) {
    if (!list) return;
    for (size_t i = 0; i < list->count; ++i) {
        if (list->tokens[i].text) {
            free(list->tokens[i].text);
            list->tokens[i].text = NULL;
        }
    }
    if (list->tokens) {
        free(list->tokens);
        list->tokens = NULL;
    }
    free(list);
}

const char *token_type_to_str(TokenType type) {
    #define CASE(t) case t: return #t
    switch (type) {
        CASE(TOKEN_EOF); CASE(TOKEN_LET); CASE(TOKEN_CONST); CASE(TOKEN_FUNC); CASE(TOKEN_EXTERN);
        CASE(TOKEN_RETURN); CASE(TOKEN_IF); CASE(TOKEN_ELSE); CASE(TOKEN_ELIF); CASE(TOKEN_GOTO); CASE(TOKEN_ASM); CASE(TOKEN_HALT);
        CASE(TOKEN_IN); CASE(TOKEN_OUT); CASE(TOKEN_LOAD); CASE(TOKEN_STORE);
        CASE(TOKEN_COLON); CASE(TOKEN_SEMICOLON); CASE(TOKEN_COMMA);
        CASE(TOKEN_LPAREN); CASE(TOKEN_RPAREN); CASE(TOKEN_LBRACE); CASE(TOKEN_RBRACE);
        CASE(TOKEN_EQUAL); CASE(TOKEN_LBRACKET); CASE(TOKEN_RBRACKET);
        CASE(TOKEN_PLUS); CASE(TOKEN_MINUS); CASE(TOKEN_MUL); CASE(TOKEN_DIV); CASE(TOKEN_MOD);
        CASE(TOKEN_AND); CASE(TOKEN_OR); CASE(TOKEN_XOR); CASE(TOKEN_SHL); CASE(TOKEN_SHR);
        CASE(TOKEN_LOGICAL_AND); CASE(TOKEN_LOGICAL_OR); CASE(TOKEN_LOGICAL_NOT);
        CASE(TOKEN_EQ); CASE(TOKEN_NEQ); CASE(TOKEN_LT); CASE(TOKEN_GT); CASE(TOKEN_LEQ); CASE(TOKEN_GEQ);
        CASE(TOKEN_IDENT); CASE(TOKEN_INT); CASE(TOKEN_STRING); CASE(TOKEN_BOOL); CASE(TOKEN_CHAR); CASE(TOKEN_FLOAT);
        CASE(TOKEN_TYPE_U8); CASE(TOKEN_TYPE_U16); CASE(TOKEN_TYPE_U32);
        CASE(TOKEN_TYPE_I8); CASE(TOKEN_TYPE_I16); CASE(TOKEN_TYPE_I32);
        CASE(TOKEN_TYPE_F32); CASE(TOKEN_TYPE_NUM); CASE(TOKEN_TYPE_VOID);
        CASE(TOKEN_TYPE_PTR); CASE(TOKEN_TYPE_STR); CASE(TOKEN_TYPE_BOOL); CASE(TOKEN_TYPE_CHAR);
        CASE(TOKEN_DEBUG); CASE(TOKEN_TRACE);
    }
    #undef CASE
    return "UNKNOWN";
}
