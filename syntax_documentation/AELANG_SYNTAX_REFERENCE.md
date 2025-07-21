# ÆLang Comprehensive Syntax Reference

## Table of Contents

1. [Basic Program Structure](#basic-program-structure)
2. [Data Types](#data-types)
3. [Variable Declarations](#variable-declarations)
4. [Function Declarations](#function-declarations)
5. [External Functions](#external-functions)
6. [Expressions and Operations](#expressions-and-operations)
7. [Control Flow](#control-flow)
8. [Comments](#comments)
9. [String Literals](#string-literals)
10. [Universal I/O System](#universal-io-system)
11. [Architecture Support](#architecture-support)
12. [Complete Examples](#complete-examples)

---

## Basic Program Structure

### Main Function
Every ÆLang program must have a `main` function as the entry point:

```aelang
func main(): void {
    // Program code here
}
```

**Explanation:**
- `func` keyword declares a function
- `main` is the required entry point function name
- `(): void` specifies no parameters and void return type
- Braces `{}` contain the function body

---

## Data Types

### Signed Integer Types
```aelang
let small: i8 = -128;        // 8-bit signed integer (-128 to 127)
let medium: i16 = -32768;    // 16-bit signed integer (-32768 to 32767)
let standard: i32 = -2147483648;  // 32-bit signed integer
let large: i64 = -9223372036854775808;  // 64-bit signed integer
```

### Unsigned Integer Types
```aelang
let tiny: u8 = 255;          // 8-bit unsigned integer (0 to 255)
let short: u16 = 65535;      // 16-bit unsigned integer (0 to 65535)
let normal: u32 = 4294967295;    // 32-bit unsigned integer
let big: u64 = 18446744073709551615;  // 64-bit unsigned integer
```

### Floating Point Types
```aelang
let precise: f32 = 3.14159265;    // 32-bit IEEE 754 single precision
let double: f64 = 3.141592653589793238;  // 64-bit IEEE 754 double precision
```

### Other Types
```aelang
let flag: bool = true;       // Boolean (true/false)
let letter: char = 'A';      // Single ASCII character
let flexible: num = 123.456; // Flexible numeric type (auto-inferred)
```

### String Type
```aelang
let message: str = "Hello World";  // String literal
```

**Explanation:**
- All types are explicitly sized for predictable memory usage
- `num` type automatically adapts to integer or floating-point as needed
- `char` stores single ASCII characters
- `bool` supports `true`, `false`, `TRUE`, `FALSE`, `True`, `False`

---

## Variable Declarations

### Basic Declaration
```aelang
let variable_name: type = value;
```

### Examples
```aelang
let age: i32 = 25;
let height: f64 = 5.9;
let name: str = "Alice";
let is_active: bool = true;
```

### Type Inference (with num)
```aelang
let auto_int: num = 42;        // Inferred as integer
let auto_float: num = 3.14;    // Inferred as floating-point
```

**Explanation:**
- `let` keyword introduces variable declarations
- Type annotation after colon is required (except with `num` inference)
- Variables must be initialized at declaration
- Variable names use snake_case convention

---

## Function Declarations

### Basic Function Syntax
```aelang
func function_name(param1: type1, param2: type2): return_type {
    // Function body
    return value;  // If return_type is not void
}
```

### Function Examples
```aelang
// Void function (no return value)
func greet(name: str): void {
    print("Hello, %s!\n", name);
}

// Function with return value
func add_numbers(a: i32, b: i32): i32 {
    return a + b;
}

// Function with multiple parameters
func calculate_area(width: f32, height: f32): f32 {
    return width * height;
}
```

### Function Calls
```aelang
func main(): void {
    greet("World");
    let sum: i32 = add_numbers(5, 3);
    let area: f32 = calculate_area(10.5, 8.2);
}
```

**Explanation:**
- Functions declared with `func` keyword
- Parameter types must be explicitly specified
- Return type specified after colon (use `void` for no return)
- Functions must be declared before use
- Function calls use parentheses with comma-separated arguments

---

## External Functions

### Declaration Syntax
```aelang
extern function_name(param1: type1, param2: type2, ...);
```

### Standard External Functions
```aelang
extern print(format: str, ...);  // Universal print with format specifiers
extern read();                   // Universal read function
```

### Usage Examples
```aelang
func main(): void {
    // Using extern print
    print("Integer: %d\n", 42);
    print("Float: %f\n", 3.14);
    print("String: %s\n", "Hello");
    
    // Using extern read
    let user_input: i32 = read();
    print("You entered: %d\n", user_input);
}
```

**Explanation:**
- `extern` declares functions implemented in external libraries (like C runtime)
- `print` supports printf-style format specifiers
- `read()` automatically infers the target type based on assignment
- External functions link with runtime library at compilation

---

## Expressions and Operations

### Arithmetic Operations
```aelang
let a: i32 = 10;
let b: i32 = 3;

let addition: i32 = a + b;        // Addition: 13
let subtraction: i32 = a - b;     // Subtraction: 7
let multiplication: i32 = a * b;  // Multiplication: 30
let division: i32 = a / b;        // Division: 3 (integer division)
```

### Floating Point Operations
```aelang
let x: f32 = 10.5;
let y: f32 = 3.2;

let float_sum: f32 = x + y;       // 13.7
let float_div: f32 = x / y;       // 3.28125 (precise division)
```

### Mixed Type Operations (with num)
```aelang
let mixed1: num = 5;              // Integer
let mixed2: num = 2.5;            // Float
let result: num = mixed1 * mixed2; // Automatic type promotion
```

**Explanation:**
- Standard arithmetic operators: `+`, `-`, `*`, `/`
- Integer division truncates decimal part
- Floating-point division preserves precision
- `num` type handles automatic type promotion

---

## Control Flow

### If Statements (Basic Structure)
```aelang
// Note: Full if-else implementation may be limited
// Check compiler support for complete conditional logic
```

### Function-Based Control
```aelang
func check_value(x: i32): void {
    // Conditional logic implemented through function calls
    if (x > 0) {  // Basic comparison support
        print("Positive: %d\n", x);
    }
}
```

**Explanation:**
- Control flow implementation varies by compiler version
- Primary focus on function-based program organization
- Conditional expressions supported in basic form

---

## Comments

### Single Line Comments
```aelang
// This is a single line comment
let value: i32 = 42;  // End-of-line comment
```

### Multi-line Comments
```aelang
/*
 * This is a multi-line comment
 * spanning multiple lines
 */
let result: f64 = 3.14159;
```

**Explanation:**
- `//` for single-line comments
- `/* */` for multi-line comments
- Comments are ignored during compilation

---

## String Literals

### Basic String Syntax
```aelang
let message: str = "Hello, World!";
let path: str = "C:\\Program Files\\App";
```

### Escape Sequences
```aelang
let newline: str = "Line 1\nLine 2";          // \n = newline
let tab: str = "Column1\tColumn2";            // \t = tab
let quote: str = "She said \"Hello\"";        // \" = escaped quote
let backslash: str = "Path: C:\\folder";      // \\ = escaped backslash
```

### Format String Usage
```aelang
print("Name: %s, Age: %d\n", "Alice", 25);
print("Pi approximation: %.2f\n", 3.14159);
```

**Explanation:**
- Double quotes delimit string literals
- Escape sequences use backslash notation
- Format strings use printf-style specifiers

---

## Universal I/O System

### Print Function Format Specifiers
```aelang
// Integer formats
print("Signed: %d\n", -42);           // %d for signed integers
print("Long: %ld\n", 123456789L);     // %ld for 64-bit integers
print("Unsigned: %u\n", 42U);         // %u for unsigned integers
print("Unsigned Long: %lu\n", 999UL); // %lu for unsigned 64-bit

// Floating point formats
print("Float: %f\n", 3.14159);        // %f for floating point
print("Scientific: %g\n", 1.23e6);    // %g for scientific notation

// Other formats
print("Character: %c\n", 'A');        // %c for characters
print("Boolean: %t\n", true);         // %t for boolean values
print("String: %s\n", "Hello");       // %s for strings
```

### Universal Read Function
```aelang
// Type-inferred reading
let integer_input: i32 = read();       // Reads as i32
let float_input: f64 = read();         // Reads as f64
let boolean_input: bool = read();      // Reads as boolean
let character_input: char = read();    // Reads as character
```

**Explanation:**
- `print()` uses format specifiers to determine output type
- `read()` automatically infers target type from variable declaration
- Universal system eliminates need for type-specific I/O functions

---

## Architecture Support

### 32-bit Compilation (Default)
```bash
./compiler/build/aelang program.ae -o program.asm
```

### 64-bit Compilation
```bash
./compiler/build/aelang program.ae --arch64 -o program_64.asm
```

### Type Behavior by Architecture
```aelang
// 32-bit architecture optimized
let standard_int: i32 = 2147483647;    // Primary integer type
let standard_float: f32 = 3.14159;     // Primary float type

// 64-bit architecture optimized  
let large_int: i64 = 9223372036854775807;  // Extended precision
let precise_float: f64 = 3.141592653589793; // Double precision
```

**Explanation:**
- Default compilation targets 32-bit architecture
- `--arch64` flag enables 64-bit mode with extended precision
- Architecture affects optimal data types and performance characteristics

---

## Complete Examples

### Basic Calculator
```aelang
extern print(format: str, ...);
extern read();

func main(): void {
    let x: i64 = 5;
    let y: i64 = 7;
    let sum: i64 = x + y;
    print("Sum: %ld\n", sum);
}
```

### Multiple Data Types
```aelang
extern print(format: str, ...);

func test_types(): void {
    let small_int: i8 = 127;
    let big_int: i64 = 9223372036854775807;
    let pi: f64 = 3.141592653589793;
    let flag: bool = true;
    let letter: char = 'X';
    
    print("i8: %d\n", small_int);
    print("i64: %ld\n", big_int);
    print("f64: %f\n", pi);
    print("bool: %t\n", flag);
    print("char: %c\n", letter);
}

func main(): void {
    test_types();
}
```

### Function with Parameters
```aelang
extern print(format: str, ...);

func multiply(a: f32, b: f32): f32 {
    return a * b;
}

func main(): void {
    let result: f32 = multiply(3.14, 2.0);
    print("Result: %f\n", result);
}
```

**Explanation:**
- Complete programs demonstrate practical syntax usage
- Functions, variables, and I/O work together seamlessly
- Type system ensures memory safety and predictable behavior

---

## Compilation and Execution

### Build Process
```bash
# Compile ÆLang source to assembly
./compiler/build/aelang program.ae -o program.asm

# Assemble to object file (32-bit)
nasm -f elf32 program.asm -o program.o

# Link with runtime library
gcc -m32 program.o std_libs/aelang_runtime_32.o -o program

# Execute
./program
```

### 64-bit Build Process  
```bash
# Compile with 64-bit flag
./compiler/build/aelang program.ae --arch64 -o program_64.asm

# Assemble for 64-bit
nasm -f elf64 program_64.asm -o program_64.o

# Link with 64-bit runtime
gcc -m64 program_64.o std_libs/aelang_runtime.o -o program_64

# Execute
./program_64
```

**Explanation:**
- ÆLang compiles to assembly language
- NASM assembles to object files
- GCC links with runtime library for final executable
- Architecture flags control target platform optimization

---

## Language Features Summary

### ✅ Implemented Features
- ✅ Strong static typing system
- ✅ Multiple integer sizes (i8, i16, i32, i64)
- ✅ Multiple unsigned types (u8, u16, u32, u64)
- ✅ IEEE 754 floating point (f32, f64)
- ✅ Boolean and character types
- ✅ Flexible `num` type with inference
- ✅ Function declarations and calls
- ✅ External function binding
- ✅ Universal I/O system (print/read)
- ✅ String literals with escape sequences
- ✅ Arithmetic expressions
- ✅ Multi-architecture compilation (32/64-bit)
- ✅ Memory-safe variable declarations
- ✅ Printf-style format strings

### 🚧 Limited/Experimental Features
- 🚧 Full conditional statements (if/else/switch)
- 🚧 Loops (for/while)
- 🚧 Arrays and data structures
- 🚧 Pointer arithmetic
- 🚧 Module system

### 🎯 Design Goals Achieved
- **Memory Safety**: Static typing prevents common errors
- **Performance**: Direct compilation to assembly
- **Portability**: Multi-architecture support
- **Simplicity**: Clean, readable syntax
- **Predictability**: Explicit type system and clear semantics

---

*This documentation covers ÆLang syntax as implemented in the current compiler version. Features and syntax may evolve in future releases.*
