// parser.c (Expanded Parser for ÆLang)
#define _GNU_SOURCE
#include <string.h>

#include "parser.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static size_t current = 0;
static TokenList *tokens;

// Forward declarations
static ASTNode *parse_expression();
static ASTNode *parse_statement();
static ASTNode *parse_if_statement(int line);
static ASTNode *parse_if_statement_with_condition(int line, ASTNode *condition);
static ASTNode *make_node(ASTNodeType type, int line);
static void free_ast_node(ASTNode *node);

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
           type == TOKEN_TYPE_F32 || type == TOKEN_TYPE_NUM || type == TOKEN_TYPE_VOID;
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

// Helper functions for if statement parsing
static int check(TokenType type) {
    if (current >= tokens->count) return 0;
    return tokens->tokens[current].type == type;
}

static int is_at_end() {
    return current >= tokens->count;
}

static ASTNode *parse_if_statement_with_condition(int line, ASTNode *condition) {
    // Parse if statement with already-parsed condition
    ASTNode *node = make_node(AST_IF_STMT, line);
    node->as.if_stmt.condition = condition;
    
    // Parse then block
    expect(TOKEN_LBRACE, "{");
    node->as.if_stmt.then_body = NULL;
    node->as.if_stmt.then_count = 0;
    size_t then_capacity = 0;
    
    while (!check(TOKEN_RBRACE) && !is_at_end()) {
        if (node->as.if_stmt.then_count >= then_capacity) {
            then_capacity = then_capacity == 0 ? 8 : then_capacity * 2;
            node->as.if_stmt.then_body = realloc(node->as.if_stmt.then_body, 
                                               then_capacity * sizeof(ASTNode*));
        }
        ASTNode *stmt = parse_statement();
        if (stmt) {
            node->as.if_stmt.then_body[node->as.if_stmt.then_count++] = stmt;
        }
    }
    expect(TOKEN_RBRACE, "}");
    
    // Initialize else body
    node->as.if_stmt.else_body = NULL;
    node->as.if_stmt.else_count = 0;
    
    // Check for else or elif
    if (check(TOKEN_ELIF)) {
        // Create nested if for elif
        advance(); // consume TOKEN_ELIF
        size_t else_capacity = 1;
        node->as.if_stmt.else_body = malloc(else_capacity * sizeof(ASTNode*));
        node->as.if_stmt.else_body[0] = parse_if_statement(peek().line); // Recursively parse elif as if
        node->as.if_stmt.else_count = 1;
    } else if (check(TOKEN_ELSE)) {
        advance(); // consume TOKEN_ELSE
        expect(TOKEN_LBRACE, "{");
        size_t else_capacity = 0;
        
        while (!check(TOKEN_RBRACE) && !is_at_end()) {
            if (node->as.if_stmt.else_count >= else_capacity) {
                else_capacity = else_capacity == 0 ? 8 : else_capacity * 2;
                node->as.if_stmt.else_body = realloc(node->as.if_stmt.else_body, 
                                                   else_capacity * sizeof(ASTNode*));
            }
            ASTNode *stmt = parse_statement();
            if (stmt) {
                node->as.if_stmt.else_body[node->as.if_stmt.else_count++] = stmt;
            }
        }
        expect(TOKEN_RBRACE, "}");
    }
    
    return node;
}

static ASTNode *parse_if_statement(int line) {
    // Parse if condition
    ASTNode *node = make_node(AST_IF_STMT, line);
    node->as.if_stmt.condition = parse_expression();
    
    // Parse then block
    expect(TOKEN_LBRACE, "{");
    node->as.if_stmt.then_body = NULL;
    node->as.if_stmt.then_count = 0;
    size_t then_capacity = 0;
    
    while (!check(TOKEN_RBRACE) && !is_at_end()) {
        if (node->as.if_stmt.then_count >= then_capacity) {
            then_capacity = then_capacity == 0 ? 8 : then_capacity * 2;
            node->as.if_stmt.then_body = realloc(node->as.if_stmt.then_body, 
                                               then_capacity * sizeof(ASTNode*));
        }
        ASTNode *stmt = parse_statement();
        if (stmt) {
            node->as.if_stmt.then_body[node->as.if_stmt.then_count++] = stmt;
        }
    }
    expect(TOKEN_RBRACE, "}");
    
    // Initialize else body
    node->as.if_stmt.else_body = NULL;
    node->as.if_stmt.else_count = 0;
    
    // Check for else or elif
    if (check(TOKEN_ELIF)) {
        // Create nested if for elif
        advance(); // consume TOKEN_ELIF
        size_t else_capacity = 1;
        node->as.if_stmt.else_body = malloc(else_capacity * sizeof(ASTNode*));
        node->as.if_stmt.else_body[0] = parse_if_statement(peek().line); // Recursively parse elif as if
        node->as.if_stmt.else_count = 1;
    } else if (check(TOKEN_ELSE)) {
        advance(); // consume TOKEN_ELSE
        expect(TOKEN_LBRACE, "{");
        size_t else_capacity = 0;
        
        while (!check(TOKEN_RBRACE) && !is_at_end()) {
            if (node->as.if_stmt.else_count >= else_capacity) {
                else_capacity = else_capacity == 0 ? 8 : else_capacity * 2;
                node->as.if_stmt.else_body = realloc(node->as.if_stmt.else_body, 
                                                   else_capacity * sizeof(ASTNode*));
            }
            ASTNode *stmt = parse_statement();
            if (stmt) {
                node->as.if_stmt.else_body[node->as.if_stmt.else_count++] = stmt;
            }
        }
        expect(TOKEN_RBRACE, "}");
    }
    
    return node;
}

