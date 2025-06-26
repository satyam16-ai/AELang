# ÆLang Universal Library - Complete Function Reference

## Quick Reference Guide

This is a comprehensive reference for all functions in the ÆLang Universal Library. Functions are organized by category with practical examples and best practices.

---

## 📋 Function Categories

| Category | Functions | Description |
|----------|-----------|-------------|
| **Basic Output** | `print()`, `print_clean()` | String output with/without newlines |
| **Smart Formatting** | `print_num()`, `print_num_precision()` | Intelligent number display |
| **Scientific** | `print_num_scientific()` | Scientific notation output |
| **Financial** | `print_currency()`, `print_percentage()` | Money and percentage formatting |
| **Engineering** | `print_num_engineering()`, `print_hex()`, `print_binary()` | Technical number formats |
| **Safe Input** | `read_num_safe()`, `read_num_with_prompt()` | Validated number input |
| **Specialized Input** | `read_positive_num()`, `read_integer_only()` | Constrained input types |
| **Legacy** | `read_int()`, `print_float()`, etc. | Backward compatibility |

---

## 🎯 Output Functions

### Basic Text Output

#### `print(string)` 
Prints text with automatic newline
```aelang
print("Hello World")          // → Hello World⏎
print("Status: Complete")     // → Status: Complete⏎
```

#### `print_clean(string)`
Prints text without newline (for prompts)
```aelang
print_clean("Enter name: ")   // → Enter name: ▋
print_clean("Loading...")     // → Loading...▋
```

### Smart Number Display

#### `print_num(number)`
**🌟 RECOMMENDED** - Intelligently formats any number
```aelang
print_num(42)        // → 42        (no decimals for integers)
print_num(3.14159)   // → 3.14      (2 decimals for floats)
print_num(10.0)      // → 10        (smart integer detection)
print_num(-7.5)      // → -7.50     (handles negatives)
```

#### `print_num_precision(number, precision)`
Control exact decimal places (0-6, or -1 for auto)
```aelang
print_num_precision(π, 0)    // → 3
print_num_precision(π, 4)    // → 3.1416
print_num_precision(π, -1)   // → 3.14 (auto-precision)
```

### Scientific & Engineering

#### `print_num_scientific(number)`
Scientific notation for very large/small numbers
```aelang
print_num_scientific(1234567)  // → 1.23e+06
print_num_scientific(0.00012)  // → 1.20e-04
```

#### `print_num_engineering(number)`
Human-friendly large number display
```aelang
print_num_engineering(1500)     // → 1.50K
print_num_engineering(2500000)  // → 2.50M
print_num_engineering(750)      // → 750.00
```

### Financial Formatting

#### `print_currency(number)`
Money display with dollar sign
```aelang
print_currency(1299.5)   // → $1299.50
print_currency(0.99)     // → $0.99
print_currency(-45.67)   // → $-45.67
```

#### `print_percentage(number)`
Percentage display with % symbol
```aelang
print_percentage(85.7)   // → 85.7%
print_percentage(100)    // → 100.0%
print_percentage(12.34)  // → 12.3%
```

### Alternative Number Systems

#### `print_hex(number)`
Hexadecimal representation
```aelang
print_hex(255)    // → 0xFF
print_hex(4096)   // → 0x1000
print_hex(16)     // → 0x10
```

#### `print_binary(number)`
Binary with visual grouping
```aelang
print_binary(15)   // → 0b0000_0000_0000_0000_0000_0000_0000_1111
print_binary(255)  // → 0b0000_0000_0000_0000_0000_0000_1111_1111
```

---

## 📥 Input Functions

### Safe Input (Recommended)

#### `read_num_safe()`
**🌟 PRODUCTION RECOMMENDED** - Bulletproof number input
```aelang
num value = read_num_safe()
// Handles: invalid chars, empty input, overflow, NaN
// Auto-prompts for corrections
// Never crashes your program
```

#### `read_num_with_prompt(prompt)`
Safe input with custom message
```aelang
num age = read_num_with_prompt("Enter your age: ")
num salary = read_num_with_prompt("Annual salary: $")
```

### Specialized Input

#### `read_positive_num()`
Only accepts positive numbers (> 0)
```aelang
num price = read_positive_num()    // Rejects: 0, negatives
num distance = read_positive_num() // Perfect for measurements
```

#### `read_integer_only()`
Only accepts whole numbers
```aelang
num count = read_integer_only()     // Rejects: 2.5, 3.14
num people = read_integer_only()    // Perfect for counting
```

### Basic Input

#### `read_num()`
Simple number input (minimal validation)
```aelang
num value = read_num()   // Use only for quick tests
```

#### `read_num_validated()`
Alias for `read_num_safe()` - same robust validation
```aelang
num value = read_num_validated()   // Same as read_num_safe()
```

---

## 💼 Real-World Examples

### 1. Professional Calculator
```aelang
print("Scientific Calculator")
print("====================")

num a = read_num_with_prompt("Enter first number: ")
num b = read_num_with_prompt("Enter second number: ")

print_clean("Sum: ")
print_num(a + b)

print_clean("Product: ")
print_num(a * b)

print_clean("Scientific: ")
print_num_scientific(a * b)

print_clean("Engineering: ")
print_num_engineering(a * b)
```

