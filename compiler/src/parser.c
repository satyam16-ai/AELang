// parser.c (Expanded Parser for ÆLang)
#define _GNU_SOURCE
#include <string.h>

#include "parser.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static size_t current = 0;
static TokenList *tokens;

static Token peek() {
    return tokens->tokens[current];
}

static Token advance() {
    if (current < tokens->count) current++;
    return tokens->tokens[current - 1];
}

static int match(TokenType type) {
    if (peek().type == type) {
        advance();
        return 1;
    }
    return 0;
}

static int is_type_token(TokenType type) {
    return type == TOKEN_TYPE_STR || type == TOKEN_TYPE_PTR || type == TOKEN_TYPE_BOOL ||
           type == TOKEN_TYPE_U8 || type == TOKEN_TYPE_U16 || type == TOKEN_TYPE_U32 ||
           type == TOKEN_TYPE_I8 || type == TOKEN_TYPE_I16 || type == TOKEN_TYPE_I32 ||
           type == TOKEN_TYPE_VOID;
}

static Token expect_type_token(const char *msg) {
    if (is_type_token(peek().type)) return advance();
    fprintf(stderr, "[Parser Error] Expected %s at line %d\n", msg, peek().line);
    exit(1);
}

static Token expect(TokenType type, const char *msg) {
    if (!match(type)) {
        fprintf(stderr, "[Parser Error] Expected %s at line %d\n", msg, peek().line);
        exit(1);
    }
    return tokens->tokens[current - 1];
}

static ASTNode *make_node(ASTNodeType type, int line) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = type;
    node->line = line;
    return node;
}

static ASTNode *parse_literal(Token tok) {
    ASTNode *node = make_node(AST_LITERAL, tok.line);
    if (tok.type == TOKEN_INT) {
        node->as.literal.type = VALUE_INT;
        node->as.literal.as.int_val = atoi(tok.text);
    } else if (tok.type == TOKEN_STRING) {
        node->as.literal.type = VALUE_STRING;
        node->as.literal.as.str_val = strdup(tok.text);
    } else if (tok.type == TOKEN_BOOL) {
        node->as.literal.type = VALUE_BOOL;
        node->as.literal.as.bool_val = strcmp(tok.text, "true") == 0;
    }
    return node;
}

static ASTNode *parse_primary_expr() {
    Token tok = peek();
    if (tok.type == TOKEN_INT || tok.type == TOKEN_STRING || tok.type == TOKEN_BOOL) {
        advance();
        return parse_literal(tok);
    } else if (tok.type == TOKEN_IDENT) {
        advance();
        ASTNode *id = make_node(AST_IDENTIFIER, tok.line);
        id->as.ident = strdup(tok.text);
        return id;
    }
    return NULL;
}

static ASTNode *parse_binary_expr() {
    ASTNode *left = parse_primary_expr();

    while (peek().type == TOKEN_PLUS || peek().type == TOKEN_MINUS ||
           peek().type == TOKEN_MUL || peek().type == TOKEN_DIV) {
        Token op = advance();
        ASTNode *right = parse_primary_expr();

        ASTNode *bin = make_node(AST_BIN_OP, op.line);
        strncpy(bin->as.bin_op.op, op.text, 2);
        bin->as.bin_op.op[2] = '\0';  // Ensure null termination
        bin->as.bin_op.left = left;
        bin->as.bin_op.right = right;

        left = bin;
    }

    return left;
}

static ASTNode *parse_expression() {
    return parse_binary_expr();
}

static ASTNode *parse_statement();

static AST *parse_block() {
    AST *ast = calloc(1, sizeof(AST));
    ast->nodes = calloc(128, sizeof(ASTNode *));
    ast->count = 0;
    while (peek().type != TOKEN_EOF) {
        ASTNode *stmt = parse_statement();
        if (stmt)
            ast->nodes[ast->count++] = stmt;
        else
            break;
    }
    return ast;
}

static ASTNode *parse_func_call(char *name) {
    ASTNode *node = make_node(AST_FUNC_CALL, peek().line);
    node->as.func_call.name = strdup(name);
    expect(TOKEN_LPAREN, "(");
    node->as.func_call.args = calloc(8, sizeof(ASTNode *));
    node->as.func_call.arg_count = 0;
    while (peek().type != TOKEN_RPAREN) {
        node->as.func_call.args[node->as.func_call.arg_count++] = parse_expression();
        match(TOKEN_COMMA);
    }
    expect(TOKEN_RPAREN, ")");
    match(TOKEN_SEMICOLON);
    return node;
}