// Safe node creation with error handling
static ASTNode *make_node(ASTNodeType type, int line) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    if (!node) {
        fprintf(stderr, "Error: Failed to allocate memory for AST node at line %d\n", line);
        return NULL;
    }
    node->type = type;
    node->line = line;
    return node;
}

static ASTNode *parse_literal(Token tok) {
    ASTNode *node = make_node(AST_LITERAL, tok.line);
    if (tok.type == TOKEN_INT) {
        node->as.literal.type = VALUE_INT;
        node->as.literal.as.int_val = atoi(tok.text);
    } else if (tok.type == TOKEN_FLOAT) {
        node->as.literal.type = VALUE_FLOAT;
        node->as.literal.as.float_val = atof(tok.text);
    } else if (tok.type == TOKEN_STRING) {
        node->as.literal.type = VALUE_STRING;
        node->as.literal.as.str_val = strdup(tok.text);
    } else if (tok.type == TOKEN_BOOL) {
        node->as.literal.type = VALUE_BOOL;
        node->as.literal.as.bool_val = strcmp(tok.text, "true") == 0;
    }
    return node;
}

// Helper function to convert a literal to num type
static void convert_literal_to_num(ASTNode *literal) {
    if (literal->type != AST_LITERAL) return;
    
    NumValue num_val;
    if (literal->as.literal.type == VALUE_INT) {
        num_val.is_float = 0;
        num_val.value.int_val = literal->as.literal.as.int_val;
    } else if (literal->as.literal.type == VALUE_FLOAT) {
        num_val.is_float = 1;
        num_val.value.float_val = literal->as.literal.as.float_val;
    } else {
        return; // Can't convert other types
    }
    
    literal->as.literal.type = VALUE_NUM;
    literal->as.literal.as.num_val = num_val;
}

static ASTNode *parse_primary_expr() {
    Token tok = peek();
    
    // Handle parentheses for expression grouping
    if (tok.type == TOKEN_LPAREN) {
        advance(); // consume '('
        ASTNode *expr = parse_expression();
        if (!expr) {
            fprintf(stderr, "Error: Expected expression after '('\n");
            return NULL;
        }
        expect(TOKEN_RPAREN, ")");
        return expr;
    }
    
    if (tok.type == TOKEN_INT || tok.type == TOKEN_FLOAT || tok.type == TOKEN_STRING || tok.type == TOKEN_BOOL) {
        advance();
        return parse_literal(tok);
    } else if (tok.type == TOKEN_IDENT) {
        advance();
        // Check if this is a function call
        if (peek().type == TOKEN_LPAREN) {
            // This is a function call
            ASTNode *node = make_node(AST_FUNC_CALL, tok.line);
            node->as.func_call.name = strdup(tok.text);
            expect(TOKEN_LPAREN, "(");
            node->as.func_call.args = calloc(8, sizeof(ASTNode *));
            node->as.func_call.arg_count = 0;
            while (peek().type != TOKEN_RPAREN) {
                ASTNode *arg = parse_expression();
                if (!arg) {
                    // Cleanup and return error
                    free(node->as.func_call.name);
                    free(node->as.func_call.args);
                    free(node);
                    return NULL;
                }
                node->as.func_call.args[node->as.func_call.arg_count++] = arg;
                match(TOKEN_COMMA);
            }
            expect(TOKEN_RPAREN, ")");
            return node;
        } else {
            // This is just an identifier
            ASTNode *id = make_node(AST_IDENTIFIER, tok.line);
            id->as.ident = strdup(tok.text);
            return id;
        }
    }
    
    fprintf(stderr, "Error: Unexpected token in expression at line %d\n", tok.line);
    return NULL;
}

