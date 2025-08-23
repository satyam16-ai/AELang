// llvm_backend.c - LLVM Backend Implementation
#include "llvm_backend.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <llvm-c/Core.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/Transforms/Scalar.h>

// Create LLVM backend
LLVMBackend* create_llvm_backend(const char* module_name) {
    LLVMBackend* backend = malloc(sizeof(LLVMBackend));
    if (!backend) return NULL;
    
    // Initialize LLVM
    LLVMInitializeNativeTarget();
    LLVMInitializeNativeAsmPrinter();
    
    // Create context and module
    backend->context = LLVMContextCreate();
    backend->module = LLVMModuleCreateWithNameInContext(module_name, backend->context);
    backend->builder = LLVMCreateBuilderInContext(backend->context);
    backend->target_machine = NULL;
    backend->variables = NULL;
    backend->functions = NULL;
    backend->var_count = 0;
    backend->func_count = 0;
    backend->target_triple = NULL;
    backend->is_32bit = false;
    
    return backend;
}

// Free LLVM backend
void free_llvm_backend(LLVMBackend* backend) {
    if (!backend) return;
    
    if (backend->target_triple) free(backend->target_triple);
    if (backend->variables) free(backend->variables);
    if (backend->functions) free(backend->functions);
    if (backend->target_machine) LLVMDisposeTargetMachine(backend->target_machine);
    LLVMDisposeBuilder(backend->builder);
    LLVMDisposeModule(backend->module);
    LLVMContextDispose(backend->context);
    free(backend);
}

// Convert semantic type to LLVM type
static LLVMTypeRef semantic_type_to_llvm(LLVMBackend* backend, SemanticType type) {
    switch (type) {
        case TYPE_I8:   return LLVMInt8TypeInContext(backend->context);
        case TYPE_I16:  return LLVMInt16TypeInContext(backend->context);
        case TYPE_I32:  return LLVMInt32TypeInContext(backend->context);
        case TYPE_I64:  return LLVMInt64TypeInContext(backend->context);
        case TYPE_U8:   return LLVMInt8TypeInContext(backend->context);
        case TYPE_U16:  return LLVMInt16TypeInContext(backend->context);
        case TYPE_U32:  return LLVMInt32TypeInContext(backend->context);
        case TYPE_U64:  return LLVMInt64TypeInContext(backend->context);
        case TYPE_F32:  return LLVMFloatTypeInContext(backend->context);
        case TYPE_F64:  return LLVMDoubleTypeInContext(backend->context);
        case TYPE_NUM:  return LLVMDoubleTypeInContext(backend->context);
        case TYPE_BOOL: return LLVMInt1TypeInContext(backend->context);
        case TYPE_CHAR: return LLVMInt8TypeInContext(backend->context);
        case TYPE_STR:  return LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
        case TYPE_VOID: return LLVMVoidTypeInContext(backend->context);
        default:        return LLVMInt32TypeInContext(backend->context);
    }
}

// Simple instruction translation (placeholder)
static void translate_basic_instruction(LLVMBackend* backend, IRInstruction* instr) {
    if (!backend || !instr) return;
    
    // For now, just create simple constants for testing
    switch (instr->opcode) {
        case IR_LOAD_CONST:
            if (instr->src1 && instr->src1->type == OPERAND_CONST_INT) {
                LLVMConstInt(LLVMInt32TypeInContext(backend->context), 
                           instr->src1->value.int_val, 0);
            }
            break;
        case IR_RETURN:
            LLVMBuildRetVoid(backend->builder);
            break;
        default:
            // Placeholder for other instructions
            break;
    }
}

