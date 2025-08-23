// main.c - ÆLang CLI Compiler Entry Point (Enhanced Pipeline with LLVM Backend)
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "lexer.h"
#include "parser.h"
#include "semantic.h"
#include "ir.h"
#include "optimizer.h"
#include "ir_codegen.h"
#include "llvm_integration.h"

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "🔥 ÆLang Compiler with LLVM Backend\n");
        fprintf(stderr, "Usage: %s <input.ae> [options]\n\n", argv[0]);
        fprintf(stderr, "📦 Core Options:\n");
        fprintf(stderr, "  -o <file>       Output file\n");
        fprintf(stderr, "  -O0, -O1, -O2, -O3  Optimization level (default: -O1)\n");
        fprintf(stderr, "  --arch32        Force 32-bit architecture\n");
        fprintf(stderr, "  --arch64        Force 64-bit architecture\n");
        fprintf(stderr, "  --strict-sizes  Enforce strict integer size checking\n");
        print_llvm_help();
        return 1;
    }

    const char *input_path = argv[1];
    const char *output_path = NULL;
    int optimization_level = 1;  // Default optimization level
    bool use_legacy_backend = false;  // Use LLVM by default
    
    // Parse LLVM-specific options first
    CompilerOptions llvm_opts = parse_llvm_options(argc, argv);
    
    // Enhanced compilation configuration
    CompilationConfig config = {
        .target_arch = ARCH_INVALID,         // No default - must be explicitly set
        .enable_string_variables = true,     // Always enabled by default
        .enable_char_operations = true,      // Always enabled by default
        .strict_integer_sizes = false,       // Relaxed by default
        .optimize_for_size = false           // Optimize for speed by default
    };
    
    // Enhanced command line argument parsing
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
        } else if (strcmp(argv[i], "-O3") == 0) {
            optimization_level = 3;
        } else if (strcmp(argv[i], "--arch32") == 0) {
            config.target_arch = ARCH_32BIT;
        } else if (strcmp(argv[i], "--arch64") == 0) {
            config.target_arch = ARCH_64BIT;
        } else if (strcmp(argv[i], "--strict-sizes") == 0) {
            config.strict_integer_sizes = true;
        } else if (strcmp(argv[i], "--optimize-size") == 0) {
            config.optimize_for_size = true;
        } else if (strcmp(argv[i], "--legacy-backend") == 0) {
            use_legacy_backend = true;
        } else if (strcmp(argv[i], "--help") == 0) {
            // Help already printed above
            return 0;
        } else if (strncmp(argv[i], "--", 2) == 0 || strncmp(argv[i], "-O", 2) == 0) {
            // Skip LLVM-specific options (already parsed)
            if (strcmp(argv[i], "--target") == 0) {
                i++; // Skip the target triple argument too
            }
        } else if (argv[i][0] != '-' && output_path == NULL) {
            // Positional argument for output file (legacy behavior)
            output_path = argv[i];
        } else if (argv[i][0] == '-') {
            fprintf(stderr, "Unknown option: %s\n", argv[i]);
            fprintf(stderr, "Use --help for usage information\n");
            return 1;
        }
    }
    
    // Validate that architecture is explicitly specified
    if (config.target_arch == ARCH_INVALID) {
        fprintf(stderr, "Error: Target architecture must be explicitly specified\n");
        fprintf(stderr, "Use --arch32 for 32-bit or --arch64 for 64-bit architecture\n");
        fprintf(stderr, "This ensures proper type handling and prevents architecture-specific bugs\n");
        return 1;
    }
    
    // Set output path for legacy backend compatibility
    char *final_output_path = NULL;
    if (use_legacy_backend && output_path) {
        // Ensure output file has .asm extension for legacy backend
        size_t output_len = strlen(output_path);
        if (output_len < 4 || strcmp(output_path + output_len - 4, ".asm") != 0) {
            // Append .asm extension
            final_output_path = malloc(output_len + 5); // +4 for ".asm" +1 for null terminator
            if (!final_output_path) {
                fprintf(stderr, "Error: Memory allocation failed\n");
                return 1;
            }
            strcpy(final_output_path, output_path);
            strcat(final_output_path, ".asm");
            output_path = final_output_path;
        }
    }

    printf("🔥 ÆLang Compiler with %s Backend\n", use_legacy_backend ? "Legacy ASM" : "LLVM");
    printf("[\u2713] Enhanced Compiler Pipeline Starting...\n");
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

    // Architecture is determined by command line flags only
    // No automatic detection - user must specify --arch32 or --arch64

    printf("[4/7] Semantic Analysis...\n");
    // Enhanced semantic analysis with configuration
    printf("  Target Architecture: %s\n", config.target_arch == ARCH_64BIT ? "64-bit" : "32-bit");
    printf("  String Variables: %s\n", config.enable_string_variables ? "Enabled" : "Disabled");
    printf("  Character Operations: %s\n", config.enable_char_operations ? "Enabled" : "Disabled");
    
    SemanticContext *sem_ctx = create_semantic_context_with_config(&config);
    printf("DEBUG: Created enhanced semantic context\n");
    
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
    // printf("  Generated IR (before optimization):\n");
    // print_ir_program(ir_program);

    printf("[6/7] Optimization (Level %d)...\n", optimization_level);
    // Optimize IR
    IRProgram *optimized_ir = optimize_program(ir_program, optimization_level);

    printf("[7/7] Code Generation...\n");
    
    bool compilation_success = false;
    
    if (use_legacy_backend) {
        // Legacy ASM backend
        if (output_path == NULL) {
            fprintf(stderr, "Error: No output file specified for legacy backend\n");
            goto cleanup;
        }
        
        printf("  Using Legacy ASM Backend\n");
        FILE *out = fopen(output_path, "w");
        if (!out) {
            perror("Failed to open output file");
            goto cleanup;
        }
        
        // Use IR-based code generation
        compilation_success = generate_asm_from_ir(optimized_ir, out, &config);
        fclose(out);
        
        if (compilation_success) {
            printf("[\u2713] Legacy Compilation Complete!\n");
            printf("  Source: %s → Assembly: %s\n", input_path, output_path);
            printf("  Optimization Level: %d\n", optimization_level);
        }
    } else {
        // LLVM Backend - the default and recommended approach
        printf("  Using LLVM Backend\n");
        
        // Sync optimization levels
        if (llvm_opts.optimization_level != optimization_level) {
            llvm_opts.optimization_level = optimization_level;
        }
        
        // If output file specified, use it
        if (output_path) {
            llvm_opts.output_filename = strdup(output_path);
        }
        
        // Compile with LLVM
        compilation_success = compile_with_llvm_backend(input_path, optimized_ir, &llvm_opts, 
                                                       config.target_arch == ARCH_32BIT);
    }
    
    if (!compilation_success) {
        fprintf(stderr, "Code generation failed\n");
        goto cleanup;
    }

cleanup:
    // Cleanup
    free_compiler_options(&llvm_opts);
    if (final_output_path) {
        free(final_output_path);
    }
    free_ir_program(optimized_ir);
    free_annotated_ast(annotated_ast);
    free_semantic_context(sem_ctx);
    free_ast(ast);
    free_token_list(tokens);
    free(source);

    return compilation_success ? 0 : 1;
}
