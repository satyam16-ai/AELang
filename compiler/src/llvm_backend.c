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

// Forward declarations
static LLVMTypeRef semantic_type_to_llvm(LLVMBackend* backend, SemanticType type);
static void declare_printf(LLVMBackend* backend);
static void declare_scanf(LLVMBackend* backend);
static void declare_print(LLVMBackend* backend);

// Global function declarations
static LLVMValueRef printf_func = NULL;
static LLVMValueRef scanf_func = NULL;

// Variable table for tracking variable allocations (dynamic)
static struct {
    char* name;
    LLVMValueRef alloca;
    SemanticType type;
} *variable_table = NULL;
static int variable_count = 0;
static int variable_capacity = 256;

// Temporary table for tracking temporary allocations and their types (dynamic)
static struct {
    LLVMValueRef alloca;
    SemanticType type;
    bool allocated;
} *temp_table = NULL;
static int temp_capacity = 1000;

// Initialize dynamic tables
static void init_dynamic_tables() {
    if (!variable_table) {
        variable_table = calloc(variable_capacity, sizeof(*variable_table));
    }
    if (!temp_table) {
        temp_table = calloc(temp_capacity, sizeof(*temp_table));
    }
}

// Helper functions for type checking
static bool is_integer_semantic_type(SemanticType type) {
    return type == TYPE_I8 || type == TYPE_I16 || type == TYPE_I32 || type == TYPE_I64 ||
           type == TYPE_U8 || type == TYPE_U16 || type == TYPE_U32 || type == TYPE_U64;
}

static bool is_float_semantic_type(SemanticType type) {
    return type == TYPE_F8 || type == TYPE_F16 || type == TYPE_F32 || type == TYPE_F64;
}

// Expand variable table if needed
static void expand_variable_table() {
    if (variable_count >= variable_capacity) {
        int old_capacity = variable_capacity;
        variable_capacity *= 2;
        variable_table = realloc(variable_table, variable_capacity * sizeof(*variable_table));
        // Initialize new entries
        for (int i = old_capacity; i < variable_capacity; i++) {
            variable_table[i].name = NULL;
            variable_table[i].alloca = NULL;
            variable_table[i].type = TYPE_UNKNOWN;
        }
        printf("[LLVM Debug] Expanded variable table to %d entries\n", variable_capacity);
    }
}

// Expand temp table if needed  
static void expand_temp_table(int needed_size) {
    if (needed_size >= temp_capacity) {
        int old_capacity = temp_capacity;
        while (temp_capacity <= needed_size) {
            temp_capacity *= 2;
        }
        temp_table = realloc(temp_table, temp_capacity * sizeof(*temp_table));
        // Initialize new entries
        for (int i = old_capacity; i < temp_capacity; i++) {
            temp_table[i].alloca = NULL;
            temp_table[i].type = TYPE_UNKNOWN;
            temp_table[i].allocated = false;
        }
        printf("[LLVM Debug] Expanded temp table to %d entries\n", temp_capacity);
    }
}

// Find or create variable allocation
static LLVMValueRef get_or_create_variable(LLVMBackend* backend, const char* name, SemanticType type) {
    init_dynamic_tables();
    
    // First, try to find existing variable
    for (int i = 0; i < variable_count; i++) {
        if (variable_table[i].name && strcmp(variable_table[i].name, name) == 0) {
            return variable_table[i].alloca;
        }
    }
    
    // Create new variable allocation
    expand_variable_table();
    
    LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, type);
    LLVMValueRef alloca = LLVMBuildAlloca(backend->builder, llvm_type, name);
    
    variable_table[variable_count].name = strdup(name);
    variable_table[variable_count].alloca = alloca;
    variable_table[variable_count].type = type;
    variable_count++;
    
    printf("[LLVM Debug] Created variable allocation for '%s' with type %d\n", name, type);
    return alloca;
}

// Global variable table for managing global variables
static struct {
    char *name;
    LLVMValueRef global;
    SemanticType type;
} *global_variable_table = NULL;
static int global_variable_count = 0;
static int global_variable_capacity = 0;

static void expand_global_variable_table(void) {
    if (global_variable_count >= global_variable_capacity) {
        global_variable_capacity = global_variable_capacity ? global_variable_capacity * 2 : 16;
        global_variable_table = realloc(global_variable_table, 
                                       global_variable_capacity * sizeof(*global_variable_table));
    }
}

static LLVMValueRef get_or_create_global_variable(LLVMBackend* backend, const char* name, SemanticType type) {
    // First, try to find existing global variable
    for (int i = 0; i < global_variable_count; i++) {
        if (global_variable_table[i].name && strcmp(global_variable_table[i].name, name) == 0) {
            return global_variable_table[i].global;
        }
    }
    
    // Create new global variable
    expand_global_variable_table();
    
    LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, type);
    LLVMValueRef global_var = LLVMAddGlobal(backend->module, llvm_type, name);
    
    // Set default initializer based on type (will be updated if explicit value provided)
    LLVMValueRef initializer;
    if (is_integer_semantic_type(type)) {
        initializer = LLVMConstInt(llvm_type, 0, 0);
    } else if (is_float_semantic_type(type)) {
        initializer = LLVMConstReal(llvm_type, 0.0);
    } else {
        initializer = LLVMConstNull(llvm_type);
    }
    LLVMSetInitializer(global_var, initializer);
    LLVMSetLinkage(global_var, LLVMInternalLinkage);
    
    global_variable_table[global_variable_count].name = strdup(name);
    global_variable_table[global_variable_count].global = global_var;
    global_variable_table[global_variable_count].type = type;
    global_variable_count++;
    
    printf("[LLVM Debug] Created global variable '%s' with type %d\n", name, type);
    return global_var;
}

// New function to set global variable initializer
static void set_global_variable_initializer(__attribute__((unused)) LLVMBackend* backend, const char* name, LLVMValueRef initial_value) {
    for (int i = 0; i < global_variable_count; i++) {
        if (global_variable_table[i].name && strcmp(global_variable_table[i].name, name) == 0) {
            LLVMSetInitializer(global_variable_table[i].global, initial_value);
            printf("[LLVM Debug] Set initializer for global variable '%s'\n", name);
            return;
        }
    }
    printf("[LLVM Error] Could not find global variable '%s' to set initializer\n", name);
}

