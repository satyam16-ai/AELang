# ÆLang Universal Library Technical Reference

## Implementation Details and Advanced Usage

### Table of Contents
1. [Library Architecture](#library-architecture)
2. [Function Implementation Analysis](#function-implementation-analysis)
3. [Memory Management](#memory-management)
4. [Error Handling Strategies](#error-handling-strategies)
5. [Performance Considerations](#performance-considerations)
6. [Advanced Usage Patterns](#advanced-usage-patterns)
7. [Troubleshooting Guide](#troubleshooting-guide)

---

## Library Architecture

### Design Philosophy
The ÆLang Universal Library follows these core principles:
- **Consolidation**: All functions in a single file for maintainability
- **Robustness**: Comprehensive error handling and input validation
- **Performance**: Optimized for mathematical computing applications
- **Compatibility**: Backward compatibility with legacy functions

### File Structure
```
aelang_universal.c
├── Header Includes (stdio.h, stdlib.h, string.h, ctype.h, math.h)
├── Basic Output Functions (lines 17-28)
├── Enhanced Number Formatting (lines 33-109)
├── Legacy Output Functions (lines 114-125)
├── Enhanced Input Functions (lines 130-230)
└── Legacy Input Functions (lines 235-274)
```

### Compilation Integration
The library is compiled as part of the ÆLang build process:
```bash
# Automatic compilation in build.sh
gcc -c c_libs/aelang_universal.c -o build/aelang_universal.o
```

---

## Function Implementation Analysis

### Smart Formatting Logic (`print_num`)
```c
void print_num(float value) {
    if (value == (int)value) {
        printf("%.0f", value);      // Integer display
    } else {
        printf("%.2f", value);      // Float display with 2 decimals
    }
    fflush(stdout);
}
```

**Key Features**:
- Automatic integer detection using type casting comparison
- Consistent 2-decimal precision for floats
- Immediate output flushing for interactive applications

### Input Validation (`read_num_safe`)
```c
float read_num_safe() {
    char buffer[256];
    float value;
    int valid = 0;
    
    while (!valid) {
        // Input reading with fgets
        // Character-by-character validation
        // Range checking with isfinite() and isnan()
        // Automatic retry on invalid input
    }
    
    return value;
}
```

**Validation Steps**:
1. **Buffer Management**: 256-character buffer prevents overflow
2. **Character Validation**: Checks digits, decimal points, and signs
3. **Format Parsing**: Uses `sscanf()` for safe conversion
4. **Range Validation**: Prevents infinity and NaN values
5. **Error Recovery**: Automatic retry with clear error messages

### Engineering Notation Logic
```c
void print_num_engineering(float value) {
    if (fabs(value) >= 1000000) {
        printf("%.2fM", value / 1000000);
    } else if (fabs(value) >= 1000) {
        printf("%.2fK", value / 1000);
    } else {
        printf("%.2f", value);
    }
    fflush(stdout);
}
```

**Scaling Logic**:
- Millions (M): Values ≥ 1,000,000
- Thousands (K): Values ≥ 1,000
- Standard: Values < 1,000

---

## Memory Management

### Buffer Safety
All input functions use fixed-size buffers with proper bounds checking:
```c
char buffer[256];  // Safe input buffer size
buffer[strcspn(buffer, "\n")] = 0;  // Safe newline removal
```

### Input Stream Management
```c
// Clear input buffer after reading
int c;
while ((c = getchar()) != '\n' && c != EOF);
```

### Memory Allocation
- **No dynamic allocation**: All functions use stack-based memory
- **Fixed buffer sizes**: Prevents memory leaks and corruption
- **Automatic cleanup**: Stack variables automatically managed

---

## Error Handling Strategies

### Input Error Categories

#### 1. Invalid Characters
```
Error: Invalid character 'x'. Please enter a valid number:
```
**Triggers**: Non-numeric characters in input
**Recovery**: Automatic retry with clear error message

#### 2. Empty Input
```
Error: Empty input. Please enter a number:
```
**Triggers**: User presses Enter without typing
**Recovery**: Immediate re-prompt

#### 3. Range Errors
```
Error: Number out of range. Please try again:
```
**Triggers**: Values that would cause overflow/underflow
**Recovery**: Re-prompt with validation

#### 4. Format Errors
```
Error: Could not parse number. Please try again:
```
**Triggers**: Complex parsing failures
**Recovery**: Safe fallback with retry

### Error Handling Best Practices
1. **Never crash**: All errors result in re-prompts, not crashes
2. **Clear messaging**: Specific error descriptions for user guidance
3. **Graceful recovery**: Automatic retry mechanisms
4. **Data integrity**: Invalid input never corrupts program state

---

## Performance Considerations

### Output Performance
- **Immediate flushing**: `fflush(stdout)` ensures immediate display
- **Minimal formatting**: Efficient printf format strings
- **No unnecessary allocations**: Direct string output

### Input Performance
- **Single-pass validation**: Character validation during reading
- **Efficient parsing**: Minimal string manipulation
- **Buffer reuse**: Fixed buffers prevent allocation overhead

### Mathematical Operations
- **FPU optimized**: Direct floating-point operations
- **Type-aware**: Automatic int/float detection minimizes conversions
- **Range optimized**: Engineering notation reduces display complexity

---

## Advanced Usage Patterns

### 1. Interactive Menu Systems
```aelang
extern print(msg: i32);
extern print_clean(msg: i32);
extern read_integer_only();

func display_menu(): void {
    print("=== Calculator Menu ===");
    print("1. Basic Operations");
    print("2. Scientific Functions");
    print("3. Financial Calculations");
    print_clean("Choose option (1-3): ");
}

func get_menu_choice(): num {
    let choice: num = read_integer_only();
    // Validates whole numbers only
    return choice;
}
```

### 2. Data Validation Chains
```aelang
extern print(msg: i32);
extern read_positive_num();
extern read_num_safe();

func get_loan_data(): void {
    print("=== Loan Calculator ===");
    
    // Positive amount validation
    print("Loan amount: $");
    let principal: num = read_positive_num();
    
    // Positive rate validation
    print("Interest rate (%): ");
    let rate: num = read_positive_num();
    
    // Any positive integer for term
    print("Term (years): ");
    let years: num = read_positive_num();
    
    // Calculate and display
    calculate_loan(principal, rate, years);
}
```

### 3. Scientific Data Display
```aelang
extern print_clean(msg: i32);
extern print_num_scientific(val: f32);
extern print_num_precision(val: f32, precision: i32);

func display_scientific_results(): void {
    let avogadro: num = 602214076000000000000000.0;
    let planck: num = 0.000000000000000000000000000000000662607015;
    
    print_clean("Avogadro's Number: ");
    print_num_scientific(avogadro);
    print("");
    
    print_clean("Planck Constant: ");
    print_num_scientific(planck);
    print("");
    
    // High precision for critical calculations
    print_clean("π (6 decimals): ");
    print_num_precision(3.141592653589793, 6);
    print("");
}
```

### 4. Financial Report Generation
```aelang
extern print_clean(msg: i32);
extern print_currency(val: f32);
extern print_percentage(val: f32);

func generate_financial_report(): void {
    let revenue: num = 1250000.0;
    let costs: num = 875000.0;
    let profit: num = revenue - costs;
    let margin: num = (profit / revenue) * 100.0;
    
    print("=== Financial Report ===");
    
    print_clean("Revenue:      ");
    print_currency(revenue);
    print("");
    
    print_clean("Costs:        ");
    print_currency(costs);
    print("");
    
    print_clean("Profit:       ");
    print_currency(profit);
    print("");
    
    print_clean("Margin:       ");
    print_percentage(margin);
    print("");
}
```

### 5. Engineering Calculations
```aelang
extern print_clean(msg: i32);
extern print_num_engineering(val: f32);
extern print_num_precision(val: f32, precision: i32);

func display_engineering_data(): void {
    let resistance: num = 4700.0;        // 4.7K ohms
    let capacitance: num = 0.000001;     // 1µF
    let frequency: num = 1000.0;         // 1KHz
    let power: num = 2500000.0;          // 2.5MW
    
    print("=== Engineering Values ===");
    
    print_clean("Resistance: ");
    print_num_engineering(resistance);
    print_clean(" Ω");
    print("");
    
    print_clean("Power: ");
    print_num_engineering(power);
    print_clean("W");
    print("");
    
    print_clean("Frequency: ");
    print_num_engineering(frequency);
    print_clean("Hz");
    print("");
}
```

---

## Troubleshooting Guide

### Common Issues and Solutions

#### Issue 1: Function Not Found Error
```
Error: undefined reference to 'print_num'
```
**Cause**: Missing extern declaration or library not linked
**Solution**: 
```aelang
extern print_num(val: f32);  // Add this declaration
```

#### Issue 2: Incorrect Number Display
```
Expected: 42
Actual: 42.000000
```
**Cause**: Using legacy `print_float()` instead of `print_num()`
**Solution**: Use `print_num()` for smart formatting

#### Issue 3: Input Validation Loop
```
User enters "abc" and program keeps asking for input
```
**Cause**: This is correct behavior - `read_num_safe()` validates input
**Solution**: This is expected; users should enter valid numbers

#### Issue 4: Compilation Warnings
```
warning: implicit declaration of function 'print_num'
```
**Cause**: Missing function declaration
**Solution**: Add proper extern declarations at file top

#### Issue 5: Floating Point Exception
```
Floating point exception (core dumped)
```
**Cause**: Usually division by zero or FPU stack issues
**Solution**: 
- Check for zero before division
- Ensure proper variable initialization
- Verify num type handling in compiler

### Debugging Strategies

#### 1. Input Validation Testing
```aelang
func test_input_validation(): void {
    print("Testing input validation:");
    print("Try: 42, 3.14, -17, abc, '', 1.2.3");
    
    let value: num = read_num_safe();
    print_clean("You entered: ");
    print_num(value);
    print("");
}
```

#### 2. Format Function Testing
```aelang
func test_formatting(): void {
    let test_value: num = 1234.56;
    
    print_clean("Standard: ");
    print_num(test_value);
    print("");
    
    print_clean("Currency: ");
    print_currency(test_value);
    print("");
    
    print_clean("Scientific: ");
    print_num_scientific(test_value);
    print("");
    
    print_clean("Engineering: ");
    print_num_engineering(test_value);
    print("");
}
```

#### 3. Edge Case Testing
```aelang
func test_edge_cases(): void {
    print("=== Edge Case Testing ===");
    
    // Test zero
    print_clean("Zero: ");
    print_num(0.0);
    print("");
    
    // Test negative
    print_clean("Negative: ");
    print_num(-42.5);
    print("");
    
    // Test very small
    print_clean("Very small: ");
    print_num_scientific(0.000001);
    print("");
    
    // Test very large
    print_clean("Very large: ");
    print_num_engineering(1500000);
    print("");
}
```

### Performance Monitoring
Monitor your applications for:
- **Input response time**: Should be immediate
- **Output formatting time**: Should be minimal
- **Memory usage**: Should remain constant (no leaks)
- **Error recovery**: Should be graceful and fast

---

## Migration Guide

### From Legacy Functions
| Old Function | New Function | Benefits |
|-------------|-------------|----------|
| `print_int()` | `print_num()` | Smart formatting, universal type |
| `print_float()` | `print_num()` | Auto-precision, cleaner output |
| `read_int()` | `read_num_safe()` | Validation, error handling |
| `read_float()` | `read_num_safe()` | Robust input, type flexibility |

### Migration Steps
1. **Update extern declarations** to use new functions
2. **Replace function calls** with modern equivalents
3. **Test thoroughly** with various input types
4. **Remove legacy declarations** to clean up code

---

*This technical reference complements the main documentation and provides deep insights into the ÆLang Universal Library implementation and advanced usage patterns.*
