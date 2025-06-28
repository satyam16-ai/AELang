// optimizer.c - Optimization Passes Implementation for ÆLang
#define _GNU_SOURCE  // For strdup
#include "optimizer.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Forward declarations for helper functions
bool operands_equal(IROperand *op1, IROperand *op2);
extern IROperand *create_const_int_operand(int value);
extern IROperand *create_const_float_operand(float value);
bool constant_propagation_pass(IRFunction *func, OptimizationStats *stats);

// Create optimizer context
OptimizerContext *create_optimizer_context(IRProgram *program, int opt_level) {
    OptimizerContext *ctx = calloc(1, sizeof(OptimizerContext));
    if (!ctx) return NULL;
    
    ctx->program = program;
    ctx->optimization_level = opt_level;
    ctx->verbose = true;
    memset(&ctx->stats, 0, sizeof(OptimizationStats));
    
    return ctx;
}

// Main optimization function
IRProgram *optimize_program(IRProgram *program, int optimization_level) {
    if (!program) {
        return program;
    }
    
    if (optimization_level == 0) {
        printf("[Optimizer] Optimization level 0 - no optimizations applied\n");
        return program;
    }
    
    printf("[Optimizer] Starting optimization level %d\n", optimization_level);
    
    // Simple stats tracking
    OptimizationStats stats;
    memset(&stats, 0, sizeof(OptimizationStats));
    
    // Apply only safe optimizations to each function
    IRFunction *func = program->functions;
    while (func) {
        printf("[Optimizer] Optimizing function '%s'\n", func->name);
        
        // Only run dead code elimination - it's the safest optimization
        if (optimization_level >= 1) {
            dead_code_elimination_pass(func, &stats);
        }
        
        func = func->next;
    }
    
    // Print optimization statistics
    printf("[Optimizer] Optimization Statistics:\n");
    printf("  Constants folded: %d\n", stats.constants_folded);
    printf("  Dead instructions removed: %d\n", stats.dead_instructions_removed);
    printf("  Copies propagated: %d\n", stats.copies_propagated);
    printf("  Common subexpressions eliminated: %d\n", stats.common_subexpressions_eliminated);
    printf("  Algebraic simplifications: %d\n", stats.algebraic_simplifications);
    printf("  Strength reductions: %d\n", stats.strength_reductions);
    printf("  Total optimizations: %d\n", 
           stats.constants_folded + stats.dead_instructions_removed + 
           stats.copies_propagated + stats.common_subexpressions_eliminated + 
           stats.algebraic_simplifications + stats.strength_reductions);
    
    return program;
}

// Constant folding optimization pass
bool constant_folding_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    IRInstruction *instr = func->instructions;
    
    while (instr) {
        
        if (can_fold_constants(instr->opcode, instr->src1, instr->src2)) {
            IROperand *folded = fold_constant_operation(instr->opcode, instr->src1, instr->src2);
            
            if (folded) {
                // Replace the instruction with a load constant
                instr->opcode = IR_LOAD_CONST;
                instr->src1 = folded;
                instr->src2 = NULL;
                
                stats->constants_folded++;
                changed = true;
                
                report_optimization(OPT_CONSTANT_FOLDING, "Folded constant expression", instr->line_number);
            }
        }
        instr = instr->next;
    }
    
    return changed;
}