// Create LLVM backend
LLVMBackend* create_llvm_backend(const char* module_name) {
    LLVMBackend* backend = malloc(sizeof(LLVMBackend));
    if (!backend) return NULL;
    
    // Initialize dynamic tables
    init_dynamic_tables();
    
    // Reset variable table
    variable_count = 0;
    for (int i = 0; i < variable_capacity; i++) {
        if (variable_table[i].name) {
            free(variable_table[i].name);
            variable_table[i].name = NULL;
        }
        variable_table[i].alloca = NULL;
        variable_table[i].type = TYPE_UNKNOWN;
    }
    
    // Reset temp table
    for (int i = 0; i < temp_capacity; i++) {
        temp_table[i].alloca = NULL;
        temp_table[i].type = TYPE_UNKNOWN;
        temp_table[i].allocated = false;
    }
    
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
    
    // Initialize label tracking
    backend->labels = NULL;
    backend->label_count = 0;
    backend->label_capacity = 0;
    
    // Initialize parameter tracking
    backend->param_count = 0;
    for (int i = 0; i < 16; i++) {
        backend->call_params[i] = NULL;
    }
    
    // Initialize current function
    backend->current_function = NULL;
    
    backend->target_triple = NULL;
    backend->is_32bit = false;
    
    return backend;
}

// Free LLVM backend with cleanup of dynamic tables
void free_llvm_backend(LLVMBackend* backend) {
    if (!backend) return;
    
    // Clean up variable table
    if (variable_table) {
        for (int i = 0; i < variable_count; i++) {
            if (variable_table[i].name) {
                free(variable_table[i].name);
            }
        }
        free(variable_table);
        variable_table = NULL;
        variable_count = 0;
        variable_capacity = 256;
    }
    
    // Clean up temp table
    if (temp_table) {
        free(temp_table);
        temp_table = NULL;
        temp_capacity = 1000;
    }
    
    if (backend->target_triple) free(backend->target_triple);
    if (backend->variables) free(backend->variables);
    if (backend->functions) free(backend->functions);
    if (backend->labels) free(backend->labels);
    if (backend->target_machine) LLVMDisposeTargetMachine(backend->target_machine);
    LLVMDisposeBuilder(backend->builder);
    LLVMDisposeModule(backend->module);
    LLVMContextDispose(backend->context);
    free(backend);
}

// Convert semantic type to LLVM type
static LLVMTypeRef semantic_type_to_llvm(LLVMBackend* backend, SemanticType type) {
    switch (type) {
        // Signed Integer Types
        case TYPE_I8:   return LLVMInt8TypeInContext(backend->context);
        case TYPE_I16:  return LLVMInt16TypeInContext(backend->context);
        case TYPE_I32:  return LLVMInt32TypeInContext(backend->context);
        case TYPE_I64:  return LLVMInt64TypeInContext(backend->context);
        
        // Unsigned Integer Types (same as signed in LLVM, signedness handled in operations)
        case TYPE_U8:   return LLVMInt8TypeInContext(backend->context);
        case TYPE_U16:  return LLVMInt16TypeInContext(backend->context);
        case TYPE_U32:  return LLVMInt32TypeInContext(backend->context);
        case TYPE_U64:  return LLVMInt64TypeInContext(backend->context);
        
        // Floating Point Types
        case TYPE_F8:   return LLVMInt8TypeInContext(backend->context);  // Custom 8-bit float as int8
        case TYPE_F16:  return LLVMHalfTypeInContext(backend->context);   // IEEE 754 half precision
        case TYPE_F32:  return LLVMFloatTypeInContext(backend->context);  // IEEE 754 single precision
        case TYPE_F64:  return LLVMDoubleTypeInContext(backend->context); // IEEE 754 double precision
        
        // Special Types
        case TYPE_NUM:  return LLVMDoubleTypeInContext(backend->context); // Dynamic numeric as double
        case TYPE_BOOL: return LLVMInt1TypeInContext(backend->context);   // 1-bit boolean
        case TYPE_CHAR: return LLVMInt8TypeInContext(backend->context);   // 8-bit character
        case TYPE_STR:  return LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0); // char*
        case TYPE_VOID: return LLVMVoidTypeInContext(backend->context);   // void
        
        // Default/Error cases
        case TYPE_UNKNOWN:
        case TYPE_ERROR:
        default:        
            printf("[LLVM Warning] Unknown type %d, defaulting to i32\n", type);
            return LLVMInt32TypeInContext(backend->context);
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

// Declare print function (from AE runtime)
static void declare_print(LLVMBackend* backend) {
    // Check if print is already declared
    LLVMValueRef existing_print = LLVMGetNamedFunction(backend->module, "print");
    if (existing_print) return;
    
    // print(format, ...) -> void
    LLVMTypeRef char_ptr = LLVMPointerType(LLVMInt8TypeInContext(backend->context), 0);
    LLVMTypeRef print_type = LLVMFunctionType(
        LLVMVoidTypeInContext(backend->context),   // return void
        &char_ptr,                                 // first arg: char*
        1,                                         // one fixed arg
        1                                          // variadic
    );
    
    LLVMAddFunction(backend->module, "print", print_type);
    printf("[LLVM Debug] Declared print function\n");
}

// Convert IR operand to LLVM value with type awareness
static LLVMValueRef operand_to_llvm_value(LLVMBackend* backend, IROperand* operand) {
    if (!operand) return NULL;
    
    switch (operand->type) {
        case OPERAND_CONST_INT: {
            SemanticType type = operand->data_type;
            LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, type);
            
            // Handle different integer sizes and signedness
            if (type == TYPE_BOOL) {
                return LLVMConstInt(llvm_type, operand->value.int_val ? 1 : 0, 0);
            } else if (type == TYPE_CHAR || type == TYPE_I8 || type == TYPE_U8) {
                return LLVMConstInt(llvm_type, operand->value.int_val & 0xFF, 0);
            } else if (type == TYPE_I16 || type == TYPE_U16) {
                return LLVMConstInt(llvm_type, operand->value.int_val & 0xFFFF, 0);
            } else if (type == TYPE_I64 || type == TYPE_U64) {
                return LLVMConstInt(llvm_type, operand->value.int_val, 0);
            } else {
                // Default to 32-bit
                return LLVMConstInt(llvm_type, operand->value.int_val, 0);
            }
        }
                              
        case OPERAND_CONST_FLOAT: {
            SemanticType type = operand->data_type;
            LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, type);
            
            if (type == TYPE_F16) {
                return LLVMConstReal(llvm_type, operand->value.float_val);
            } else if (type == TYPE_F32) {
                return LLVMConstReal(llvm_type, operand->value.float_val);
            } else if (type == TYPE_F64 || type == TYPE_NUM) {
                return LLVMConstReal(llvm_type, operand->value.float_val);
            } else if (type == TYPE_F8) {
                // Custom F8 handling - convert to i8
                uint8_t f8_val = (uint8_t)(operand->value.float_val * 15.0f); // Simple conversion
                return LLVMConstInt(llvm_type, f8_val, 0);
            } else {
                return LLVMConstReal(LLVMFloatTypeInContext(backend->context), operand->value.float_val);
            }
        }
                               
        case OPERAND_CONST_STR: {
            // For string constants, return the string pointer directly
            return LLVMBuildGlobalStringPtr(backend->builder, operand->value.str_val, "str");
        }
            
        case OPERAND_TEMP: {
            init_dynamic_tables();
            int temp_id = operand->value.temp_id;
            
            if (temp_id >= 0 && temp_id < temp_capacity && temp_table[temp_id].allocated) {
                LLVMValueRef temp_alloca = temp_table[temp_id].alloca;
                LLVMTypeRef load_type = semantic_type_to_llvm(backend, temp_table[temp_id].type);
                
                return LLVMBuildLoad2(backend->builder, load_type, temp_alloca, "temp_load");
            } else {
                printf("[LLVM Error] Invalid or unallocated temp_id %d in operand_to_llvm_value\n", temp_id);
                // Return a zero constant as fallback
                return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
            }
        }
            
        case OPERAND_VAR: {
            // Look up variable in variable table
            if (operand->value.name) {
                init_dynamic_tables();
                for (int i = 0; i < variable_count; i++) {
                    if (variable_table[i].name && strcmp(variable_table[i].name, operand->value.name) == 0) {
                        LLVMTypeRef load_type = semantic_type_to_llvm(backend, variable_table[i].type);
                        return LLVMBuildLoad2(backend->builder, load_type, variable_table[i].alloca, "var_load");
                    }
                }
                printf("[LLVM Debug] Variable '%s' not found in table\n", operand->value.name);
            }
            return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
        }
            
        case OPERAND_LABEL:
        case OPERAND_FUNCTION:
            // Handle separately
            break;
    }
    
    return LLVMConstInt(LLVMInt32TypeInContext(backend->context), 0, 0);
}

