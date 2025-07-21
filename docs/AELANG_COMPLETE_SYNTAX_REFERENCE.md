# ÆLang Complete Language Syntax Reference

## Overview
ÆLang is a systems programming language with C-like syntax and modern type safety features. This comprehensive reference covers all language constructs and syntax patterns.

## File Extension
- Source files use `.ae` extension
- Example: `program.ae`, `calculator.ae`

## Comments
```aelang
// Single-line comment
```

## Data Types

### Integer Types
- `i8` - 8-bit signed integer (-128 to 127)
- `i16` - 16-bit signed integer (-32,768 to 32,767)  
- `i32` - 32-bit signed integer (-2,147,483,648 to 2,147,483,647)
- `i64` - 64-bit signed integer
- `u8` - 8-bit unsigned integer (0 to 255)
- `u16` - 16-bit unsigned integer (0 to 65,535)
- `u32` - 32-bit unsigned integer (0 to 4,294,967,295)
- `u64` - 64-bit unsigned integer

### Floating Point Types  
- `f32` - 32-bit floating point (single precision)
- `f64` - 64-bit floating point (double precision)
- `float` - Alias for f32

### Special Types
- `num` - Dynamic number type (can be int or float)
- `bool` - Boolean type (true/false)
- `char` - Character type
- `str` - String type
- `void` - No return value (functions only)

## Variable Declarations

### Syntax Pattern
```aelang
let variable_name: type = value;
```

### Examples
```aelang
let x: i32 = 42;
let pi: f32 = 3.14159;
let name: str = "ÆLang";
let is_ready: bool = true;
let letter: char = 'A';
let dynamic: num = 123.45;
```

## Function Definitions

### Syntax Pattern
```aelang
func function_name(param1: type1, param2: type2): return_type {
    // function body
    return value;  // if not void
}
```

### Examples
```aelang
// Void function (no return value)
func print_hello(): void {
    print_clean("Hello, ÆLang!\n");
}

// Function with return value
func add(a: i32, b: i32): i32 {
    return a + b;
}

// Function with multiple parameters
func calculate_area(width: f32, height: f32): f32 {
    return width * height;
}

// Recursive function
func factorial(n: i32): i32 {
    if n <= 1 {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
```

## External Function Declarations

### Syntax Pattern
```aelang
extern function_name(param1: type1, param2: type2);
```

### Standard Library Functions
```aelang
extern print_clean(msg: str);
extern print_int(val: i32);
extern print_num(val: num);
extern read_int(): i32;
extern read_float(): f32;
extern read_num(): num;
```

## Control Flow

### If Statements
**Important:** ÆLang does NOT support `else if`. Use nested if statements instead.

```aelang
// Simple if
if condition {
    // statements
}

// If-else
if condition {
    // statements
} else {
    // statements  
}

// Nested conditions (NO else if support)
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

### While Loops
```aelang
while condition {
    // loop body
}
```

## Operators

### Arithmetic Operators
- `+` - Addition
- `-` - Subtraction  
- `*` - Multiplication
- `/` - Division
- `%` - Modulo

### Comparison Operators
- `==` - Equal to
- `!=` - Not equal to
- `<` - Less than
- `>` - Greater than
- `<=` - Less than or equal to
- `>=` - Greater than or equal to

### Logical Operators
- `&&` - Logical AND
- `||` - Logical OR
- `^^` - Logical XOR (exclusive OR)
- `!` - Logical NOT

### Unary Operators
- `-` - Unary minus (negation)
- `!` - Logical NOT

## Function Calls

### Syntax Pattern
```aelang
function_name(arg1, arg2, arg3);
```

### Examples
```aelang
print_clean("Hello World\n");
let result: i32 = add(10, 20);
let fact: i32 = factorial(5);
```

## Expression Examples

### Arithmetic Expressions
```aelang
let result: i32 = (a + b) * c - d / 2;
let average: f32 = (x + y + z) / 3.0;
```

### Boolean Expressions
```aelang
let is_valid: bool = (x > 0) && (y < 100);
let is_special: bool = (flag1 || flag2) && !flag3;
let is_exclusive: bool = flag1 ^^ flag2;  // XOR
```

### Function Call Expressions
```aelang
let total: i32 = add(multiply(x, 2), subtract(y, 1));
let computed: i32 = factorial(n - 1) * n;
```

## Complete Program Structure

### Minimal Program
```aelang
extern print_clean(msg: str);

func main(): void {
    print_clean("Hello, ÆLang!\n");
}
```

### Complex Program Example
```aelang
extern print_clean(msg: str);
extern print_int(val: i32);
extern read_int(): i32;

func calculate_factorial(n: i32): i32 {
    if n <= 1 {
        return 1;
    } else {
        return n * calculate_factorial(n - 1);
    }
}

func is_even(num: i32): bool {
    return (num % 2) == 0;
}

func main(): void {
    print_clean("Enter a number: ");
    let number: i32 = read_int();
    
    if number < 0 {
        print_clean("Negative numbers not supported\n");
    } else {
        let result: i32 = calculate_factorial(number);
        print_clean("Factorial: ");
        print_int(result);
        print_clean("\n");
        
        if is_even(number) {
            print_clean("The number is even\n");
        } else {
            print_clean("The number is odd\n");
        }
    }
}
```

## Important Syntax Rules

### 1. No else-if Support
```aelang
// ❌ WRONG - This will cause syntax errors
if condition1 {
    // statements
} else if condition2 {  // NOT SUPPORTED
    // statements
}

// ✅ CORRECT - Use nested if statements
if condition1 {
    // statements
} else {
    if condition2 {
        // statements
    }
}
```

### 2. Function Parameter and Return Type Syntax
```aelang
// ✅ CORRECT ÆLang syntax
func add(a: i32, b: i32): i32 {
    return a + b;
}

// ❌ WRONG - Other language syntax
func add(a: i32, b: i32) -> i32 {  // NOT ÆLang syntax
    return a + b;
}
```

### 3. Variable Declaration Syntax
```aelang
// ✅ CORRECT
let variable: type = value;

// ❌ WRONG
int variable = value;     // C-style not supported
var variable = value;     // Go-style not supported
```

### 4. Semicolon Usage
- All statements end with semicolons `;`
- Function and control structure bodies are enclosed in braces `{}`

## Architecture Support
ÆLang supports both 32-bit and 64-bit compilation:

```bash
# Compile for 32-bit
aelang program.ae --arch32 -o program_32bit.asm

# Compile for 64-bit  
aelang program.ae --arch64 -o program_64bit.asm
```

## Best Practices

1. **Always specify types explicitly** in variable declarations
2. **Use descriptive function and variable names**
3. **Handle edge cases** in recursive functions
4. **Prefer explicit over implicit** type conversions
5. **Use nested if statements** instead of else-if chains
6. **Test on both 32-bit and 64-bit architectures** for compatibility

This reference covers all current ÆLang syntax. The language prioritizes simplicity, type safety, and cross-architecture compatibility.
