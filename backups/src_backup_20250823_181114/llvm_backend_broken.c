// llvm_backend_fixed.c - Fixed LLVM Backend Implementation
#include "llvm_backend.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>  // For unlink
#include <llvm-c/Core.h>
#include <llvm-c/ExecutionEngine.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/BitWriter.h>
#include <llvm-c/Transforms/Scalar.h>
#include <llvm-c/Transforms/Utils.h>

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
    
    return backend;
}

// Free LLVM backend
void free_llvm_backend(LLVMBackend* backend) {
    if (!backend) return;
    
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
        case TYPE_STR: return LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
        case TYPE_VOID: return LLVMVoidTypeInContext(backend->context);
        default:        return LLVMInt32TypeInContext(backend->context);
    }
}

// Convert IR operand to LLVM value
static LLVMValueRef operand_to_llvm_value(LLVMBackend* backend, IROperand* operand, 
                                         LLVMValueRef* local_vars, int local_var_count) {
    if (!operand) return NULL;
    
    switch (operand->type) {
        case OPERAND_CONST_INT:
            return LLVMConstInt(semantic_type_to_llvm(backend, operand->data_type),
                              operand->value.int_val, 0);
                              
        case OPERAND_CONST_FLOAT:
            return LLVMConstReal(semantic_type_to_llvm(backend, operand->data_type),
                               operand->value.float_val);
                               
        case OPERAND_CONST_STR:
            return LLVMBuildGlobalStringPtr(backend->builder, operand->value.str_val, "str");
            
        case OPERAND_TEMP:
            if (operand->value.temp_id < local_var_count) {
                return LLVMBuildLoad2(backend->builder,
                                    semantic_type_to_llvm(backend, operand->data_type),
                                    local_vars[operand->value.temp_id], "temp_load");
            }
            break;
            
        case OPERAND_VAR:
            // For now, treat as temp (should lookup in symbol table)
            return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
            
        case OPERAND_LABEL:
        case OPERAND_FUNCTION:
            // Handle separately
            break;
    }
    
    return NULL;
}

// Translate IR instruction to LLVM
static void translate_ir_instruction(LLVMBackend* backend, IRInstruction* instr, 
                                   LLVMValueRef* local_vars, int local_var_count) {
    if (!instr) return;
    
    LLVMValueRef result = NULL;
    
    switch (instr->opcode) {
        case IR_LOAD_CONST: {
            result = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                if (temp_id < local_var_count) {
                    LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                }
            }
            break;
        }
        
        case IR_ASSIGN: {
            LLVMValueRef value = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            if (value && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                if (temp_id < local_var_count) {
                    LLVMBuildStore(backend->builder, value, local_vars[temp_id]);
                }
            }
            break;
        }
        
        case IR_ADD: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2, local_vars, local_var_count);
            
            if (lhs && rhs) {
                if (instr->dest && instr->dest->data_type == TYPE_F32 || 
                    instr->dest && instr->dest->data_type == TYPE_F64 || 
                    instr->dest && instr->dest->data_type == TYPE_NUM) {
                    result = LLVMBuildFAdd(backend->builder, lhs, rhs, "fadd");
                } else {
                    result = LLVMBuildAdd(backend->builder, lhs, rhs, "add");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id < local_var_count) {
                        LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                    }
                }
            }
            break;
        }
        
        case IR_SUB: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2, local_vars, local_var_count);
            
            if (lhs && rhs) {
                if (instr->dest && instr->dest->data_type == TYPE_F32 || 
                    instr->dest && instr->dest->data_type == TYPE_F64 || 
                    instr->dest && instr->dest->data_type == TYPE_NUM) {
                    result = LLVMBuildFSub(backend->builder, lhs, rhs, "fsub");
                } else {
                    result = LLVMBuildSub(backend->builder, lhs, rhs, "sub");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id < local_var_count) {
                        LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                    }
                }
            }
            break;
        }
        
        case IR_MUL: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2, local_vars, local_var_count);
            
            if (lhs && rhs) {
                if (instr->dest && instr->dest->data_type == TYPE_F32 || 
                    instr->dest && instr->dest->data_type == TYPE_F64 || 
                    instr->dest && instr->dest->data_type == TYPE_NUM) {
                    result = LLVMBuildFMul(backend->builder, lhs, rhs, "fmul");
                } else {
                    result = LLVMBuildMul(backend->builder, lhs, rhs, "mul");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id < local_var_count) {
                        LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                    }
                }
            }
            break;
        }
        
        case IR_DIV: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2, local_vars, local_var_count);
            
            if (lhs && rhs) {
                if (instr->dest && instr->dest->data_type == TYPE_F32 || 
                    instr->dest && instr->dest->data_type == TYPE_F64 || 
                    instr->dest && instr->dest->data_type == TYPE_NUM) {
                    result = LLVMBuildFDiv(backend->builder, lhs, rhs, "fdiv");
                } else {
                    result = LLVMBuildSDiv(backend->builder, lhs, rhs, "div");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id < local_var_count) {
                        LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                    }
                }
            }
            break;
        }
        
        case IR_RETURN: {
            if (instr->src1) {
                LLVMValueRef ret_val = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
                if (ret_val) {
                    LLVMBuildRet(backend->builder, ret_val);
                }
            } else {
                LLVMBuildRetVoid(backend->builder);
            }
            break;
        }
        
        default:
            // Handle other instructions as needed
            printf("Unhandled LLVM IR instruction: %d\n", instr->opcode);
            break;
    }
}

