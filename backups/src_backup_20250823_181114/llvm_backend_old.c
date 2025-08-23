#include "llvm_backend.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Transforms/PassManagerBuilder.h>
#include <llvm-c/Transforms/Utils.h>
#include <llvm-c/Transforms/Scalar.h>
#include <llvm-c/Transforms/IPO.h>
#include <llvm-c/ExecutionEngine.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Initialize LLVM targets
static bool llvm_initialized = false;

static void ensure_llvm_initialized() {
    if (!llvm_initialized) {
        LLVMInitializeAllTargetInfos();
        LLVMInitializeAllTargets();
        LLVMInitializeAllTargetMCs();
        LLVMInitializeAllAsmParsers();
        LLVMInitializeAllAsmPrinters();
        llvm_initialized = true;
        printf("[LLVM] Initialized all targets and backends\n");
    }
}

// Create LLVM backend context
LLVMBackend* llvm_backend_create(const char* module_name, bool is_32bit) {
    ensure_llvm_initialized();
    
    LLVMBackend* backend = (LLVMBackend*)malloc(sizeof(LLVMBackend));
    if (!backend) {
        fprintf(stderr, "[LLVM Error] Failed to allocate backend context\n");
        return NULL;
    }
    
    // Initialize LLVM context and module
    backend->context = LLVMContextCreate();
    backend->module = LLVMModuleCreateWithNameInContext(module_name, backend->context);
    backend->builder = LLVMCreateBuilderInContext(backend->context);
    
    // Initialize arrays for tracking variables and functions
    backend->variables = (LLVMValueRef*)calloc(1000, sizeof(LLVMValueRef)); // Max 1000 variables
    backend->functions = (LLVMValueRef*)calloc(100, sizeof(LLVMValueRef));   // Max 100 functions
    backend->var_count = 0;
    backend->func_count = 0;
    backend->is_32bit = is_32bit;
    
    // Set target triple based on architecture
    const char* default_triple = LLVMGetDefaultTargetTriple();
    backend->target_triple = strdup(default_triple);
    
    // Override for 32-bit if requested
    if (is_32bit) {
        #ifdef _WIN32
            backend->target_triple = strdup("i686-pc-windows-msvc");
        #elif defined(__APPLE__)
            backend->target_triple = strdup("i686-apple-darwin");
        #else
            backend->target_triple = strdup("i686-pc-linux-gnu");
        #endif
    }
    
    // Set module target triple
    LLVMSetTarget(backend->module, backend->target_triple);
    
    // Create target machine
    char* error = NULL;
    LLVMTargetRef target;
    if (LLVMGetTargetFromTriple(backend->target_triple, &target, &error)) {
        fprintf(stderr, "[LLVM Error] Failed to get target: %s\n", error);
        LLVMDisposeMessage(error);
        llvm_backend_destroy(backend);
        return NULL;
    }
    
    backend->target_machine = LLVMCreateTargetMachine(
        target,
        backend->target_triple,
        "generic",              // CPU
        "",                     // Features
        LLVMCodeGenLevelDefault,
        LLVMRelocDefault,
        LLVMCodeModelDefault
    );
    
    printf("[LLVM] Created backend for target: %s\n", backend->target_triple);
    return backend;
}

// Destroy LLVM backend
void llvm_backend_destroy(LLVMBackend* backend) {
    if (!backend) return;
    
    if (backend->target_machine) {
        LLVMDisposeTargetMachine(backend->target_machine);
    }
    if (backend->builder) {
        LLVMDisposeBuilder(backend->builder);
    }
    if (backend->module) {
        LLVMDisposeModule(backend->module);
    }
    if (backend->context) {
        LLVMContextDispose(backend->context);
    }
    
    free(backend->variables);
    free(backend->functions);
    free(backend->target_triple);
    free(backend);
    
    printf("[LLVM] Backend destroyed\n");
}

