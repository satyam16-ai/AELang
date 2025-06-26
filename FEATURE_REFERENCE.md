# ÆLang Quick Reference - All Implemented Features

## 🔧 Compilation Commands
```bash
# Build any program
./build.sh examples/program_name.ae

# Manual compilation
./compiler/build/aelang source.ae output.asm
nasm -f elf output.asm -o output.o
gcc -m32 -o output output.o build/aelang_universal.o
```

## 📝 Syntax Reference

### Variable Declarations
```aelang
let name: i32 = 42;           // Integer
let pi: f32 = 3.14159;        // Float  
let value: num = 25.5;        // Universal type
```

### Function Definitions
```aelang
func main(): void {
    // Function body
}

extern print_num(val: f32);   // External function
```

### Arithmetic Operations
```aelang
let sum: num = a + b;         // Addition
let diff: num = a - b;        // Subtraction  
let product: num = a * b;     // Multiplication
let quotient: num = a / b;    // Division
```

## 🖥️ I/O Functions Reference

### Output Functions
```aelang
print("Hello World");         // String with newline
print_clean("No newline");    // String without newline
print_num(42.5);             // Smart number formatting
print_int(42);               // Integer output
print_float(3.14);           // Float output
```

### Input Functions  
```aelang
let val: num = read_num();           // Basic input
let safe_val: num = read_num_safe(); // Validated input
let int_val: i32 = read_int();       // Integer input
let float_val: f32 = read_float();   // Float input
```

## 🔢 Type System

| Type | Description | Example |
|------|-------------|---------|
| `i32` | 32-bit signed integer | `let x: i32 = 42;` |
| `f32` | 32-bit float | `let pi: f32 = 3.14;` |
| `num` | Universal number type | `let val: num = 25.5;` |
| `void` | Function return type | `func main(): void` |

## 🧮 Mathematical Examples

### Basic Arithmetic
```aelang
let a: num = 25.5;
let b: num = 10.2;
let sum: num = a + b;        // 35.7
let product: num = a * b;    // 260.1
```

### Complex Expressions
```aelang
let mean: num = (a + b) / 2.0;
let squares: num = (a * a) + (b * b);
let compound: num = ((a + b) * 2.0) - (a / b);
```

### Real-World Applications
```aelang
// Physics: Ohm's Law
let voltage: num = 12.0;
let resistance: num = 4.0;
let current: num = voltage / resistance;

// Finance: Simple Interest
let principal: num = 1000.0;
let rate: num = 5.5;
let interest: num = (principal * rate) / 100.0;

// Engineering: Area Calculation
let length: num = 15.5;
let width: num = 10.0;
let area: num = length * width;
```

## 🎨 Advanced Output Formatting

### Smart Number Display
```aelang
print_num(42);      // Displays: 42
print_num(42.50);   // Displays: 42.50
print_num(42.00);   // Displays: 42
```

### Professional Formatting
```aelang
print_clean("Result: ");
print_num(result);
print_clean(" units");
```

## 📊 Complete Example Programs

### Calculator
```aelang
extern print_clean(msg: i32);
extern print_num(val: f32);
extern read_num_safe();

func main(): void {
    print("=== ÆLang Calculator ===");
    
    print("Enter first number: ");
    let a: num = read_num_safe();
    
    print("Enter second number: ");
    let b: num = read_num_safe();
    
    let sum: num = a + b;
    print_clean("Result: ");
    print_num(sum);
    print("");
}
```

### Scientific Calculator
```aelang
func main(): void {
    print("=== Scientific Calculator ===");
    
    let radius: num = 5.5;
    let pi: num = 3.14159;
    
    // Circle calculations
    let circumference: num = 2.0 * pi * radius;
    let area: num = pi * radius * radius;
    
    print_clean("Circumference: ");
    print_num(circumference);
    print_clean("Area: ");
    print_num(area);
}
```

## 🏗️ Build System

### Automated Build
```bash
# Default build (hello.ae)
./build.sh

# Specific program  
./build.sh examples/calculator.ae

# With input
echo -e "10\n5" | ./build.sh examples/calculator.ae
```

### Manual Steps
```bash
# 1. Compile ÆLang source
./compiler/build/aelang input.ae output.asm

# 2. Assemble to object file
nasm -f elf output.asm -o output.o

# 3. Link with universal library
gcc -m32 -o output output.o build/aelang_universal.o

# 4. Run
./output
```

## ✅ Tested Features Checklist

- ✅ Variable declarations (i32, f32, num)
- ✅ Function definitions and extern declarations  
- ✅ Arithmetic operations (+, -, *, /)
- ✅ Mixed-type arithmetic (int + float)
- ✅ String literal support
- ✅ Basic I/O (print, read functions)
- ✅ Advanced I/O (smart formatting, validation)
- ✅ Complex mathematical expressions
- ✅ Real-world application examples
- ✅ Professional output formatting
- ✅ Error handling and input validation
- ✅ Assembly code generation
- ✅ Automated build system
- ✅ Unicode support in output
- ✅ Memory management
- ✅ Type system and type inference

## 🎯 Key Strengths

1. **Universal `num` Type**: Eliminates int/float complexity
2. **Smart Formatting**: Automatic number display optimization
3. **Robust I/O**: Comprehensive input validation
4. **Real-World Applications**: Physics, finance, engineering examples
5. **Professional Output**: Clean, formatted results
6. **Easy Compilation**: One-command build process
7. **Production Quality**: Zero crashes, proper error handling

---

**ÆLang is production-ready for mathematical computing, scientific applications, and systems programming!**
