# ÆLang Syntax Reference Guide

## Overview
ÆLang is a statically-typed programming language with C-style syntax and modern features. This guide provides comprehensive syntax reference based on analysis of working examples.

## Basic Syntax Elements

### Comments
```aelang
// Single line comment
```

### Data Types

#### Primitive Types
- `i32` - 32-bit signed integer
- `i8`, `i16`, `i64` - Other integer types
- `u8`, `u16`, `u32`, `u64` - Unsigned integer types
- `f32` - 32-bit floating point
- `f64` - 64-bit floating point
- `bool` - Boolean (true/false)
- `str` - String type
- `char` - Character type
- `num` - Dynamic numeric type (can be int or float)
- `void` - No return value

### Variable Declaration
```aelang
let variable_name: type = value;
let x: i32 = 42;
let pi: f32 = 3.14;
let is_valid: bool = true;
let name: str = "Hello";
```

### Function Declaration

#### Function with Return Type
```aelang
func function_name(param1: type1, param2: type2): return_type {
    // function body
    return value;
}

// Examples:
func add(a: i32, b: i32): i32 {
    return a + b;
}

func factorial(n: i32): i32 {
    if n <= 1 {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
```

#### Function with No Return (void)
```aelang
func function_name(param1: type1): void {
    // function body
}

// Example:
func main(): void {
    print("Hello, World!");
}
```

#### Function with No Parameters
```aelang
func function_name(): return_type {
    return value;
}

// Example:
func get_answer(): i32 {
    return 42;
}
```

### External Function Declaration
```aelang
extern function_name(param1: type1, param2: type2);

// Examples:
extern print(msg: str);
extern print_int(val: i32);
extern print_num(val: f32);
extern print_bool(val: bool);
extern read_int();
extern read_float();
```

### Control Flow

#### If Statements
```aelang
// Basic if
if condition {
    // statements
}

// If-else
if condition {
    // statements
} else {
    // statements  
}

// If-else-if (Note: ÆLang doesn't support "else if", use nested if statements)
if condition1 {
    // statements
} else {
    if condition2 {
        // statements
    } else {
        // statements
    }
}
```

#### Comparison Operators
- `==` - Equal to
- `!=` - Not equal to
- `<` - Less than
- `>` - Greater than
- `<=` - Less than or equal to
- `>=` - Greater than or equal to

#### Logical Operators
- `&&` - Logical AND
- `||` - Logical OR
- `^^` - Logical XOR
- `!` - Logical NOT

### Arithmetic Operators
- `+` - Addition
- `-` - Subtraction
- `*` - Multiplication
- `/` - Division
- `%` - Modulo

### Expression Examples
```aelang
let result: i32 = a + b * c;
let is_valid: bool = x > 0 && y < 100;
let combined: bool = flag1 || flag2;
let negated: bool = !is_empty;
```

### Function Calls
```aelang
// Call function with arguments
let result: i32 = add(5, 10);

// Call function without arguments
let value: i32 = get_answer();

// Call external function
print("Hello");
print_int(42);
```

### Built-in Functions
```aelang
// Output functions
print(message);          // Print string
print_int(value);        // Print integer
print_num(value);        // Print number (float)
print_bool(value);       // Print boolean
print_clean(message);    // Print without newline

// Input functions
read_int();              // Read integer from input
read_float();            // Read float from input
read_num();              // Read number (dynamic)
read_bool_safe();        // Read boolean safely
```

### Program Structure
```aelang
// External function declarations (if needed)
extern print(msg: str);
extern print_int(val: i32);

// Function definitions
func helper_function(param: i32): i32 {
    return param * 2;
}

// Main function (entry point)
func main(): void {
    // Program logic
}
```

## Common Patterns

### Basic Calculator
```aelang
extern print(msg: str);
extern print_int(val: i32);
extern read_int();

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

### Recursive Function
```aelang
func factorial(n: i32): i32 {
    if n <= 1 {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

func main(): void {
    let result: i32 = factorial(5);
    print_int(result);
}
```

### Conditional Logic
```aelang
func check_number(x: i32): void {
    if x > 0 {
        print("Positive");
    } else {
        if x < 0 {
            print("Negative");
        } else {
            print("Zero");
        }
    }
}
```

## Important Notes

1. **No "else if"**: ÆLang doesn't support `else if` syntax. Use nested `if` statements instead.

2. **Return Type Syntax**: Use `: type` not `-> type`
   - Correct: `func add(a: i32, b: i32): i32`
   - Incorrect: `func add(a: i32, b: i32) -> i32`

3. **Type Annotations Required**: All variables and function parameters must have explicit type annotations.

4. **Semicolons**: Required after variable declarations and statements.

5. **Braces**: Required for function bodies and control flow blocks.

6. **Main Function**: Program entry point should be `func main(): void`

## Architecture Considerations

ÆLang supports both 32-bit and 64-bit compilation:
- Use `--arch32` flag for 32-bit compilation
- Use `--arch64` flag for 64-bit compilation
- Integer operations may behave differently between architectures
- Floating-point precision may vary

## Debugging Tips

1. Use `print_clean()` for output without newlines
2. Use appropriate print functions for different types
3. Check parameter types match function signatures
4. Ensure all code paths in non-void functions return a value
5. Be careful with recursion depth to avoid stack overflow

---

*This documentation is generated from analysis of working ÆLang examples and may be updated as the language evolves.*
