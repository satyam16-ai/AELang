// main.c - ÆLang CLI Compiler Entry Point
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lexer.h"
#include "parser.h"
#include "codegen.h"

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <input.ae> <output.asm>\n", argv[0]);
        return 1;
    }

    const char *input_path = argv[1];
    const char *output_path = argv[2];

    // Load source code
    FILE *in = fopen(input_path, "r");
    if (!in) {
        perror("Failed to open input file");
        return 1;
    }

    fseek(in, 0, SEEK_END);
    long len = ftell(in);
    rewind(in);

    char *source = malloc(len + 1);
    if (!source) {
        perror("Failed to allocate memory for source");
        fclose(in);
        return 1;
    }

    fread(source, 1, len, in);
    source[len] = '\0';
    fclose(in);

    // Tokenize
    TokenList *tokens = lex(source);

    // Debug: Print first 10 tokens
    for (size_t i = 0; i < tokens->count && i < 10; ++i) {
        printf("[DEBUG] Token %zu: type=%d text='%s' line=%d\n",
               i, tokens->tokens[i].type, tokens->tokens[i].text, tokens->tokens[i].line);
    }
    fflush(stdout);

    // Parse into AST
    AST *ast = parse(tokens);

    // Generate NASM output
    FILE *out = fopen(output_path, "w");
    if (!out) {
        perror("Failed to open output file");
        free_ast(ast);
        free_token_list(tokens);
        free(source);
        return 1;
    }
    generate_code(ast, out);
    fclose(out);

    printf("[\u2713] Compiled %s → %s\n", input_path, output_path);

    // Clean up
    free_ast(ast);
    free_token_list(tokens);
    free(source);

    return 0;
}