### 2. Financial Calculator
```aelang
print("Investment Calculator")
print("====================")

num principal = read_num_with_prompt("Principal amount: $")
num rate = read_num_with_prompt("Interest rate (%): ")
num years = read_integer_only()

num final_amount = principal * (1 + rate/100) * years
num profit = final_amount - principal

print_clean("Final amount: ")
print_currency(final_amount)

print_clean("Profit: ")
print_currency(profit)

print_clean("Return rate: ")
print_percentage(profit / principal * 100)
```

### 3. Engineering Calculations
```aelang
print("Power Calculator")
print("================")

num voltage = read_positive_num()
num current = read_positive_num()
num power = voltage * current

print_clean("Power: ")
print_num_engineering(power)
print(" W")

print_clean("Scientific: ")
print_num_scientific(power)
print(" W")
```

### 4. Unit Converter
```aelang
print("Distance Converter")
print("=================")

num meters = read_positive_num()

print_clean("Kilometers: ")
print_num_precision(meters / 1000, 3)

print_clean("Miles: ")
print_num_precision(meters * 0.000621371, 6)

print_clean("Feet: ")
print_num(meters * 3.28084)
```

---

## ⚡ Performance Tips

### Fast vs Safe Functions

| Use Case | Recommended Function | Why |
|----------|---------------------|-----|
| **Production apps** | `read_num_safe()` | Bulletproof error handling |
| **Quick prototypes** | `read_num()` | Minimal overhead |
| **User interfaces** | `read_num_with_prompt()` | Better UX |
| **Counting/indices** | `read_integer_only()` | Prevents float errors |
| **Measurements** | `read_positive_num()` | Domain validation |

### Output Function Selection

| Data Type | Best Function | Example |
|-----------|---------------|---------|
| **General numbers** | `print_num()` | Any calculation result |
| **Money** | `print_currency()` | Prices, costs, salaries |
| **Rates** | `print_percentage()` | Interest, efficiency, scores |
| **Large numbers** | `print_num_engineering()` | Population, distances |
| **Precise values** | `print_num_precision()` | Scientific measurements |
| **Technical data** | `print_num_scientific()` | Very large/small values |

---

## 🎯 Best Practices

### ✅ DO: Use Smart Functions
```aelang
// Smart formatting based on context
print_currency(price)        // → $1,234.50
print_percentage(efficiency) // → 95.5%
print_num_engineering(power) // → 2.50MW

// Safe input with validation
num age = read_positive_num()
num count = read_integer_only()
```

### ❌ DON'T: Use Generic Functions for Specific Data
```aelang
// Poor - unclear output
print_num(price)       // → 1234.5 (is this dollars?)
print_num(efficiency)  // → 95.5 (percent or ratio?)
print_num(power)       // → 2500000 (hard to read)

// Risky - no validation
num age = read_num()   // Could accept -5 or 2.5
```

### 💡 Pro Tips

1. **Always use prompts for better UX**:
   ```aelang
   // Good
   num temp = read_num_with_prompt("Temperature (°C): ")
   
   // Poor
   num temp = read_num()  // User doesn't know what to enter
   ```

2. **Match output format to data meaning**:
   ```aelang
   // Financial data
   print_currency(salary)
   print_percentage(tax_rate)
   
   // Scientific data  
   print_num_scientific(avogadro_number)
   print_num_precision(measurement, 4)
   
   // Engineering data
   print_num_engineering(power_consumption)
   ```

3. **Use specialized input for data validation**:
   ```aelang
   num people_count = read_integer_only()    // Can't be 2.5 people
   num distance = read_positive_num()        // Can't be negative
   num temperature = read_num_safe()         // Can be negative
   ```

4. **Combine functions for rich output**:
   ```aelang
   print_clean("Total cost: ")
   print_currency(total)
   print_clean(" (")
   print_percentage(tax_rate)
   print(" tax)")
   ```

---

## 🔧 Legacy Functions (Avoid in New Code)

These functions exist for backward compatibility but have limitations:

| Legacy Function | Modern Replacement | Why Change |
|----------------|-------------------|------------|
| `print_int()` | `print_num()` | Works with all numbers |
| `print_float()` | `print_num()` | Smart formatting |
| `read_int()` | `read_num_safe()` | Better validation |
| `read_float()` | `read_num_safe()` | Robust error handling |

---

## 🚨 Common Pitfalls

### Input Validation
```aelang
// ❌ WRONG - Can crash with invalid input
num value = read_num()    

// ✅ CORRECT - Handles all edge cases
num value = read_num_safe()
```

### Number Display
```aelang
// ❌ WRONG - Inconsistent formatting
print_num_precision(money, 6)    // → $1234.500000 (confusing)

// ✅ CORRECT - Context-appropriate
print_currency(money)            // → $1234.50 (clear)
```

### User Experience
```aelang
// ❌ WRONG - No guidance
num amount = read_num()

// ✅ CORRECT - Clear expectations  
num amount = read_num_with_prompt("Enter loan amount: $")
```

---

## 📚 Quick Function Lookup

### Most Used Functions
```aelang
// Display any number intelligently
print_num(value)

// Safe input with validation  
num value = read_num_safe()

// Input with custom prompt
num value = read_num_with_prompt("Enter value: ")

// Display money
print_currency(amount)

// Display percentages
print_percentage(rate)

// Only positive numbers
num value = read_positive_num()

// Only whole numbers
num value = read_integer_only()
```

---

*This reference covers all functions in the ÆLang Universal Library. For implementation details, see the technical documentation.*
