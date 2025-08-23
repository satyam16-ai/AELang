// llvm_backend.c - Complete LLVM Backend Implementation
#include "llvm_backend.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <llvm-c/Core.h>
#include <llvm-c/Target.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/Transforms/Scalar.h>

// Global function declarations
static LLVMValueRef printf_func = NULL;
static LLVMValueRef scanf_func = NULL;

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

// Declare printf function
static void declare_printf(LLVMBackend* backend) {
    if (printf_func) return;
    
    // printf(format, ...) -> int
    LLVMTypeRef char_ptr = LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
    LLVMTypeRef printf_type = LLVMFunctionType(
        LLVMInt32TypeInContext(backend->context),  // return int
        &char_ptr,                                 // first arg: char*
        1,                                         // one fixed arg
        1                                          // variadic
    );
    
    printf_func = LLVMAddFunction(backend->module, "printf", printf_type);
}

// Declare scanf function
static void declare_scanf(LLVMBackend* backend) {
    if (scanf_func) return;
    
    // scanf(format, ...) -> int
    LLVMTypeRef char_ptr = LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
    LLVMTypeRef scanf_type = LLVMFunctionType(
        LLVMInt32TypeInContext(backend->context),  // return int
        &char_ptr,                                 // first arg: char*
        1,                                         // one fixed arg
        1                                          // variadic
    );
    
    scanf_func = LLVMAddFunction(backend->module, "scanf", scanf_type);
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
            if (operand->value.temp_id >= 0 && operand->value.temp_id < local_var_count) {
                return LLVMBuildLoad2(backend->builder,
                                    semantic_type_to_llvm(backend, operand->data_type),
                                    local_vars[operand->value.temp_id], "temp_load");
            }
            break;
            
        case OPERAND_VAR:
            // Look up variable name - for now use simple approach
            if (operand->value.name && local_var_count > 0) {
                // Try to find matching variable by name (simple approach)
                // In a full implementation, this would use a symbol table
                for (int i = 0; i < local_var_count; i++) {
                    // For now, just load from the first available variable
                    return LLVMBuildLoad2(backend->builder,
                                        semantic_type_to_llvm(backend, operand->data_type),
                                        local_vars[i], "var_load");
                }
            }
            return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
            
        case OPERAND_LABEL:
        case OPERAND_FUNCTION:
            // Handle separately
            break;
    }
    
    return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
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
                if (temp_id >= 0 && temp_id < local_var_count) {
                    LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                }
            }
            break;
        }
        
        case IR_ASSIGN: {
            LLVMValueRef value = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            if (value && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                if (temp_id >= 0 && temp_id < local_var_count) {
                    LLVMBuildStore(backend->builder, value, local_vars[temp_id]);
                }
            }
            break;
        }
        
        case IR_ADD: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2, local_vars, local_var_count);
            
            if (lhs && rhs) {
                // Determine if floating point or integer arithmetic
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFAdd(backend->builder, lhs, rhs, "fadd");
                } else {
                    result = LLVMBuildAdd(backend->builder, lhs, rhs, "add");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id >= 0 && temp_id < local_var_count) {
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
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFSub(backend->builder, lhs, rhs, "fsub");
                } else {
                    result = LLVMBuildSub(backend->builder, lhs, rhs, "sub");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id >= 0 && temp_id < local_var_count) {
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
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFMul(backend->builder, lhs, rhs, "fmul");
                } else {
                    result = LLVMBuildMul(backend->builder, lhs, rhs, "mul");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id >= 0 && temp_id < local_var_count) {
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
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFDiv(backend->builder, lhs, rhs, "fdiv");
                } else {
                    result = LLVMBuildSDiv(backend->builder, lhs, rhs, "div");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    if (temp_id >= 0 && temp_id < local_var_count) {
                        LLVMBuildStore(backend->builder, result, local_vars[temp_id]);
                    }
                }
            }
            break;
        }
        
        case IR_CALL: {
            // Handle function calls (especially printf)
            if (instr->src1 && instr->src1->type == OPERAND_FUNCTION && instr->src1->value.name) {
                if (strcmp(instr->src1->value.name, "print") == 0) {
                    declare_printf(backend);
                    
                    // Build arguments for printf
                    LLVMValueRef args[16];  // Max 16 arguments
                    int arg_count = 0;
                    
                    // Add parameters
                    for (int i = 0; i < instr->param_count && i < 15; i++) {
                        LLVMValueRef arg = operand_to_llvm_value(backend, instr->params[i], 
                                                               local_vars, local_var_count);
                        if (arg) {
                            args[arg_count++] = arg;
                        }
                    }
                    
                    if (arg_count > 0) {
                        result = LLVMBuildCall2(backend->builder, 
                                              LLVMGlobalGetValueType(printf_func),
                                              printf_func, args, arg_count, "printf_call");
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
        
        case IR_STORE_VAR: {
            // Store value to variable
            LLVMValueRef value = operand_to_llvm_value(backend, instr->src1, local_vars, local_var_count);
            if (value && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                if (temp_id >= 0 && temp_id < local_var_count) {
                    LLVMBuildStore(backend->builder, value, local_vars[temp_id]);
                }
            }
            break;
        }
        
        case IR_LOAD_VAR: {
            // Load variable value
            if (instr->src1 && instr->src1->type == OPERAND_TEMP) {
                int src_id = instr->src1->value.temp_id;
                if (src_id >= 0 && src_id < local_var_count) {
                    SemanticType load_type = instr->src1->data_type;
                    result = LLVMBuildLoad2(backend->builder,
                                          semantic_type_to_llvm(backend, load_type),
                                          local_vars[src_id], "load");
                    
                    if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                        int dest_id = instr->dest->value.temp_id;
                        if (dest_id >= 0 && dest_id < local_var_count) {
                            LLVMBuildStore(backend->builder, result, local_vars[dest_id]);
                        }
                    }
                }
            }
            break;
        }
        
        default:
            // Handle other instructions as needed
            printf("[LLVM] Unhandled IR instruction: %d\n", instr->opcode);
            break;
    }
}

// Generate LLVM IR from IRProgram
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
        int local_var_count = func->temp_counter + 100;  // Extra space for safety
        LLVMValueRef* local_vars = calloc(local_var_count, sizeof(LLVMValueRef));
        
        // Create allocations for all potential temporaries
        for (int i = 0; i < local_var_count; i++) {
            local_vars[i] = LLVMBuildAlloca(backend->builder, 
                                          LLVMDoubleTypeInContext(backend->context),  // Use double for compatibility
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
    
    // Add basic optimization passes
    if (opt_level >= 1) {
        LLVMAddInstructionCombiningPass(pass_manager);
        LLVMAddReassociatePass(pass_manager);
        LLVMAddGVNPass(pass_manager);
        LLVMAddCFGSimplificationPass(pass_manager);
    }
    
    if (opt_level >= 2) {
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