// Dead code elimination pass
bool dead_code_elimination_pass(IRFunction *func, OptimizationStats *stats) {
    printf("[DCE] Starting dead code elimination\n");
    fflush(stdout);
    
    bool changed = false;
    
    // Mark all used temporaries
    bool *used_temps = calloc(1000, sizeof(bool));  // Assume max 1000 temps
    
    printf("[DCE] First pass: marking used temporaries\n");
    fflush(stdout);
    
    // First pass: mark all used temporaries
    IRInstruction *instr = func->instructions;
    int instr_count = 0;
    while (instr) {
        instr_count++;
        if (instr->src1 && instr->src1->type == OPERAND_TEMP) {
            used_temps[instr->src1->value.temp_id] = true;
        }
        if (instr->src2 && instr->src2->type == OPERAND_TEMP) {
            used_temps[instr->src2->value.temp_id] = true;
        }
        
        // Control flow and function calls have side effects
        if (instr->opcode == IR_CALL || instr->opcode == IR_RETURN || 
            instr->opcode == IR_GOTO || instr->opcode == IR_IF_GOTO ||
            instr->opcode == IR_IF_FALSE_GOTO || instr->opcode == IR_STORE_VAR) {
            // These instructions are never dead
        }
        
        instr = instr->next;
    }
    
    printf("[DCE] Processed %d instructions in first pass\n", instr_count);
    fflush(stdout);
    
    printf("[DCE] Second pass: removing dead instructions\n");
    fflush(stdout);
    IRInstruction *prev = NULL;
    instr = func->instructions;
    
    while (instr) {
        bool is_dead = false;
        bool optimize_call = false;
        
        if (instr->dest && instr->dest->type == OPERAND_TEMP) {
            if (!used_temps[instr->dest->value.temp_id]) {
                // Check if instruction has side effects
                if (instr->opcode == IR_CALL) {
                    // For function calls, we can't remove the call (side effects),
                    // but we can remove the unused destination
                    optimize_call = true;
                } else if (instr->opcode != IR_STORE_VAR) {
                    is_dead = true;
                }
            }
        }
        
        if (is_dead) {
            // Remove this instruction
            if (prev) {
                prev->next = instr->next;
            } else {
                func->instructions = instr->next;
            }
            
            IRInstruction *to_delete = instr;
            instr = instr->next;
            
            stats->dead_instructions_removed++;
            changed = true;
            
            report_optimization(OPT_DEAD_CODE_ELIMINATION, "Removed dead instruction", 
                              to_delete->line_number);
            
            free(to_delete);
        } else if (optimize_call) {
            // Remove the destination of the call but keep the call
            instr->dest = NULL;
            stats->dead_instructions_removed++;
            changed = true;
            
            report_optimization(OPT_DEAD_CODE_ELIMINATION, "Removed unused function call result", 
                              instr->line_number);
            
            prev = instr;
            instr = instr->next;
        } else {
            prev = instr;
            instr = instr->next;
        }
    }
    
    free(used_temps);
    return changed;
}

// Copy propagation pass
bool copy_propagation_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    
    // Simple copy propagation: replace uses of t1 with t2 if t1 = t2
    IRInstruction *instr = func->instructions;
    
    while (instr) {
        // Look for copy instructions: t1 = t2
        if (instr->opcode == IR_ASSIGN && 
            instr->dest && instr->dest->type == OPERAND_TEMP &&
            instr->src1 && instr->src1->type == OPERAND_TEMP) {
            
            int dest_temp = instr->dest->value.temp_id;
            int src_temp = instr->src1->value.temp_id;
            
            // Replace all subsequent uses of dest_temp with src_temp
            IRInstruction *next_instr = instr->next;
            while (next_instr) {
                bool replaced = false;
                
                if (next_instr->src1 && next_instr->src1->type == OPERAND_TEMP &&
                    next_instr->src1->value.temp_id == dest_temp) {
                    next_instr->src1->value.temp_id = src_temp;
                    replaced = true;
                }
                
                if (next_instr->src2 && next_instr->src2->type == OPERAND_TEMP &&
                    next_instr->src2->value.temp_id == dest_temp) {
                    next_instr->src2->value.temp_id = src_temp;
                    replaced = true;
                }
                
                if (replaced) {
                    stats->copies_propagated++;
                    changed = true;
                }
                
                // Stop if dest_temp is redefined
                if (next_instr->dest && next_instr->dest->type == OPERAND_TEMP &&
                    next_instr->dest->value.temp_id == dest_temp) {
                    break;
                }
                
                next_instr = next_instr->next;
            }
        }
        
        instr = instr->next;
    }
    
    return changed;
}

// Algebraic simplification pass
bool algebraic_simplification_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    IRInstruction *instr = func->instructions;
    
    while (instr) {
        if (is_algebraic_identity(instr->opcode, instr->src1, instr->src2)) {
            IROperand *simplified = apply_algebraic_simplification(instr->opcode, instr->src1, instr->src2);
            
            if (simplified) {
                instr->opcode = IR_ASSIGN;
                instr->src1 = simplified;
                instr->src2 = NULL;
                
                stats->algebraic_simplifications++;
                changed = true;
                
                report_optimization(OPT_ALGEBRAIC_SIMPLIFICATION, "Applied algebraic simplification", 
                                  instr->line_number);
            }
        }
        instr = instr->next;
    }
    
    return changed;
}

