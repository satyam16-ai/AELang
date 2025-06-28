# ÆLang Language Reference

## Table of Contents

1. [Syntax Overview](#syntax-overview)
2. [Data Types](#data-types)
3. [Variables and Constants](#variables-and-constants)
4. [Functions](#functions)
5. [Expressions](#expressions)
6. [Control Flow](#control-flow)
7. [Standard Library](#standard-library)
8. [Memory Model](#memory-model)
9. [Error Handling](#error-handling)

## Syntax Overview

ÆLang uses a clean, modern syntax inspired by Rust and TypeScript. The language is statically typed with explicit type annotations.

### Basic Program Structure

```aelang
// External function declarations
extern print_int(val: i32);
extern read_int(): i32;

// Function definition
func main(): void {
    let x: i32 = 42;
    print_int(x);
}
```

### Comments

ÆLang supports single-line comments:

```aelang
// This is a comment
let x: i32 = 42;  // End-of-line comment
```

### Identifiers

- Must start with a letter or underscore
- Can contain letters, digits, and underscores
- Case-sensitive
- Cannot be keywords

Valid identifiers:
```aelang
variable_name
camelCase
PascalCase
_private
counter1
```

## Data Types

### Primitive Types

#### Integer Types

```aelang
let small: i32 = 42;           // 32-bit signed integer
let zero: i32 = 0;
let negative: i32 = -100;
```

**Range**: -2,147,483,648 to 2,147,483,647

#### Floating Point Types

```aelang
let pi: f32 = 3.14159;         // 32-bit floating point
let scientific: f32 = 1.23e-4;
let negative: f32 = -42.0;
```

**Range**: IEEE 754 single precision

#### String Types

```aelang
let message: str = "Hello, World!";
let empty: str = "";
let quote: str = "She said \"Hello\"";
```

**Features**:
- UTF-8 encoded
- Immutable
- Null-terminated for C interop

#### Boolean Types

```aelang
let flag: bool = true;
let condition: bool = false;
```

**Values**: `true` or `false`

### Type Inference

ÆLang supports limited type inference in some contexts:

```aelang
// Explicit typing (recommended)
let x: i32 = 42;

// Type inferred from literal
let y = 42;  // Inferred as i32
```

## Variables and Constants

### Variable Declaration

Variables are declared using the `let` keyword:

```aelang
let variable_name: type = initial_value;
```

Examples:
```aelang
let count: i32 = 0;
let rate: f32 = 0.05;
let name: str = "Alice";
let active: bool = true;
```

### Constants

Constants are declared using the `const` keyword:

```aelang
const PI: f32 = 3.14159;
const MAX_USERS: i32 = 1000;
const APP_NAME: str = "ÆLang App";
```

**Rules**:
- Must be initialized at declaration
- Cannot be modified after declaration
- Must use compile-time constant values
- Convention: Use SCREAMING_SNAKE_CASE

### Scope Rules

Variables have block scope:

```aelang
func example(): void {
    let outer: i32 = 10;
    
    if (condition) {
        let inner: i32 = 20;  // Only visible in this block
        // Can access 'outer' here
    }
    
    // 'inner' is not accessible here
}
```

## Functions

### Function Declaration

```aelang
func function_name(param1: type1, param2: type2): return_type {
    // function body
    return value;
}
```

### Function Examples

#### Simple Function

```aelang
func add(a: i32, b: i32): i32 {
    return a + b;
}
```

#### Void Function

```aelang
func greet(name: str): void {
    print("Hello, ");
    print(name);
}
```

#### Function with Multiple Parameters

```aelang
func calculate_area(length: f32, width: f32, height: f32): f32 {
    return length * width * height;
}
```

### External Functions

External functions are declared with the `extern` keyword:

```aelang
extern print(message: str);
extern print_int(val: i32);
extern read_int(): i32;
```

**Rules**:
- No function body
- Must be implemented in linked library
- Used for C interoperability

### Function Calls

```aelang
func main(): void {
    let result: i32 = add(10, 20);
    greet("World");
    
    let user_input: i32 = read_int();
    print_int(user_input);
}
```

## Expressions

### Arithmetic Expressions

```aelang
let a: i32 = 10;
let b: i32 = 3;

let sum = a + b;        // Addition: 13
let diff = a - b;       // Subtraction: 7
let product = a * b;    // Multiplication: 30
let quotient = a / b;   // Division: 3
let remainder = a % b;  // Modulo: 1
```

### Comparison Expressions

```aelang
let a: i32 = 10;
let b: i32 = 20;

let equal = a == b;      // false
let not_equal = a != b;  // true
let less = a < b;        // true
let greater = a > b;     // false
let less_eq = a <= b;    // true
let greater_eq = a >= b; // false
```

### Logical Expressions

```aelang
let x: bool = true;
let y: bool = false;

let and_result = x && y;  // false
let or_result = x || y;   // true
let not_result = !x;      // false
```

### Operator Precedence

From highest to lowest precedence:

1. Function calls: `func()`
2. Unary operators: `!`, `-` (unary minus)
3. Multiplicative: `*`, `/`, `%`
4. Additive: `+`, `-`
5. Comparison: `<`, `<=`, `>`, `>=`
6. Equality: `==`, `!=`
7. Logical AND: `&&`
8. Logical OR: `||`
9. Assignment: `=`

### Parentheses

Use parentheses to override precedence:

```aelang
let result1 = 2 + 3 * 4;      // 14 (3*4 first)
let result2 = (2 + 3) * 4;    // 20 (2+3 first)
```

## Control Flow

### Conditional Statements

#### If Statement

```aelang
if (condition) {
    // code executed if condition is true
}
```

#### If-Else Statement

```aelang
if (condition) {
    // code executed if condition is true
} else {
    // code executed if condition is false
}
```

#### Nested Conditions

```aelang
if (score >= 90) {
    print("A grade");
} else if (score >= 80) {
    print("B grade");
} else if (score >= 70) {
    print("C grade");
} else {
    print("F grade");
}
```

### Examples

#### Simple Condition

```aelang
func check_positive(x: i32): void {
    if (x > 0) {
        print("Positive number");
    } else {
        print("Non-positive number");
    }
}
```

#### Complex Condition

```aelang
func check_range(x: i32): void {
    if (x >= 0 && x <= 100) {
        print("In range");
    } else {
        print("Out of range");
    }
}
```

## Standard Library

### Output Functions

#### print(message: str)

Prints a string message to stdout.

```aelang
extern print(message: str);

func main(): void {
    print("Hello, World!");
    print("Line 1");
    print("Line 2");
}
```

#### print_int(val: i32)

Prints an integer value to stdout.

```aelang
extern print_int(val: i32);

func main(): void {
    let number: i32 = 42;
    print_int(number);      // Outputs: 42
    print_int(123);         // Outputs: 123
}
```

#### print_float(val: f32)

Prints a floating-point value to stdout.

```aelang
extern print_float(val: f32);

func main(): void {
    let pi: f32 = 3.14159;
    print_float(pi);        // Outputs: 3.141590
}
```

### Input Functions

#### read_int(): i32

Reads an integer from stdin.

```aelang
extern read_int(): i32;

func main(): void {
    print("Enter a number: ");
    let number: i32 = read_int();
    print_int(number);
}
```

#### read_float(): f32

Reads a floating-point number from stdin.

```aelang
extern read_float(): f32;

func main(): void {
    print("Enter a decimal: ");
    let value: f32 = read_float();
    print_float(value);
}
```

### Advanced Functions

#### print_num(val: f32)

Enhanced number printing with better formatting.

```aelang
extern print_num(val: f32);

func main(): void {
    let value: f32 = 3.14159;
    print_num(value);       // Better formatted output
}
```

## Memory Model

### Stack Allocation

All variables in ÆLang are allocated on the stack:

```aelang
func example(): void {
    let x: i32 = 42;    // Allocated on stack
    let y: f32 = 3.14;  // Allocated on stack
    
    // Variables automatically deallocated when function returns
}
```

### Function Call Stack

Function parameters and local variables use the call stack:

```aelang
func caller(): void {
    let a: i32 = 10;
    callee(a);          // 'a' passed by value
}

func callee(param: i32): void {
    let local: i32 = param * 2;
    // 'param' and 'local' on callee's stack frame
}
```

### String Handling

Strings are stored as null-terminated character arrays:

```aelang
let message: str = "Hello";  // Stored in read-only data section
```

## Error Handling

### Compile-Time Errors

#### Syntax Errors

```aelang
// Error: Missing semicolon
let x: i32 = 42

// Error: Unmatched braces
func main(): void {
    let x: i32 = 42;
// Missing closing brace
```

#### Type Errors

```aelang
// Error: Type mismatch
let x: i32 = "string";

// Error: Wrong parameter type
func add(a: i32, b: i32): i32 {
    return a + b;
}

func main(): void {
    let result = add(10, "20");  // Error: string instead of i32
}
```

#### Semantic Errors

```aelang
// Error: Undefined variable
func main(): void {
    print_int(undefined_var);
}

// Error: Function not declared
func main(): void {
    undefined_function();
}
```

### Runtime Considerations

#### Stack Overflow

Avoid deep recursion:

```aelang
// Potential stack overflow
func infinite_recursion(n: i32): i32 {
    return infinite_recursion(n + 1);  // Never terminates
}
```

#### Integer Overflow

Be aware of integer limits:

```aelang
func main(): void {
    let max: i32 = 2147483647;
    let overflow = max + 1;  // Undefined behavior
}
```

### Best Practices

1. **Always initialize variables**:
   ```aelang
   let x: i32 = 0;  // Good
   ```

2. **Use meaningful names**:
   ```aelang
   let user_count: i32 = 0;     // Good
   let c: i32 = 0;              // Less clear
   ```

3. **Check function return values**:
   ```aelang
   let input: i32 = read_int();
   if (input < 0) {
       print("Invalid input");
   }
   ```

4. **Use constants for magic numbers**:
   ```aelang
   const MAX_RETRIES: i32 = 3;
   ```

5. **Keep functions small and focused**:
   ```aelang
   func calculate_area(length: f32, width: f32): f32 {
       return length * width;
   }
   ```

---

*ÆLang Language Reference v1.0*
*Complete syntax and semantics reference*