static ASTNode *parse_statement() {
    Token tok = peek();

    if (match(TOKEN_LET)) {
        ASTNode *node = make_node(AST_VAR_DECL, tok.line);
        Token name = expect(TOKEN_IDENT, "identifier");
        expect(TOKEN_COLON, ":");
        Token type = expect_type_token("type");
        expect(TOKEN_EQUAL, "=");
        ASTNode *value = parse_expression();
        match(TOKEN_SEMICOLON);
        node->as.var_decl.name = strdup(name.text);
        node->as.var_decl.type_name = strdup(type.text);
        node->as.var_decl.value = value;
        return node;
    } else if (match(TOKEN_CONST)) {
        ASTNode *node = make_node(AST_CONST_DECL, tok.line);
        Token name = expect(TOKEN_IDENT, "identifier");
        expect(TOKEN_COLON, ":");
        Token type = expect_type_token("type");
        expect(TOKEN_EQUAL, "=");
        ASTNode *value = parse_literal(advance());
        match(TOKEN_SEMICOLON);
        node->as.var_decl.name = strdup(name.text);
        node->as.var_decl.type_name = strdup(type.text);
        node->as.var_decl.value = value;
        return node;
    } else if (peek().type == TOKEN_IDENT) {
        Token ident = advance();
        if (match(TOKEN_EQUAL)) {
            ASTNode *node = make_node(AST_ASSIGN, ident.line);
            node->as.assign.target = strdup(ident.text);
            node->as.assign.value = parse_expression();
            match(TOKEN_SEMICOLON);
            return node;
        } else if (peek().type == TOKEN_LPAREN) {
            return parse_func_call(ident.text);
        } else {
            match(TOKEN_SEMICOLON);
            ASTNode *id = make_node(AST_IDENTIFIER, ident.line);
            id->as.ident = strdup(ident.text);
            return id;
        }
    } else if (match(TOKEN_IF)) {
        ASTNode *node = make_node(AST_IF_GOTO, tok.line);
        ASTNode *cond = parse_expression();
        expect(TOKEN_GOTO, "goto");
        Token label = expect(TOKEN_IDENT, "label name");
        match(TOKEN_SEMICOLON);
        node->as.if_goto.condition = cond;
        node->as.if_goto.label = strdup(label.text);
        return node;
    } else if (match(TOKEN_GOTO)) {
        ASTNode *node = make_node(AST_GOTO, tok.line);
        Token label = expect(TOKEN_IDENT, "label name");
        match(TOKEN_SEMICOLON);
        node->as.label_name = strdup(label.text);
        return node;
    } else if (match(TOKEN_HALT)) {
        match(TOKEN_SEMICOLON);
        return make_node(AST_HALT, tok.line);
    } else if (match(TOKEN_EXTERN)) {
        ASTNode *node = make_node(AST_EXTERN_FUNC, tok.line);
        Token name = expect(TOKEN_IDENT, "function name");
        node->as.extern_func.name = strdup(name.text);
        expect(TOKEN_LPAREN, "(");
        node->as.extern_func.param_names = calloc(8, sizeof(char *));
        node->as.extern_func.param_types = calloc(8, sizeof(char *));
        node->as.extern_func.param_count = 0;
        while (!match(TOKEN_RPAREN)) {
            Token param = expect(TOKEN_IDENT, "param");
            expect(TOKEN_COLON, ":");
            Token typ = expect_type_token("type");
            node->as.extern_func.param_names[node->as.extern_func.param_count] = strdup(param.text);
            node->as.extern_func.param_types[node->as.extern_func.param_count] = strdup(typ.text);
            node->as.extern_func.param_count++;
            match(TOKEN_COMMA);
        }
        match(TOKEN_SEMICOLON);
        return node;
    } else if (match(TOKEN_FUNC)) {
        ASTNode *node = make_node(AST_FUNC_DEF, tok.line);
        Token name = expect(TOKEN_IDENT, "function name");
        node->as.func_def.name = strdup(name.text);
        expect(TOKEN_LPAREN, "(");
        node->as.func_def.param_names = calloc(8, sizeof(char *));
        node->as.func_def.param_types = calloc(8, sizeof(char *));
        node->as.func_def.param_count = 0;
        while (!match(TOKEN_RPAREN)) {
            Token param = expect(TOKEN_IDENT, "param");
            expect(TOKEN_COLON, ":");
            Token typ = expect_type_token("type");
            node->as.func_def.param_names[node->as.func_def.param_count] = strdup(param.text);
            node->as.func_def.param_types[node->as.func_def.param_count] = strdup(typ.text);
            node->as.func_def.param_count++;
            match(TOKEN_COMMA);
        }
        expect(TOKEN_COLON, ":");
        Token rtype = expect_type_token("return type");
        node->as.func_def.return_type = strdup(rtype.text);
        expect(TOKEN_LBRACE, "{");
        node->as.func_def.body = calloc(32, sizeof(ASTNode *));
        node->as.func_def.body_count = 0;
        while (!match(TOKEN_RBRACE)) {
            ASTNode *stmt = parse_statement();
            node->as.func_def.body[node->as.func_def.body_count++] = stmt;
        }
        // Debug output for function body
        fprintf(stderr, "[PARSER DEBUG] func %s body_count=%zu\n", node->as.func_def.name, node->as.func_def.body_count);
        for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
            if (node->as.func_def.body[i])
                fprintf(stderr, "[PARSER DEBUG]   body[%zu] type=%d\n", i, node->as.func_def.body[i]->type);
        }
        return node;
    }

    printf("[Parser Warning] Unrecognized statement at line %d: %s\n", tok.line, token_type_to_str(tok.type));
    advance();
    return NULL;
}