// Get or create temporary allocation with proper type
static LLVMValueRef get_or_create_temp(LLVMBackend* backend, int temp_id, SemanticType type) {
    init_dynamic_tables();
    expand_temp_table(temp_id);
    
    if (temp_table[temp_id].allocated && temp_table[temp_id].type == type) {
        return temp_table[temp_id].alloca;
    }
    
    // Create new allocation with the correct type
    LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, type);
    LLVMValueRef alloca = LLVMBuildAlloca(backend->builder, llvm_type, "temp");
    
    temp_table[temp_id].alloca = alloca;
    temp_table[temp_id].type = type;
    temp_table[temp_id].allocated = true;
    
    printf("[LLVM Debug] Created temp%d allocation with type %d\n", temp_id, type);
    return alloca;
}

// Helper function to store values with type preservation
static void store_to_temp_typed(LLVMBackend* backend, LLVMValueRef value, 
                               int temp_id, SemanticType dest_type) {
    if (!value || temp_id < 0) {
        printf("[LLVM Error] Invalid parameters in store_to_temp_typed\n");
        return;
    }
    
    LLVMValueRef temp_alloca = get_or_create_temp(backend, temp_id, dest_type);
    if (!temp_alloca) {
        printf("[LLVM Error] Failed to get temp allocation for temp%d\n", temp_id);
        return;
    }
    
    LLVMTypeRef alloca_type = LLVMGetElementType(LLVMTypeOf(temp_alloca));
    LLVMTypeRef value_type = LLVMTypeOf(value);
    
    LLVMValueRef converted_value = value;
    
    // Only convert if types are different
    if (alloca_type != value_type) {
        // Handle type conversions based on destination type
        if (LLVMGetTypeKind(alloca_type) == LLVMIntegerTypeKind && 
            LLVMGetTypeKind(value_type) == LLVMIntegerTypeKind) {
            
            unsigned alloca_bits = LLVMGetIntTypeWidth(alloca_type);
            unsigned value_bits = LLVMGetIntTypeWidth(value_type);
            
            if (alloca_bits != value_bits) {
                if (alloca_bits < value_bits) {
                    // Truncate to smaller type
                    converted_value = LLVMBuildTrunc(backend->builder, value, alloca_type, "trunc");
                } else {
                    // Extend to larger type
                    converted_value = LLVMBuildSExt(backend->builder, value, alloca_type, "sext");
                }
            }
        }
        else if (LLVMGetTypeKind(alloca_type) == LLVMFloatTypeKind ||
                 LLVMGetTypeKind(alloca_type) == LLVMDoubleTypeKind ||
                 LLVMGetTypeKind(alloca_type) == LLVMHalfTypeKind) {
            
            if (LLVMGetTypeKind(value_type) == LLVMIntegerTypeKind) {
                // Convert integer to float
                converted_value = LLVMBuildSIToFP(backend->builder, value, alloca_type, "itof");
            } else if (LLVMGetTypeKind(value_type) == LLVMFloatTypeKind ||
                       LLVMGetTypeKind(value_type) == LLVMDoubleTypeKind ||
                       LLVMGetTypeKind(value_type) == LLVMHalfTypeKind) {
                // Float to float conversion if needed
                if (LLVMGetTypeKind(alloca_type) == LLVMDoubleTypeKind) {
                    converted_value = LLVMBuildFPExt(backend->builder, value, alloca_type, "fpext");
                } else {
                    converted_value = LLVMBuildFPTrunc(backend->builder, value, alloca_type, "fptrunc");
                }
            }
        }
        else if (LLVMGetTypeKind(alloca_type) == LLVMIntegerTypeKind &&
                 (LLVMGetTypeKind(value_type) == LLVMFloatTypeKind ||
                  LLVMGetTypeKind(value_type) == LLVMDoubleTypeKind ||
                  LLVMGetTypeKind(value_type) == LLVMHalfTypeKind)) {
            // Convert float to integer
            converted_value = LLVMBuildFPToSI(backend->builder, value, alloca_type, "ftoi");
        }
        else if (LLVMGetTypeKind(value_type) == LLVMPointerTypeKind) {
            // Keep pointers as-is or convert appropriately
            if (LLVMGetTypeKind(alloca_type) == LLVMIntegerTypeKind) {
                converted_value = LLVMBuildPtrToInt(backend->builder, value, alloca_type, "ptr_to_int");
            }
        }
    }
    
    LLVMBuildStore(backend->builder, converted_value, temp_alloca);
}

