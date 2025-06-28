// main.c - ÆLang CLI Compiler Entry Point (Enhanced Pipeline)
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lexer.h"
#include "parser.h"
#include "semantic.h"
#include "ir.h"
#include "optimizer.h"
#include "codegen.h"

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <input.ae> [options]\n", argv[0]);
        fprintf(stderr, "Options:\n");
        fprintf(stderr, "  -o <file>     Output assembly file\n");
        fprintf(stderr, "  -O0, -O1, -O2 Optimization level (default: -O1)\n");
        fprintf(stderr, "  <output.asm>  Output file (if no -o specified)\n");
        return 1;
    }

    const char *input_path = argv[1];
    const char *output_path = NULL;
    int optimization_level = 1;  // Default optimization level
    
    // Parse command line arguments
    for (int i = 2; i < argc; i++) {
        if (strcmp(argv[i], "-o") == 0) {
            if (i + 1 >= argc) {
                fprintf(stderr, "Error: -o flag requires output filename\n");
                return 1;
            }
            output_path = argv[++i];
        } else if (strcmp(argv[i], "-O0") == 0) {
            optimization_level = 0;
        } else if (strcmp(argv[i], "-O1") == 0) {
            optimization_level = 1;
        } else if (strcmp(argv[i], "-O2") == 0) {
            optimization_level = 2;
        } else if (argv[i][0] != '-' && output_path == NULL) {
            // Positional argument for output file
            output_path = argv[i];
        } else {
            fprintf(stderr, "Unknown option: %s\n", argv[i]);
            return 1;
        }
    }
    
    // If no output path specified, generate default
    if (output_path == NULL) {
        fprintf(stderr, "Error: No output file specified\n");
        return 1;
    }

    printf("[\u2713] ÆLang Enhanced Compiler Pipeline Starting...\n");
    printf("[1/7] Loading source code: %s\n", input_path);

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

    printf("[2/7] Lexical Analysis (Tokenization)...\n");
    // Tokenize
    TokenList *tokens = lex(source);
    if (!tokens) {
        fprintf(stderr, "Lexical analysis failed\n");
        free(source);
        return 1;
    }

    // Debug: Print first 5 tokens only
    printf("  Generated %zu tokens\n", tokens->count);
    for (size_t i = 0; i < tokens->count && i < 5; ++i) {
        printf("  [%zu] %s: '%s'\n", i, token_type_to_str(tokens->tokens[i].type), tokens->tokens[i].text);
    }

    printf("[3/7] Syntax Analysis (Parsing)...\n");
    // Parse into AST
    AST *ast = parse(tokens);
    if (!ast) {
        fprintf(stderr, "Syntax analysis failed\n");
        free_token_list(tokens);
        free(source);
        return 1;
    }
    printf("  Generated AST with %zu nodes\n", ast->count);

    printf("[4/7] Semantic Analysis...\n");
    // Semantic analysis
    SemanticContext *sem_ctx = create_semantic_context();
    printf("DEBUG: Created semantic context\n");
    
    AnnotatedAST *annotated_ast = semantic_analyze(ast, sem_ctx);
    printf("DEBUG: Semantic analysis function returned\n");
    
    if (sem_ctx->error_count > 0) {
        fprintf(stderr, "Semantic analysis failed with %d errors\n", sem_ctx->error_count);
        free_annotated_ast(annotated_ast);
        free_semantic_context(sem_ctx);
        free_ast(ast);
        free_token_list(tokens);
        free(source);
        return 1;
    }
    printf("DEBUG: Semantic analysis completed successfully\n");
    
    printf("  Semantic analysis completed (%d warnings)\n", sem_ctx->warning_count);

    printf("[5/7] IR Generation...\n");
    // Generate IR
    printf("DEBUG: About to call generate_ir\n");
    IRProgram *ir_program = generate_ir(annotated_ast, sem_ctx);
    printf("DEBUG: generate_ir returned\n");
    
    if (!ir_program) {
        fprintf(stderr, "IR generation failed\n");
        free_annotated_ast(annotated_ast);
        free_semantic_context(sem_ctx);
        free_ast(ast);
        free_token_list(tokens);
        free(source);
        return 1;
    }
    printf("DEBUG: IR generation completed successfully\n");

    // DISABLED IR PRINTING TO PREVENT HANGING
    // if (optimization_level > 0) {
    //     printf("  Generated IR (before optimization):\n");
    //     print_ir_program(ir_program);
    // }

    printf("[6/7] Optimization (Level %d)...\n", optimization_level);
    // Optimize IR
    IRProgram *optimized_ir = optimize_program(ir_program, optimization_level);

    printf("[7/7] Code Generation...\n");
    // Generate NASM output from optimized IR
    FILE *out = fopen(output_path, "w");
    if (!out) {
        perror("Failed to open output file");
        free_ir_program(optimized_ir);
        free_annotated_ast(annotated_ast);
        free_semantic_context(sem_ctx);
        free_ast(ast);
        free_token_list(tokens);
        free(source);
        return 1;
    }
    
    // For now, we'll still use the original codegen since we haven't 
    // implemented IR-to-assembly yet. This is the final piece to complete.
    generate_code(ast, out);
    fclose(out);

    printf("[\u2713] Enhanced Compilation Complete!\n");
    printf("  Source: %s → Assembly: %s\n", input_path, output_path);
    printf("  Optimization Level: %d\n", optimization_level);

    // Cleanup
    free_ir_program(optimized_ir);
    free_annotated_ast(annotated_ast);
    free_semantic_context(sem_ctx);
    free_ast(ast);
    free_token_list(tokens);
    free(source);

    return 0;
}
