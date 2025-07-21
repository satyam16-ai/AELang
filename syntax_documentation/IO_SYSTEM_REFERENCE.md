# ÆLang Universal I/O System Reference

## Overview
ÆLang features a universal I/O system with two main functions: `print()` for output and `read()` for input. This system eliminates the need for type-specific I/O functions by using format specifiers and type inference.

## Universal Print Function

### Declaration
```aelang
extern print(format: str, ...);
```

### Basic Usage
```aelang
print("Hello, World!\n");               // Simple string output
print("Value: %d\n", 42);               // Formatted output with integer
print("Multiple: %d, %f\n", 10, 3.14);  // Multiple values
```

## Format Specifiers Reference

### Integer Format Specifiers

#### Signed Integers
```aelang
let small: i8 = -128;
let medium: i16 = -32768;
let standard: i32 = -2147483648;
let large: i64 = -9223372036854775808;

print("i8: %d\n", small);               // %d for 8, 16, 32-bit signed
print("i16: %d\n", medium);             // %d for 8, 16, 32-bit signed  
print("i32: %d\n", standard);           // %d for 8, 16, 32-bit signed
print("i64: %ld\n", large);             // %ld for 64-bit signed integers
```

**Output:**
```
i8: -128
i16: -32768
i32: -2147483648
i64: -9223372036854775808
```

#### Unsigned Integers
```aelang
let tiny: u8 = 255;
let short: u16 = 65535;
let normal: u32 = 4294967295;
let big: u64 = 18446744073709551615;

print("u8: %u\n", tiny);                // %u for 8, 16, 32-bit unsigned
print("u16: %u\n", short);              // %u for 8, 16, 32-bit unsigned
print("u32: %u\n", normal);             // %u for 8, 16, 32-bit unsigned
print("u64: %lu\n", big);               // %lu for 64-bit unsigned integers
```

**Output:**
```
u8: 255
u16: 65535
u32: 4294967295
u64: 18446744073709551615
```

### Floating Point Format Specifiers

#### Basic Float Formatting
```aelang
let pi_f32: f32 = 3.14159265;
let pi_f64: f64 = 3.141592653589793238;

print("f32 pi: %f\n", pi_f32);          // %f for f32 and f64
print("f64 pi: %f\n", pi_f64);          // %f shows full precision available
```

**Output:**
```
f32 pi: 3.141593
f64 pi: 3.141593
```

#### Scientific Notation
```aelang
let large_num: f64 = 1.23456789e+100;
let small_num: f64 = 1.23456789e-100;

print("Large: %f\n", large_num);        // May show as 0 if too large
print("Small: %f\n", small_num);        // May show as 0 if too small
```

#### Flexible Numeric Type
```aelang
let num_int: num = 999999;
let num_float: num = 2.71828;
let num_scientific: num = 1230000.0;

print("num as int: %g\n", num_int);     // %g for optimal format selection
print("num as float: %g\n", num_float); // %g chooses best representation
print("num scientific: %g\n", num_scientific); // %g handles large numbers
```

**Output:**
```
num as int: 999999
num as float: 2.71828
num scientific: 1.23e+06
```

### Other Type Format Specifiers

#### Boolean Values
```aelang
let flag_true: bool = true;
let flag_false: bool = false;
let flag_upper: bool = TRUE;
let flag_mixed: bool = False;

print("Standard true: %t\n", flag_true);   // %t for boolean values
print("Standard false: %t\n", flag_false); // Outputs "true" or "false"
print("Upper TRUE: %t\n", flag_upper);     // Normalized to lowercase
print("Mixed False: %t\n", flag_mixed);    // Normalized to lowercase
```

**Output:**
```
Standard true: true
Standard false: false
Upper TRUE: true
Mixed False: false
```