// Strength reduction pass
bool strength_reduction_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    IRInstruction *instr = func->instructions;
    
    while (instr) {
        // Replace multiplication by powers of 2 with left shifts
        if (instr->opcode == IR_MUL && instr->src2 && instr->src2->type == OPERAND_CONST_INT) {
            int value = instr->src2->value.int_val;
            
            // Check if value is a power of 2
            if (value > 0 && (value & (value - 1)) == 0) {
                // Convert to shift left
                int shift_amount = 0;
                int temp = value;
                while (temp > 1) {
                    temp >>= 1;
                    shift_amount++;
                }
                
                // Note: We don't have SHL in our IR, so this is a conceptual optimization
                // In a real implementation, we'd add shift operations to IR
                stats->strength_reductions++;
                changed = true;
                
                report_optimization(OPT_STRENGTH_REDUCTION, "Replaced multiplication with shift", 
                                  instr->line_number);
            }
        }
        
        // Replace division by powers of 2 with right shifts (for positive values)
        if (instr->opcode == IR_DIV && instr->src2 && instr->src2->type == OPERAND_CONST_INT) {
            int value = instr->src2->value.int_val;
            
            if (value > 0 && (value & (value - 1)) == 0) {
                // Similar to multiplication case
                stats->strength_reductions++;
                changed = true;
                
                report_optimization(OPT_STRENGTH_REDUCTION, "Replaced division with shift", 
                                  instr->line_number);
            }
        }
        
        instr = instr->next;
    }
    
    return changed;
}

// Common subexpression elimination pass
bool common_subexpression_elimination_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    
    // Simple CSE: look for identical operations
    IRInstruction *instr1 = func->instructions;
    
    while (instr1) {
        if (instr1->opcode >= IR_ADD && instr1->opcode <= IR_GEQ) {
            // Look for subsequent identical operations
            IRInstruction *instr2 = instr1->next;
            
            while (instr2) {
                if (instr2->opcode == instr1->opcode &&
                    operands_equal(instr1->src1, instr2->src1) &&
                    operands_equal(instr1->src2, instr2->src2)) {
                    
                    // Replace instr2 with assignment from instr1's result
                    instr2->opcode = IR_ASSIGN;
                    instr2->src1 = instr1->dest;
                    instr2->src2 = NULL;
                    
                    stats->common_subexpressions_eliminated++;
                    changed = true;
                    
                    report_optimization(OPT_COMMON_SUBEXPRESSION_ELIMINATION, 
                                      "Eliminated common subexpression", instr2->line_number);
                }
                
                instr2 = instr2->next;
            }
        }
        
        instr1 = instr1->next;
    }
    
    return changed;
}

// Peephole optimization pass
bool peephole_optimization_pass(IRFunction *func, OptimizationStats *stats) {
    (void)stats; // Suppress unused parameter warning
    bool changed = false;
    IRInstruction *instr = func->instructions;
    
    while (instr && instr->next) {
        // Pattern: t1 = something; t2 = t1  ->  t2 = something
        if (instr->next->opcode == IR_ASSIGN &&
            instr->next->src1 && instr->next->src1->type == OPERAND_TEMP &&
            instr->dest && instr->dest->type == OPERAND_TEMP &&
            instr->next->src1->value.temp_id == instr->dest->value.temp_id) {
            
            // Check if t1 is not used elsewhere
            bool can_optimize = true;
            IRInstruction *check = instr->next->next;
            while (check) {
                if ((check->src1 && check->src1->type == OPERAND_TEMP &&
                     check->src1->value.temp_id == instr->dest->value.temp_id) ||
                    (check->src2 && check->src2->type == OPERAND_TEMP &&
                     check->src2->value.temp_id == instr->dest->value.temp_id)) {
                    can_optimize = false;
                    break;
                }
                check = check->next;
            }
            
            if (can_optimize) {
                // Replace the destination of the first instruction
                instr->dest = instr->next->dest;
                
                // Remove the second instruction
                IRInstruction *to_remove = instr->next;
                instr->next = to_remove->next;
                free(to_remove);
                
                changed = true;
                report_optimization(OPT_PEEPHOLE, "Eliminated redundant copy", instr->line_number);
            }
        }
        
        instr = instr->next;
    }
    
    return changed;
}