// Convert ÆLang semantic type to LLVM type
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
        case TYPE_F8:   return LLVMFloatTypeInContext(backend->context);  // Use float for f8
        case TYPE_F16:  return LLVMHalfTypeInContext(backend->context);
        case TYPE_NUM:  return LLVMDoubleTypeInContext(backend->context);
        case TYPE_BOOL: return LLVMInt1TypeInContext(backend->context);
        case TYPE_CHAR: return LLVMInt8TypeInContext(backend->context);
        case TYPE_STR:  return LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
        case TYPE_VOID: return LLVMVoidTypeInContext(backend->context);
        default:
            fprintf(stderr, "[LLVM Warning] Unknown type %d, using i32\n", type);
            return LLVMInt32TypeInContext(backend->context);
    }
}

// Convert IR instruction to LLVM
static LLVMValueRef translate_ir_instruction(LLVMBackend* backend, IRInstruction* instr, 
                                           LLVMValueRef* local_vars, int local_var_count) {
    LLVMValueRef result = NULL;
    
    switch (instr->op) {
        case IR_LOAD_CONST: {
            // Create constant value based on type
            if (instr->type == TYPE_I32 || instr->type == TYPE_I16 || instr->type == TYPE_I8) {
                result = LLVMConstInt(semantic_type_to_llvm(backend, instr->type), 
                                    instr->operand1, 0);
            } else if (instr->type == TYPE_F32) {
                float val = *(float*)&instr->operand1;
                result = LLVMConstReal(semantic_type_to_llvm(backend, instr->type), val);
            } else if (instr->type == TYPE_F64) {
                double val = *(double*)&instr->operand1;
                result = LLVMConstReal(semantic_type_to_llvm(backend, instr->type), val);
            } else if (instr->type == TYPE_BOOL) {
                result = LLVMConstInt(LLVMInt1TypeInContext(backend->context), 
                                    instr->operand1 ? 1 : 0, 0);
            } else if (instr->type == TYPE_CHAR) {
                result = LLVMConstInt(LLVMInt8TypeInContext(backend->context), 
                                    instr->operand1, 0);
            } else {
                // Default to i32
                result = LLVMConstInt(LLVMInt32TypeInContext(backend->context), 
                                    instr->operand1, 0);
            }
            
            // Store in destination temporary
            if (instr->dest < local_var_count) {
                LLVMBuildStore(backend->builder, result, local_vars[instr->dest]);
            }
            break;
        }
        
        case IR_LOAD_VAR: {
            // Load from source variable to destination temporary
            if (instr->src1 < local_var_count && instr->dest < local_var_count) {
                LLVMValueRef loaded = LLVMBuildLoad2(backend->builder, 
                                                   semantic_type_to_llvm(backend, instr->type),
                                                   local_vars[instr->src1], "load_var");
                LLVMBuildStore(backend->builder, loaded, local_vars[instr->dest]);
                result = loaded;
            }
            break;
        }
        
        case IR_STORE_VAR: {
            // Store from source temporary to destination variable
            if (instr->src1 < local_var_count && instr->src2 < local_var_count) {
                LLVMValueRef value = LLVMBuildLoad2(backend->builder,
                                                  semantic_type_to_llvm(backend, instr->type),
                                                  local_vars[instr->src1], "store_src");
                LLVMBuildStore(backend->builder, value, local_vars[instr->src2]);
            }
            break;
        }
        
        case IR_ADD: {
            if (instr->src1 < local_var_count && instr->src2 < local_var_count && 
                instr->dest < local_var_count) {
                LLVMValueRef lhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src1], "add_lhs");
                LLVMValueRef rhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src2], "add_rhs");
                
                if (instr->type == TYPE_F32 || instr->type == TYPE_F64 || instr->type == TYPE_NUM) {
                    result = LLVMBuildFAdd(backend->builder, lhs, rhs, "fadd");
                } else {
                    result = LLVMBuildAdd(backend->builder, lhs, rhs, "add");
                }
                
                LLVMBuildStore(backend->builder, result, local_vars[instr->dest]);
            }
            break;
        }
        
        case IR_SUB: {
            if (instr->src1 < local_var_count && instr->src2 < local_var_count && 
                instr->dest < local_var_count) {
                LLVMValueRef lhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src1], "sub_lhs");
                LLVMValueRef rhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src2], "sub_rhs");
                
                if (instr->type == TYPE_F32 || instr->type == TYPE_F64 || instr->type == TYPE_NUM) {
                    result = LLVMBuildFSub(backend->builder, lhs, rhs, "fsub");
                } else {
                    result = LLVMBuildSub(backend->builder, lhs, rhs, "sub");
                }
                
                LLVMBuildStore(backend->builder, result, local_vars[instr->dest]);
            }
            break;
        }
        
        case IR_MUL: {
            if (instr->src1 < local_var_count && instr->src2 < local_var_count && 
                instr->dest < local_var_count) {
                LLVMValueRef lhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src1], "mul_lhs");
                LLVMValueRef rhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src2], "mul_rhs");
                
                if (instr->type == TYPE_F32 || instr->type == TYPE_F64 || instr->type == TYPE_NUM) {
                    result = LLVMBuildFMul(backend->builder, lhs, rhs, "fmul");
                } else {
                    result = LLVMBuildMul(backend->builder, lhs, rhs, "mul");
                }
                
                LLVMBuildStore(backend->builder, result, local_vars[instr->dest]);
            }
            break;
        }
        
        case IR_DIV: {
            if (instr->src1 < local_var_count && instr->src2 < local_var_count && 
                instr->dest < local_var_count) {
                LLVMValueRef lhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src1], "div_lhs");
                LLVMValueRef rhs = LLVMBuildLoad2(backend->builder,
                                                semantic_type_to_llvm(backend, instr->type),
                                                local_vars[instr->src2], "div_rhs");
                
                if (instr->type == TYPE_F32 || instr->type == TYPE_F64 || instr->type == TYPE_NUM) {
                    result = LLVMBuildFDiv(backend->builder, lhs, rhs, "fdiv");
                } else if (instr->type == TYPE_U8 || instr->type == TYPE_U16 || 
                          instr->type == TYPE_U32 || instr->type == TYPE_U64) {
                    result = LLVMBuildUDiv(backend->builder, lhs, rhs, "udiv");
                } else {
                    result = LLVMBuildSDiv(backend->builder, lhs, rhs, "sdiv");
                }
                
                LLVMBuildStore(backend->builder, result, local_vars[instr->dest]);
            }
            break;
        }
        
        case IR_CALL: {
            // Handle function calls - for now, assume it's printf
            LLVMValueRef printf_func = LLVMGetNamedFunction(backend->module, "printf");
            if (!printf_func) {
                // Declare printf if not already declared
                LLVMTypeRef printf_type = LLVMFunctionType(
                    LLVMInt32TypeInContext(backend->context),  // return type
                    (LLVMTypeRef[]){LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0)}, // format string
                    1,    // param count (variadic, so we specify minimum)
                    1     // is variadic
                );
                printf_func = LLVMAddFunction(backend->module, "printf", printf_type);
            }
            
            // For now, create a simple call with format string
            if (instr->src1 < local_var_count) {
                LLVMValueRef format_arg = LLVMBuildLoad2(backend->builder,
                                                       LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0),
                                                       local_vars[instr->src1], "format");
                result = LLVMBuildCall2(backend->builder, 
                                      LLVMGlobalGetValueType(printf_func),
                                      printf_func, &format_arg, 1, "call");
            }
            break;
        }
        
        case IR_RETURN: {
            if (instr->src1 < local_var_count) {
                LLVMValueRef ret_val = LLVMBuildLoad2(backend->builder,
                                                    semantic_type_to_llvm(backend, instr->type),
                                                    local_vars[instr->src1], "ret_val");
                result = LLVMBuildRet(backend->builder, ret_val);
            } else {
                result = LLVMBuildRetVoid(backend->builder);
            }
            break;
        }
        
        default:
            fprintf(stderr, "[LLVM Warning] Unhandled IR instruction: %d\n", instr->op);
            break;
    }
    
    return result;
}

