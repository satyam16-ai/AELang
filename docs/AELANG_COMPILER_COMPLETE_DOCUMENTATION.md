# ÆLang Compiler - Complete Implementation Documentation

## Table of Contents
1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Language Features](#language-features)
4. [Compiler Pipeline](#compiler-pipeline)
5. [Type System](#type-system)
6. [Lexical Analysis](#lexical-analysis)
7. [Syntax Analysis](#syntax-analysis)
8. [Semantic Analysis](#semantic-analysis)
9. [IR Generation](#ir-generation)
10. [Optimization](#optimization)
11. [Code Generation](#code-generation)
12. [Testing](#testing)
13. [Build System](#build-system)
14. [Error Handling](#error-handling)
15. [Performance](#performance)

---

## Overview

ÆLang is a statically-typed, compiled programming language designed for systems programming and general-purpose applications. The compiler is implemented in C and generates 32-bit x86 assembly code.

### Key Features
- **Static Type System**: Strong typing with type inference
- **Memory Management**: Manual memory management with stack allocation
- **Function Support**: First-class functions with parameters and return values
- **Control Flow**: If-else statements, loops, and conditional expressions
- **Operators**: Arithmetic, logical, comparison, and unary operators
- **Built-in Types**: Integers, floats, booleans, characters, strings, and numeric types
- **External Function Interface**: Support for calling C library functions

### Design Goals
- **Performance**: Generate efficient assembly code
- **Safety**: Catch errors at compile time
- **Simplicity**: Clean, readable syntax
- **Extensibility**: Modular compiler architecture

---

## Architecture

The ÆLang compiler follows a traditional multi-pass architecture:

```
Source Code (.ae)
      ↓
Lexical Analysis (Lexer)
      ↓
Syntax Analysis (Parser)
      ↓
Semantic Analysis
      ↓
IR Generation
      ↓
Optimization
      ↓
Code Generation
      ↓
Assembly Code (.asm)
      ↓
Assembly & Linking
      ↓
Executable Binary
```

### Core Components
- **Lexer**: Tokenizes source code
- **Parser**: Builds Abstract Syntax Tree (AST)
- **Semantic Analyzer**: Type checking and symbol resolution
- **IR Generator**: Produces intermediate representation
- **Optimizer**: Performs code optimizations
- **Code Generator**: Emits x86 assembly

---

## Language Features

### Data Types

#### Primitive Types
- `i32`: 32-bit signed integers
- `f32`: 32-bit floating-point numbers
- `bool`: Boolean values (true/false)
- `char`: Single characters
- `str`: String literals
- `num`: Dynamic numeric type (can hold integers or floats)
- `void`: Absence of value (function returns)

#### Type Examples
```aelang
let integer: i32 = 42
let floating: f32 = 3.14
let boolean: bool = true
let character: char = 'A'
let string: str = "Hello, World!"
let dynamic: num = 123  // Can be int or float
```

### Variables and Constants

#### Variable Declarations
```aelang
let variable_name: type = initial_value
let count: i32 = 0
let pi: f32 = 3.14159
let is_valid: bool = true
```

#### Constant Declarations
```aelang
const BUFFER_SIZE: i32 = 1024
const PI: f32 = 3.14159
const DEBUG: bool = true
```

### Functions

#### Function Definition
```aelang
func function_name(param1: type1, param2: type2): return_type {
    // function body
    return value
}
```

#### Function Examples
```aelang
func add(a: i32, b: i32): i32 {
    return a + b
}

func greet(name: str): void {
    print("Hello, " + name)
}

func is_even(n: i32): bool {
    return n % 2 == 0
}
```

#### External Functions
```aelang
extern print(message: str)
extern print_int(value: i32)
extern print_bool(value: bool)
```

### Operators

#### Arithmetic Operators
- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulo

#### Comparison Operators
- `==`: Equal to
- `!=`: Not equal to
- `<`: Less than
- `>`: Greater than
- `<=`: Less than or equal to
- `>=`: Greater than or equal to

#### Logical Operators
- `&&`: Logical AND
- `||`: Logical OR
- `!`: Logical NOT (unary)

#### Unary Operators
- `!`: Logical NOT
- `-`: Unary minus

#### Operator Examples
```aelang
let result: i32 = a + b * c
let is_positive: bool = value > 0
let is_valid: bool = !is_error && has_data
let negative: i32 = -value
let inverted: bool = !flag
```

### Control Flow

#### If-Else Statements
```aelang
if condition {
    // true branch
} else {
    // false branch
}

if score >= 90 {
    print("A grade")
} else if score >= 80 {
    print("B grade")
} else {
    print("Below B")
}
```

#### Complex Conditions
```aelang
if !is_error && (count > 0 || has_default) {
    process_data()
}
```

### Expressions

#### Boolean Expressions
```aelang
let complex: bool = !true && !false  // false
let nested: bool = !(x && !y)        // depends on x, y
let simple: bool = !flag             // opposite of flag
```

#### Arithmetic Expressions
```aelang
let result: i32 = (a + b) * (c - d)
let average: f32 = (sum / count)
let rounded: i32 = value + 0.5
```

---

## Compiler Pipeline

### Phase 1: Lexical Analysis

The lexer converts source code into tokens:

#### Token Types
- **Keywords**: `func`, `let`, `const`, `if`, `else`, `return`, `extern`, `true`, `false`
- **Identifiers**: Variable and function names
- **Literals**: Numbers, strings, characters, booleans
- **Operators**: Arithmetic, logical, comparison, assignment
- **Delimiters**: Parentheses, braces, colons, semicolons
- **Comments**: Single-line (`//`) and block (`/* */`)

#### Lexer Features
- Unicode support for identifiers
- Floating-point number parsing
- String escape sequences
- Error recovery and reporting

### Phase 2: Syntax Analysis

The parser builds an Abstract Syntax Tree (AST):

#### AST Node Types
- **Program**: Top-level container
- **Function Definition**: Function declarations
- **Variable Declaration**: Variable and constant declarations
- **Statements**: If-else, return, expression statements
- **Expressions**: Binary ops, unary ops, literals, identifiers, function calls
- **External Declarations**: External function declarations

#### Parser Features
- Recursive descent parsing
- Operator precedence handling
- Error recovery with panic mode
- Syntax error reporting with line numbers

### Phase 3: Semantic Analysis

Semantic analysis performs type checking and symbol resolution:

#### Symbol Table
- **Scoped Symbol Resolution**: Hierarchical scope management
- **Symbol Types**: Variables, constants, functions, parameters
- **Type Information**: Data types and type compatibility
- **Usage Tracking**: Unused variable warnings

#### Type Checking
- **Type Compatibility**: Automatic type conversions
- **Expression Type Resolution**: Bottom-up type inference
- **Function Signature Validation**: Parameter and return type checking
- **Operator Type Validation**: Type-specific operator support

#### Annotated AST
The semantic analyzer produces an annotated AST with:
- Resolved types for all expressions
- Symbol references
- Type conversion information
- Children relationships for IR generation

### Phase 4: IR Generation

Converts annotated AST to intermediate representation:

#### IR Instructions
- **Arithmetic**: `ADD`, `SUB`, `MUL`, `DIV`, `MOD`
- **Logical**: `AND`, `OR`, `NOT`
- **Comparison**: `EQ`, `NE`, `LT`, `GT`, `LE`, `GE`
- **Control Flow**: `GOTO`, `IF_FALSE_GOTO`, `LABEL`
- **Function**: `CALL`, `RETURN`
- **Memory**: `LOAD_VAR`, `STORE_VAR`
- **Type Conversion**: `INT_TO_FLOAT`, `FLOAT_TO_INT`

#### IR Features
- **Three-Address Code**: Maximum of three operands per instruction
- **Temporary Variables**: Automatic temporary generation
- **Control Flow Graph**: Structured control flow representation
- **Type Information**: Type annotations on all operands

### Phase 5: Optimization

Multi-level optimization passes:

#### Level 1 Optimizations
- **Dead Code Elimination**: Remove unused instructions
- **Constant Folding**: Evaluate compile-time constants
- **Copy Propagation**: Eliminate unnecessary copies
- **Common Subexpression Elimination**: Reuse computed values

#### Optimization Statistics
The optimizer tracks and reports:
- Constants folded
- Dead instructions removed
- Copies propagated
- Common subexpressions eliminated

### Phase 6: Code Generation

Generates x86 32-bit assembly code:

#### Assembly Features
- **NASM Syntax**: Compatible with Netwide Assembler
- **32-bit Registers**: `eax`, `ebx`, `ecx`, `edx`, `esp`, `ebp`
- **Stack Management**: Function prologue/epilogue
- **Calling Convention**: Standard C calling convention
- **Memory Addressing**: Stack-relative addressing for locals

#### Generated Code Structure
```asm
section .data
    ; Global variables and string literals

section .text
    global main
    extern print
    extern print_int
    extern print_bool

main:
    push ebp
    mov ebp, esp
    sub esp, 16    ; Allocate local variables
    
    ; Function body
    
    mov esp, ebp   ; Restore stack
    pop ebp
    ret
```

---

## Type System

### Type Categories

#### Static Types
- All types are resolved at compile time
- No runtime type information
- Type checking prevents runtime type errors

#### Type Compatibility
- **Exact Match**: Same types are compatible
- **Numeric Promotion**: `i32` ↔ `f32` ↔ `num`
- **Boolean Context**: `i32` can be used in boolean contexts
- **No Implicit Conversions**: Explicit type annotations required

### Type Resolution

#### Expression Type Rules
1. **Literals**: Type determined by literal form
2. **Variables**: Type from declaration
3. **Binary Operations**: Result type based on operand types
4. **Unary Operations**: Result type based on operator and operand
5. **Function Calls**: Return type from function signature

#### Type Promotion Hierarchy
```
num (most general)
 ↑
f32
 ↑
i32 (most specific)
```

---

## Testing

### Test Categories

#### Unit Tests
- **Individual Operators**: Each operator tested in isolation
- **Type Combinations**: All valid type combinations tested
- **Error Cases**: Invalid syntax and semantic errors tested

#### Integration Tests
- **Complete Programs**: Full compilation pipeline tested
- **Complex Expressions**: Nested and mixed expressions tested
- **Function Calls**: Parameter passing and return values tested

#### Regression Tests
- **Bug Fixes**: Tests for previously fixed issues
- **Feature Additions**: Tests for new language features
- **Performance**: Compilation time and output quality tests

### Test Examples

#### Simple Expression Tests
```aelang
// test_arithmetic.ae
func main(): i32 {
    let a: i32 = 10
    let b: i32 = 20
    let result: i32 = a + b * 2
    return result  // Should be 50
}
```

#### Boolean Logic Tests
```aelang
// test_boolean.ae
func main(): i32 {
    let flag: bool = true
    let inverted: bool = !flag
    let complex: bool = !true && !false
    return 0
}
```

#### Function Tests
```aelang
// test_functions.ae
func add(x: i32, y: i32): i32 {
    return x + y
}

func main(): i32 {
    let result: i32 = add(5, 3)
    return result
}
```

---

## Build System

### Build Script
The `build.sh` script handles the complete build process:

```bash
#!/bin/bash
# 1. Compile universal C library
# 2. Compile ÆLang source to assembly
# 3. Assemble to object file
# 4. Link final binary
# 5. Execute program
```

### Build Steps
1. **C Library Compilation**: Compile support functions
2. **ÆLang Compilation**: Source → Assembly
3. **Assembly**: Assembly → Object file
4. **Linking**: Object files → Executable
5. **Execution**: Run the generated program

### Makefile
```makefile
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
SRCDIR = src
BUILDDIR = build
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(SRCDIR)/%.o)
TARGET = $(BUILDDIR)/aelang

all: $(TARGET)

$(TARGET): $(OBJECTS)
    $(CC) $(CFLAGS) -o $@ $^

clean:
    rm -rf $(SRCDIR)/*.o $(TARGET)
```

---

## Error Handling

### Compile-Time Errors

#### Lexical Errors
- **Invalid Characters**: Unsupported characters in source
- **Unterminated Strings**: Missing closing quotes
- **Invalid Numbers**: Malformed numeric literals

#### Syntax Errors
- **Missing Tokens**: Expected tokens not found
- **Invalid Grammar**: Constructs that don't match grammar rules
- **Unbalanced Delimiters**: Mismatched parentheses, braces

#### Semantic Errors
- **Type Mismatches**: Incompatible types in operations
- **Undefined Identifiers**: References to undeclared variables/functions
- **Duplicate Declarations**: Multiple declarations of same identifier
- **Invalid Operations**: Operations not supported for given types

### Error Recovery

#### Panic Mode Recovery
- Skip tokens until synchronization point
- Continue parsing after errors
- Report multiple errors in single pass

#### Error Messages
```
Semantic Error (line 15): Type mismatch in binary operation '+': bool vs i32
Syntax Error (line 8): Expected ')' after function parameter list
Lexical Error (line 3): Unterminated string literal
```

---

## Performance

### Compilation Performance
- **Single Pass**: Most phases complete in single pass
- **Efficient Data Structures**: Hash tables for symbol lookup
- **Memory Management**: Careful allocation and deallocation
- **Error Batching**: Multiple errors reported per pass

### Generated Code Quality
- **Register Usage**: Efficient register allocation
- **Instruction Selection**: Optimal instruction sequences
- **Dead Code Elimination**: Remove unused code
- **Constant Folding**: Compile-time computation

### Optimization Statistics
Example output:
```
[Optimizer] Optimization Statistics:
  Constants folded: 12
  Dead instructions removed: 8
  Copies propagated: 5
  Common subexpressions eliminated: 3
  Total optimizations: 28
```

---

## Implementation Details

### Memory Management
- **Stack Allocation**: Local variables on stack
- **Heap Allocation**: Dynamic memory for compiler data structures
- **Reference Counting**: Symbol and AST node cleanup
- **Leak Prevention**: Careful resource management

### Symbol Table Implementation
- **Hash Table**: O(1) average lookup time
- **Chaining**: Collision resolution with linked lists
- **Scoped Lookup**: Hierarchical scope traversal
- **Symbol Types**: Variables, functions, constants, parameters

### AST Design
- **Node Types**: Polymorphic node structure
- **Children Arrays**: Dynamic child node management
- **Type Annotations**: Type information on all nodes
- **Line Numbers**: Source location tracking

---

## Future Enhancements

### Language Features
- **Structs/Records**: User-defined data types
- **Arrays**: Fixed and dynamic arrays
- **Pointers**: Memory address manipulation
- **Modules**: Namespace and import system
- **Generics**: Parametric polymorphism

### Compiler Features
- **64-bit Support**: Generate 64-bit assembly
- **Multiple Backends**: LLVM, WebAssembly targets
- **Advanced Optimizations**: Loop optimization, inlining
- **Debug Information**: Source-level debugging support
- **Package Manager**: Dependency management system

### Tooling
- **Language Server**: IDE integration
- **Formatter**: Code formatting tool
- **Linter**: Static analysis tool
- **Profiler**: Performance analysis
- **Documentation Generator**: API documentation

---

## Conclusion

The ÆLang compiler represents a complete implementation of a modern programming language compiler. It demonstrates key compiler construction principles including lexical analysis, parsing, semantic analysis, intermediate representation, optimization, and code generation.

The modular architecture allows for easy extension and modification, while the comprehensive test suite ensures reliability and correctness. The generated assembly code is efficient and follows established conventions for interoperability with existing systems.

This implementation serves as both a functional programming language and an educational resource for understanding compiler design and implementation.

---

**Date**: June 28, 2025  
**Version**: 1.0  
**Authors**: ÆLang Development Team  
**License**: MIT License
