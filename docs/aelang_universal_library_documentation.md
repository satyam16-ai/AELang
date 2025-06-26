# ÆLang Universal C Library Documentation

## Table of Contents
1. [Overview](#overview)
2. [Basic Output Functions](#basic-output-functions)
3. [Enhanced Number Formatting Functions](#enhanced-number-formatting-functions)
4. [Enhanced Input Functions](#enhanced-input-functions)
5. [Legacy Functions](#legacy-functions)
6. [Usage Examples](#usage-examples)
7. [Integration Guide](#integration-guide)
8. [Best Practices](#best-practices)

---

## Overview

The ÆLang Universal C Library (`aelang_universal.c`) is a consolidated collection of input/output functions designed specifically for the ÆLang programming language. This library provides robust, professional-grade functions for mathematical computing, user interaction, and data presentation.

### Key Features
- **Smart number formatting** with automatic precision detection
- **Robust input validation** with comprehensive error handling
- **Professional formatting options** including scientific notation, currency, and engineering formats
- **Universal `num` type support** for seamless integer/float operations
- **Production-ready reliability** with proper error handling and memory management

### Library Structure
```
aelang_universal.c
├── Basic Output Functions
├── Enhanced Number Formatting Functions
├── Enhanced Input Functions
└── Legacy Functions (for compatibility)
```

---

## Basic Output Functions

### `print(const char *str)`
**Purpose**: Basic string output with automatic newline  
**Parameters**: 
- `str`: Null-terminated string to print
**Return**: `void`
**Usage**: Standard text output for messages and labels

```c
extern print(msg: i32);
```

**Example**:
```aelang
print("Welcome to ÆLang Calculator!");
// Output: Welcome to ÆLang Calculator!
//         [newline]
```

### `print_clean(const char *str)`
**Purpose**: String output without automatic newline  
**Parameters**: 
- `str`: Null-terminated string to print
**Return**: `void`
**Usage**: Inline text output for building formatted displays

```c
extern print_clean(msg: i32);
```

**Example**:
```aelang
print_clean("Result: ");
print_num(42.5);
// Output: Result: 42.50
```

---

## Enhanced Number Formatting Functions

### `print_num(float value)`
**Purpose**: Smart number formatting with automatic precision detection  
**Parameters**: 
- `value`: Floating-point number to display
**Return**: `void`
**Behavior**: 
- Integers display without decimal places (e.g., `42`)
- Floating-point numbers display with 2 decimal places (e.g., `42.50`)

```c
extern print_num(val: f32);
```

**Examples**:
```aelang
print_num(100.0);    // Output: 100
print_num(3.14159);  // Output: 3.14
print_num(42.0);     // Output: 42
```

### `print_num_precision(float value, int precision)`
**Purpose**: Number formatting with custom precision control  
**Parameters**: 
- `value`: Number to display
- `precision`: Decimal places (0-6, or -1 for auto)
**Return**: `void`

```c
extern print_num_precision(val: f32, precision: i32);
```

**Examples**:
```aelang
print_num_precision(3.14159, 4);  // Output: 3.1416
print_num_precision(100.0, 0);    // Output: 100
print_num_precision(42.5, -1);    // Output: 42.50 (auto)
```

### `print_num_scientific(float value)`
**Purpose**: Scientific notation formatting  
**Parameters**: 
- `value`: Number to display in scientific notation
**Return**: `void`

```c
extern print_num_scientific(val: f32);
```

**Examples**:
```aelang
print_num_scientific(1234.56);    // Output: 1.23e+03
print_num_scientific(0.000123);   // Output: 1.23e-04
```

### `print_currency(float value)`
**Purpose**: Currency formatting with dollar symbol  
**Parameters**: 
- `value`: Monetary amount to display
**Return**: `void`

```c
extern print_currency(val: f32);
```

**Examples**:
```aelang
print_currency(1234.56);  // Output: $1234.56
print_currency(99.9);     // Output: $99.90
```

### `print_percentage(float value)`
**Purpose**: Percentage formatting with percent symbol  
**Parameters**: 
- `value`: Percentage value to display
**Return**: `void`

```c
extern print_percentage(val: f32);
```

**Examples**:
```aelang
print_percentage(85.5);   // Output: 85.5%
print_percentage(100.0);  // Output: 100.0%
```

### `print_num_engineering(float value)`
**Purpose**: Engineering notation with K/M suffixes  
**Parameters**: 
- `value`: Number to display in engineering format
**Return**: `void`
**Behavior**:
- Values ≥ 1,000,000: Display with 'M' suffix
- Values ≥ 1,000: Display with 'K' suffix
- Values < 1,000: Display normally

```c
extern print_num_engineering(val: f32);
```

**Examples**:
```aelang
print_num_engineering(1500000);  // Output: 1.50M
print_num_engineering(2500);     // Output: 2.50K
print_num_engineering(750);      // Output: 750.00
```

### `print_hex(float value)`
**Purpose**: Hexadecimal representation of integer portion  
**Parameters**: 
- `value`: Number to display in hexadecimal
**Return**: `void`

```c
extern print_hex(val: f32);
```

**Examples**:
```aelang
print_hex(255.0);  // Output: 0xFF
print_hex(16.0);   // Output: 0x10
```

### `print_binary(float value)`
**Purpose**: Binary representation with grouping  
**Parameters**: 
- `value`: Number to display in binary
**Return**: `void`

```c
extern print_binary(val: f32);
```

**Examples**:
```aelang
print_binary(15.0);  // Output: 0b0000_0000_0000_0000_0000_0000_0000_1111
```

---

## Enhanced Input Functions

### `read_num_safe()`
**Purpose**: Robust number input with comprehensive validation  
**Parameters**: None
**Return**: `float` - Validated numeric input
**Features**:
- Input validation for numeric characters
- Error handling for invalid input
- Automatic retry on invalid input
- Range checking for overflow/underflow
- Buffer overflow protection

```c
extern read_num_safe();
```

**Example**:
```aelang
print("Enter a number: ");
let value: num = read_num_safe();
// Handles: "42", "3.14", "-17.5", "0", etc.
// Rejects: "abc", "12.34.56", "", etc.
```

### `read_num()`
**Purpose**: Basic number input  
**Parameters**: None
**Return**: `float` - Numeric input (0.0 on error)

```c
extern read_num();
```

### `read_num_validated()`
**Purpose**: Alias for `read_num_safe()`  
**Parameters**: None
**Return**: `float` - Validated numeric input

```c
extern read_num_validated();
```

### `read_num_with_prompt(const char* prompt)`
**Purpose**: Number input with custom prompt message  
**Parameters**: 
- `prompt`: Custom prompt string
**Return**: `float` - Validated numeric input

```c
extern read_num_with_prompt(prompt: i32);
```

### `read_positive_num()`
**Purpose**: Input validation for positive numbers only  
**Parameters**: None
**Return**: `float` - Positive numeric input
**Behavior**: Continues prompting until a positive number is entered

```c
extern read_positive_num();
```

**Example**:
```aelang
let radius: num = read_positive_num();
// Accepts: 5.0, 1.23, 0.1
// Rejects: -1, 0, -5.5 (continues prompting)
```

### `read_integer_only()`
**Purpose**: Input validation for whole numbers only  
**Parameters**: None
**Return**: `float` - Whole number input
**Behavior**: Continues prompting until a whole number is entered

```c
extern read_integer_only();
```

**Example**:
```aelang
let count: num = read_integer_only();
// Accepts: 5, 42, -3
// Rejects: 3.14, 2.5, 1.1 (continues prompting)
```

---

## Legacy Functions

### Deprecated Output Functions
These functions are maintained for backward compatibility but are not recommended for new code:

#### `print_float(float value)`
**Status**: ⚠️ Deprecated - Use `print_num()` instead  
**Purpose**: Legacy float printing with fixed precision

#### `print_int(int value)`
**Status**: ⚠️ Deprecated - Use `print_num()` instead  
**Purpose**: Legacy integer printing

### Deprecated Input Functions

#### `read_int()`
**Status**: ⚠️ Deprecated - Use `read_num_safe()` instead  
**Purpose**: Legacy integer input

#### `read_float()`
**Status**: ⚠️ Deprecated - Use `read_num_safe()` instead  
**Purpose**: Legacy float input

---

## Usage Examples

### Basic Calculator Example
```aelang
extern print(msg: i32);
extern print_clean(msg: i32);
extern print_num(val: f32);
extern read_num_safe();

func main(): void {
    print("Simple Calculator");
    
    print_clean("Enter first number: ");
    let a: num = read_num_safe();
    
    print_clean("Enter second number: ");
    let b: num = read_num_safe();
    
    let sum: num = a + b;
    
    print_clean("Result: ");
    print_num(a);
    print_clean(" + ");
    print_num(b);
    print_clean(" = ");
    print_num(sum);
    print("");
}
```

### Financial Calculator Example
```aelang
extern print(msg: i32);
extern print_clean(msg: i32);
extern print_currency(val: f32);
extern print_percentage(val: f32);
extern read_positive_num();

func main(): void {
    print("Loan Calculator");
    
    print("Enter loan amount: $");
    let principal: num = read_positive_num();
    
    print("Enter interest rate (%): ");
    let rate: num = read_positive_num();
    
    let monthly_payment: num = (principal * rate) / 1200.0;
    
    print_clean("Monthly payment: ");
    print_currency(monthly_payment);
    print("");
}
```

### Scientific Calculator Example
```aelang
extern print(msg: i32);
extern print_num_scientific(val: f32);
extern print_num_engineering(val: f32);
extern read_num_safe();

func main(): void {
    print("Scientific Notation Demo");
    
    print("Enter a number: ");
    let value: num = read_num_safe();
    
    print_clean("Scientific: ");
    print_num_scientific(value);
    print("");
    
    print_clean("Engineering: ");
    print_num_engineering(value);
    print("");
}
```

---

## Integration Guide

### 1. External Function Declarations
At the top of your ÆLang file, declare the functions you need:

```aelang
// Basic functions
extern print(msg: i32);
extern print_clean(msg: i32);
extern print_num(val: f32);
extern read_num_safe();

// Advanced formatting (optional)
extern print_num_precision(val: f32, precision: i32);
extern print_currency(val: f32);
extern print_percentage(val: f32);
extern print_num_scientific(val: f32);
extern print_num_engineering(val: f32);

// Specialized input (optional)
extern read_positive_num();
extern read_integer_only();
```

### 2. Build System Integration
The library is automatically compiled and linked by the ÆLang build system:

```bash
./build.sh your_program.ae
```

### 3. Variable Type Usage
Use the `num` type for maximum compatibility:

```aelang
let value: num = read_num_safe();    // Universal numeric type
let result: num = value * 2.5;       // Automatic type handling
print_num(result);                   // Smart formatting
```

---

## Best Practices

### Input Handling
1. **Always use `read_num_safe()`** for user input instead of legacy functions
2. **Use specialized input functions** when validation is needed:
   - `read_positive_num()` for values that must be positive
   - `read_integer_only()` for whole numbers only
3. **Provide clear prompts** for user guidance

### Output Formatting
1. **Use `print_num()`** for general numeric output (auto-formats)
2. **Use `print_clean()`** for inline text without newlines
3. **Choose appropriate format functions**:
   - `print_currency()` for monetary values
   - `print_percentage()` for rates and percentages
   - `print_num_scientific()` for very large or small numbers
   - `print_num_engineering()` for technical applications

### Code Organization
1. **Declare only needed functions** to keep code clean
2. **Use consistent variable naming** with the `num` type
3. **Group related functionality** together in your code

### Error Prevention
1. **Always validate user input** using the safe input functions
2. **Handle edge cases** like division by zero
3. **Test with various input types** including edge values

---

## Function Quick Reference

| Function | Purpose | Input Parameters | Output Format |
|----------|---------|------------------|---------------|
| `print()` | Basic text output | string | text + newline |
| `print_clean()` | Inline text output | string | text only |
| `print_num()` | Smart number format | float | auto-precision |
| `print_currency()` | Money format | float | $XX.XX |
| `print_percentage()` | Percent format | float | XX.X% |
| `print_num_scientific()` | Scientific notation | float | X.XXe±XX |
| `print_num_engineering()` | Engineering format | float | X.XXK/M |
| `read_num_safe()` | Robust input | none | validated float |
| `read_positive_num()` | Positive input | none | positive float |
| `read_integer_only()` | Whole number input | none | integer float |

---

*This documentation covers the complete ÆLang Universal C Library as implemented in `aelang_universal.c`. For the latest updates and examples, refer to the example programs in the `/examples` directory.*