// Generate LLVM IR from ÆLang IR
bool llvm_generate_from_ir(LLVMBackend* backend, IRFunction* functions, int func_count) {
    printf("[LLVM] Generating LLVM IR from %d functions\n", func_count);
    
    for (int f = 0; f < func_count; f++) {
        IRFunction* func = &functions[f];
        printf("[LLVM] Processing function: %s\n", func->name);
        
        // Create function type
        LLVMTypeRef return_type = semantic_type_to_llvm(backend, func->return_type);
        LLVMTypeRef func_type = LLVMFunctionType(return_type, NULL, 0, 0);
        
        // Create function
        LLVMValueRef llvm_func = LLVMAddFunction(backend->module, func->name, func_type);
        backend->functions[backend->func_count++] = llvm_func;
        
        // Create entry basic block
        LLVMBasicBlockRef entry_block = LLVMAppendBasicBlockInContext(
            backend->context, llvm_func, "entry");
        LLVMPositionBuilderAtEnd(backend->builder, entry_block);
        
        // Allocate space for local variables (temporaries)
        LLVMValueRef local_vars[1000]; // Max 1000 local variables
        int local_var_count = func->temp_count;
        
        // Create alloca instructions for all temporaries at the start
        for (int i = 0; i < local_var_count; i++) {
            char var_name[64];
            snprintf(var_name, sizeof(var_name), "temp_%d", i);
            local_vars[i] = LLVMBuildAlloca(backend->builder, 
                                          LLVMInt32TypeInContext(backend->context), // Default to i32
                                          var_name);
        }
        
        // Translate all IR instructions
        for (int i = 0; i < func->instruction_count; i++) {
            translate_ir_instruction(backend, &func->instructions[i], 
                                    local_vars, local_var_count);
        }
        
        // Add return void if no explicit return
        if (func->return_type == TYPE_VOID) {
            LLVMBuildRetVoid(backend->builder);
        }
        
        // Verify function
        char* error = NULL;
        if (LLVMVerifyFunction(llvm_func, LLVMReturnStatusAction)) {
            fprintf(stderr, "[LLVM Error] Function %s failed verification\n", func->name);
            return false;
        }
        
        printf("[LLVM] Successfully generated function: %s\n", func->name);
    }
    
    // Verify module
    char* error = NULL;
    if (LLVMVerifyModule(backend->module, LLVMReturnStatusAction, &error)) {
        fprintf(stderr, "[LLVM Error] Module verification failed: %s\n", error);
        LLVMDisposeMessage(error);
        return false;
    }
    
    printf("[LLVM] Module verification passed\n");
    return true;
}