// Translate IR instruction to LLVM with type awareness
static void translate_ir_instruction(LLVMBackend* backend, IRInstruction* instr) {
    if (!instr) return;
    
    LLVMValueRef result = NULL;
    
    // Debug: Print IR instruction being processed
    printf("[LLVM Debug] Processing IR instruction: opcode=%d", instr->opcode);
    switch (instr->opcode) {
        case IR_STORE_GLOBAL: printf(" (IR_STORE_GLOBAL)"); break;
        case IR_LOAD_CONST: printf(" (IR_LOAD_CONST)"); break;
        case IR_STORE_VAR: printf(" (IR_STORE_VAR)"); break;
        case IR_LOAD_VAR: printf(" (IR_LOAD_VAR)"); break;
        case IR_CALL: printf(" (IR_CALL)"); break;
        default: printf(" (other)"); break;
    }
    printf("\n");
    if (instr->dest) {
        printf("[LLVM Debug]   dest: type=%d\n", instr->dest->type);
    }
    if (instr->src1) {
        printf("[LLVM Debug]   src1: type=%d\n", instr->src1->type);
    }
    if (instr->src2) {
        printf("[LLVM Debug]   src2: type=%d\n", instr->src2->type);
    }
    
    switch (instr->opcode) {
        case IR_LOAD_CONST: {
            result = operand_to_llvm_value(backend, instr->src1);
            if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                SemanticType dest_type = instr->dest->data_type;
                            store_to_temp_typed(backend, result, temp_id, dest_type);
            }
            break;
        }
        
        case IR_ASSIGN: {
            LLVMValueRef value = operand_to_llvm_value(backend, instr->src1);
            if (value && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                SemanticType dest_type = instr->dest->data_type;
                store_to_temp_typed(backend, value, temp_id, dest_type);
            }
            break;
        }
        
        case IR_ADD: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
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
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_SUB: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFSub(backend->builder, lhs, rhs, "fsub");
                } else {
                    result = LLVMBuildSub(backend->builder, lhs, rhs, "sub");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_MUL: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFMul(backend->builder, lhs, rhs, "fmul");
                } else {
                    result = LLVMBuildMul(backend->builder, lhs, rhs, "mul");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_DIV: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFDiv(backend->builder, lhs, rhs, "fdiv");
                } else {
                    result = LLVMBuildSDiv(backend->builder, lhs, rhs, "div");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_MOD: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType dest_type = instr->dest ? instr->dest->data_type : TYPE_I32;
                if (dest_type == TYPE_F32 || dest_type == TYPE_F64 || dest_type == TYPE_NUM) {
                    result = LLVMBuildFRem(backend->builder, lhs, rhs, "fmod");
                } else {
                    result = LLVMBuildSRem(backend->builder, lhs, rhs, "mod");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        // Comparison operations
        case IR_EQ: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealOEQ, lhs, rhs, "fcmp_eq");
                } else {
                    result = LLVMBuildICmp(backend->builder, LLVMIntEQ, lhs, rhs, "icmp_eq");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                                store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_NEQ: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealONE, lhs, rhs, "fcmp_neq");
                } else {
                    result = LLVMBuildICmp(backend->builder, LLVMIntNE, lhs, rhs, "icmp_neq");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_LT: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealOLT, lhs, rhs, "fcmp_lt");
                } else {
                    if (src_type == TYPE_U8 || src_type == TYPE_U16 || src_type == TYPE_U32 || src_type == TYPE_U64) {
                        result = LLVMBuildICmp(backend->builder, LLVMIntULT, lhs, rhs, "ucmp_lt");
                    } else {
                        result = LLVMBuildICmp(backend->builder, LLVMIntSLT, lhs, rhs, "scmp_lt");
                    }
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_GT: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealOGT, lhs, rhs, "fcmp_gt");
                } else {
                    if (src_type == TYPE_U8 || src_type == TYPE_U16 || src_type == TYPE_U32 || src_type == TYPE_U64) {
                        result = LLVMBuildICmp(backend->builder, LLVMIntUGT, lhs, rhs, "ucmp_gt");
                    } else {
                        result = LLVMBuildICmp(backend->builder, LLVMIntSGT, lhs, rhs, "scmp_gt");
                    }
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_LEQ: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealOLE, lhs, rhs, "fcmp_leq");
                } else {
                    if (src_type == TYPE_U8 || src_type == TYPE_U16 || src_type == TYPE_U32 || src_type == TYPE_U64) {
                        result = LLVMBuildICmp(backend->builder, LLVMIntULE, lhs, rhs, "ucmp_leq");
                    } else {
                        result = LLVMBuildICmp(backend->builder, LLVMIntSLE, lhs, rhs, "scmp_leq");
                    }
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_GEQ: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFCmp(backend->builder, LLVMRealOGE, lhs, rhs, "fcmp_geq");
                } else {
                    if (src_type == TYPE_U8 || src_type == TYPE_U16 || src_type == TYPE_U32 || src_type == TYPE_U64) {
                        result = LLVMBuildICmp(backend->builder, LLVMIntUGE, lhs, rhs, "ucmp_geq");
                    } else {
                        result = LLVMBuildICmp(backend->builder, LLVMIntSGE, lhs, rhs, "scmp_geq");
                    }
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_LOGICAL_AND: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                // Logical AND: result = (a != 0) && (b != 0)
                LLVMValueRef lhs_bool = LLVMBuildICmp(backend->builder, LLVMIntNE, lhs, 
                    LLVMConstInt(LLVMTypeOf(lhs), 0, 0), "lhs_bool");
                LLVMValueRef rhs_bool = LLVMBuildICmp(backend->builder, LLVMIntNE, rhs, 
                    LLVMConstInt(LLVMTypeOf(rhs), 0, 0), "rhs_bool");
                result = LLVMBuildAnd(backend->builder, lhs_bool, rhs_bool, "logical_and");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_LOGICAL_OR: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                // Logical OR: result = (a != 0) || (b != 0)
                LLVMValueRef lhs_bool = LLVMBuildICmp(backend->builder, LLVMIntNE, lhs, 
                    LLVMConstInt(LLVMTypeOf(lhs), 0, 0), "lhs_bool");
                LLVMValueRef rhs_bool = LLVMBuildICmp(backend->builder, LLVMIntNE, rhs, 
                    LLVMConstInt(LLVMTypeOf(rhs), 0, 0), "rhs_bool");
                result = LLVMBuildOr(backend->builder, lhs_bool, rhs_bool, "logical_or");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_BITWISE_AND: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                result = LLVMBuildAnd(backend->builder, lhs, rhs, "bitwise_and");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_BITWISE_OR: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                result = LLVMBuildOr(backend->builder, lhs, rhs, "bitwise_or");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_BITWISE_XOR: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                result = LLVMBuildXor(backend->builder, lhs, rhs, "bitwise_xor");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_SHL: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                result = LLVMBuildShl(backend->builder, lhs, rhs, "shift_left");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_SHR: {
            LLVMValueRef lhs = operand_to_llvm_value(backend, instr->src1);
            LLVMValueRef rhs = operand_to_llvm_value(backend, instr->src2);
            
            if (lhs && rhs) {
                // Use arithmetic shift right for signed integers, logical for unsigned
                SemanticType src_type = instr->src1->data_type;
                if (src_type == TYPE_U8 || src_type == TYPE_U16 || src_type == TYPE_U32 || src_type == TYPE_U64) {
                    result = LLVMBuildLShr(backend->builder, lhs, rhs, "logical_shift_right");
                } else {
                    result = LLVMBuildAShr(backend->builder, lhs, rhs, "arithmetic_shift_right");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_NOT: {
            LLVMValueRef operand = operand_to_llvm_value(backend, instr->src1);
            
            if (operand) {
                // Logical NOT: compare with 0 and return boolean result
                LLVMValueRef zero = LLVMConstInt(LLVMTypeOf(operand), 0, 0);
                result = LLVMBuildICmp(backend->builder, LLVMIntEQ, operand, zero, "logical_not");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_BITWISE_NOT: {
            LLVMValueRef operand = operand_to_llvm_value(backend, instr->src1);
            
            if (operand) {
                // Bitwise NOT: flip all bits
                result = LLVMBuildNot(backend->builder, operand, "bitwise_not");
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_NEG: {
            LLVMValueRef operand = operand_to_llvm_value(backend, instr->src1);
            
            if (operand) {
                SemanticType src_type = instr->src1 ? instr->src1->data_type : TYPE_I32;
                if (src_type == TYPE_F32 || src_type == TYPE_F64 || src_type == TYPE_NUM) {
                    result = LLVMBuildFNeg(backend->builder, operand, "fneg");
                } else {
                    result = LLVMBuildNeg(backend->builder, operand, "ineg");
                }
                
                if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                    int temp_id = instr->dest->value.temp_id;
                    SemanticType dest_type = instr->dest->data_type;
                    store_to_temp_typed(backend, result, temp_id, dest_type);
                }
            }
            break;
        }
        
        case IR_LOAD_VAR: {
            // Load variable src1 into dest
            if (instr->src1 && instr->src1->type == OPERAND_VAR && instr->dest && instr->dest->type == OPERAND_TEMP) {
                LLVMValueRef var_alloca = get_or_create_variable(backend, instr->src1->value.name, instr->src1->data_type);
                if (var_alloca) {
                    LLVMValueRef loaded_value = LLVMBuildLoad2(backend->builder,
                                                              semantic_type_to_llvm(backend, instr->src1->data_type),
                                                              var_alloca, "var_load");
                    
                    // Store loaded value into destination temp
                    int dest_id = instr->dest->value.temp_id;
                    store_to_temp_typed(backend, loaded_value, dest_id, instr->src1->data_type);
                    printf("[LLVM Debug] Loaded variable '%s' into temp%d\n", instr->src1->value.name, dest_id);
                }
            }
            break;
        }
        
        case IR_STORE_VAR: {
            // Store src2 (value) to src1 (variable name)  
            if (instr->src1 && instr->src1->type == OPERAND_VAR && instr->src2) {
                LLVMValueRef var_alloca = get_or_create_variable(backend, instr->src1->value.name, instr->src1->data_type);
                LLVMValueRef value = operand_to_llvm_value(backend, instr->src2);
                if (var_alloca && value) {
                    // Get the types for proper conversion
                    LLVMTypeRef var_type = LLVMGetElementType(LLVMTypeOf(var_alloca));
                    LLVMTypeRef value_type = LLVMTypeOf(value);
                    
                    // Convert value to match variable type if needed
                    if (var_type != value_type) {
                        LLVMTypeKind var_kind = LLVMGetTypeKind(var_type);
                        LLVMTypeKind value_kind = LLVMGetTypeKind(value_type);
                        
                        if (var_kind == LLVMIntegerTypeKind && value_kind == LLVMIntegerTypeKind) {
                            // Integer type conversion
                            unsigned var_bits = LLVMGetIntTypeWidth(var_type);
                            unsigned value_bits = LLVMGetIntTypeWidth(value_type);
                            if (var_bits < value_bits) {
                                value = LLVMBuildTrunc(backend->builder, value, var_type, "trunc");
                            } else if (var_bits > value_bits) {
                                value = LLVMBuildSExt(backend->builder, value, var_type, "sext");
                            }
                        } else if ((var_kind == LLVMFloatTypeKind || var_kind == LLVMDoubleTypeKind) && 
                                   (value_kind == LLVMFloatTypeKind || value_kind == LLVMDoubleTypeKind)) {
                            // Float type conversion (f32 to f64 or vice versa)
                            if (var_type == LLVMFloatTypeInContext(backend->context) && 
                                value_type == LLVMDoubleTypeInContext(backend->context)) {
                                // f64 to f32
                                value = LLVMBuildFPTrunc(backend->builder, value, var_type, "fptrunc");
                            } else if (var_type == LLVMDoubleTypeInContext(backend->context) && 
                                       value_type == LLVMFloatTypeInContext(backend->context)) {
                                // f32 to f64
                                value = LLVMBuildFPExt(backend->builder, value, var_type, "fpext");
                            }
                        } else if (var_kind == LLVMIntegerTypeKind && (value_kind == LLVMFloatTypeKind || value_kind == LLVMDoubleTypeKind)) {
                            // Float to int conversion
                            value = LLVMBuildFPToSI(backend->builder, value, var_type, "fptosi");
                        } else if (var_kind == LLVMFloatTypeKind && value_kind == LLVMIntegerTypeKind) {
                            // Int to float conversion
                            value = LLVMBuildSIToFP(backend->builder, value, var_type, "sitofp");
                        }
                    }
                    
                    LLVMBuildStore(backend->builder, value, var_alloca);
                    printf("[LLVM Debug] Stored value to variable '%s'\n", instr->src1->value.name);
                }
            }
            break;
        }
        
        case IR_LOAD_GLOBAL: {
            // Load global variable src1 into dest
            if (instr->src1 && instr->src1->type == OPERAND_VAR && instr->dest && instr->dest->type == OPERAND_TEMP) {
                LLVMValueRef global_var = get_or_create_global_variable(backend, instr->src1->value.name, instr->src1->data_type);
                if (global_var) {
                    LLVMValueRef loaded_value = LLVMBuildLoad2(backend->builder,
                                                              semantic_type_to_llvm(backend, instr->src1->data_type),
                                                              global_var, "global_load");
                    
                    // Store loaded value into destination temp
                    int dest_id = instr->dest->value.temp_id;
                    store_to_temp_typed(backend, loaded_value, dest_id, instr->src1->data_type);
                    printf("[LLVM Debug] Loaded global variable '%s' into temp%d\n", instr->src1->value.name, dest_id);
                }
            }
            break;
        }
        
        case IR_STORE_GLOBAL: {
            // Initialize global variable with constant value during compilation
            if (instr->src1 && instr->src1->type == OPERAND_VAR && instr->src2) {
                LLVMValueRef global_var = get_or_create_global_variable(backend, instr->src1->value.name, instr->src1->data_type);
                
                // Convert the source operand to a constant value for global initialization
                LLVMValueRef constant_value = NULL;
                
                if (instr->src2->type == OPERAND_CONST_INT || 
                    instr->src2->type == OPERAND_CONST_FLOAT || 
                    instr->src2->type == OPERAND_CONST_STR) {
                    // Handle literal constants
                    SemanticType src_type = instr->src2->data_type;
                    LLVMTypeRef llvm_type = semantic_type_to_llvm(backend, src_type);
                    
                    switch (instr->src2->type) {
                        case OPERAND_CONST_INT:
                            if (src_type == TYPE_BOOL) {
                                constant_value = LLVMConstInt(llvm_type, instr->src2->value.int_val ? 1 : 0, 0);
                            } else if (is_integer_semantic_type(src_type)) {
                                // Determine if signed or unsigned
                                int is_signed = (src_type == TYPE_I8 || src_type == TYPE_I16 || 
                                               src_type == TYPE_I32 || src_type == TYPE_I64);
                                constant_value = LLVMConstInt(llvm_type, instr->src2->value.int_val, is_signed);
                            }
                            break;
                        case OPERAND_CONST_FLOAT:
                            constant_value = LLVMConstReal(llvm_type, instr->src2->value.float_val);
                            break;
                        case OPERAND_CONST_STR:
                            if (instr->src2->value.str_val) {
                                constant_value = LLVMConstStringInContext(LLVMGetGlobalContext(), 
                                                                        instr->src2->value.str_val, 
                                                                        strlen(instr->src2->value.str_val), 
                                                                        0);
                            } else {
                                constant_value = LLVMConstNull(llvm_type);
                            }
                            break;
                        default:
                            break;
                    }
                } else {
                    // For non-literal values, we might need to handle them differently
                    // For now, fall back to runtime initialization
                    LLVMValueRef value = operand_to_llvm_value(backend, instr->src2);
                    if (global_var && value) {
                        LLVMBuildStore(backend->builder, value, global_var);
                        printf("[LLVM Debug] Runtime stored value to global variable '%s'\n", instr->src1->value.name);
                    }
                    break;
                }
                
                if (constant_value) {
                    set_global_variable_initializer(backend, instr->src1->value.name, constant_value);
                }
            }
            break;
        }
        
        case IR_INT_TO_FLOAT: {
            LLVMValueRef operand = operand_to_llvm_value(backend, instr->src1);
            
            if (operand && instr->dest && instr->dest->type == OPERAND_TEMP) {
                // Get destination type
                SemanticType dest_type = instr->dest->data_type;
                LLVMTypeRef target_type = semantic_type_to_llvm(backend, dest_type);
                
                // Convert signed integer to floating point
                result = LLVMBuildSIToFP(backend->builder, operand, target_type, "sitofp");
                
                int temp_id = instr->dest->value.temp_id;
                store_to_temp_typed(backend, result, temp_id, dest_type);
                printf("[LLVM Debug] Converted int to float in temp%d\n", temp_id);
            }
            break;
        }
        
        case IR_FLOAT_TO_INT: {
            LLVMValueRef operand = operand_to_llvm_value(backend, instr->src1);
            
            if (operand && instr->dest && instr->dest->type == OPERAND_TEMP) {
                // Get destination type
                SemanticType dest_type = instr->dest->data_type;
                LLVMTypeRef target_type = semantic_type_to_llvm(backend, dest_type);
                
                // Convert floating point to signed integer
                result = LLVMBuildFPToSI(backend->builder, operand, target_type, "fptosi");
                
                int temp_id = instr->dest->value.temp_id;
                store_to_temp_typed(backend, result, temp_id, dest_type);
                printf("[LLVM Debug] Converted float to int in temp%d\n", temp_id);
            }
            break;
        }
        
        case IR_CALL: {
            // Handle function calls
            printf("[LLVM Debug] IR_CALL instruction: param_count=%d\n", instr->param_count);
            
            if (instr->src1) {
                printf("[LLVM Debug] src1 type: %d\n", instr->src1->type);
                if (instr->src1->type == OPERAND_VAR) {
                    printf("[LLVM Debug] src1 name: %s\n", instr->src1->value.name);
                }
            } else {
                printf("[LLVM Debug] src1 is NULL\n");
            }
            
            if (instr->src1 && instr->src1->type == OPERAND_FUNCTION) {
                const char* func_name = instr->src1->value.name;
                
                // Auto-declare common functions
                if (strcmp(func_name, "print") == 0) {
                    declare_print(backend);
                } else if (strcmp(func_name, "printf") == 0) {
                    declare_printf(backend);
                } else if (strcmp(func_name, "scanf") == 0) {
                    declare_scanf(backend);
                }
                
                // Look up the function
                LLVMValueRef func = LLVMGetNamedFunction(backend->module, func_name);
                if (func) {
                    // Build arguments list
                    LLVMValueRef args[15]; // Reasonable limit
                    int arg_count = 0;
                    
                    for (int i = 0; i < instr->param_count && i < 15; i++) {
                        LLVMValueRef arg = operand_to_llvm_value(backend, instr->params[i]);
                        if (arg) {
                            // For variadic functions like print, promote float to double
                            if (strcmp(func_name, "print") == 0 && i > 0) { // Skip format string (first arg)
                                LLVMTypeRef arg_type = LLVMTypeOf(arg);
                                if (LLVMGetTypeKind(arg_type) == LLVMFloatTypeKind) {
                                    // Promote float to double
                                    arg = LLVMBuildFPExt(backend->builder, arg, 
                                                       LLVMDoubleTypeInContext(backend->context), "fpext");
                                }
                            }
                            printf("[LLVM Debug] Function call arg %d: %p\n", i, (void*)arg);
                            args[arg_count++] = arg;
                        } else {
                            printf("[LLVM Debug] Function call arg %d: NULL\n", i);
                        }
                    }
                    
                    printf("[LLVM Debug] Calling %s with %d arguments\n", func_name, arg_count);
                    
                    // Check if function returns void
                    LLVMTypeRef func_type = LLVMGlobalGetValueType(func);
                    LLVMTypeRef return_type = LLVMGetReturnType(func_type);
                    
                    if (LLVMGetTypeKind(return_type) == LLVMVoidTypeKind) {
                        // Function returns void - don't assign result
                        LLVMBuildCall2(backend->builder, func_type, func, args, arg_count, "");
                        result = NULL;
                        printf("[LLVM Debug] Called void function: %s\n", func_name);
                    } else {
                        // Function returns a value
                        result = LLVMBuildCall2(backend->builder, func_type, func, args, arg_count, "call");
                        printf("[LLVM Debug] Called function: %s\n", func_name);
                    }
                } else {
                    printf("[LLVM Warning] Function '%s' not declared\n", func_name);
                }
            }
            
            // Store result if needed
            if (result && instr->dest && instr->dest->type == OPERAND_TEMP) {
                int temp_id = instr->dest->value.temp_id;
                SemanticType dest_type = instr->dest->data_type;
                store_to_temp_typed(backend, result, temp_id, dest_type);
            }
            break;
        }
        
        case IR_RETURN: {
            if (instr->src1) {
                LLVMValueRef ret_val = operand_to_llvm_value(backend, instr->src1);
                if (ret_val) {
                    LLVMBuildRet(backend->builder, ret_val);
                }
            } else {
                LLVMBuildRetVoid(backend->builder);
            }
            break;
        }
        
        case IR_LABEL: {
            if (instr->dest && instr->dest->type == OPERAND_TEMP) {
                int label_id = instr->dest->value.temp_id;
                
                // Expand label table if needed
                if (label_id >= backend->label_capacity) {
                    int new_capacity = label_id + 10;
                    backend->labels = realloc(backend->labels, new_capacity * sizeof(LLVMBasicBlockRef));
                    for (int i = backend->label_capacity; i < new_capacity; i++) {
                        backend->labels[i] = NULL;
                    }
                    backend->label_capacity = new_capacity;
                }
                
                if (!backend->labels[label_id]) {
                    char name[64];
                    snprintf(name, sizeof(name), "label_%d", label_id);
                    backend->labels[label_id] = LLVMAppendBasicBlock(backend->current_function, name);
                }
                
                // Position builder at this label
                LLVMPositionBuilderAtEnd(backend->builder, backend->labels[label_id]);
            }
            break;
        }
        
        case IR_GOTO: {
            if (instr->src1 && instr->src1->type == OPERAND_TEMP) {
                int label_id = instr->src1->value.temp_id;
                
                // Expand label table if needed
                if (label_id >= backend->label_capacity) {
                    int new_capacity = label_id + 10;
                    backend->labels = realloc(backend->labels, new_capacity * sizeof(LLVMBasicBlockRef));
                    for (int i = backend->label_capacity; i < new_capacity; i++) {
                        backend->labels[i] = NULL;
                    }
                    backend->label_capacity = new_capacity;
                }
                
                if (!backend->labels[label_id]) {
                    char name[64];
                    snprintf(name, sizeof(name), "label_%d", label_id);
                    backend->labels[label_id] = LLVMAppendBasicBlock(backend->current_function, name);
                }
                
                LLVMBuildBr(backend->builder, backend->labels[label_id]);
            }
            break;
        }
        
        case IR_IF_GOTO: {
            if (instr->src1 && instr->src2 && instr->src2->type == OPERAND_TEMP) {
                LLVMValueRef condition = operand_to_llvm_value(backend, instr->src1);
                int label_id = instr->src2->value.temp_id;
                
                // Expand label table if needed
                if (label_id >= backend->label_capacity) {
                    int new_capacity = label_id + 10;
                    backend->labels = realloc(backend->labels, new_capacity * sizeof(LLVMBasicBlockRef));
                    for (int i = backend->label_capacity; i < new_capacity; i++) {
                        backend->labels[i] = NULL;
                    }
                    backend->label_capacity = new_capacity;
                }
                
                if (!backend->labels[label_id]) {
                    char name[64];
                    snprintf(name, sizeof(name), "label_%d", label_id);
                    backend->labels[label_id] = LLVMAppendBasicBlock(backend->current_function, name);
                }
                
                // Create continuation block
                LLVMBasicBlockRef cont_block = LLVMAppendBasicBlock(backend->current_function, "cont");
                
                LLVMBuildCondBr(backend->builder, condition, backend->labels[label_id], cont_block);
                LLVMPositionBuilderAtEnd(backend->builder, cont_block);
            }
            break;
        }
        
        case IR_IF_FALSE_GOTO: {
            if (instr->src1 && instr->src2 && instr->src2->type == OPERAND_TEMP) {
                LLVMValueRef condition = operand_to_llvm_value(backend, instr->src1);
                int label_id = instr->src2->value.temp_id;
                
                // Expand label table if needed
                if (label_id >= backend->label_capacity) {
                    int new_capacity = label_id + 10;
                    backend->labels = realloc(backend->labels, new_capacity * sizeof(LLVMBasicBlockRef));
                    for (int i = backend->label_capacity; i < new_capacity; i++) {
                        backend->labels[i] = NULL;
                    }
                    backend->label_capacity = new_capacity;
                }
                
                if (!backend->labels[label_id]) {
                    char name[64];
                    snprintf(name, sizeof(name), "label_%d", label_id);
                    backend->labels[label_id] = LLVMAppendBasicBlock(backend->current_function, name);
                }
                
                // Create continuation block
                LLVMBasicBlockRef cont_block = LLVMAppendBasicBlock(backend->current_function, "cont");
                
                LLVMBuildCondBr(backend->builder, condition, cont_block, backend->labels[label_id]);
                LLVMPositionBuilderAtEnd(backend->builder, cont_block);
            }
            break;
        }
        
        case IR_PARAM: {
            // Parameters are stored for later use in function calls
            if (instr->src1) {
                LLVMValueRef value = operand_to_llvm_value(backend, instr->src1);
                if (backend->param_count < 16) { // Limit parameters
                    backend->call_params[backend->param_count++] = value;
                }
            }
            break;
        }
        
        case IR_ALLOC: {
            if (instr->dest && instr->src1) {
                // For simplicity, just create an alloca (ignoring size for now)
                LLVMValueRef alloc = LLVMBuildAlloca(backend->builder, LLVMInt8Type(), "alloc");
                
                if (instr->dest->type == OPERAND_TEMP) {
                    store_to_temp_typed(backend, alloc, instr->dest->value.temp_id, TYPE_I64);
                }
            }
            break;
        }
        
        case IR_LOAD_MEM: {
            if (instr->dest && instr->src1) {
                LLVMValueRef ptr = operand_to_llvm_value(backend, instr->src1);
                LLVMValueRef loaded = LLVMBuildLoad2(backend->builder, LLVMInt64Type(), ptr, "load_mem");
                
                if (instr->dest->type == OPERAND_TEMP) {
                    store_to_temp_typed(backend, loaded, instr->dest->value.temp_id, TYPE_I64);
                }
            }
            break;
        }
        
        case IR_STORE_MEM: {
            if (instr->src1 && instr->src2) {
                LLVMValueRef ptr = operand_to_llvm_value(backend, instr->src1);
                LLVMValueRef value = operand_to_llvm_value(backend, instr->src2);
                LLVMBuildStore(backend->builder, value, ptr);
            }
            break;
        }
        
        case IR_PHI: {
            if (instr->dest && instr->src1 && instr->src2) {
                // Create PHI node with two incoming values
                LLVMTypeRef type = LLVMInt64Type(); // Default to int64
                LLVMValueRef phi = LLVMBuildPhi(backend->builder, type, "phi");
                
                LLVMValueRef values[2] = {
                    operand_to_llvm_value(backend, instr->src1),
                    operand_to_llvm_value(backend, instr->src2)
                };
                LLVMBasicBlockRef blocks[2] = {
                    LLVMGetInsertBlock(backend->builder),
                    LLVMGetInsertBlock(backend->builder)
                };
                
                LLVMAddIncoming(phi, values, blocks, 2);
                
                if (instr->dest->type == OPERAND_TEMP) {
                    store_to_temp_typed(backend, phi, instr->dest->value.temp_id, TYPE_I64);
                }
            }
            break;
        }
        
        case IR_NOP: {
            // No operation - just continue
            break;
        }
        
        default:
            // Handle other instructions as needed
            printf("[LLVM] Unhandled IR instruction: %d\n", instr->opcode);
            break;
    }
}

// Generate LLVM IR from IRProgram with dynamic type-aware system
bool llvm_generate_from_ir(LLVMBackend* backend, IRProgram* program) {
    if (!backend || !program) {
        fprintf(stderr, "Invalid parameters for LLVM generation\n");
        return false;
    }
    
    // Process global instructions first (global variable initializations)
    if (program->global_instructions) {
        printf("[LLVM Debug] Processing global instructions...\n");
        
        // Initialize minimal context for global instruction processing
        init_dynamic_tables();
        
        for (IRInstruction* instr = program->global_instructions; instr; instr = instr->next) {
            // Only process IR_STORE_GLOBAL instructions at global level
            if (instr->opcode == IR_STORE_GLOBAL) {
                translate_ir_instruction(backend, instr);
            }
        }
    }
    
    // Generate functions
    for (IRFunction* func = program->functions; func; func = func->next) {
        // Create function type - but handle main function specially
        LLVMTypeRef ret_type;
        if (strcmp(func->name, "main") == 0) {
            // Force main to return int for C compatibility
            ret_type = LLVMInt32Type();
            printf("[LLVM Debug] Forcing main function to return int\n");
        } else {
            ret_type = semantic_type_to_llvm(backend, func->return_type);
        }
        
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
        
        // Set current function for label management
        backend->current_function = llvm_func;
        
        // Reset label table for this function
        if (backend->labels) {
            free(backend->labels);
        }
        backend->labels = NULL;
        backend->label_count = 0;
        backend->label_capacity = 0;
        
        // Create basic block
        LLVMBasicBlockRef entry = LLVMAppendBasicBlockInContext(backend->context, llvm_func, "entry");
        LLVMPositionBuilderAtEnd(backend->builder, entry);
        
        // Reset temporary table for this function - ensure we have enough capacity
        init_dynamic_tables();
        expand_temp_table(func->temp_counter + 100); // Add safety margin
        
        // Reset all temp allocations for this function
        for (int i = 0; i < temp_capacity; i++) {
            temp_table[i].allocated = false;
            temp_table[i].alloca = NULL;
            temp_table[i].type = TYPE_UNKNOWN;
        }
        
        // Process instructions with type-aware system
        for (IRInstruction* instr = func->instructions; instr; instr = instr->next) {
            translate_ir_instruction(backend, instr);
        }
        
        // Add return if none exists
        if (!LLVMGetBasicBlockTerminator(LLVMGetInsertBlock(backend->builder))) {
            if (strcmp(func->name, "main") == 0) {
                // Main function always returns 0
                LLVMValueRef zero = LLVMConstInt(LLVMInt32Type(), 0, 0);
                LLVMBuildRet(backend->builder, zero);
                printf("[LLVM Debug] Added return 0 for main function\n");
            } else if (func->return_type == TYPE_VOID) {
                LLVMBuildRetVoid(backend->builder);
            } else {
                LLVMValueRef zero = LLVMConstInt(semantic_type_to_llvm(backend, func->return_type), 0, 0);
                LLVMBuildRet(backend->builder, zero);
            }
        }
        
        // Cleanup
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