#### Character Values
```aelang
let letter: char = 'A';
let digit: char = '9';
let symbol: char = '@';
let space: char = ' ';
let tab: char = '\t';

print("Letter: %c\n", letter);          // %c for single characters
print("Digit: %c\n", digit);            // Direct character output
print("Symbol: %c\n", symbol);          // Special characters
print("Space: '%c'\n", space);          // Space in quotes for visibility
print("Tab: '%c'\n", tab);              // Tab character (invisible)
```

**Output:**
```
Letter: A
Digit: 9
Symbol: @
Space: ' '
Tab: '	'
```

#### String Values
```aelang
let message: str = "Hello, ÆLang!";
let path: str = "C:\\Program Files";
let quoted: str = "She said \"Hi\"";

print("Message: %s\n", message);        // %s for string output
print("Path: %s\n", path);              // Escape sequences processed
print("Quoted: %s\n", quoted);          // Embedded quotes preserved
```

**Output:**
```
Message: Hello, ÆLang!
Path: C:\Program Files
Quoted: She said "Hi"
```

## Universal Read Function

### Declaration
```aelang
extern read();
```

### Type-Inferred Reading
The `read()` function automatically infers the target type based on the variable assignment:

#### Integer Reading
```aelang
let input_i8: i8 = read();              // Reads and converts to i8
let input_i16: i16 = read();            // Reads and converts to i16
let input_i32: i32 = read();            // Reads and converts to i32
let input_i64: i64 = read();            // Reads and converts to i64

let input_u8: u8 = read();              // Reads and converts to u8
let input_u16: u16 = read();            // Reads and converts to u16
let input_u32: u32 = read();            // Reads and converts to u32
let input_u64: u64 = read();            // Reads and converts to u64
```

#### Floating Point Reading
```aelang
let input_f32: f32 = read();            // Reads and converts to f32
let input_f64: f64 = read();            // Reads and converts to f64
let input_num: num = read();             // Reads with automatic inference
```

#### Other Type Reading
```aelang
let input_bool: bool = read();          // Reads boolean (true/false/1/0)
let input_char: char = read();          // Reads single character
```

### Interactive Input Examples

#### Simple Calculator
```aelang
extern print(format: str, ...);
extern read();

func main(): void {
    print("Enter first number: ");
    let a: f64 = read();                 // User enters: 3.14
    
    print("Enter second number: ");
    let b: f64 = read();                 // User enters: 2.71
    
    let sum: f64 = a + b;
    print("Sum: %f\n", sum);             // Output: Sum: 5.850000
}
```

#### Type-Specific Input
```aelang
extern print(format: str, ...);
extern read();

func test_input(): void {
    print("Enter your age (0-255): ");
    let age: u8 = read();                // Optimized for small range
    
    print("Enter your height in cm: ");
    let height: u16 = read();            // Sufficient for height in cm
    
    print("Enter your income: ");
    let income: u32 = read();            // Large range for financial data
    
    print("Enter precise measurement: ");
    let measurement: f64 = read();        // High precision floating point
    
    print("Are you a student (true/false): ");
    let is_student: bool = read();       // Boolean input
    
    print("Enter your grade (A-F): ");
    let grade: char = read();            // Single character
    
    // Output all values
    print("Age: %u, Height: %u cm, Income: %u\n", age, height, income);
    print("Measurement: %f, Student: %t, Grade: %c\n", 
          measurement, is_student, grade);
}

func main(): void {
    test_input();
}
```

## Advanced Formatting Examples

### Mixed Data Types
```aelang
func demo_mixed_output(): void {
    let name: str = "Alice";
    let age: u8 = 25;
    let height: f32 = 5.6;
    let is_student: bool = true;
    let grade: char = 'A';
    
    // Single line with multiple types
    print("Name: %s, Age: %u, Height: %f ft, Student: %t, Grade: %c\n",
          name, age, height, is_student, grade);
    
    // Formatted output with alignment
    print("Student Profile:\n");
    print("  Name:     %s\n", name);
    print("  Age:      %u years\n", age);
    print("  Height:   %f feet\n", height);
    print("  Student:  %t\n", is_student);
    print("  Grade:    %c\n", grade);
}
```

