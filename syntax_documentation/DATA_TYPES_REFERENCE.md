# ÆLang Data Types Reference

## Overview
ÆLang provides a comprehensive type system designed for memory safety, performance, and predictability across different architectures.

## Integer Types

### Signed Integer Types

| Type | Size | Range | 32-bit Optimal | 64-bit Optimal |
|------|------|-------|----------------|----------------|
| `i8` | 8-bit | -128 to 127 | ✅ | ✅ |
| `i16` | 16-bit | -32,768 to 32,767 | ✅ | ✅ |
| `i32` | 32-bit | -2,147,483,648 to 2,147,483,647 | ⭐ Primary | ✅ |
| `i64` | 64-bit | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | ✅ | ⭐ Primary |

#### Usage Examples:
```aelang
// Boundary values
let i8_min: i8 = -128;
let i8_max: i8 = 127;

let i16_min: i16 = -32768;
let i16_max: i16 = 32767;

let i32_min: i32 = -2147483648;
let i32_max: i32 = 2147483647;

let i64_min: i64 = -9223372036854775808;
let i64_max: i64 = 9223372036854775807;

// Practical usage
let age: i8 = 25;                    // Age fits in small range
let population: i32 = 1000000;       // City population
let distance_nm: i64 = 384400000;    // Earth to Moon in meters
```

### Unsigned Integer Types

| Type | Size | Range | 32-bit Optimal | 64-bit Optimal |
|------|------|-------|----------------|----------------|
| `u8` | 8-bit | 0 to 255 | ✅ | ✅ |
| `u16` | 16-bit | 0 to 65,535 | ✅ | ✅ |
| `u32` | 32-bit | 0 to 4,294,967,295 | ⭐ Primary | ✅ |
| `u64` | 64-bit | 0 to 18,446,744,073,709,551,615 | ✅ | ⭐ Primary |

#### Usage Examples:
```aelang
// Boundary values
let u8_min: u8 = 0;
let u8_max: u8 = 255;

let u16_min: u16 = 0;
let u16_max: u16 = 65535;

let u32_min: u32 = 0;
let u32_max: u32 = 4294967295;

let u64_min: u64 = 0;
let u64_max: u64 = 18446744073709551615;

// Practical usage
let rgb_red: u8 = 255;              // Color component
let port_number: u16 = 8080;        // Network port
let file_size: u32 = 2048576;       // File size in bytes
let total_bytes: u64 = 1099511627776; // 1TB in bytes
```

## Floating Point Types

### IEEE 754 Compliance

| Type | Size | Precision | Range (Approximate) | 32-bit Optimal | 64-bit Optimal |
|------|------|-----------|---------------------|----------------|----------------|
| `f32` | 32-bit | ~6-7 decimal digits | ±1.2×10⁻³⁸ to ±3.4×10³⁸ | ⭐ Primary | ✅ |
| `f64` | 64-bit | ~15-16 decimal digits | ±2.3×10⁻³⁰⁸ to ±1.8×10³⁰⁸ | ✅ | ⭐ Primary |

#### Usage Examples:
```aelang
// f32 - Single precision
let f32_tiny: f32 = 0.00000001;         // Very small number
let f32_pi: f32 = 3.14159265;           // Pi (limited precision)
let f32_large: f32 = 999999999.0;       // Large number
let f32_precise: f32 = 16777216.0;      // Precision limit

// f64 - Double precision  
let f64_tiny: f64 = 2.2250738585072014e-308;    // Near minimum
let f64_pi: f64 = 3.141592653589793238;         // High precision pi
let f64_large: f64 = 1.7976931348623157e+308;   // Near maximum
let f64_precise: f64 = 123456789012345.0;       // Extended precision

// Precision comparison
let precision_f32: f32 = 1.234567890123456;     // Limited to ~7 digits
let precision_f64: f64 = 1.234567890123456789;  // ~16 digits precision
```

#### Precision Characteristics:
```aelang
// f32 precision limits
let f32_exact: f32 = 16777216.0;        // Last exactly representable integer
let f32_inexact: f32 = 16777217.0;      // May lose precision

// f64 extended precision
let f64_scientific: f64 = 1.23456789e-100;   // Scientific notation
let f64_decimal: f64 = 0.123456789012345;    // Many decimal places
```

## Other Primitive Types

### Boolean Type
```aelang
let bool_true: bool = true;              // Standard lowercase
let bool_false: bool = false;            // Standard lowercase
let bool_upper_true: bool = TRUE;        // Uppercase variant
let bool_upper_false: bool = FALSE;      // Uppercase variant
let bool_mixed_true: bool = True;        // Mixed case variant
let bool_mixed_false: bool = False;      // Mixed case variant
```

**Print Format:** `%t`
```aelang
print("Boolean value: %t\n", bool_true);  // Output: "Boolean value: true"
```

