# ÆLang Compiler Architecture Guide

## Table of Contents

1. [Overview](#overview)
2. [Pipeline Architecture](#pipeline-architecture)
3. [Phase Details](#phase-details)
4. [Data Structures](#data-structures)
5. [Optimization Framework](#optimization-framework)
6. [Code Generation](#code-generation)
7. [Runtime System](#runtime-system)
8. [Extension Guide](#extension-guide)

## Overview

The ÆLang compiler implements a modern, multi-phase compilation pipeline that transforms ÆLang source code into executable x86 assembly. The architecture emphasizes modularity, extensibility, and optimization opportunities.

### Design Principles

- **Modular Design**: Each phase is independent and well-defined
- **Intermediate Representations**: Clean separation between phases
- **Optimization Focus**: Multiple optimization passes with different levels
- **Error Recovery**: Comprehensive error reporting at each phase
- **Extensibility**: Easy to add new language features and optimizations

### High-Level Architecture

```
Source Code (.ae)
       ↓
   Lexer (Phase 1)
       ↓
   Token Stream
       ↓
   Parser (Phase 2)
       ↓
   Abstract Syntax Tree (AST)
       ↓
   Semantic Analyzer (Phase 3)
       ↓
   Annotated AST
       ↓
   IR Generator (Phase 4)
       ↓
   Intermediate Representation (IR)
       ↓
   Optimizer (Phase 5)
       ↓
   Optimized IR
       ↓
   Code Generator (Phase 6)
       ↓
   NASM Assembly (.asm)
       ↓
   Assembler + Linker (Phase 7)
       ↓
   Executable Binary
```

## Pipeline Architecture

### Phase 1: Lexical Analysis

**File**: `compiler/src/lexer.c`

**Purpose**: Converts source code characters into a stream of tokens.

**Input**: Raw source code string
**Output**: Token list with type and position information

**Key Features**:
- Handles all ÆLang tokens (keywords, operators, literals, identifiers)
- Line number tracking for error reporting
- Efficient token recognition using finite automata
- Supports string literals with escape sequences

**Token Types**:
```c
typedef enum {
    TOKEN_EOF,
    TOKEN_LET, TOKEN_CONST, TOKEN_FUNC, TOKEN_EXTERN,
    TOKEN_RETURN, TOKEN_IF, TOKEN_ELSE,
    TOKEN_COLON, TOKEN_SEMICOLON, TOKEN_COMMA,
    TOKEN_LPAREN, TOKEN_RPAREN, TOKEN_LBRACE, TOKEN_RBRACE,
    TOKEN_PLUS, TOKEN_MINUS, TOKEN_MUL, TOKEN_DIV,
    TOKEN_EQ, TOKEN_NEQ, TOKEN_LT, TOKEN_GT,
    TOKEN_IDENT, TOKEN_INT, TOKEN_FLOAT, TOKEN_STRING,
    // ... more tokens
} TokenType;
```

### Phase 2: Syntax Analysis

**File**: `compiler/src/parser.c`

**Purpose**: Builds an Abstract Syntax Tree (AST) from the token stream.

**Input**: Token list
**Output**: AST representing program structure

**Key Features**:
- Recursive descent parser
- Error recovery mechanisms
- Operator precedence handling
- Support for all ÆLang constructs

**AST Node Types**:
```c
typedef enum {
    AST_VAR_DECL, AST_CONST_DECL, AST_ASSIGN,
    AST_BIN_OP, AST_UNARY_OP, AST_LITERAL,
    AST_IDENTIFIER, AST_FUNC_CALL, AST_FUNC_DEF,
    AST_IF_STMT, AST_RETURN,
    // ... more node types
} ASTNodeType;
```

### Phase 3: Semantic Analysis

**File**: `compiler/src/semantic.c`

**Purpose**: Performs type checking, symbol resolution, and semantic validation.

**Input**: AST
**Output**: Annotated AST with type information

**Key Features**:
- Symbol table management with scope handling
- Type checking and inference
- Function signature validation
- Unused variable detection
- Error and warning generation

**Symbol Table Structure**:
```c
typedef struct Symbol {
    char *name;
    SymbolType symbol_type;
    SemanticType type;
    int line_declared;
    bool is_used;
    struct Symbol *next;
} Symbol;

typedef struct Scope {
    Symbol *symbols[256];  // Hash table
    struct Scope *parent;
    int depth;
} Scope;
```

### Phase 4: IR Generation

**File**: `compiler/src/ir.c`

**Purpose**: Converts annotated AST to three-address code intermediate representation.

**Input**: Annotated AST
**Output**: IR program with functions and instructions

**Key Features**:
- Three-address code format
- Temporary variable management
- Function-based organization
- Simple instruction set

**IR Instructions**:
```c
typedef enum {
    IR_LOAD_CONST,    // t1 = constant
    IR_LOAD_VAR,      // t1 = variable
    IR_STORE_VAR,     // variable = t1
    IR_ADD,           // t1 = t2 + t3
    IR_SUB,           // t1 = t2 - t3
    IR_MUL,           // t1 = t2 * t3
    IR_DIV,           // t1 = t2 / t3
    IR_CALL,          // t1 = function(args)
    IR_PARAM,         // param t1
    IR_RETURN,        // return t1
    // ... more instructions
} IROpcode;
```

### Phase 5: Optimization

**File**: `compiler/src/optimizer.c`

**Purpose**: Applies various optimization passes to improve code quality.

**Input**: IR program
**Output**: Optimized IR program

**Optimization Levels**:
- **-O0**: No optimization
- **-O1**: Basic optimization (dead code elimination)
- **-O2**: Advanced optimization (all passes)

**Optimization Passes**:
1. Dead Code Elimination
2. Copy Propagation
3. Constant Folding
4. Common Subexpression Elimination
5. Algebraic Simplification
6. Strength Reduction

### Phase 6: Code Generation

**File**: `compiler/src/codegen.c`

**Purpose**: Converts optimized IR to NASM x86 assembly code.

**Input**: Optimized IR
**Output**: NASM assembly file

**Key Features**:
- x86 32-bit target architecture
- Register allocation and management
- Function calling conventions
- String literal handling
- Symbol resolution

### Phase 7: Assembly and Linking

**Tools**: NASM + GCC

**Purpose**: Converts assembly to executable binary.

**Process**:
1. Assemble with NASM to object file
2. Link with runtime library using GCC
3. Produce executable binary

## Data Structures

### Token Structure

```c
typedef struct {
    TokenType type;
    char *text;
    int line;
} Token;

typedef struct {
    Token *tokens;
    size_t count;
    size_t capacity;
} TokenList;
```

### AST Node Structure

```c
typedef struct ASTNode {
    ASTNodeType type;
    int line;
    union {
        struct {
            char *name;
            char *type_name;
            struct ASTNode *value;
        } var_decl;
        
        struct {
            char *name;
            char **param_names;
            char **param_types;
            size_t param_count;
            struct ASTNode **body;
            size_t body_count;
        } func_def;
        
        struct {
            struct ASTNode *left;
            struct ASTNode *right;
            char *operator;
        } bin_op;
        
        // ... more union members
    } as;
} ASTNode;
```

### IR Structures

```c
typedef struct IROperand {
    OperandType type;
    union {
        int temp_id;
        char *name;
        int int_val;
        float float_val;
        char *str_val;
    } value;
} IROperand;

typedef struct IRInstruction {
    IROpcode opcode;
    IROperand *dest;
    IROperand *src1;
    IROperand *src2;
    int line_number;
    struct IRInstruction *next;
} IRInstruction;

typedef struct IRFunction {
    char *name;
    IRInstruction *instructions;
    IROperand **parameters;
    int param_count;
    struct IRFunction *next;
} IRFunction;
```

## Optimization Framework

### Optimization Context

```c
typedef struct {
    IRProgram *program;
    int optimization_level;
    bool verbose;
    OptimizationStats stats;
} OptimizerContext;

typedef struct {
    int constants_folded;
    int dead_instructions_removed;
    int copies_propagated;
    int common_subexpressions_eliminated;
    int algebraic_simplifications;
    int strength_reductions;
} OptimizationStats;
```

### Dead Code Elimination

**Algorithm**:
1. Mark all used temporaries by scanning instruction operands
2. Remove instructions that define unused temporaries
3. Preserve instructions with side effects (calls, stores)

**Implementation**:
```c
bool dead_code_elimination_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    bool *used_temps = calloc(1000, sizeof(bool));
    
    // First pass: mark used temporaries
    IRInstruction *instr = func->instructions;
    while (instr) {
        if (instr->src1 && instr->src1->type == OPERAND_TEMP) {
            used_temps[instr->src1->value.temp_id] = true;
        }
        if (instr->src2 && instr->src2->type == OPERAND_TEMP) {
            used_temps[instr->src2->value.temp_id] = true;
        }
        instr = instr->next;
    }
    
    // Second pass: remove dead instructions
    // ... implementation details
    
    free(used_temps);
    return changed;
}
```

### Copy Propagation

**Algorithm**:
1. Identify copy instructions (t1 = t2)
2. Replace subsequent uses of t1 with t2
3. Remove the copy instruction if t1 is no longer used

### Constant Folding

**Algorithm**:
1. Identify instructions with constant operands
2. Evaluate the operation at compile time
3. Replace with a load constant instruction

## Code Generation

### Register Allocation

**Strategy**: Simple register allocation using stack-based approach
- Use EAX for temporary calculations
- Parameters passed on stack
- Local variables allocated on stack

### Function Calling Convention

**ÆLang Calling Convention**:
- Parameters pushed right-to-left
- Return value in EAX
- Caller cleans up stack
- Callee preserves EBP

**Example Generated Code**:
```asm
; Function: add(a: i32, b: i32): i32
add:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]    ; Load parameter 'a'
    add eax, [ebp+12]   ; Add parameter 'b'
    
    pop ebp
    ret
```

### String Handling

**String Literals**:
- Collected during code generation
- Stored in `.data` section
- Null-terminated for C compatibility

## Runtime System

### Runtime Library

**File**: `c_libs/aelang_universal.c`

**Functions Provided**:
- I/O functions (print, read)
- Numeric formatting
- Type conversion utilities

**Key Functions**:
```c
void print(const char* str);
void print_int(int value);
void print_float(float value);
int read_int(void);
float read_float(void);
```

### Memory Management

**Stack-Based Allocation**:
- All variables allocated on stack
- Automatic deallocation on scope exit
- No garbage collection needed

### Linking Process

**Steps**:
1. Compile runtime library to object file
2. Assemble ÆLang code to object file
3. Link both object files with GCC
4. Produce executable binary

## Extension Guide

### Adding New Language Features

#### 1. Lexer Extension

Add new tokens to `lexer.h`:
```c
// Add to TokenType enum
TOKEN_NEW_KEYWORD,
```

Update lexer logic in `lexer.c`:
```c
if (strncmp(current, "newkeyword", 10) == 0) {
    add_token(tokens, TOKEN_NEW_KEYWORD, "newkeyword", line);
    current += 10;
    continue;
}
```

#### 2. Parser Extension

Add new AST node type to `parser.h`:
```c
// Add to ASTNodeType enum
AST_NEW_CONSTRUCT,
```

Add parsing logic to `parser.c`:
```c
ASTNode *parse_new_construct() {
    Token tok = expect(TOKEN_NEW_KEYWORD, "new keyword");
    ASTNode *node = make_node(AST_NEW_CONSTRUCT, tok.line);
    // ... parsing logic
    return node;
}
```

#### 3. Semantic Analysis Extension

Add semantic checking in `semantic.c`:
```c
void analyze_new_construct(ASTNode *node, SemanticContext *ctx) {
    // ... semantic analysis logic
}
```

#### 4. IR Generation Extension

Add IR generation in `ir.c`:
```c
IROperand *generate_new_construct_ir(ASTNode *node, IRContext *ctx) {
    // ... IR generation logic
}
```

#### 5. Code Generation Extension

Add code generation in `codegen.c`:
```c
void emit_new_construct(ASTNode *node, FILE *out) {
    // ... assembly generation logic
}
```

### Adding New Optimization Passes

1. **Define the optimization function**:
```c
bool new_optimization_pass(IRFunction *func, OptimizationStats *stats) {
    bool changed = false;
    // ... optimization logic
    return changed;
}
```

2. **Add to optimization pipeline**:
```c
// In optimize_program function
if (optimization_level >= 2) {
    changed |= new_optimization_pass(func, &ctx->stats);
}
```

3. **Update statistics tracking**:
```c
// Add to OptimizationStats structure
int new_optimizations_applied;
```

### Testing New Features

1. **Create test cases**:
```aelang
// test_new_feature.ae
extern print_int(val: i32);

func main(): void {
    // Test new language feature
}
```

2. **Test compilation**:
```bash
./compiler/build/aelang test_new_feature.ae -o test.asm
```

3. **Test execution**:
```bash
./build.sh test_new_feature.ae
./build/test_new_feature
```

### Performance Profiling

**Compile-time profiling**:
- Add timing measurements to each phase
- Use `clock()` or `gettimeofday()` for timing
- Report phase-by-phase execution times

**Runtime profiling**:
- Use `perf` for detailed analysis
- Measure instruction count and cache performance
- Compare optimized vs unoptimized code

---

*ÆLang Compiler Architecture Guide v1.0*
*Complete implementation reference for developers*