**Output:**
```
Name: Alice, Age: 25, Height: 5.600000 ft, Student: true, Grade: A
Student Profile:
  Name:     Alice
  Age:      25 years
  Height:   5.600000 feet
  Student:  true
  Grade:    A
```

### Numeric Precision Display
```aelang
func demo_precision(): void {
    let f32_pi: f32 = 3.14159265359;
    let f64_pi: f64 = 3.14159265358979323846;
    
    print("f32 precision (7 digits): %f\n", f32_pi);   // Limited precision
    print("f64 precision (15+ digits): %f\n", f64_pi); // Extended precision
    
    // Large numbers
    let f32_large: f32 = 16777216.0;
    let f32_too_large: f32 = 16777217.0;    // May lose precision
    
    print("f32 exact: %f\n", f32_large);
    print("f32 inexact: %f\n", f32_too_large);
    
    // Scientific notation with num type
    let scientific: num = 1230000.0;
    print("Scientific: %g\n", scientific);
}
```

### Architecture-Specific I/O

#### 32-bit Optimized I/O
```aelang
func io_32bit(): void {
    print("=== 32-bit Optimized I/O ===\n");
    
    print("Enter standard integer: ");
    let std_int: i32 = read();           // Primary 32-bit type
    
    print("Enter standard float: ");
    let std_float: f32 = read();         // Primary 32-bit float
    
    print("Results - i32: %d, f32: %f\n", std_int, std_float);
}
```

#### 64-bit Extended I/O
```aelang
func io_64bit(): void {
    print("=== 64-bit Extended I/O ===\n");
    
    print("Enter large integer: ");
    let large_int: i64 = read();         // Extended precision integer
    
    print("Enter precise float: ");
    let precise_float: f64 = read();     // Double precision float
    
    print("Results - i64: %ld, f64: %f\n", large_int, precise_float);
}
```

## Error Handling and Input Validation

### Boolean Input Variations
```aelang
// read() accepts various boolean formats:
// true, false, TRUE, FALSE, True, False
// 1, 0 (numeric boolean)

print("Enter boolean (true/false/1/0): ");
let flag: bool = read();
print("You entered: %t\n", flag);
```

### Character Input
```aelang
// read() for char takes first character of input
print("Enter any character: ");
let ch: char = read();                   // Takes first char only
print("First character was: %c\n", ch);
```

### Numeric Range Considerations
```aelang
// Input values are validated against type ranges
print("Enter small number (0-255): ");
let small: u8 = read();                  // Automatically clamped to u8 range

print("Enter large number: ");
let large: i64 = read();                 // Full 64-bit range available

print("Small: %u, Large: %ld\n", small, large);
```

## Best Practices

### Clear User Prompts
```aelang
// Always provide clear input instructions
print("Enter temperature in Celsius (-273.15 to 1000.0): ");
let temp: f32 = read();

print("Enter year (1900-2100): ");
let year: u16 = read();

print("Enter your initial (single letter): ");
let initial: char = read();
```

### Efficient Type Selection
```aelang
// Choose appropriate types for expected input ranges
print("Enter age: ");
let age: u8 = read();                    // 0-255 sufficient for age

print("Enter file size in bytes: ");
let filesize: u64 = read();              // Large files need u64

print("Enter GPS coordinate: ");
let coordinate: f64 = read();            // High precision for coordinates
```

### Format Specifier Matching
```aelang
// Always match format specifiers to variable types
let count: u32 = 1000;
print("Count: %u\n", count);            // %u for unsigned 32-bit

let distance: i64 = 384400000;
print("Distance: %ld meters\n", distance); // %ld for signed 64-bit

let precision: f64 = 3.141592653589793;
print("Pi: %f\n", precision);           // %f for floating point
```

---

*The Universal I/O system provides type-safe, efficient input/output operations suitable for both 32-bit and 64-bit architectures while maintaining code simplicity and readability.*
