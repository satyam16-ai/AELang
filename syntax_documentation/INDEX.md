# ÆLang Complete Documentation Index

## Overview
This directory contains comprehensive documentation for the ÆLang programming language, covering all implemented syntax, features, and best practices.

## Documentation Structure

### 📚 Core Language References

#### **[AELANG_SYNTAX_REFERENCE.md](./AELANG_SYNTAX_REFERENCE.md)**
- **Purpose**: Primary syntax reference covering all language constructs
- **Contents**: Basic structure, variable declarations, functions, I/O system, compilation
- **Audience**: All ÆLang developers
- **Key Sections**: Program structure, compilation commands, architecture support

#### **[DATA_TYPES_REFERENCE.md](./DATA_TYPES_REFERENCE.md)**
- **Purpose**: Comprehensive data type system documentation
- **Contents**: Integer types, floating-point types, special types, format specifiers
- **Audience**: Developers needing detailed type information
- **Key Sections**: Type ranges, precision characteristics, architecture optimization

#### **[IO_SYSTEM_REFERENCE.md](./IO_SYSTEM_REFERENCE.md)**
- **Purpose**: Universal I/O system documentation
- **Contents**: print() and read() functions, format specifiers, type inference
- **Audience**: Developers working with input/output operations
- **Key Sections**: Format specifiers, examples, interactive programming

#### **[FUNCTION_SYSTEM_REFERENCE.md](./FUNCTION_SYSTEM_REFERENCE.md)**
- **Purpose**: Function declaration, definition, and usage guide
- **Contents**: Function syntax, parameters, return values, external functions
- **Audience**: Developers creating modular code
- **Key Sections**: Function types, parameter passing, organization patterns

#### **[CONTROL_FLOW_REFERENCE.md](./CONTROL_FLOW_REFERENCE.md)**
- **Purpose**: Conditional statements, loops, and branching mechanisms
- **Contents**: If statements, comparison operators, logical operators, loops
- **Audience**: Developers implementing program logic
- **Key Sections**: Conditionals, comparisons, nested structures

## Quick Reference Guide

### 🚀 Getting Started
1. **First Program**: Start with `AELANG_SYNTAX_REFERENCE.md` - Basic Structure section
2. **Variables**: Read `DATA_TYPES_REFERENCE.md` - Basic Types section  
3. **Input/Output**: Check `IO_SYSTEM_REFERENCE.md` - Universal I/O System section
4. **Functions**: Explore `FUNCTION_SYSTEM_REFERENCE.md` - Basic Function Structure
5. **Logic**: Study `CONTROL_FLOW_REFERENCE.md` - Conditional Statements

### 🎯 Feature Lookup Table

| Feature | Primary Reference | Section | Page Location |
|---------|------------------|---------|---------------|
| **Variable Declaration** | AELANG_SYNTAX_REFERENCE.md | Variable Declarations | Lines 45-80 |
| **Data Types** | DATA_TYPES_REFERENCE.md | All Sections | Complete guide |
| **Print Function** | IO_SYSTEM_REFERENCE.md | Universal Print Function | Lines 25-120 |
| **Read Function** | IO_SYSTEM_REFERENCE.md | Universal Read Function | Lines 121-180 |
| **Function Definition** | FUNCTION_SYSTEM_REFERENCE.md | Function Declaration Syntax | Lines 15-60 |
| **If Statements** | CONTROL_FLOW_REFERENCE.md | Conditional Statements | Lines 15-100 |
| **Loops** | CONTROL_FLOW_REFERENCE.md | Loops | Lines 300-400 |
| **Comparisons** | CONTROL_FLOW_REFERENCE.md | Comparison Operators | Lines 150-250 |
| **Format Specifiers** | IO_SYSTEM_REFERENCE.md | Format Specifiers | Lines 181-300 |
| **Architecture Support** | AELANG_SYNTAX_REFERENCE.md | Architecture Support | Lines 200-250 |

### 📋 Syntax Quick Reference

#### Essential Syntax Elements
```aelang
// Program structure
extern print(format: str, ...);
extern read();

func main(): void {
    // Your code here
}

// Variable declarations
let variable_name: type = value;
let mutable_var: mut type = value;

// Function definition
func function_name(param: type): return_type {
    return value;
}

// Conditional statement
if (condition) {
    // Code block
} else {
    // Alternative code
}

// I/O operations
print("Format string %specifier\n", value);
let input: type = read();
```

#### Data Type Summary
```aelang
// Integer types
i8, i16, i32, i64    // Signed integers
u8, u16, u32, u64    // Unsigned integers

// Floating point types  
f32, f64             // IEEE 754 floating point

// Special types
bool                 // Boolean (true/false)
char                 // Single character
str                  // String literal
num                  // Flexible numeric type
```

#### Format Specifiers Summary
```aelang
%d   // Signed integers (i8, i16, i32)
%ld  // Long signed integers (i64)
%u   // Unsigned integers (u8, u16, u32)
%lu  // Long unsigned integers (u64)
%f   // Floating point (f32, f64)
%c   // Single character
%t   // Boolean (true/false)
%g   // Generic numeric (num type)
%s   // String literals
```

### 🏗️ Architecture Support

#### Compilation Commands
```bash
# 32-bit compilation (default)
aelangc program.ae

# 64-bit compilation
aelangc program.ae --arch64

# Assembly generation
aelangc program.ae  # Generates program.asm

# Full compilation process
aelangc program.ae && nasm -f elf32 program.asm -o program.o && \
gcc -m32 program.o aelang_runtime.c -o program
```