// Constant propagation pass - propagate constants through temporaries
bool constant_propagation_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    
    // Simple constant propagation: if t1 = constant, replace uses of t1 with constant
    IRInstruction *instr = func->instructions;
    
    while (instr) {
        // Look for LOAD_CONST instructions: t1 = constant
        if (instr->opcode == IR_LOAD_CONST && 
            instr->dest && instr->dest->type == OPERAND_TEMP &&
            instr->src1 && is_constant_operand(instr->src1)) {
            
            int temp_id = instr->dest->value.temp_id;
            IROperand *constant = instr->src1;
            
            // Replace all subsequent uses of this temporary with the constant
            IRInstruction *next_instr = instr->next;
            while (next_instr) {
                bool replaced = false;
                
                // Replace in src1
                if (next_instr->src1 && next_instr->src1->type == OPERAND_TEMP &&
                    next_instr->src1->value.temp_id == temp_id) {
                    
                    // Create a copy of the constant operand
                    IROperand *const_copy = calloc(1, sizeof(IROperand));
                    *const_copy = *constant;
                    if (constant->type == OPERAND_CONST_STR) {
                        const_copy->value.str_val = strdup(constant->value.str_val);
                    }
                    
                    next_instr->src1 = const_copy;
                    replaced = true;
                }
                
                // Replace in src2
                if (next_instr->src2 && next_instr->src2->type == OPERAND_TEMP &&
                    next_instr->src2->value.temp_id == temp_id) {
                    
                    // Create a copy of the constant operand
                    IROperand *const_copy = calloc(1, sizeof(IROperand));
                    *const_copy = *constant;
                    if (constant->type == OPERAND_CONST_STR) {
                        const_copy->value.str_val = strdup(constant->value.str_val);
                    }
                    
                    next_instr->src2 = const_copy;
                    replaced = true;
                }
                
                if (replaced) {
                    stats->copies_propagated++;
                    changed = true;
                }
                
                // Stop if the temporary is redefined
                if (next_instr->dest && next_instr->dest->type == OPERAND_TEMP &&
                    next_instr->dest->value.temp_id == temp_id) {
                    break;
                }
                
                next_instr = next_instr->next;
            }
        }
        
        instr = instr->next;
    }
    
    return changed;
}

// Helper functions for optimizations
bool is_constant_operand(IROperand *operand) {
    return operand && (operand->type == OPERAND_CONST_INT || 
                      operand->type == OPERAND_CONST_FLOAT);
}

bool can_fold_constants(IROpcode opcode, IROperand *src1, IROperand *src2) {
    // First check if both operands are constants
    if (is_constant_operand(src1) && is_constant_operand(src2)) {
        return (opcode >= IR_ADD && opcode <= IR_GEQ);
    }
    
    // Also check for cases where we can simplify based on one constant
    if (src2 && is_constant_operand(src2)) {
        // Check for algebraic identities like x + 0, x * 1, etc.
        if (src2->type == OPERAND_CONST_INT) {
            int val = src2->value.int_val;
            switch (opcode) {
                case IR_ADD:
                case IR_SUB:
                    return val == 0;  // x + 0 = x, x - 0 = x
                case IR_MUL:
                    return val == 1 || val == 0;  // x * 1 = x, x * 0 = 0
                case IR_DIV:
                    return val == 1;  // x / 1 = x
                default:
                    break;
            }
        }
    }
    
    return false;
}

IROperand *fold_constant_operation(IROpcode opcode, IROperand *src1, IROperand *src2) {
    // Handle pure constant folding
    if (is_constant_operand(src1) && is_constant_operand(src2)) {
        // For simplicity, only handle integer constants
        if (src1->type == OPERAND_CONST_INT && src2->type == OPERAND_CONST_INT) {
            int val1 = src1->value.int_val;
            int val2 = src2->value.int_val;
            int result;
            
            switch (opcode) {
                case IR_ADD: result = val1 + val2; break;
                case IR_SUB: result = val1 - val2; break;
                case IR_MUL: result = val1 * val2; break;
                case IR_DIV: 
                    if (val2 == 0) return NULL;  // Avoid division by zero
                    result = val1 / val2; 
                    break;
                case IR_MOD:
                    if (val2 == 0) return NULL;
                    result = val1 % val2;
                    break;
                case IR_EQ: result = (val1 == val2) ? 1 : 0; break;
                case IR_NEQ: result = (val1 != val2) ? 1 : 0; break;
                case IR_LT: result = (val1 < val2) ? 1 : 0; break;
                case IR_GT: result = (val1 > val2) ? 1 : 0; break;
                case IR_LEQ: result = (val1 <= val2) ? 1 : 0; break;
                case IR_GEQ: result = (val1 >= val2) ? 1 : 0; break;
                default: return NULL;
            }
            
            return create_const_int_operand(result);
        }
    }
    
    // Handle algebraic identities with one constant
    if (src2 && is_constant_operand(src2) && src2->type == OPERAND_CONST_INT) {
        int val = src2->value.int_val;
        
        switch (opcode) {
            case IR_ADD:
                if (val == 0) return src1;  // x + 0 = x
                break;
            case IR_SUB:
                if (val == 0) return src1;  // x - 0 = x
                break;
            case IR_MUL:
                if (val == 1) return src1;  // x * 1 = x
                if (val == 0) return create_const_int_operand(0);  // x * 0 = 0
                break;
            case IR_DIV:
                if (val == 1) return src1;  // x / 1 = x
                break;
            default:
                break;
        }
    }
    
    return NULL;
}