AST *parse(TokenList *token_stream) {
    current = 0;
    tokens = token_stream;
    return parse_block();
}

// Recursively free an AST node and its children
static void free_ast_node(ASTNode *node) {
    if (!node) return;
    switch (node->type) {
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            free(node->as.var_decl.name);
            free(node->as.var_decl.type_name);
            free_ast_node(node->as.var_decl.value);
            break;
        case AST_ASSIGN:
            free(node->as.assign.target);
            free_ast_node(node->as.assign.value);
            break;
        case AST_BIN_OP:
            free_ast_node(node->as.bin_op.left);
            free_ast_node(node->as.bin_op.right);
            break;
        case AST_UNARY_OP:
            free_ast_node(node->as.unary_op.expr);
            break;
        case AST_LITERAL:
            if (node->as.literal.type == VALUE_STRING)
                free(node->as.literal.as.str_val);
            break;
        case AST_IDENTIFIER:
            free(node->as.ident);
            break;
        case AST_FUNC_CALL:
            free(node->as.func_call.name);
            for (size_t i = 0; i < node->as.func_call.arg_count; ++i)
                free_ast_node(node->as.func_call.args[i]);
            free(node->as.func_call.args);
            break;
        case AST_EXTERN_FUNC:
            free(node->as.extern_func.name);
            for (size_t i = 0; i < node->as.extern_func.param_count; ++i) {
                free(node->as.extern_func.param_names[i]);
                free(node->as.extern_func.param_types[i]);
            }
            free(node->as.extern_func.param_names);
            free(node->as.extern_func.param_types);
            break;
        case AST_FUNC_DEF:
            free(node->as.func_def.name);
            for (size_t i = 0; i < node->as.func_def.param_count; ++i) {
                free(node->as.func_def.param_names[i]);
                free(node->as.func_def.param_types[i]);
            }
            free(node->as.func_def.param_names);
            free(node->as.func_def.param_types);
            free(node->as.func_def.return_type);
            for (size_t i = 0; i < node->as.func_def.body_count; ++i)
                free_ast_node(node->as.func_def.body[i]);
            free(node->as.func_def.body);
            break;
        case AST_LABEL:
            free(node->as.label_name);
            break;
        case AST_IF_GOTO:
            free_ast_node(node->as.if_goto.condition);
            free(node->as.if_goto.label);
            break;
        case AST_GOTO:
            free(node->as.label_name);
            break;
        case AST_IO:
            free(node->as.io.var);
            break;
        case AST_LOAD:
            free(node->as.load.dest);
            free(node->as.load.addr);
            free(node->as.load.type);
            break;
        case AST_STORE:
            free(node->as.store.addr);
            free(node->as.store.src);
            break;
        case AST_DEBUG:
            free(node->as.debug.var);
            break;
        case AST_TRACE:
            free(node->as.trace.message);
            break;
        default:
            break;
    }
    free(node);
}

void free_ast(AST *ast) {
    for (size_t i = 0; i < ast->count; ++i) {
        free_ast_node(ast->nodes[i]);
    }
    free(ast->nodes);
    free(ast);
}
