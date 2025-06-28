# ÆLang Compiler Documentation

## Table of Contents

1. [Overview](#overview)
2. [Getting Started](#getting-started)
3. [Language Reference](#language-reference)
4. [Compiler Architecture](#compiler-architecture)
5. [Optimization Guide](#optimization-guide)
6. [Examples](#examples)
7. [API Reference](#api-reference)
8. [Troubleshooting](#troubleshooting)

## Overview

ÆLang is a modern, statically-typed programming language with a focus on performance and simplicity. The ÆLang compiler implements a complete 7-phase compilation pipeline with advanced optimization capabilities.

### Key Features

- **Static Typing**: Strong type system with type inference
- **Modern Syntax**: Clean, readable syntax inspired by Rust and TypeScript
- **Advanced Optimization**: Multi-level optimization with dead code elimination
- **NASM Output**: Generates efficient x86 assembly code
- **Zero-Cost Abstractions**: High-level features with minimal runtime overhead
- **Memory Safety**: Compile-time memory management

### Architecture

The ÆLang compiler follows a traditional 7-phase pipeline:

1. **Lexical Analysis** - Tokenizes source code
2. **Syntax Analysis** - Builds Abstract Syntax Tree (AST)
3. **Semantic Analysis** - Type checking and symbol resolution
4. **IR Generation** - Converts AST to Intermediate Representation
5. **Optimization** - Multi-pass optimization with 3 levels
6. **Code Generation** - Converts IR to NASM assembly
7. **Executable** - Links with runtime library to create executable

## Getting Started

### Prerequisites

- GCC compiler with 32-bit support
- NASM assembler
- Linux operating system
- Make utility

### Building the Compiler

```bash
cd compiler
make clean
make
```

### Basic Usage

```bash
# Compile with default optimization (-O1)
./compiler/build/aelang source.ae -o output.asm

# Compile with specific optimization level
./compiler/build/aelang source.ae -O0 -o output.asm  # No optimization
./compiler/build/aelang source.ae -O1 -o output.asm  # Basic optimization
./compiler/build/aelang source.ae -O2 -o output.asm  # Advanced optimization

# Build and run using the build script
./build.sh source.ae
./build/executable_name
```

## Language Reference

### Basic Syntax

#### Variables and Constants

```aelang
// Variable declarations
let x: i32 = 42;
let y: f32 = 3.14;
let name: str = "Hello, World!";

// Constants
const PI: f32 = 3.14159;
const MAX_SIZE: i32 = 1000;
```

#### Data Types

- `i32` - 32-bit signed integer
- `f32` - 32-bit floating point
- `str` - String type
- `bool` - Boolean type
- `void` - No return value (functions only)

#### Functions

```aelang
// Function definition
func add(a: i32, b: i32): i32 {
    return a + b;
}

// Function with no return value
func greet(name: str): void {
    print("Hello, ");
    print(name);
}

// External function declaration
extern print_int(val: i32);
extern read_int(): i32;
```

#### Expressions and Operators

```aelang
// Arithmetic operators
let sum = a + b;
let diff = a - b;
let product = a * b;
let quotient = a / b;
let remainder = a % b;

// Comparison operators
if (a == b) { /* ... */ }
if (a != b) { /* ... */ }
if (a < b) { /* ... */ }
if (a > b) { /* ... */ }
if (a <= b) { /* ... */ }
if (a >= b) { /* ... */ }

// Logical operators
if (a && b) { /* ... */ }
if (a || b) { /* ... */ }
if (!a) { /* ... */ }
```

#### Control Flow

```aelang
// Conditional statements
if (condition) {
    // code
} else {
    // code
}

// Function calls
let result = add(10, 20);
print_int(result);
```

### Standard Library Functions

The ÆLang runtime provides several built-in functions:

```aelang
// Output functions
extern print(message: str);          // Print string
extern print_int(val: i32);          // Print integer
extern print_float(val: f32);        // Print float

// Input functions
extern read_int(): i32;              // Read integer from input
extern read_float(): f32;            // Read float from input

// Advanced numeric functions
extern print_num(val: f32);          // Enhanced number printing
extern read_num(): f32;              // Enhanced number reading
```

## Compiler Architecture

### Phase 1: Lexical Analysis

The lexer converts source code into tokens:

```
Source: "let x: i32 = 42;"
Tokens: [TOKEN_LET, TOKEN_IDENT("x"), TOKEN_COLON, TOKEN_TYPE_I32, TOKEN_EQUAL, TOKEN_INT(42), TOKEN_SEMICOLON]
```

### Phase 2: Syntax Analysis

The parser builds an Abstract Syntax Tree (AST) from tokens:

```
AST_FUNC_DEF
├── name: "main"
├── return_type: "void"
└── body:
    └── AST_VAR_DECL
        ├── name: "x"
        ├── type: "i32"
        └── value: AST_LITERAL(42)
```

### Phase 3: Semantic Analysis

Performs type checking and symbol resolution:

- Type compatibility checking
- Symbol table management
- Scope resolution
- Warning generation for unused variables

### Phase 4: IR Generation

Converts AST to three-address code intermediate representation:

```
FUNCTION main():
    LOAD_CONST t0 = 42
    STORE_VAR x, t0
    LOAD_VAR t1 = x
    PARAM t1
    CALL t2 = print_int
```

### Phase 5: Optimization

Multi-pass optimization with three levels:

- **Level 0 (-O0)**: No optimization
- **Level 1 (-O1)**: Basic optimization (dead code elimination)
- **Level 2 (-O2)**: Advanced optimization (all passes)

### Phase 6: Code Generation

Converts optimized IR to NASM assembly:

```asm
section .text
    global main
main:
    push ebp
    mov ebp, esp
    mov eax, 42
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
```

### Phase 7: Executable Generation

Links with runtime library to create executable binary.

## Optimization Guide

### Optimization Levels

#### -O0: No Optimization
- Fastest compilation
- Largest code size
- Best for debugging
- Preserves all intermediate values

#### -O1: Basic Optimization
- Dead code elimination
- Removes unused temporary variables
- Good balance of speed and code size
- Recommended for development

#### -O2: Advanced Optimization
- All -O1 optimizations
- Additional optimization passes
- Smaller code size
- Best for production builds

### Optimization Techniques

The compiler implements several optimization passes:

1. **Dead Code Elimination**: Removes unused variables and unreachable code
2. **Copy Propagation**: Replaces variable copies with original values
3. **Constant Folding**: Evaluates constant expressions at compile time
4. **Common Subexpression Elimination**: Removes redundant calculations
5. **Algebraic Simplification**: Simplifies mathematical expressions
6. **Strength Reduction**: Replaces expensive operations with cheaper ones

### Performance Tips

1. **Use appropriate optimization levels**:
   ```bash
   # Development
   ./compiler/build/aelang source.ae -O1 -o output.asm
   
   # Production
   ./compiler/build/aelang source.ae -O2 -o output.asm
   ```

2. **Declare variables close to usage**:
   ```aelang
   // Good
   func calculate(): i32 {
       let x = expensive_operation();
       return x * 2;
   }
   
   // Less optimal
   func calculate(): i32 {
       let x = expensive_operation();
       let unused = 999;  // Will be eliminated by optimizer
       return x * 2;
   }
   ```

3. **Use constants for known values**:
   ```aelang
   const BUFFER_SIZE: i32 = 1024;  // Better than magic numbers
   ```

## Examples

### Hello World

```aelang
extern print(message: str);

func main(): void {
    print("Hello, World!");
}
```

### Calculator

```aelang
extern print(message: str);
extern print_int(val: i32);
extern read_int(): i32;

func main(): void {
    print("Enter first number: ");
    let a: i32 = read_int();
    
    print("Enter second number: ");
    let b: i32 = read_int();
    
    let sum: i32 = a + b;
    print("Sum: ");
    print_int(sum);
}
```

### Complex Calculations

```aelang
extern print_int(val: i32);

func factorial(n: i32): i32 {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

func main(): void {
    let result = factorial(5);
    print_int(result);  // Outputs: 120
}
```

## API Reference

### Compiler API

#### Command Line Interface

```bash
aelang <input.ae> [options]

Options:
  -o <file>     Output assembly file
  -O0           No optimization
  -O1           Basic optimization (default)
  -O2           Advanced optimization
  -h, --help    Show help message
```

#### Exit Codes

- `0`: Successful compilation
- `1`: Compilation error
- `2`: Invalid command line arguments

### Runtime Library API

#### Output Functions

```c
void print(const char* message);
void print_int(int value);
void print_float(float value);
void print_num(float value);
```

#### Input Functions

```c
int read_int(void);
float read_float(void);
float read_num(void);
```

## Build System

### Using the Build Script

The `build.sh` script automates the entire build process:

```bash
# Basic usage
./build.sh source.ae

# The script performs:
# 1. Compiles the universal C library
# 2. Compiles ÆLang source to assembly
# 3. Assembles with NASM
# 4. Links with GCC
# 5. Creates executable in build/ directory
```

### Manual Build Process

```bash
# 1. Compile ÆLang source
./compiler/build/aelang source.ae -O2 -o build/output.asm

# 2. Compile runtime library
gcc -m32 -c c_libs/aelang_universal.c -o build/aelang_universal.o

# 3. Assemble
nasm -f elf32 build/output.asm -o build/output.o

# 4. Link
gcc -m32 build/output.o build/aelang_universal.o -o build/executable
```

## Troubleshooting

### Common Issues

#### Compilation Errors

**"Failed to open input file"**
- Check file path and permissions
- Ensure file has `.ae` extension

**"Syntax analysis failed"**
- Check for missing semicolons
- Verify function declarations
- Check bracket matching

**"Semantic analysis failed"**
- Check variable declarations
- Verify function signatures
- Check type compatibility

#### Runtime Errors

**Segmentation fault**
- Check for uninitialized variables
- Verify function calls match declarations
- Check array bounds (when implemented)

**Linking errors**
- Ensure runtime library is compiled
- Check that all external functions are declared
- Verify 32-bit compilation flags

#### Performance Issues

**Large executable size**
- Use `-O2` optimization
- Remove unused variables
- Minimize string literals

**Slow compilation**
- Use `-O0` for development
- Break large functions into smaller ones
- Use incremental compilation

### Debug Mode

Enable verbose output for debugging:

```bash
# The compiler automatically shows detailed phase information
./compiler/build/aelang source.ae -O1 -o output.asm
```

Output includes:
- Token count and samples
- AST node count
- Semantic analysis results
- IR instruction count
- Optimization statistics
- Code generation progress

### Getting Help

1. **Check this documentation** for common patterns and examples
2. **Examine the examples/** directory for working code samples
3. **Review compiler output** for detailed error messages
4. **Test with simpler programs** to isolate issues

## Advanced Topics

### Extending the Language

The modular compiler architecture allows for easy extensions:

1. **Adding new tokens**: Modify `lexer.h` and `lexer.c`
2. **New syntax**: Update `parser.h` and `parser.c`
3. **Type system**: Extend `semantic.h` and `semantic.c`
4. **Optimization passes**: Add to `optimizer.c`
5. **Code generation**: Enhance `codegen.c`

### Contributing

The ÆLang compiler is designed for educational and research purposes. Key areas for contribution:

- Additional optimization passes
- Better error messages
- More data types
- Control flow constructs
- Standard library functions

### License

This compiler implementation is provided for educational purposes. See individual source files for specific licensing information.

---

*ÆLang Compiler Documentation v1.0*
*Generated: June 28, 2025*
