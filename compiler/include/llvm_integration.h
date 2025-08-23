#pragma once

#include "ir.h"
#include "semantic.h"
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

// Compiler options structure
typedef struct {
    bool use_llvm_backend;
    bool emit_llvm_ir;
    bool emit_llvm_bitcode;
    bool emit_assembly;
    bool emit_object;
    int optimization_level;
    char* target_triple;
    char* output_filename;
    bool link_executable;
} CompilerOptions;

// Main LLVM compilation interface
bool compile_with_llvm_backend(const char* source_file, IRProgram* ir_program, 
                              CompilerOptions* opts, bool is_32bit);

// Command line parsing
CompilerOptions parse_llvm_options(int argc, char** argv);

// Help and utilities
void print_llvm_help(void);
void free_compiler_options(CompilerOptions* opts);

#ifdef __cplusplus
}
#endif
