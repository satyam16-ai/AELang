# ÆLang Function System Reference

## Overview
ÆLang supports both user-defined functions and external function declarations. Functions provide modular code organization, parameter passing, and return values with strong type safety.

## Function Declaration Syntax

### Basic Function Structure
```aelang
func function_name(parameter1: type1, parameter2: type2): return_type {
    // Function body
    return value;  // If return_type is not void
}
```

### Components Explained
- `func` - Function declaration keyword
- `function_name` - Function identifier (snake_case convention)
- `(parameters)` - Parameter list with types
- `: return_type` - Return type specification  
- `{}` - Function body block
- `return` - Return statement (optional for void functions)

## Function Types

### Void Functions (No Return Value)
```aelang
func greet_user(name: str): void {
    print("Hello, %s!\n", name);
    print("Welcome to ÆLang!\n");
    // No return statement needed
}

func print_separator(): void {
    print("=" * 50);
    print("\n");
}

func display_info(age: u8, height: f32): void {
    print("Age: %u years\n", age);
    print("Height: %f feet\n", height);
}
```

### Functions with Return Values
```aelang
// Simple arithmetic function
func add(a: i32, b: i32): i32 {
    return a + b;
}

// Floating point calculation
func calculate_area(width: f32, height: f32): f32 {
    return width * height;
}

// Boolean logic function
func is_even(number: i32): bool {
    return (number % 2) == 0;
}

// String manipulation (conceptual - full string ops may be limited)
func get_greeting(): str {
    return "Hello from ÆLang!";
}
```

### Functions with Mixed Parameter Types
```aelang
// Multiple parameter types
func calculate_bmi(weight_kg: f32, height_m: f32): f32 {
    return weight_kg / (height_m * height_m);
}

// Different integer sizes
func process_data(id: u16, count: u32, timestamp: u64): void {
    print("Processing ID: %u\n", id);
    print("Count: %u\n", count);
    print("Timestamp: %lu\n", timestamp);
}

// Mixed numeric types
func convert_temperature(celsius: f64, scale: char): f64 {
    if (scale == 'F') {  // Basic conditional (implementation varies)
        return celsius * 9.0 / 5.0 + 32.0;
    }
    return celsius;  // Default return Celsius
}
```

## External Function Declarations

### External Function Syntax
```aelang
extern function_name(parameter1: type1, parameter2: type2, ...);
```

### Standard External Functions
```aelang
// Universal I/O functions
extern print(format: str, ...);         // Variadic print function
extern read();                          // Universal read function

// Usage in program
func main(): void {
    print("Enter your name: ");
    let name: str = read();              // Type inference for read()
    print("Hello, %s!\n", name);
}
```

### Custom External Function Examples
```aelang
// Mathematical functions (if available in runtime)
extern sqrt(x: f64): f64;
extern sin(x: f64): f64;
extern cos(x: f64): f64;

// Usage
func calculate_hypotenuse(a: f64, b: f64): f64 {
    let sum_squares: f64 = a * a + b * b;
    return sqrt(sum_squares);
}

// System functions (platform dependent)
extern get_time(): u64;
extern sleep(seconds: u32): void;

func timed_operation(): void {
    let start: u64 = get_time();
    // Perform some operation
    sleep(1);                            // Wait 1 second
    let end: u64 = get_time();
    print("Operation took %lu time units\n", end - start);
}
```

## Function Parameters

### Parameter Passing
```aelang
// Parameters are passed by value
func modify_value(x: i32): i32 {
    x = x + 10;                          // Modifies local copy only
    return x;
}

func main(): void {
    let original: i32 = 5;
    let result: i32 = modify_value(original);
    print("Original: %d, Result: %d\n", original, result);
    // Output: Original: 5, Result: 15
}
```

### Multiple Parameters
```aelang
func calculate_compound_interest(
    principal: f64, 
    rate: f64, 
    time: u16, 
    compounds_per_year: u8
): f64 {
    let rate_per_period: f64 = rate / compounds_per_year;
    let total_periods: u16 = time * compounds_per_year;
    
    // Simplified calculation (actual implementation may vary)
    let amount: f64 = principal * (1.0 + rate_per_period) * total_periods;
    return amount;
}

func main(): void {
    let final_amount: f64 = calculate_compound_interest(1000.0, 0.05, 10, 12);
    print("Final amount: $%f\n", final_amount);
}
```