// Apply optimizations
void llvm_optimize(LLVMBackend* backend, int optimization_level) {
    if (optimization_level <= 0) return;
    
    printf("[LLVM] Applying optimization level %d\n", optimization_level);
    
    // Create pass manager
    LLVMPassManagerRef pass_manager = LLVMCreatePassManager();
    
    // Add basic optimizations based on level
    if (optimization_level >= 1) {
        LLVMAddPromoteMemoryToRegisterPass(pass_manager);
        LLVMAddInstructionCombiningPass(pass_manager);
        LLVMAddReassociatePass(pass_manager);
        LLVMAddGVNPass(pass_manager);
        LLVMAddCFGSimplificationPass(pass_manager);
    }
    
    if (optimization_level >= 2) {
        LLVMAddFunctionInliningPass(pass_manager);
        LLVMAddConstantPropagationPass(pass_manager);
        LLVMAddDeadStoreEliminationPass(pass_manager);
        LLVMAddAggressiveDCEPass(pass_manager);
    }
    
    if (optimization_level >= 3) {
        LLVMAddLoopVectorizePass(pass_manager);
        LLVMAddSLPVectorizePass(pass_manager);
    }
    
    // Run optimizations
    LLVMRunPassManager(pass_manager, backend->module);
    LLVMDisposePassManager(pass_manager);
    
    printf("[LLVM] Optimization complete\n");
}

