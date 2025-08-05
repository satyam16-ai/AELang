// ir_codegen.h - IR to NASM Code Generator for ÆLang
#ifndef IR_CODEGEN_H
#define IR_CODEGEN_H

#include "ir.h"
#include "parser.h"
#include <stdio.h>

// Generate NASM assembly from optimized IR
bool generate_asm_from_ir(IRProgram *ir_program, FILE *out, CompilationConfig *config);

// Helper functions for IR code generation
void emit_ir_instruction(IRInstruction *instr, FILE *out, CompilationConfig *config);
void emit_ir_function(IRFunction *func, FILE *out, CompilationConfig *config);
void emit_ir_prologue(FILE *out, CompilationConfig *config);
void emit_ir_epilogue(FILE *out, CompilationConfig *config);

// Architecture-specific helpers
const char* get_register_for_temp(int temp_id, bool is_float, CompilationConfig *config);
const char* get_register_for_operand(IROperand *operand, bool is_dest, CompilationConfig *config);
void emit_mov_instruction(IROperand *dest, IROperand *src, FILE *out, CompilationConfig *config);

#endif // IR_CODEGEN_H