### Parameter Type Variety
```aelang
// Function using all major types
func comprehensive_function(
    small_int: i8,
    large_int: i64,
    unsigned_val: u32,
    float_val: f32,
    double_val: f64,
    flag: bool,
    character: char,
    flexible: num
): void {
    print("i8: %d\n", small_int);
    print("i64: %ld\n", large_int);
    print("u32: %u\n", unsigned_val);
    print("f32: %f\n", float_val);
    print("f64: %f\n", double_val);
    print("bool: %t\n", flag);
    print("char: %c\n", character);
    print("num: %g\n", flexible);
}

func main(): void {
    comprehensive_function(
        -128,                            // i8
        9223372036854775807,             // i64
        4294967295,                      // u32
        3.14159,                         // f32
        2.718281828459045,               // f64
        true,                            // bool
        'X',                             // char
        42.0                             // num
    );
}
```

## Function Calls and Return Values

### Basic Function Calls
```aelang
func square(x: i32): i32 {
    return x * x;
}

func cube(x: i32): i32 {
    return x * x * x;
}

func main(): void {
    let number: i32 = 5;
    
    // Direct function calls
    let squared: i32 = square(number);
    let cubed: i32 = cube(number);
    
    print("Number: %d\n", number);
    print("Squared: %d\n", squared);
    print("Cubed: %d\n", cubed);
    
    // Nested function calls
    let square_of_cube: i32 = square(cube(3));
    print("Square of cube of 3: %d\n", square_of_cube);
}
```

### Function Calls in Expressions
```aelang
func add(a: i32, b: i32): i32 {
    return a + b;
}

func multiply(a: i32, b: i32): i32 {
    return a * b;
}

func main(): void {
    let x: i32 = 3;
    let y: i32 = 4;
    let z: i32 = 5;
    
    // Functions in arithmetic expressions
    let result1: i32 = add(x, y) * z;
    let result2: i32 = multiply(add(x, y), z);
    let result3: i32 = add(multiply(x, y), z);
    
    print("add(x,y) * z = %d\n", result1);           // (3+4)*5 = 35
    print("multiply(add(x,y), z) = %d\n", result2);  // (3+4)*5 = 35
    print("add(multiply(x,y), z) = %d\n", result3);  // (3*4)+5 = 17
}
```

## Advanced Function Examples

### Mathematical Functions
```aelang
// Factorial function (iterative approach)
func factorial(n: u32): u64 {
    let result: u64 = 1;
    let i: u32 = 1;
    
    // Simple loop implementation (syntax may vary)
    while (i <= n) {
        result = result * i;
        i = i + 1;
    }
    
    return result;
}

// Power function
func power(base: f64, exponent: u32): f64 {
    let result: f64 = 1.0;
    let i: u32 = 0;
    
    while (i < exponent) {
        result = result * base;
        i = i + 1;
    }
    
    return result;
}

// Maximum of two numbers
func max_i32(a: i32, b: i32): i32 {
    if (a > b) {
        return a;
    }
    return b;
}

// Minimum of two numbers
func min_f64(a: f64, b: f64): f64 {
    if (a < b) {
        return a;
    }
    return b;
}
```

### Utility Functions
```aelang
// Conversion functions
func celsius_to_fahrenheit(celsius: f32): f32 {
    return celsius * 9.0 / 5.0 + 32.0;
}

func fahrenheit_to_celsius(fahrenheit: f32): f32 {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
}

// Validation functions
func is_valid_age(age: u8): bool {
    return age >= 0 && age <= 150;       // Reasonable age range
}

func is_leap_year(year: u16): bool {
    // Simplified leap year calculation
    return (year % 4 == 0);              // Basic rule (simplified)
}

// Formatting functions
func format_currency(amount: f64): void {
    print("$%.2f\n", amount);            // Note: precision control may vary
}

func format_percentage(ratio: f64): void {
    let percentage: f64 = ratio * 100.0;
    print("%.1f%%\n", percentage);       // Note: precision control may vary
}
```

