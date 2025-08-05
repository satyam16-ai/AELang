// ir.h - Intermediate Representation for ÆLang
#ifndef IR_H
#define IR_H

#include "semantic.h"
#include <stddef.h>
#include <stdbool.h>

// Forward declarations
struct IRProgram;
struct IRFunction;  
struct IRInstruction;

// IR Instruction types (Three-Address Code)
typedef enum {
    // Arithmetic operations
    IR_ADD,         // t1 = t2 + t3
    IR_SUB,         // t1 = t2 - t3  
    IR_MUL,         // t1 = t2 * t3
    IR_DIV,         // t1 = t2 / t3
    IR_MOD,         // t1 = t2 % t3
    
    // Comparison operations
    IR_EQ,          // t1 = t2 == t3
    IR_NEQ,         // t1 = t2 != t3
    IR_LT,          // t1 = t2 < t3
    IR_GT,          // t1 = t2 > t3
    IR_LEQ,         // t1 = t2 <= t3
    IR_GEQ,         // t1 = t2 >= t3
    
    // Logical operations
    IR_AND,         // t1 = t2 && t3
    IR_OR,          // t1 = t2 || t3
    IR_NOT,         // t1 = !t2
    IR_NEG,         // t1 = -t2
    
    // Assignment and movement
    IR_ASSIGN,      // t1 = t2
    IR_LOAD_CONST,  // t1 = constant
    IR_LOAD_VAR,    // t1 = variable
    IR_STORE_VAR,   // variable = t1
    
    // Type conversions
    IR_INT_TO_FLOAT,  // t1 = (float)t2
    IR_FLOAT_TO_INT,  // t1 = (int)t2
    
    // Control flow
    IR_LABEL,       // label:
    IR_GOTO,        // goto label
    IR_IF_GOTO,     // if t1 goto label
    IR_IF_FALSE_GOTO, // if !t1 goto label
    
    // Function operations
    IR_CALL,        // t1 = call func(args...)
    IR_RETURN,      // return t1
    IR_PARAM,       // param t1
    
    // Memory operations
    IR_ALLOC,       // t1 = alloc size
    IR_LOAD_MEM,    // t1 = [t2]
    IR_STORE_MEM,   // [t1] = t2
    
    // Special operations
    IR_PHI,         // t1 = phi(t2, t3) - for SSA form
    IR_NOP          // no operation
} IROpcode;

// IR Operand types
typedef enum {
    OPERAND_TEMP,       // Temporary variable (t1, t2, etc.)
    OPERAND_VAR,        // Named variable
    OPERAND_CONST_INT,  // Integer constant
    OPERAND_CONST_FLOAT, // Float constant
    OPERAND_CONST_STR,  // String constant
    OPERAND_LABEL,      // Label name
    OPERAND_FUNCTION    // Function name
} OperandType;

// IR Operand
typedef struct {
    OperandType type;
    union {
        int temp_id;        // For temporary variables
        char *name;         // For variables, labels, functions
        int int_val;        // For integer constants
        float float_val;    // For float constants
        char *str_val;      // For string constants
    } value;
    SemanticType data_type;
} IROperand;

// IR Instruction
typedef struct IRInstruction {
    IROpcode opcode;
    IROperand *dest;        // Destination operand (can be NULL)
    IROperand *src1;        // First source operand (can be NULL)
    IROperand *src2;        // Second source operand (can be NULL)
    int line_number;        // For debugging
    
    // For function calls - store parameters directly
    IROperand **params;     // Array of parameters (for IR_CALL instructions)
    int param_count;        // Number of parameters
    
    struct IRInstruction *next;
} IRInstruction;

// Basic Block (for advanced optimizations)
typedef struct BasicBlock {
    int id;
    IRInstruction *first_instruction;
    IRInstruction *last_instruction;
    struct BasicBlock **predecessors;
    struct BasicBlock **successors;
    int pred_count;
    int succ_count;
    bool visited;  // For graph traversal
} BasicBlock;

// IR Function
typedef struct IRFunction {
    char *name;
    IROperand **parameters;
    int param_count;
    SemanticType return_type;
    IRInstruction *instructions;
    BasicBlock **basic_blocks;
    int block_count;
    int temp_counter;  // For generating unique temporary names
    struct IRFunction *next;
} IRFunction;

// IR Program
typedef struct IRProgram {
    IRFunction *functions;
    IRInstruction *global_instructions;
    int temp_counter;
    int label_counter;
} IRProgram;

// IR Generation context
typedef struct {
    IRProgram *program;
    IRFunction *current_function;
    int temp_counter;
    int label_counter;
    IRInstruction **instruction_tail;  // For appending instructions
    bool generating_parameters;        // Flag to prevent nested parameter generation
} IRContext;

// Public API
IRContext *create_ir_context(void);
IRProgram *generate_ir(AnnotatedAST *ast, SemanticContext *sem_ctx);
void free_ir_program(IRProgram *program);
void free_ir_context(IRContext *ctx);

// IR construction helpers
IROperand *create_temp_operand(IRContext *ctx, SemanticType type);
IROperand *create_var_operand(const char *name, SemanticType type);
IROperand *create_const_int_operand(int value);
IROperand *create_const_float_operand(float value);
IROperand *create_const_str_operand(const char *value);
IROperand *create_label_operand(const char *name);

IRInstruction *create_instruction(IROpcode opcode, IROperand *dest, 
                                  IROperand *src1, IROperand *src2, int line);
void append_instruction(IRContext *ctx, IRInstruction *instr);

// IR optimization support
void build_basic_blocks(IRFunction *func);
void compute_dominance(IRFunction *func);
BasicBlock *find_basic_block(IRFunction *func, IRInstruction *instr);

// IR printing (for debugging)
void print_ir_program(IRProgram *program);
void print_ir_instruction(IRInstruction *instr);
const char *opcode_to_string(IROpcode opcode);

#endif // IR_H