static ASTNode *parse_binary_expr() {
    ASTNode *left = parse_primary_expr();
    if (!left) {
        return NULL; // Error in primary expression
    }

    while (peek().type == TOKEN_PLUS || peek().type == TOKEN_MINUS ||
           peek().type == TOKEN_MUL || peek().type == TOKEN_DIV || peek().type == TOKEN_MOD ||
           peek().type == TOKEN_EQ || peek().type == TOKEN_NEQ ||
           peek().type == TOKEN_LT || peek().type == TOKEN_GT ||
           peek().type == TOKEN_LEQ || peek().type == TOKEN_GEQ) {
        Token op = advance();
        ASTNode *right = parse_primary_expr();
        
        if (!right) {
            // Cleanup left node and return error
            free_ast_node(left);
            return NULL;
        }

        ASTNode *bin = make_node(AST_BIN_OP, op.line);
        if (!bin) {
            // Cleanup and return error
            free_ast_node(left);
            free_ast_node(right);
            return NULL;
        }
        
        // Handle operator text (can be 1 or 2 characters)
        int op_len = strlen(op.text);
        if (op_len < 3) {
            strcpy(bin->as.bin_op.op, op.text);
        } else {
            strncpy(bin->as.bin_op.op, op.text, 2);
            bin->as.bin_op.op[2] = '\0';
        }
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
    ast->capacity = 256; // Increased capacity
    ast->nodes = calloc(ast->capacity, sizeof(ASTNode *));
    ast->count = 0;
    while (peek().type != TOKEN_EOF) {
        ASTNode *stmt = parse_statement();
        if (stmt) {
            // Dynamic resize if needed
            if (ast->count >= ast->capacity) {
                ast->capacity *= 2;
                ast->nodes = realloc(ast->nodes, ast->capacity * sizeof(ASTNode *));
                if (!ast->nodes) {
                    fprintf(stderr, "Error: Failed to resize AST nodes array\n");
                    free(ast);
                    return NULL;
                }
            }
            ast->nodes[ast->count++] = stmt;
        } else
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
        if (!node) {
            fprintf(stderr, "Error: Failed to create AST_VAR_DECL node\n");
            return NULL;
        }
        Token name = expect(TOKEN_IDENT, "identifier");
        expect(TOKEN_COLON, ":");
        Token type = expect_type_token("type");
        expect(TOKEN_EQUAL, "=");
        ASTNode *value = parse_expression();
        if (!value) {
            fprintf(stderr, "Error: Failed to parse expression for variable\n");
            free_ast_node(node);
            return NULL;
        }
        match(TOKEN_SEMICOLON);
        node->as.var_decl.name = strdup(name.text);
        node->as.var_decl.type_name = strdup(type.text);
        node->as.var_decl.value = value;
        
        // Convert to num type if variable is declared as num
        if (strcmp(type.text, "num") == 0) {
            convert_literal_to_num(value);
        }
        
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
        // Look ahead to see if this is "if <condition> goto <label>" or "if <condition> { ... }"
        ASTNode *cond = parse_expression();
        
        if (peek().type == TOKEN_GOTO) {
            // This is an if-goto statement
            ASTNode *node = make_node(AST_IF_GOTO, tok.line);
            advance(); // consume TOKEN_GOTO
            Token label = expect(TOKEN_IDENT, "label name");
            match(TOKEN_SEMICOLON);
            node->as.if_goto.condition = cond;
            node->as.if_goto.label = strdup(label.text);
            return node;
        } else if (peek().type == TOKEN_LBRACE) {
            // This is a regular if statement - use helper with pre-parsed condition
            return parse_if_statement_with_condition(tok.line, cond);
        } else {
            fprintf(stderr, "Error: Expected 'goto' or '{' after if condition\n");
            free_ast_node(cond);
            return NULL;
        }
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
        
        // Dynamic function body allocation
        size_t body_capacity = 64; // Start with larger capacity
        node->as.func_def.body = calloc(body_capacity, sizeof(ASTNode *));
        node->as.func_def.body_count = 0;
        
        while (!match(TOKEN_RBRACE)) {
            // Check if we need to resize
            if (node->as.func_def.body_count >= body_capacity) {
                body_capacity *= 2;
                node->as.func_def.body = realloc(node->as.func_def.body, body_capacity * sizeof(ASTNode *));
                if (!node->as.func_def.body) {
                    fprintf(stderr, "Error: Failed to resize function body array\n");
                    return NULL;
                }
                // Zero out new memory
                for (size_t i = node->as.func_def.body_count; i < body_capacity; i++) {
                    node->as.func_def.body[i] = NULL;
                }
            }
            
            ASTNode *stmt = parse_statement();
            if (stmt) {
                node->as.func_def.body[node->as.func_def.body_count++] = stmt;
            } else {
                fprintf(stderr, "Warning: Failed to parse statement in function body\n");
                break;
            }
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

// Recursively free an AST node and its children - memory optimized
static void free_ast_node(ASTNode *node) {
    if (!node) return;
    
    // Prevent double-free by marking as freed
    if (node->type == -1) return;  // Already freed marker
    
    switch (node->type) {
        case AST_VAR_DECL:
        case AST_CONST_DECL:
            if (node->as.var_decl.name) {
                free(node->as.var_decl.name);
                node->as.var_decl.name = NULL;
            }
            if (node->as.var_decl.type_name) {
                free(node->as.var_decl.type_name);
                node->as.var_decl.type_name = NULL;
            }
            if (node->as.var_decl.value && node->as.var_decl.value->type != -1) {
                free_ast_node(node->as.var_decl.value);
                node->as.var_decl.value = NULL;
            }
            break;
        case AST_ASSIGN:
            if (node->as.assign.target) {
                free(node->as.assign.target);
                node->as.assign.target = NULL;
            }
            if (node->as.assign.value && node->as.assign.value->type != -1) {
                free_ast_node(node->as.assign.value);
                node->as.assign.value = NULL;
            }
            break;
        case AST_BIN_OP:
            if (node->as.bin_op.left && node->as.bin_op.left->type != -1) {
                free_ast_node(node->as.bin_op.left);
                node->as.bin_op.left = NULL;
            }
            if (node->as.bin_op.right && node->as.bin_op.right->type != -1) {
                free_ast_node(node->as.bin_op.right);
                node->as.bin_op.right = NULL;
            }
            break;
        case AST_UNARY_OP:
            if (node->as.unary_op.expr && node->as.unary_op.expr->type != -1) {
                free_ast_node(node->as.unary_op.expr);
                node->as.unary_op.expr = NULL;
            }
            break;
        case AST_LITERAL:
            if (node->as.literal.type == VALUE_STRING && node->as.literal.as.str_val) {
                free(node->as.literal.as.str_val);
                node->as.literal.as.str_val = NULL;
            }
            break;
        case AST_IDENTIFIER:
            if (node->as.ident) {
                free(node->as.ident);
                node->as.ident = NULL;
            }
            break;
        case AST_FUNC_CALL:
            if (node->as.func_call.name) {
                free(node->as.func_call.name);
                node->as.func_call.name = NULL;
            }
            if (node->as.func_call.args) {
                for (size_t i = 0; i < node->as.func_call.arg_count; ++i) {
                    if (node->as.func_call.args[i] && node->as.func_call.args[i]->type != -1) {
                        free_ast_node(node->as.func_call.args[i]);
                        node->as.func_call.args[i] = NULL;
                    }
                }
                free(node->as.func_call.args);
                node->as.func_call.args = NULL;
            }
            break;
        case AST_EXTERN_FUNC:
            if (node->as.extern_func.name) {
                free(node->as.extern_func.name);
                node->as.extern_func.name = NULL;
            }
            if (node->as.extern_func.param_names) {
                for (size_t i = 0; i < node->as.extern_func.param_count; ++i) {
                    if (node->as.extern_func.param_names[i]) {
                        free(node->as.extern_func.param_names[i]);
                        node->as.extern_func.param_names[i] = NULL;
                    }
                }
                free(node->as.extern_func.param_names);
                node->as.extern_func.param_names = NULL;
            }
            if (node->as.extern_func.param_types) {
                for (size_t i = 0; i < node->as.extern_func.param_count; ++i) {
                    if (node->as.extern_func.param_types[i]) {
                        free(node->as.extern_func.param_types[i]);
                        node->as.extern_func.param_types[i] = NULL;
                    }
                }
                free(node->as.extern_func.param_types);
                node->as.extern_func.param_types = NULL;
            }
            break;
        case AST_FUNC_DEF:
            if (node->as.func_def.name) {
                free(node->as.func_def.name);
                node->as.func_def.name = NULL;
            }
            if (node->as.func_def.param_names) {
                for (size_t i = 0; i < node->as.func_def.param_count; ++i) {
                    if (node->as.func_def.param_names[i]) {
                        free(node->as.func_def.param_names[i]);
                        node->as.func_def.param_names[i] = NULL;
                    }
                }
                free(node->as.func_def.param_names);
                node->as.func_def.param_names = NULL;
            }
            if (node->as.func_def.param_types) {
                for (size_t i = 0; i < node->as.func_def.param_count; ++i) {
                    if (node->as.func_def.param_types[i]) {
                        free(node->as.func_def.param_types[i]);
                        node->as.func_def.param_types[i] = NULL;
                    }
                }
                free(node->as.func_def.param_types);
                node->as.func_def.param_types = NULL;
            }
            if (node->as.func_def.return_type) {
                free(node->as.func_def.return_type);
                node->as.func_def.return_type = NULL;
            }
            // Safe body cleanup with null checks
            if (node->as.func_def.body) {
                for (size_t i = 0; i < node->as.func_def.body_count; ++i) {
                    if (node->as.func_def.body[i] && node->as.func_def.body[i]->type != -1) {
                        free_ast_node(node->as.func_def.body[i]);
                        node->as.func_def.body[i] = NULL;
                    }
                }
                free(node->as.func_def.body);
                node->as.func_def.body = NULL;
            }
            break;
        case AST_LABEL:
            if (node->as.label_name) {
                free(node->as.label_name);
                node->as.label_name = NULL;
            }
            break;
        case AST_IF_GOTO:
            if (node->as.if_goto.condition && node->as.if_goto.condition->type != -1) {
                free_ast_node(node->as.if_goto.condition);
                node->as.if_goto.condition = NULL;
            }
            if (node->as.if_goto.label) {
                free(node->as.if_goto.label);
                node->as.if_goto.label = NULL;
            }
            break;
        case AST_IF_STMT:
            if (node->as.if_stmt.condition && node->as.if_stmt.condition->type != -1) {
                free_ast_node(node->as.if_stmt.condition);
                node->as.if_stmt.condition = NULL;
            }
            // Free then body
            if (node->as.if_stmt.then_body) {
                for (size_t i = 0; i < node->as.if_stmt.then_count; i++) {
                    if (node->as.if_stmt.then_body[i]) {
                        free_ast_node(node->as.if_stmt.then_body[i]);
                    }
                }
                free(node->as.if_stmt.then_body);
                node->as.if_stmt.then_body = NULL;
            }
            // Free else body
            if (node->as.if_stmt.else_body) {
                for (size_t i = 0; i < node->as.if_stmt.else_count; i++) {
                    if (node->as.if_stmt.else_body[i]) {
                        free_ast_node(node->as.if_stmt.else_body[i]);
                    }
                }
                free(node->as.if_stmt.else_body);
                node->as.if_stmt.else_body = NULL;
            }
            break;
        case AST_GOTO:
            if (node->as.label_name) {
                free(node->as.label_name);
                node->as.label_name = NULL;
            }
            break;
        case AST_IO:
            if (node->as.io.var) {
                free(node->as.io.var);
                node->as.io.var = NULL;
            }
            break;
        case AST_LOAD:
            if (node->as.load.dest) {
                free(node->as.load.dest);
                node->as.load.dest = NULL;
            }
            if (node->as.load.addr) {
                free(node->as.load.addr);
                node->as.load.addr = NULL;
            }
            if (node->as.load.type) {
                free(node->as.load.type);
                node->as.load.type = NULL;
            }
            break;
        case AST_STORE:
            if (node->as.store.addr) {
                free(node->as.store.addr);
                node->as.store.addr = NULL;
            }
            if (node->as.store.src) {
                free(node->as.store.src);
                node->as.store.src = NULL;
            }
            break;
        case AST_DEBUG:
            if (node->as.debug.var) {
                free(node->as.debug.var);
                node->as.debug.var = NULL;
            }
            break;
        case AST_TRACE:
            if (node->as.trace.message) {
                free(node->as.trace.message);
                node->as.trace.message = NULL;
            }
            break;
        default:
            break;
    }
    node->type = -1;  // Mark as freed
    free(node);
}

void free_ast(AST *ast) {
    if (!ast) return;
    
    if (ast->nodes) {
        for (size_t i = 0; i < ast->count; ++i) {
            if (ast->nodes[i]) {
                free_ast_node(ast->nodes[i]);
                ast->nodes[i] = NULL;
            }
        }
        free(ast->nodes);
        ast->nodes = NULL;
    }
    
    ast->count = 0;
    ast->capacity = 0;
    free(ast);
}
