// optimizer.h - Optimization Passes for ÆLang
#ifndef OPTIMIZER_H
#define OPTIMIZER_H

#include "ir.h"

// Optimization pass types
typedef enum {
    OPT_CONSTANT_FOLDING,
    OPT_DEAD_CODE_ELIMINATION,
    OPT_COPY_PROPAGATION,
    OPT_COMMON_SUBEXPRESSION_ELIMINATION,
    OPT_ALGEBRAIC_SIMPLIFICATION,
    OPT_STRENGTH_REDUCTION,
    OPT_LOOP_INVARIANT_CODE_MOTION,
    OPT_INLINE_EXPANSION,
    OPT_REGISTER_ALLOCATION,
    OPT_PEEPHOLE
} OptimizationType;

// Optimization statistics
typedef struct {
    int constants_folded;
    int dead_instructions_removed;
    int copies_propagated;
    int common_subexpressions_eliminated;
    int algebraic_simplifications;
    int strength_reductions;
    int functions_inlined;
    int total_optimizations;
} OptimizationStats;

// Optimization context
typedef struct {
    IRProgram *program;
    OptimizationStats stats;
    bool verbose;  // For optimization reporting
    int optimization_level;  // 0=none, 1=basic, 2=aggressive
} OptimizerContext;

// Use-Def chain for dataflow analysis
typedef struct UseDef {
    IRInstruction *instruction;
    IROperand *operand;
    bool is_def;  // true if definition, false if use
    struct UseDef *next;
} UseDef;

// Dataflow analysis information
typedef struct {
    UseDef **use_def_chains;  // Indexed by temporary ID
    int temp_count;
    bool *live_temps;         // Live variable analysis
    bool *reaching_defs;      // Reaching definitions
} DataflowInfo;

// Public API
OptimizerContext *create_optimizer_context(IRProgram *program, int opt_level);
IRProgram *optimize_program(IRProgram *program, int optimization_level);
void free_optimizer_context(OptimizerContext *ctx);

// Individual optimization passes
bool constant_propagation_pass(IRFunction *func, OptimizationStats *stats);
bool constant_folding_pass(IRFunction *func, OptimizationStats *stats);
bool dead_code_elimination_pass(IRFunction *func, OptimizationStats *stats);
bool copy_propagation_pass(IRFunction *func, OptimizationStats *stats);
bool common_subexpression_elimination_pass(IRFunction *func, OptimizationStats *stats);
bool algebraic_simplification_pass(IRFunction *func, OptimizationStats *stats);
bool strength_reduction_pass(IRFunction *func, OptimizationStats *stats);
bool peephole_optimization_pass(IRFunction *func, OptimizationStats *stats);

// Dataflow analysis
DataflowInfo *compute_dataflow_info(IRFunction *func);
void free_dataflow_info(DataflowInfo *info);
bool is_temp_live_at(DataflowInfo *info, int temp_id, IRInstruction *instr);
UseDef *get_use_def_chain(DataflowInfo *info, int temp_id);

// Helper functions for optimizations
bool is_constant_operand(IROperand *operand);
bool can_fold_constants(IROpcode opcode, IROperand *src1, IROperand *src2);
IROperand *fold_constant_operation(IROpcode opcode, IROperand *src1, IROperand *src2);
bool is_algebraic_identity(IROpcode opcode, IROperand *src1, IROperand *src2);
IROperand *apply_algebraic_simplification(IROpcode opcode, IROperand *src1, IROperand *src2);

// Loop analysis (for advanced optimizations)
typedef struct Loop {
    BasicBlock *header;
    BasicBlock **blocks;
    int block_count;
    struct Loop *parent;
    struct Loop **children;
    int child_count;
    int depth;
} Loop;

Loop **find_natural_loops(IRFunction *func, int *loop_count);
bool is_loop_invariant(IRInstruction *instr, Loop *loop);
void free_loops(Loop **loops, int count);

// Register allocation structures
typedef struct {
    int temp_id;
    int start_point;  // First use
    int end_point;    // Last use
    int reg_assigned; // -1 if spilled
} LiveInterval;

typedef struct {
    LiveInterval *intervals;
    int interval_count;
    int *register_map;  // temp_id -> register
    int register_count;
    int *spill_temps;   // List of temporaries to spill
    int spill_count;
} RegisterAllocation;

RegisterAllocation *allocate_registers(IRFunction *func, int register_count);
void free_register_allocation(RegisterAllocation *alloc);

// Optimization reporting
void print_optimization_stats(OptimizationStats *stats);
void report_optimization(OptimizationType type, const char *description, int line);

// Optimization validation
bool validate_ir_after_optimization(IRProgram *program);
bool check_ir_consistency(IRProgram *program);

#endif // OPTIMIZER_H