// Generate LLVM IR from IRProgram
bool llvm_generate_from_ir(LLVMBackend* backend, IRProgram* program) {
    if (!backend || !program) {
        fprintf(stderr, "Invalid parameters for LLVM generation\n");
        return false;
    }
    
    // Create a simple main function for now
    LLVMTypeRef main_type = LLVMFunctionType(LLVMInt32TypeInContext(backend->context), NULL, 0, 0);
    LLVMValueRef main_func = LLVMAddFunction(backend->module, "main", main_type);
    
    LLVMBasicBlockRef entry = LLVMAppendBasicBlockInContext(backend->context, main_func, "entry");
    LLVMPositionBuilderAtEnd(backend->builder, entry);
    
    // Process simple instructions
    if (program->global_instructions) {
        for (IRInstruction* instr = program->global_instructions; instr; instr = instr->next) {
            translate_basic_instruction(backend, instr);
        }
    }
    
    // Add return 0
    LLVMValueRef zero = LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
    LLVMBuildRet(backend->builder, zero);
    
    // Verify the function
    char* error = NULL;
    if (LLVMVerifyModule(backend->module, LLVMAbortProcessAction, &error)) {
        fprintf(stderr, "LLVM module verification failed: %s\n", error);
        LLVMDisposeMessage(error);
        return false;
    }
    
    return true;
}

// Optimize LLVM module
void llvm_optimize(LLVMBackend* backend, int opt_level) {
    if (!backend || opt_level < 0 || opt_level > 3) return;
    
    LLVMPassManagerRef pass_manager = LLVMCreatePassManager();
    
    // Add basic optimization passes
    if (opt_level >= 1) {
        LLVMAddInstructionCombiningPass(pass_manager);
        LLVMAddReassociatePass(pass_manager);
        LLVMAddGVNPass(pass_manager);
        LLVMAddCFGSimplificationPass(pass_manager);
    }
    
    if (opt_level >= 2) {
        LLVMAddPromoteMemoryToRegisterPass(pass_manager);
        LLVMAddDeadStoreEliminationPass(pass_manager);
    }
    
    if (opt_level >= 3) {
        LLVMAddAggressiveDCEPass(pass_manager);
        LLVMAddLoopUnrollPass(pass_manager);
    }
    
    // Run optimizations
    LLVMRunPassManager(pass_manager, backend->module);
    LLVMDisposePassManager(pass_manager);
}

// Emit LLVM IR to file
int llvm_emit_ir(LLVMBackend* backend, const char* filename) {
    if (!backend || !filename) return 0;
    
    char* error = NULL;
    if (LLVMPrintModuleToFile(backend->module, filename, &error)) {
        fprintf(stderr, "Error writing IR to file %s: %s\n", filename, error);
        LLVMDisposeMessage(error);
        return 0;
    }
    
    return 1;
}

// Emit object file using system tools
int llvm_emit_object(LLVMBackend* backend, const char* filename, const char* target_triple) {
    if (!backend || !filename) return 0;
    
    // First emit LLVM IR
    char ir_filename[256];
    snprintf(ir_filename, sizeof(ir_filename), "%s.ll", filename);
    
    if (!llvm_emit_ir(backend, ir_filename)) {
        return 0;
    }
    
    // Use LLC to generate object file
    char command[512];
    if (target_triple) {
        snprintf(command, sizeof(command), 
                "llc -filetype=obj -mtriple=%s %s -o %s", 
                target_triple, ir_filename, filename);
    } else {
        snprintf(command, sizeof(command), 
                "llc -filetype=obj %s -o %s", 
                ir_filename, filename);
    }
    
    int result = system(command);
    
    // Clean up IR file
    unlink(ir_filename);
    
    return (result == 0) ? 1 : 0;
}

// Emit assembly file
bool llvm_emit_assembly(LLVMBackend* backend, const char* filename) {
    if (!backend || !filename) return false;
    
    // First emit LLVM IR
    char ir_filename[256];
    snprintf(ir_filename, sizeof(ir_filename), "%s.ll", filename);
    
    if (!llvm_emit_ir(backend, ir_filename)) {
        return false;
    }
    
    // Use LLC to generate assembly
    char command[512];
    if (backend->target_triple) {
        snprintf(command, sizeof(command), 
                "llc -mtriple=%s %s -o %s", 
                backend->target_triple, ir_filename, filename);
    } else {
        snprintf(command, sizeof(command), 
                "llc %s -o %s", 
                ir_filename, filename);
    }
    
    int result = system(command);
    
    // Clean up IR file
    unlink(ir_filename);
    
    return (result == 0) ? true : false;
}

// Print LLVM module (for debugging)
void llvm_print_module(LLVMBackend* backend) {
    if (!backend) return;
    
    char* ir_string = LLVMPrintModuleToString(backend->module);
    printf("LLVM Module:\n%s\n", ir_string);
    LLVMDisposeMessage(ir_string);
}