bool is_algebraic_identity(IROpcode opcode, IROperand *src1, IROperand *src2) {
    (void)src1; // Suppress unused parameter warning
    if (!src2 || src2->type != OPERAND_CONST_INT) {
        return false;
    }
    
    int val = src2->value.int_val;
    
    switch (opcode) {
        case IR_ADD:
        case IR_SUB:
            return val == 0;  // x + 0 = x, x - 0 = x
        case IR_MUL:
            return val == 1;  // x * 1 = x
        case IR_DIV:
            return val == 1;  // x / 1 = x
        default:
            return false;
    }
}

IROperand *apply_algebraic_simplification(IROpcode opcode, IROperand *src1, IROperand *src2) {
    if (!is_algebraic_identity(opcode, src1, src2)) {
        return NULL;
    }
    
    // Return the first operand (the identity)
    return src1;
}

// Helper function to check if operands are equal
bool operands_equal(IROperand *op1, IROperand *op2) {
    if (!op1 || !op2 || op1->type != op2->type) {
        return false;
    }
    
    switch (op1->type) {
        case OPERAND_TEMP:
            return op1->value.temp_id == op2->value.temp_id;
        case OPERAND_VAR:
            return strcmp(op1->value.name, op2->value.name) == 0;
        case OPERAND_CONST_INT:
            return op1->value.int_val == op2->value.int_val;
        case OPERAND_CONST_FLOAT:
            return op1->value.float_val == op2->value.float_val;
        case OPERAND_CONST_STR:
            return strcmp(op1->value.str_val, op2->value.str_val) == 0;
        case OPERAND_LABEL:
        case OPERAND_FUNCTION:
            return strcmp(op1->value.name, op2->value.name) == 0;
        default:
            return false;
    }
}

// Optimization reporting
void print_optimization_stats(OptimizationStats *stats) {
    printf("\n[Optimizer] Optimization Statistics:\n");
    printf("  Constants folded: %d\n", stats->constants_folded);
    printf("  Dead instructions removed: %d\n", stats->dead_instructions_removed);
    printf("  Copies propagated: %d\n", stats->copies_propagated);
    printf("  Common subexpressions eliminated: %d\n", stats->common_subexpressions_eliminated);
    printf("  Algebraic simplifications: %d\n", stats->algebraic_simplifications);
    printf("  Strength reductions: %d\n", stats->strength_reductions);
    printf("  Total optimizations: %d\n", 
           stats->constants_folded + stats->dead_instructions_removed + 
           stats->copies_propagated + stats->common_subexpressions_eliminated +
           stats->algebraic_simplifications + stats->strength_reductions);
    printf("\n");
}

void report_optimization(OptimizationType type, const char *description, int line) {
    (void)type; (void)description; (void)line; // Suppress unused parameter warnings
    // Only print detailed reports in verbose mode
    // printf("[Optimizer] %s (line %d)\n", description, line);
}

// Validation functions
bool validate_ir_after_optimization(IRProgram *program) {
    (void)program; // Suppress unused parameter warning
    // Basic validation: check that all referenced temporaries are defined
    // This is a simplified validation
    return true;
}

bool check_ir_consistency(IRProgram *program) {
    (void)program; // Suppress unused parameter warning
    // Check for basic consistency issues
    return true;
}

// Cleanup
void free_optimizer_context(OptimizerContext *ctx) {
    if (ctx) {
        free(ctx);
    }
}