// Emit object file
bool llvm_emit_object_file(LLVMBackend* backend, const char* filename) {
    char* error = NULL;
    
    if (LLVMTargetMachineEmitToFile(backend->target_machine, backend->module,
                                   (char*)filename, LLVMObjectFile, &error)) {
        fprintf(stderr, "[LLVM Error] Failed to emit object file: %s\n", error);
        LLVMDisposeMessage(error);
        return false;
    }
    
    printf("[LLVM] Generated object file: %s\n", filename);
    return true;
}

// Emit assembly
bool llvm_emit_assembly(LLVMBackend* backend, const char* filename) {
    char* error = NULL;
    
    if (LLVMTargetMachineEmitToFile(backend->target_machine, backend->module,
                                   (char*)filename, LLVMAssemblyFile, &error)) {
        fprintf(stderr, "[LLVM Error] Failed to emit assembly: %s\n", error);
        LLVMDisposeMessage(error);
        return false;
    }
    
    printf("[LLVM] Generated assembly file: %s\n", filename);
    return true;
}

// Emit LLVM bitcode
bool llvm_emit_bitcode(LLVMBackend* backend, const char* filename) {
    if (LLVMWriteBitcodeToFile(backend->module, filename)) {
        fprintf(stderr, "[LLVM Error] Failed to write bitcode to %s\n", filename);
        return false;
    }
    
    printf("[LLVM] Generated bitcode file: %s\n", filename);
    return true;
}

// Set target triple
bool llvm_set_target_triple(LLVMBackend* backend, const char* triple) {
    free(backend->target_triple);
    backend->target_triple = strdup(triple);
    LLVMSetTarget(backend->module, backend->target_triple);
    
    // Recreate target machine
    if (backend->target_machine) {
        LLVMDisposeTargetMachine(backend->target_machine);
    }
    
    char* error = NULL;
    LLVMTargetRef target;
    if (LLVMGetTargetFromTriple(backend->target_triple, &target, &error)) {
        fprintf(stderr, "[LLVM Error] Invalid target triple %s: %s\n", triple, error);
        LLVMDisposeMessage(error);
        return false;
    }
    
    backend->target_machine = LLVMCreateTargetMachine(
        target,
        backend->target_triple,
        "generic",
        "",
        LLVMCodeGenLevelDefault,
        LLVMRelocDefault,
        LLVMCodeModelDefault
    );
    
    printf("[LLVM] Set target triple to: %s\n", backend->target_triple);
    return true;
}

// List available targets
void llvm_list_available_targets(void) {
    ensure_llvm_initialized();
    
    printf("[LLVM] Available targets:\n");
    
    // Common targets
    const char* common_targets[] = {
        "x86_64-pc-linux-gnu",      // Linux 64-bit
        "i686-pc-linux-gnu",        // Linux 32-bit
        "x86_64-pc-windows-msvc",   // Windows 64-bit
        "i686-pc-windows-msvc",     // Windows 32-bit
        "x86_64-apple-darwin",      // macOS 64-bit
        "aarch64-apple-darwin",     // macOS ARM64
        "aarch64-linux-gnu",        // Linux ARM64
        "arm-linux-gnueabihf",      // Linux ARM32
        "wasm32-unknown-unknown",   // WebAssembly 32-bit
        "wasm64-unknown-unknown",   // WebAssembly 64-bit
        "riscv64-unknown-linux-gnu",// RISC-V 64-bit
        NULL
    };
    
    for (int i = 0; common_targets[i] != NULL; i++) {
        printf("  %s\n", common_targets[i]);
    }
}