### Interactive Functions
```aelang
func get_user_age(): u8 {
    print("Enter your age (0-255): ");
    let age: u8 = read();
    return age;
}

func get_user_height(): f32 {
    print("Enter your height in feet: ");
    let height: f32 = read();
    return height;
}

func calculate_and_display_bmi(): void {
    print("BMI Calculator\n");
    print("Enter weight in kg: ");
    let weight: f32 = read();
    
    print("Enter height in meters: ");
    let height: f32 = read();
    
    let bmi: f32 = weight / (height * height);
    print("Your BMI is: %f\n", bmi);
}
```

## Function Organization Patterns

### Main Function with Helpers
```aelang
extern print(format: str, ...);
extern read();

func display_menu(): void {
    print("\n=== Calculator Menu ===\n");
    print("1. Add\n");
    print("2. Subtract\n");
    print("3. Multiply\n");
    print("4. Divide\n");
    print("Enter choice (1-4): ");
}

func get_numbers(a: f64, b: f64): void {
    print("Enter first number: ");
    a = read();
    print("Enter second number: ");
    b = read();
}

func perform_calculation(choice: u8, a: f64, b: f64): f64 {
    if (choice == 1) {
        return a + b;
    } else if (choice == 2) {
        return a - b;
    } else if (choice == 3) {
        return a * b;
    } else if (choice == 4) {
        if (b != 0.0) {
            return a / b;
        }
        print("Error: Division by zero!\n");
        return 0.0;
    }
    return 0.0;
}

func main(): void {
    display_menu();
    let choice: u8 = read();
    
    let num1: f64 = 0.0;
    let num2: f64 = 0.0;
    get_numbers(num1, num2);
    
    let result: f64 = perform_calculation(choice, num1, num2);
    print("Result: %f\n", result);
}
```

## Architecture-Specific Function Considerations

### 32-bit Optimized Functions
```aelang
// Functions optimized for 32-bit architecture
func process_32bit_data(count: u32, value: f32): f32 {
    let result: f32 = 0.0;
    let i: u32 = 0;
    
    while (i < count) {
        result = result + value;
        i = i + 1;
    }
    
    return result;
}
```

### 64-bit Extended Precision Functions  
```aelang
// Functions utilizing 64-bit extended precision
func process_large_dataset(records: u64, precision_value: f64): f64 {
    let accumulator: f64 = 0.0;
    let index: u64 = 0;
    
    while (index < records) {
        accumulator = accumulator + precision_value;
        index = index + 1;
    }
    
    return accumulator / records;  // Average calculation
}
```

## Best Practices

### Function Naming
```aelang
// Use descriptive names
func calculate_monthly_payment(principal: f64, rate: f64, months: u16): f64 {
    // Implementation
    return 0.0;
}

// Use verb-noun pattern for actions
func convert_temperature(temp: f32, from_unit: char, to_unit: char): f32 {
    // Implementation
    return temp;
}

// Use is/has/can prefix for boolean functions
func is_prime_number(n: u32): bool {
    // Implementation
    return true;
}
```

### Parameter Organization
```aelang
// Group related parameters
func create_rectangle(width: f32, height: f32, x: f32, y: f32): void {
    // Implementation
}

// Use appropriate types for parameter ranges
func set_rgb_color(red: u8, green: u8, blue: u8): void {
    // u8 perfect for 0-255 color values
}

// Use meaningful parameter names
func transfer_funds(from_account: u32, to_account: u32, amount: f64): bool {
    // Implementation
    return true;
}
```

### Return Value Patterns
```aelang
// Single responsibility functions
func get_area(radius: f64): f64 {
    return 3.14159 * radius * radius;
}

// Error indication through return values
func divide_safe(a: f64, b: f64): f64 {
    if (b == 0.0) {
        return -1.0;  // Error indicator
    }
    return a / b;
}

// Boolean success indicators
func validate_input(value: i32): bool {
    return value >= 0 && value <= 100;
}
```

---

*Functions in ÆLang provide powerful abstraction and code organization capabilities while maintaining type safety and performance across different architectures.*