### Character Type
```aelang
let char_letter: char = 'A';             // ASCII letter
let char_digit: char = '9';              // ASCII digit
let char_symbol: char = '@';             // ASCII symbol
let char_space: char = ' ';              // Space character
let char_tab: char = '\t';               // Tab character (escape sequence)
let char_newline: char = '\n';           // Newline (escape sequence)
```

**Print Format:** `%c`
```aelang
print("Character: %c\n", 'X');          // Output: "Character: X"
print("Tab char: '%c'\n", '\t');        // Shows tab in quotes
```

### Flexible Numeric Type
```aelang
// Automatic type inference
let num_integer: num = 999999;           // Inferred as integer
let num_float: num = 2.71828;            // Inferred as floating-point
let num_scientific: num = 1230000.0;     // Large number notation

// Adapts to usage context
let num_calc1: num = 5;                  // Integer
let num_calc2: num = 2.5;                // Float
let num_result: num = num_calc1 * num_calc2; // Automatic promotion
```

**Print Format:** `%g` (general format)
```aelang
print("Flexible number: %g\n", num_float);  // Optimal format selection
```

## String Type
```aelang
let simple_string: str = "Hello World";
let path_string: str = "C:\\Program Files\\Application";
let message: str = "She said \"Hello!\"";
let multiline: str = "Line 1\nLine 2\nLine 3";
```

**Print Format:** `%s`
```aelang
print("Message: %s\n", "Hello ÆLang!");  // Output: "Message: Hello ÆLang!"
```

## Architecture-Specific Optimizations

### 32-bit Architecture (Default)
```aelang
// Optimal types for 32-bit systems
let optimal_int: i32 = 2147483647;       // Primary integer type
let optimal_uint: u32 = 4294967295;      // Primary unsigned type
let optimal_float: f32 = 3.14159265;     // Primary floating-point type

// Memory-efficient choices
let counter: u16 = 65535;                // Sufficient for most counters
let small_flags: u8 = 255;               // Bit flags or small values
```

### 64-bit Architecture (--arch64)
```aelang
// Extended precision types for 64-bit systems
let large_int: i64 = 9223372036854775807;    // Extended integer range
let large_uint: u64 = 18446744073709551615;  // Extended unsigned range
let precise_float: f64 = 3.141592653589793238; // Double precision

// High-precision calculations
let scientific: f64 = 6.02214076e+23;    // Avogadro's number
let nano_time: u64 = 1640995200000000000; // Nanosecond timestamp
```

## Type Conversion and Compatibility

### Implicit Conversions (Limited)
```aelang
// num type provides automatic inference
let auto1: num = 42;                     // Integer
let auto2: num = 3.14;                   // Float
let mixed: num = auto1 * auto2;          // Automatic promotion to float
```

### Explicit Type Usage
```aelang
// Specify exact types for predictable behavior
let precise_calc: f64 = 123.456789;      // Double precision required
let memory_addr: u64 = 0x7fff12345678;   // Memory address (64-bit systems)
let small_counter: u8 = 200;             // Space-efficient counter
```

## Format Specifier Reference

| Type | Format | Example | Output |
|------|--------|---------|--------|
| `i8`, `i16`, `i32` | `%d` | `print("%d", -42)` | `-42` |
| `i64` | `%ld` | `print("%ld", 123456789L)` | `123456789` |
| `u8`, `u16`, `u32` | `%u` | `print("%u", 42U)` | `42` |
| `u64` | `%lu` | `print("%lu", 999UL)` | `999` |
| `f32`, `f64` | `%f` | `print("%f", 3.14)` | `3.140000` |
| `num` | `%g` | `print("%g", 1.23e6)` | `1.23e+06` |
| `bool` | `%t` | `print("%t", true)` | `true` |
| `char` | `%c` | `print("%c", 'A')` | `A` |
| `str` | `%s` | `print("%s", "Hi")` | `Hi` |

## Best Practices

### Memory Efficiency
```aelang
// Choose appropriate size for data range
let age: u8 = 25;                        // 0-255 sufficient for human age
let year: u16 = 2024;                    // 0-65535 covers years
let population: u32 = 8000000000;        // Large numbers need u32/u64
```

### Precision Requirements
```aelang
// Use f32 for general floating-point work (32-bit systems)
let temperature: f32 = 98.6;             // Sufficient precision
let coordinate: f32 = 40.7128;           // GPS coordinate (basic precision)

// Use f64 for high-precision calculations
let scientific_constant: f64 = 6.02214076e+23;  // Avogadro's number
let financial_calc: f64 = 1234567.89;           // Financial precision
```

### Architecture Considerations
```aelang
// 32-bit optimized program
func calc_32bit(a: i32, b: f32): f32 {
    return a * b;                        // Native 32-bit operations
}

// 64-bit optimized program  
func calc_64bit(a: i64, b: f64): f64 {
    return a * b;                        // Extended precision operations
}
```

---

*Choose data types based on value range requirements, memory constraints, and target architecture for optimal performance and correctness.*