// Generate LLVM IR from IRProgram
bool llvm_generate_from_ir(LLVMBackend* backend, IRProgram* program) {
bool llvm_generate_from_ir(LLVMBackend* backend, IRProgram* program) {
    if (!backend || !program) {
        fprintf(stderr, "Invalid parameters for LLVM generation\n");
        return false;
    }
    
    // Generate functions
    for (IRFunction* func = program->functions; func; func = func->next) {
        
        // Create function type
        LLVMTypeRef ret_type = semantic_type_to_llvm(backend, func->return_type);
        
        // Create parameter types
        LLVMTypeRef* param_types = NULL;
        if (func->param_count > 0) {
            param_types = malloc(sizeof(LLVMTypeRef) * func->param_count);
            for (int i = 0; i < func->param_count; i++) {
                param_types[i] = semantic_type_to_llvm(backend, func->parameters[i]->data_type);
            }
        }
        
        LLVMTypeRef func_type = LLVMFunctionType(ret_type, param_types, func->param_count, 0);
        LLVMValueRef llvm_func = LLVMAddFunction(backend->module, func->name, func_type);
        
        // Create basic block
        LLVMBasicBlockRef entry = LLVMAppendBasicBlockInContext(backend->context, llvm_func, "entry");
        LLVMPositionBuilderAtEnd(backend->builder, entry);
        
        // Allocate local variables (temporaries)
        int local_var_count = func->temp_counter;
        LLVMValueRef* local_vars = malloc(sizeof(LLVMValueRef) * local_var_count);
        
        for (int i = 0; i < local_var_count; i++) {
            local_vars[i] = LLVMBuildAlloca(backend->builder, 
                                          LLVMInt32TypeInContext(backend->context), 
                                          "temp");
        }
        
        // Process instructions
        for (IRInstruction* instr = func->instructions; instr; instr = instr->next) {
            translate_ir_instruction(backend, instr, local_vars, local_var_count);
        }
        
        // Add return if none exists
        if (!LLVMGetBasicBlockTerminator(LLVMGetInsertBlock(backend->builder))) {
            if (func->return_type == TYPE_VOID) {
                LLVMBuildRetVoid(backend->builder);
            } else {
                LLVMValueRef zero = LLVMConstInt(semantic_type_to_llvm(backend, func->return_type), 0, 0);
                LLVMBuildRet(backend->builder, zero);
            }
        }
        
        // Cleanup
        free(local_vars);
        if (param_types) free(param_types);
    }
    
    return true;
}

// Optimize LLVM module
void llvm_optimize(LLVMBackend* backend, int opt_level) {
    if (!backend || opt_level < 0 || opt_level > 3) return;
    
    LLVMPassManagerRef pass_manager = LLVMCreatePassManager();
    
    // Add optimization passes based on level
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