#### Architecture-Specific Features
- **32-bit**: Optimized for f32 floats, u32 integers, memory efficiency
- **64-bit**: Extended precision with f64, u64 support, large data processing
- **Universal**: Same source code compiles for both architectures

### 📖 Learning Path Recommendations

#### **Beginner Track**
1. **Hello World**: `AELANG_SYNTAX_REFERENCE.md` → Hello World Example
2. **Variables**: `DATA_TYPES_REFERENCE.md` → Basic Types  
3. **Input/Output**: `IO_SYSTEM_REFERENCE.md` → Simple Examples
4. **First Function**: `FUNCTION_SYSTEM_REFERENCE.md` → Basic Functions
5. **Simple Logic**: `CONTROL_FLOW_REFERENCE.md` → If Statements

#### **Intermediate Track**
1. **Type System**: `DATA_TYPES_REFERENCE.md` → All sections
2. **Advanced I/O**: `IO_SYSTEM_REFERENCE.md` → Format Specifiers
3. **Function Design**: `FUNCTION_SYSTEM_REFERENCE.md` → Advanced Examples
4. **Control Flow**: `CONTROL_FLOW_REFERENCE.md` → Loops and Logic
5. **Architecture**: `AELANG_SYNTAX_REFERENCE.md` → Architecture Support

#### **Advanced Track**
1. **Runtime System**: `IO_SYSTEM_REFERENCE.md` → Runtime Library
2. **Memory Management**: `DATA_TYPES_REFERENCE.md` → Memory Optimization
3. **Complex Functions**: `FUNCTION_SYSTEM_REFERENCE.md` → Organization Patterns
4. **Performance**: All references → Architecture-specific sections
5. **Best Practices**: All references → Best Practices sections

### 🔍 Common Use Cases

#### **Calculator Development**
- **References**: IO_SYSTEM_REFERENCE.md, CONTROL_FLOW_REFERENCE.md
- **Key Features**: Format specifiers, conditional logic, user input
- **Examples**: Interactive calculator examples in multiple references

#### **Data Processing**
- **References**: DATA_TYPES_REFERENCE.md, FUNCTION_SYSTEM_REFERENCE.md
- **Key Features**: Numeric types, function organization, loops
- **Examples**: Array processing, mathematical calculations

#### **Interactive Programs**
- **References**: IO_SYSTEM_REFERENCE.md, CONTROL_FLOW_REFERENCE.md
- **Key Features**: Universal I/O, menu systems, input validation
- **Examples**: Menu-driven programs, user interaction patterns

#### **System Programming**
- **References**: All references focusing on architecture sections
- **Key Features**: Memory optimization, type precision, performance
- **Examples**: Architecture-specific code samples

### 🛠️ Development Workflow

#### **Project Setup**
1. Create `.ae` source file
2. Set up compilation environment
3. Choose target architecture (32-bit/64-bit)
4. Include necessary runtime library

#### **Development Process**
1. **Design**: Review function and type references
2. **Implement**: Use syntax references for correct formatting
3. **Test**: Compile with appropriate architecture flag
4. **Debug**: Use I/O system for debugging output
5. **Optimize**: Apply architecture-specific optimizations

#### **Quality Assurance**
- **Syntax Validation**: Cross-reference with syntax documentation
- **Type Safety**: Verify with data types reference
- **I/O Correctness**: Validate format specifiers
- **Function Design**: Follow organization patterns
- **Logic Verification**: Test control flow thoroughly

### 📊 Documentation Statistics

| Reference | Lines | Sections | Examples | Use Cases |
|-----------|-------|----------|----------|-----------|
| AELANG_SYNTAX_REFERENCE.md | ~300 | 8 | 25+ | General usage |
| DATA_TYPES_REFERENCE.md | ~400 | 12 | 40+ | Type system |
| IO_SYSTEM_REFERENCE.md | ~350 | 10 | 30+ | Input/output |
| FUNCTION_SYSTEM_REFERENCE.md | ~500 | 15 | 50+ | Modular programming |
| CONTROL_FLOW_REFERENCE.md | ~450 | 12 | 45+ | Program logic |
| **Total Coverage** | **~2000** | **57** | **190+** | **Complete** |

### 🎯 Quick Problem Solving

#### **Compilation Issues**
- **Reference**: AELANG_SYNTAX_REFERENCE.md → Compilation section
- **Common Fixes**: Check syntax, verify architecture flags, validate runtime linking

#### **Type Errors**  
- **Reference**: DATA_TYPES_REFERENCE.md → Type System section
- **Common Fixes**: Verify type compatibility, check ranges, validate format specifiers

#### **I/O Problems**
- **Reference**: IO_SYSTEM_REFERENCE.md → Universal I/O System
- **Common Fixes**: Correct format specifiers, validate input types, check function calls

#### **Logic Errors**
- **Reference**: CONTROL_FLOW_REFERENCE.md → Control Flow patterns
- **Common Fixes**: Review conditional logic, validate comparisons, check loop conditions

#### **Function Issues**
- **Reference**: FUNCTION_SYSTEM_REFERENCE.md → Function System
- **Common Fixes**: Verify signatures, check parameter types, validate return statements

---

## Version Information
- **Documentation Version**: 1.0.0
- **ÆLang Version**: Latest implementation
- **Last Updated**: Current implementation status
- **Coverage**: Complete syntax and feature documentation

## Contributing
When contributing to ÆLang or its documentation:
1. Follow established patterns in existing references
2. Include comprehensive examples for new features
3. Update this index when adding new documentation
4. Maintain consistency across all reference files

---

*This documentation provides complete coverage of the ÆLang programming language as currently implemented, with practical examples and best practices for effective development.*
