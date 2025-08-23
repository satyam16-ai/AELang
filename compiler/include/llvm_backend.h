#pragma once

#include <llvm-c/Core.h>
#include <llvm-c/TargetMachine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Object.h>
#include "ir.h"
#include "semantic.h"

#ifdef __cplusplus
extern "C" {
#endif

// LLVM Backend Context
typedef struct {
    LLVMContextRef context;
    LLVMModuleRef module;
    LLVMBuilderRef builder;
    LLVMTargetMachineRef target_machine;
    
    // Symbol tables for variables and functions
    LLVMValueRef* variables;
    LLVMValueRef* functions;
    int var_count;
    int func_count;
    
    // Label tracking for control flow
    LLVMBasicBlockRef* labels;
    int label_count;
    int label_capacity;
    
    // Function call parameter tracking
    LLVMValueRef call_params[16];
    int param_count;
    
    // Current function being compiled
    LLVMValueRef current_function;
    
    // Target information
    char* target_triple;
    bool is_32bit;
} LLVMBackend;

// Core LLVM backend functions
LLVMBackend* create_llvm_backend(const char* module_name);
void free_llvm_backend(LLVMBackend* backend);

// IR to LLVM translation
bool llvm_generate_from_ir(LLVMBackend* backend, IRProgram* program);

// Code generation
int llvm_emit_ir(LLVMBackend* backend, const char* filename);
int llvm_emit_object(LLVMBackend* backend, const char* filename, const char* target_triple);
bool llvm_emit_assembly(LLVMBackend* backend, const char* filename);

// Optimization
void llvm_optimize(LLVMBackend* backend, int opt_level);

// Debug
void llvm_print_module(LLVMBackend* backend);

#ifdef __cplusplus
}
#endif
