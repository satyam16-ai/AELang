# ÆLang Complete Syntax Documentation

## Overview

ÆLang (AELang) is a modern, statically-typed programming language designed for systems programming and general-purpose applications. This document provides comprehensive syntax documentation based on the complete analysis of the AELang compiler implementation.

## Table of Contents

1. [Program Structure](#program-structure)
2. [Data Types](#data-types)
3. [Variables and Constants](#variables-and-constants)
4. [Functions](#functions)
5. [External Functions](#external-functions)
6. [Expressions and Operators](#expressions-and-operators)
7. [Control Flow](#control-flow)
8. [I/O System](#io-system)
9. [Comments](#comments)
10. [Literals](#literals)
11. [Keywords](#keywords)
12. [Compilation and Architecture](#compilation-and-architecture)
13. [Examples](#examples)

---

## Program Structure

### Basic Program Template
```aelang
// External function declarations (if needed)
extern print(format: str, ...);
extern read();

// Main function (entry point)
func main(): void {
    // Program code here
}

// Additional functions (if needed)
func custom_function(param: type): return_type {
    // Function body
    return value;
}
```

### File Extension
- ÆLang source files use the `.ae` extension
- Example: `program.ae`, `calculator.ae`, `hello_world.ae`

---

## Data Types

### Integer Types

#### Signed Integers
```aelang
let tiny: i8 = -128;                 // 8-bit signed (-128 to 127)
let small: i16 = -32768;             // 16-bit signed (-32,768 to 32,767)
let standard: i32 = -2147483648;     // 32-bit signed (-2^31 to 2^31-1)
let large: i64 = -9223372036854775808; // 64-bit signed (-2^63 to 2^63-1)
```

#### Unsigned Integers
```aelang
let byte: u8 = 255;                  // 8-bit unsigned (0 to 255)
let word: u16 = 65535;               // 16-bit unsigned (0 to 65,535)
let dword: u32 = 4294967295;         // 32-bit unsigned (0 to 2^32-1)
let qword: u64 = 18446744073709551615; // 64-bit unsigned (0 to 2^64-1)
```

### Floating-Point Types
```aelang
let precision_f8: f8 = 3.14;         // 8-bit custom float
let half: f16 = 2.718;               // 16-bit IEEE-754 half-precision
let single: f32 = 1.414213;          // 32-bit IEEE-754 single-precision
let double: f64 = 3.141592653589793; // 64-bit IEEE-754 double-precision
```

### Special Types
```aelang
let dynamic: num = 42.0;             // Universal dynamic numeric type
let flag: bool = true;               // Boolean (true/false)
let letter: char = 'A';              // Single ASCII character
let message: str = "Hello World";    // String literal
```

### Type Characteristics

| Type | Size | Range/Precision | Primary Architecture |
|------|------|----------------|---------------------|
| `i8` | 8-bit | -128 to 127 | All |
| `i16` | 16-bit | -32,768 to 32,767 | All |
| `i32` | 32-bit | -2^31 to 2^31-1 | 32-bit Primary |
| `i64` | 64-bit | -2^63 to 2^63-1 | 64-bit Primary |
| `u8` | 8-bit | 0 to 255 | All |
| `u16` | 16-bit | 0 to 65,535 | All |
| `u32` | 32-bit | 0 to 2^32-1 | 32-bit Primary |
| `u64` | 64-bit | 0 to 2^64-1 | 64-bit Primary |
| `f8` | 8-bit | Custom format | Experimental |
| `f16` | 16-bit | IEEE-754 half | Modern |
| `f32` | 32-bit | IEEE-754 single | 32-bit Primary |
| `f64` | 64-bit | IEEE-754 double | 64-bit Primary |
| `num` | Variable | Dynamic | All |
| `bool` | 1-bit | true/false | All |
| `char` | 8-bit | ASCII characters | All |
| `str` | Variable | UTF-8 strings | All |
| `void` | 0 | No value | Functions only |

---

## Variables and Constants

### Variable Declaration
```aelang
let variable_name: type = initial_value;
```

### Variable Examples
```aelang
// Basic variable declarations
let age: i32 = 25;
let height: f64 = 5.9;
let name: str = "Alice";
let is_active: bool = true;
let grade: char = 'A';

// Numeric type with auto-inference
let flexible_int: num = 42;        // Inferred as integer
let flexible_float: num = 3.14;    // Inferred as floating-point

// All integer types
let tiny_num: i8 = 100;
let small_num: i16 = 30000;
let normal_num: i32 = 1000000;
let big_num: i64 = 1000000000000;

let unsigned_byte: u8 = 200;
let unsigned_word: u16 = 50000;
let unsigned_dword: u32 = 3000000000;
let unsigned_qword: u64 = 10000000000000000000;

// Floating-point precision variants
let custom_float: f8 = 2.5;
let half_precision: f16 = 1.25;
let single_precision: f32 = 123.456789;
let double_precision: f64 = 123.456789012345678;
```

### Constant Declaration
```aelang
const CONSTANT_NAME: type = value;
```

### Constant Examples
```aelang
const PI: f64 = 3.141592653589793;
const MAX_USERS: i32 = 1000;
const APP_NAME: str = "ÆLang Application";
const DEBUG_MODE: bool = true;
const EOF_CHAR: char = '\0';
```

### Scope Rules
- Variables have block scope
- Constants are immutable after declaration
- Variables must be initialized at declaration
- Constants must use compile-time constant values

---

## Functions

### Function Declaration Syntax
```aelang
func function_name(param1: type1, param2: type2): return_type {
    // Function body
    return value; // If return_type is not void
}
```

### Function Examples

#### Basic Functions
```aelang
// Function returning a value
func add(a: i32, b: i32): i32 {
    return a + b;
}

// Void function (no return value)
func greet(name: str): void {
    print("Hello, %s!\n", name);
}

// Function with multiple parameters and complex logic
func calculate_bmi(weight: f32, height: f32): f32 {
    let height_squared: f32 = height * height;
    return weight / height_squared;
}

// Function with different numeric types
func convert_temperature(celsius: f64): f64 {
    return celsius * 9.0 / 5.0 + 32.0;
}
```

#### Functions with Different Return Types
```aelang
// Boolean return
func is_even(number: i32): bool {
    return number % 2 == 0;
}

// Character return
func get_grade(score: i32): char {
    if (score >= 90) {
        return 'A';
    } else if (score >= 80) {
        return 'B';
    } else {
        return 'C';
    }
}

// String return (conceptual - may require external implementation)
func get_status(active: bool): str {
    if (active) {
        return "Online";
    } else {
        return "Offline";
    }
}
```

#### Main Function
```aelang
func main(): void {
    // Program entry point
    // All ÆLang programs must have a main function
    print("Hello, ÆLang!\n");
}
```

---

## External Functions

### External Function Declaration
```aelang
extern function_name(param1: type1, param2: type2): return_type;
```

### Standard External Functions
```aelang
// Universal I/O functions
extern print(format: str, ...);     // Printf-style formatted output
extern print_clean(format: str, ...); // Output without automatic newlines
extern read();                      // Universal input function
extern read_int();                  // Read integer
extern read_float();                // Read floating-point
extern read_bool();                 // Read boolean
```

### External Function Usage
```aelang
func main(): void {
    // Using print with format specifiers
    print("Integer: %d\n", 42);
    print("Float: %.2f\n", 3.14159);
    print("Boolean: %t\n", true);
    print("Character: %c\n", 'X');
    
    // Using read functions
    print("Enter an integer: ");
    let user_number: i32 = read_int();
    print("You entered: %d\n", user_number);
    
    print("Enter a decimal: ");
    let user_float: f32 = read_float();
    print("You entered: %.3f\n", user_float);
}
```

---

## Expressions and Operators

### Arithmetic Operators
```aelang
let a: i32 = 10;
let b: i32 = 3;

let addition: i32 = a + b;          // Addition: 13
let subtraction: i32 = a - b;       // Subtraction: 7
let multiplication: i32 = a * b;    // Multiplication: 30
let division: i32 = a / b;          // Integer division: 3
let modulo: i32 = a % b;            // Modulo: 1

// Floating-point arithmetic
let x: f32 = 10.5;
let y: f32 = 3.2;
let float_result: f32 = x / y;      // Precise division: 3.28125
```

### Comparison Operators
```aelang
let value1: i32 = 10;
let value2: i32 = 20;

let equal: bool = value1 == value2;        // Equal to: false
let not_equal: bool = value1 != value2;    // Not equal: true
let less_than: bool = value1 < value2;     // Less than: true
let greater_than: bool = value1 > value2;  // Greater than: false
let less_equal: bool = value1 <= value2;   // Less or equal: true
let greater_equal: bool = value1 >= value2; // Greater or equal: false
```

### Logical Operators
```aelang
let flag1: bool = true;
let flag2: bool = false;

let logical_and: bool = flag1 && flag2;    // Logical AND: false
let logical_or: bool = flag1 || flag2;     // Logical OR: true
let logical_not: bool = !flag1;            // Logical NOT: false
```

### Unary Operators
```aelang
let positive: i32 = 42;
let negative: i32 = -positive;      // Unary minus: -42

let condition: bool = true;
let inverted: bool = !condition;    // Logical NOT: false
```

### Operator Precedence (Highest to Lowest)
1. `!` (Logical NOT), `-` (Unary minus)
2. `*`, `/`, `%` (Multiplication, Division, Modulo)
3. `+`, `-` (Addition, Subtraction)
4. `<`, `<=`, `>`, `>=` (Relational)
5. `==`, `!=` (Equality)
6. `&&` (Logical AND)
7. `||` (Logical OR)
8. `=` (Assignment)

---

## Control Flow

### If-Else Statements
```aelang
// Basic if statement
if (condition) {
    // Execute if condition is true
}

// If-else statement
if (condition) {
    // Execute if condition is true
} else {
    // Execute if condition is false
}

// Nested if-else (elif not supported, use nested if)
if (score >= 90) {
    print("Grade: A\n");
} else {
    if (score >= 80) {
        print("Grade: B\n");
    } else {
        if (score >= 70) {
            print("Grade: C\n");
        } else {
            print("Grade: F\n");
        }
    }
}
```

### Complex Conditions
```aelang
let age: i32 = 25;
let has_license: bool = true;
let has_insurance: bool = true;

// Multiple conditions with logical operators
if (age >= 18 && has_license && has_insurance) {
    print("Can drive legally\n");
} else {
    print("Cannot drive\n");
}

// Complex boolean expressions
let is_adult: bool = age >= 18;
let can_rent_car: bool = age >= 25;
if (is_adult && (has_license || can_rent_car)) {
    print("Eligible for vehicle rental\n");
}
```

### Return Statements
```aelang
func check_positive(number: i32): bool {
    if (number > 0) {
        return true;
    } else {
        return false;
    }
}

func early_return_example(value: i32): i32 {
    if (value < 0) {
        return 0;  // Early return for negative values
    }
    
    let result: i32 = value * 2;
    return result;
}
```

---

## I/O System

### Universal Print Function
The `print` function is the primary output mechanism in ÆLang, supporting printf-style format specifiers.

#### Format Specifiers
```aelang
// Integer formats
print("Decimal: %d\n", 42);           // Standard decimal
print("Binary: %b\n", 42);            // Binary representation
print("Hexadecimal: %x\n", 42);       // Hexadecimal
print("Long integer: %ld\n", 123456789);

// Floating-point formats
print("Float: %f\n", 3.14159);        // Standard float
print("Precision: %.2f\n", 3.14159);  // 2 decimal places
print("Scientific: %e\n", 1234.5);    // Scientific notation

// Special formats
print("Currency: %$\n", 123.45);      // Currency format
print("Percentage: %P\n", 0.85);      // Percentage format
print("Engineering: %K\n", 1500000);  // Engineering notation

// Other types
print("Boolean: %t\n", true);         // Boolean (true/false)
print("Character: %c\n", 'A');        // Single character
print("String: %s\n", "Hello");       // String

// Mixed formats
let age: i32 = 25;
let salary: f32 = 50000.50;
let active: bool = true;
print("Employee: Age=%d, Salary=%$, Active=%t\n", age, salary, active);
```

#### Escape Sequences
```aelang
print("Line 1\\nLine 2\\n");          // Newline
print("Tab\\tSeparated\\tValues\\n");  // Tab characters
print("Quote: \\\"Hello\\\"\\n");      // Escaped quotes
print("Backslash: \\\\path\\\\file\\n"); // Escaped backslashes
```

### Input Functions
```aelang
func input_example(): void {
    // Reading different types
    print("Enter an integer: ");
    let user_int: i32 = read_int();
    
    print("Enter a decimal: ");
    let user_float: f32 = read_float();
    
    print("Enter true or false: ");
    let user_bool: bool = read_bool();
    
    // Universal read (type inferred from assignment)
    print("Enter a number: ");
    let user_value: i32 = read();  // Type inferred as i32
    
    // Display results
    print("Integer: %d\\n", user_int);
    print("Float: %.3f\\n", user_float);
    print("Boolean: %t\\n", user_bool);
    print("Value: %d\\n", user_value);
}
```

---

## Comments

### Single-Line Comments
```aelang
// This is a single-line comment
let value: i32 = 42;  // End-of-line comment

// Multiple single-line comments
// can be used for longer explanations
// across multiple lines
```

### Block Comments (if supported)
```aelang
/* This is a block comment
   that can span multiple lines
   and is useful for longer documentation */
   
let variable: i32 = 100;

/*
 * Multi-line comment with formatting
 * Used for function documentation
 * and detailed explanations
 */
func documented_function(): void {
    // Function implementation
}
```

---

## Literals

### Integer Literals
```aelang
// Decimal (base 10)
let decimal: i32 = 123456;
let negative: i32 = -98765;

// Hexadecimal (base 16)
let hex1: i32 = 0xFF00AA;
let hex2: i32 = 0x123ABC;

// Binary (base 2)
let binary1: i32 = 0b11010110;
let binary2: i32 = 0B10101010;

// Octal (base 8)
let octal1: i32 = 0o755;
let octal2: i32 = 0O644;
```

### Floating-Point Literals
```aelang
// Decimal notation
let simple: f32 = 3.14159;
let fractional: f64 = 0.123456789;

// Scientific notation
let scientific1: f64 = 1.23e-4;     // 0.000123
let scientific2: f32 = 5.67E+10;    // 56700000000.0
let scientific3: f64 = 2.5e0;       // 2.5
```

### String Literals
```aelang
let simple_string: str = "Hello, World!";
let empty_string: str = "";
let quoted_string: str = "She said \\\"Hello\\\"";
let path_string: str = "C:\\\\Users\\\\Name\\\\file.txt";
let multiline_concept: str = "Line 1\\nLine 2\\nLine 3";
```

### Character Literals
```aelang
let letter: char = 'A';
let digit: char = '9';
let symbol: char = '@';
let space: char = ' ';
let tab: char = '\\t';
let newline: char = '\\n';
let quote: char = '\\'';
let backslash: char = '\\\\';
```

### Boolean Literals
```aelang
// Standard lowercase (recommended)
let flag1: bool = true;
let flag2: bool = false;

// Uppercase variants
let flag3: bool = TRUE;
let flag4: bool = FALSE;

// Mixed case variants
let flag5: bool = True;
let flag6: bool = False;
```

---

## Keywords

### Reserved Keywords
```
// Control flow
func        if          else        return

// Variable declaration
let         const       extern

// Data types
i8          i16         i32         i64
u8          u16         u32         u64
f8          f16         f32         f64
num         bool        char        str        void

// Boolean values
true        false       TRUE        FALSE      True       False

// Special keywords (if supported)
goto        asm         halt        in         out
load        store       debug       trace
```

### Identifier Rules
- Must start with a letter (`a-z`, `A-Z`) or underscore (`_`)
- Can contain letters, digits (`0-9`), and underscores
- Case-sensitive
- Cannot be reserved keywords
- Convention: Use `snake_case` for variables and functions
- Convention: Use `SCREAMING_SNAKE_CASE` for constants

#### Valid Identifiers
```aelang
let variable_name: i32 = 0;
let camelCase: i32 = 0;          // Valid but not conventional
let PascalCase: i32 = 0;         // Valid but not conventional
let _private: i32 = 0;
let counter1: i32 = 0;
let MAX_SIZE: i32 = 1000;        // Constant naming
```

---

## Compilation and Architecture

### Build Process
```bash
# Compile ÆLang source to assembly
./compiler/build/aelang program.ae --arch32 -o program.asm

# Assemble to object file
nasm -f elf32 program.asm -o program.o

# Link with runtime library
gcc -m32 program.o std_libs/aelang_runtime.o -o program

# Execute
./program
```

### Architecture Support
```bash
# 32-bit compilation (default for i32, u32, f32 types)
./compiler/build/aelang source.ae --arch32 -o output.asm

# 64-bit compilation (optimized for i64, u64, f64 types)
./compiler/build/aelang source.ae --arch64 -o output_64.asm
```

### Compilation Options
```bash
# Optimization levels
./compiler/build/aelang source.ae --arch32 -O0 -o output.asm  # No optimization
./compiler/build/aelang source.ae --arch32 -O1 -o output.asm  # Basic optimization
./compiler/build/aelang source.ae --arch32 -O2 -o output.asm  # Advanced optimization

# Additional flags
./compiler/build/aelang source.ae --arch32 --strict-sizes -o output.asm
./compiler/build/aelang source.ae --arch64 --optimize-size -o output.asm
```

---

## Examples

### Hello World
```aelang
extern print(format: str, ...);

func main(): void {
    print("Hello, ÆLang World!\\n");
}
```

### Calculator Program
```aelang
extern print(format: str, ...);
extern read_int();

func add(a: i32, b: i32): i32 {
    return a + b;
}

func subtract(a: i32, b: i32): i32 {
    return a - b;
}

func multiply(a: i32, b: i32): i32 {
    return a * b;
}

func divide(a: i32, b: i32): f32 {
    let a_float: f32 = a;  // Type conversion concept
    let b_float: f32 = b;
    return a_float / b_float;
}

func main(): void {
    print("Simple Calculator\\n");
    print("Enter first number: ");
    let num1: i32 = read_int();
    
    print("Enter second number: ");
    let num2: i32 = read_int();
    
    print("Results:\\n");
    print("Addition: %d + %d = %d\\n", num1, num2, add(num1, num2));
    print("Subtraction: %d - %d = %d\\n", num1, num2, subtract(num1, num2));
    print("Multiplication: %d * %d = %d\\n", num1, num2, multiply(num1, num2));
    print("Division: %d / %d = %.2f\\n", num1, num2, divide(num1, num2));
}
```

### Type Demonstration
```aelang
extern print(format: str, ...);

func demonstrate_types(): void {
    // Integer types showcase
    let tiny: i8 = 127;
    let small: i16 = 32000;
    let medium: i32 = 2000000000;
    let large: i64 = 9000000000000000000;
    
    let utiny: u8 = 255;
    let usmall: u16 = 65000;
    let umedium: u32 = 4000000000;
    let ularge: u64 = 18000000000000000000;
    
    // Floating-point types
    let single: f32 = 3.14159265;
    let double: f64 = 3.141592653589793238;
    
    // Special types
    let dynamic_int: num = 42;
    let dynamic_float: num = 3.14;
    let flag: bool = true;
    let letter: char = 'Æ';
    
    // Print all values
    print("Signed integers:\\n");
    print("i8:  %d\\n", tiny);
    print("i16: %d\\n", small);
    print("i32: %d\\n", medium);
    print("i64: %ld\\n", large);
    
    print("\\nUnsigned integers:\\n");
    print("u8:  %u\\n", utiny);
    print("u16: %u\\n", usmall);
    print("u32: %u\\n", umedium);
    print("u64: %lu\\n", ularge);
    
    print("\\nFloating-point:\\n");
    print("f32: %.6f\\n", single);
    print("f64: %.15f\\n", double);
    
    print("\\nSpecial types:\\n");
    print("num (int): %d\\n", dynamic_int);
    print("num (float): %.2f\\n", dynamic_float);
    print("bool: %t\\n", flag);
    print("char: %c\\n", letter);
}

func main(): void {
    demonstrate_types();
}
```

### Conditional Logic Example
```aelang
extern print(format: str, ...);
extern read_int();

func check_number(number: i32): void {
    // Multiple condition checks
    if (number > 0) {
        print("%d is positive\\n", number);
    } else {
        if (number < 0) {
            print("%d is negative\\n", number);
        } else {
            print("%d is zero\\n", number);
        }
    }
    
    // Check if even or odd
    if (number % 2 == 0) {
        print("%d is even\\n", number);
    } else {
        print("%d is odd\\n", number);
    }
    
    // Range checks
    if (number >= 1 && number <= 10) {
        print("%d is between 1 and 10\\n", number);
    } else {
        if (number >= 11 && number <= 100) {
            print("%d is between 11 and 100\\n", number);
        } else {
            print("%d is outside the range 1-100\\n", number);
        }
    }
}

func main(): void {
    print("Enter a number: ");
    let user_number: i32 = read_int();
    check_number(user_number);
}
```

---

## Conclusion

This documentation covers the complete syntax of the ÆLang programming language based on comprehensive analysis of the compiler implementation. ÆLang provides:

### Key Features:
- **Rich Type System**: 15 data types including multiple integer sizes, floating-point precisions, and special types
- **Modern Syntax**: Clean, readable syntax inspired by modern languages
- **Static Typing**: Compile-time type checking for safety
- **External Function Interface**: Seamless integration with C libraries
- **Architecture Support**: Both 32-bit and 64-bit target architectures
- **Comprehensive I/O**: Universal print function with extensive format specifier support

### Development Status:
- ✅ **Complete Lexer**: Full tokenization with all keywords and operators
- ✅ **Complete Parser**: AST generation with all language constructs
- ✅ **Semantic Analysis**: Type checking and symbol resolution
- ✅ **IR Generation**: Intermediate representation for optimization
- ✅ **Code Generation**: NASM assembly output for x86 architectures
- ✅ **VS Code Extension**: Syntax highlighting and language server support

### Architecture:
- **Compiler Pipeline**: 7-phase compilation (Lexer → Parser → Semantic → IR → Optimization → Code Generation → Assembly)
- **Target Platforms**: x86 32-bit and 64-bit architectures
- **Runtime**: C library integration for I/O and system functions

ÆLang is designed to be both educational and practical, offering a complete programming environment suitable for systems programming, mathematical computation, and general-purpose application development.

---

*Documentation generated: August 1, 2025*
*Based on ÆLang Compiler v1.0*
