# ⚡ ÆLang Compiler

<div align="center">
  <img src="icon.png" alt="ÆLang Logo" width="120"/>
  
  **⚙️ Systems Programming Language for OS Development ⚙️**
  
  *Empowering the next generation of operating systems*
</div>

[![Language](https://img.shields.io/badge/Language-ÆLang-blue.svg)](https://github.com/satyam/aelang)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://linux.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **ÆLang** is a systems programming language specifically designed for **Operating System Development**. Built for low-level programming with minimal runtime dependencies and direct assembly generation.

## 🚀 Features

### Core Language Support
- **Mixed Type System**: Native support for `i32` (32-bit integers) and `f32` (32-bit floats)
- **Interactive I/O**: Built-in functions for user input and formatted output (`read_int`, `read_float`, `print`, `print_int`, `print_float`)
- **Arithmetic Operations**: Complete implementation of `+`, `-`, `*`, `/` for both integer and float types
- **String Literals**: Support for custom messages and prompts
- **Function Calls**: Both statement-level and expression-level function calls
- **Variable Declarations**: Type-safe variable storage and retrieval

### OS Development Focus
- **Direct Assembly Generation**: Pure NASM output with no runtime overhead
- **Minimal Dependencies**: Only requires assembler and linker - no complex runtime
- **Bare-Metal Ready**: Can run without operating system (with appropriate startup code)
- **Zero-Cost Abstractions**: High-level syntax that compiles to optimal assembly
- **Predictable Output**: Deterministic compilation for real-time and embedded systems

### Compiler Architecture
- **Single-Pass Design**: Fast compilation suitable for embedded development workflows
- **Lexical Analysis**: Token-based lexer with comprehensive language construct support
- **Parsing**: Recursive descent parser with proper expression handling
- **Code Generation**: Direct NASM assembly generation with optimized x86 output
- **Type System**: Automatic type detection and appropriate instruction generation
- **Memory Management**: Efficient variable storage in `.bss` section with proper indexing

## 📁 Project Structure

```
ae/
├── compiler/                 # Compiler source code
│   ├── include/
│   │   ├── lexer.h          # Token definitions and lexical analysis
│   │   ├── parser.h         # AST definitions and parser interface
│   │   └── codegen.h        # Code generation interface
│   ├── src/
│   │   ├── lexer.c          # Tokenization and lexical analysis
│   │   ├── parser.c         # Syntax analysis and AST construction
│   │   ├── codegen.c        # NASM assembly code generation
│   │   └── main.c           # Compiler entry point
│   ├── build/
│   │   └── aelang           # Compiled compiler executable
│   └── Makefile             # Compiler build configuration
├── c_libs/                  # Runtime library functions
│   ├── print.c              # String output function
│   ├── print_int.c          # Integer output function  
│   ├── print_float.c        # Float output function (printf-based)
│   ├── read_int.c           # Integer input function (scanf-based)
│   └── read_float.c         # Float input function (scanf-based)
├── examples/                # Example ÆLang programs
│   ├── hello.ae             # Basic hello world with arithmetic
│   ├── calculator.ae        # Interactive arithmetic calculator
│   ├── float_calculator.ae  # Float arithmetic calculator
│   ├── int_arithmetic.ae    # Integer arithmetic demonstrations
│   ├── float_arithmetic.ae  # Float arithmetic demonstrations
│   ├── edge_cases.ae        # Edge case testing
│   ├── mixed_arithmetic.ae  # Mixed type operations
│   └── interactive_calculator.ae # Full interactive calculator
├── build/                   # Build artifacts and executables
├── syn_highlighter/         # Syntax highlighter extension
├── build.sh                 # Automated build script
└── README.md               # This file
```

## 🛠️ Quick Start

### Prerequisites
- **GCC** with 32-bit support (`gcc-multilib`)
- **NASM** assembler (`nasm`)
- **Make** build system
- **Linux** environment (tested on Ubuntu/Debian)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ae
   ```

2. **Build the compiler**
   ```bash
   cd compiler
   make clean && make
   cd ..
   ```

3. **Make build script executable**
   ```bash
   chmod +x build.sh
   ```

4. **Test the installation**
   ```bash
   ./build.sh
   ```

5. **Install the official ÆLang syntax highlighter**
   - Visit: https://github.com/satyam16-ai/aelang-syntax-highlighter
   - Follow installation instructions for VS Code

### Build Dependencies
```bash
# Ubuntu/Debian
sudo apt install gcc-multilib nasm make

# Fedora/RHEL
sudo dnf install gcc glibc-devel.i686 nasm make

# Arch Linux
sudo pacman -S gcc lib32-glibc nasm make
```

## 💻 Language Syntax

### Variable Declarations
```aelang
let name: i32 = 42;           // Integer variable
let pi: f32 = 3.14;           // Float variable
let result: i32 = a + b;      // Expression assignment
```

### Function Declarations
```aelang
extern print_int(val: i32);   // External function declaration
extern read_int();            // Input function (no parameters)

func main(): void {           // Function definition
    // Function body
}
```

### Arithmetic Operations
```aelang
let sum: i32 = a + b;         // Addition
let diff: i32 = a - b;        // Subtraction  
let product: i32 = a * b;     // Multiplication
let quotient: i32 = a / b;    // Division
```

### Input/Output Operations
```aelang
print("Enter a number: ");    // String output
let num: i32 = read_int();    // Integer input (expression-level)
print_int(num);               // Integer output
print_float(3.14);            // Float output
```

## 🧪 Example Programs

### Hello World
```aelang
extern print_int(val: i32);

func main(): void {
    let pi: f32 = 3.5;
    let x: i32 = 5;
    let radius: f32 = 5.8;
    let res: f32 = pi + radius;
    print_float(res);  // Output: 9.300000
    print_int(x);      // Output: 5
}
```

### Interactive Calculator
```aelang
extern print_int(val: i32);
extern read_int();

func main(): void {
    print("=== ÆLang Calculator ===");
    
    print("Enter first number: ");
    let a: i32 = read_int();
    
    print("Enter second number: ");
    let b: i32 = read_int();
    
    let sum: i32 = a + b;
    print("Result: ");
    print_int(sum);
}
```

### Float Arithmetic
```aelang
extern read_float();

func main(): void {
    print("Enter first float: ");
    let x: f32 = read_float();
    
    print("Enter second float: ");
    let y: f32 = read_float();
    
    let result: f32 = x * y;
    print("Product: ");
    print_float(result);
}
```

## 🔧 Compilation Process

The ÆLang compiler follows a multi-stage compilation process:

1. **Lexical Analysis**: Source code → Tokens
2. **Syntax Analysis**: Tokens → Abstract Syntax Tree (AST)
3. **Code Generation**: AST → NASM Assembly
4. **Assembly**: NASM Assembly → Object File
5. **Linking**: Object File + Runtime Libraries → Executable

### Manual Compilation
```bash
# Step 1: Compile ÆLang source to assembly
./compiler/build/aelang examples/calculator.ae build/calculator.asm

# Step 2: Assemble to object file
nasm -f elf build/calculator.asm -o build/calculator.o

# Step 3: Link with runtime libraries
gcc -m32 build/calculator.o c_libs/print.o c_libs/print_int.o c_libs/read_int.o -o build/calculator

# Step 4: Run the program
./build/calculator
```

### Automated Build
```bash
# Build and run hello.ae (default)
./build.sh

# Build specific program
./compiler/build/aelang examples/float_calculator.ae build/float_calc.asm
nasm -f elf build/float_calc.asm -o build/float_calc.o
gcc -m32 build/float_calc.o c_libs/print.o c_libs/print_float.o c_libs/read_float.o -o build/float_calc
./build/float_calc
```

## 🎯 Technical Implementation

### Type System
- **Integer Types**: 32-bit signed integers with standard x86 arithmetic
- **Float Types**: 32-bit IEEE-754 floating-point with x87 FPU operations
- **Type Safety**: Compile-time type checking and proper code generation
- **Mixed Operations**: Automatic type detection for appropriate instruction selection

### Code Generation
- **Integer Arithmetic**: Uses standard x86 instructions (`add`, `sub`, `imul`, `div`)
- **Float Arithmetic**: Uses x87 FPU instructions (`faddp`, `fsubp`, `fmulp`, `fdivp`)
- **Variable Storage**: Efficient memory allocation in `.bss` section
- **Function Calls**: Proper stack management and calling conventions
- **String Handling**: Automatic string literal collection and `.rodata` emission

### Memory Management
- **Variables**: Stored in `.bss` section with unique indices
- **Constants**: Float constants stored in `.rodata` section with IEEE-754 encoding
- **Stack Management**: Proper function prologue/epilogue generation
- **Type Separation**: Separate storage and indexing for integer and float variables

## 🖥️ OS Development Use Cases

### Bootloader Development
```aelang
// Convert LBA to CHS for disk access
func main(): void {
    let sectors_per_track: i32 = 18;
    let heads: i32 = 2;
    let lba: i32 = 1024;
    
    let sector: i32 = lba / (heads * sectors_per_track);
    let temp: i32 = lba - (sector * heads * sectors_per_track);
    let head: i32 = temp / sectors_per_track;
    let track: i32 = temp - (head * sectors_per_track) + 1;
    
    print_int(sector);  // Boot sector calculation
}
```

### Memory Manager
```aelang
// Page allocation calculations
func main(): void {
    let page_size: i32 = 4096;        // 4KB pages
    let total_memory: i32 = 134217728; // 128MB
    let requested_bytes: i32 = 8192;   // 8KB request
    
    let pages_needed: i32 = (requested_bytes + page_size - 1) / page_size;
    let total_pages: i32 = total_memory / page_size;
    
    print("Pages needed: ");
    print_int(pages_needed);
}
```

### Device Driver Timing
```aelang
// Precise timing calculations for hardware delays
func main(): void {
    let cpu_freq: f32 = 1000000000.0;  // 1 GHz CPU
    let delay_us: f32 = 100.0;         // 100 microsecond delay
    
    let cycles_needed: f32 = cpu_freq * delay_us / 1000000.0;
    print_float(cycles_needed);
}
```

## 🧪 Testing & Examples

The project includes comprehensive test programs:

### Arithmetic Tests
- **int_arithmetic.ae**: Integer operations testing
- **float_arithmetic.ae**: Float operations testing  
- **mixed_arithmetic.ae**: Mixed type operations
- **edge_cases.ae**: Zero, one, and boundary value testing

### Interactive Programs
- **calculator.ae**: Basic integer calculator
- **float_calculator.ae**: Floating-point calculator
- **interactive_calculator.ae**: Full-featured calculator with detailed output

### Input/Output Tests
- **simple_input_test.ae**: Basic input/output verification
- **float_input_test.ae**: Float input/output testing

### Test Results
```
Integer Tests (inputs: 20, 4):
✓ Addition: 20 + 4 = 24
✓ Subtraction: 20 - 4 = 16  
✓ Multiplication: 20 * 4 = 80
✓ Division: 20 / 4 = 5

Float Tests (inputs: 8.5, 2.5):
✓ Addition: 8.5 + 2.5 = 11.0
✓ Subtraction: 8.5 - 2.5 = 6.0
✓ Multiplication: 8.5 * 2.5 = 21.25
✓ Division: 8.5 / 2.5 = 3.4
```

## 📊 Performance

### Compilation Speed
- **Small programs** (< 50 lines): < 100ms
- **Medium programs** (< 200 lines): < 500ms
- **Memory usage**: < 10MB RAM during compilation
- **Single-pass design**: Ideal for rapid development cycles

### Runtime Performance
- **Integer arithmetic**: Native x86 performance with zero overhead
- **Float arithmetic**: Direct hardware FPU performance
- **Memory footprint**: Minimal runtime overhead
- **Code size**: Compact assembly output suitable for embedded systems

## 🎨 Developer Tools

### Syntax Highlighter
**ÆLang** now has official syntax highlighting support for VS Code!

🔗 **[Install the ÆLang Syntax Highlighter](https://github.com/satyam16-ai/aelang-syntax-highlighter)**

**Features:**
- **Keyword highlighting**: `let`, `func`, `extern`, `i32`, `f32`, etc.
- **Operator highlighting**: Arithmetic and assignment operators
- **String literal highlighting**: Proper string and comment formatting
- **Function call highlighting**: Distinguished function calls and declarations
- **Type annotations**: Clear type highlighting for better code readability

**Installation:**
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "ÆLang"
4. Install the official ÆLang syntax highlighter

## 🔮 Future Roadmap

### Planned Features
- **Control Flow**: `if/else`, `while`, `for` loop constructs
- **User-defined Functions**: Parameters and return values
- **Arrays**: Support for array declarations and indexing
- **Boolean Type**: Native boolean type with logical operations
- **Operator Precedence**: Mathematical operator precedence

### OS Development Enhancements
- **Inline Assembly**: Direct assembly code embedding
- **Memory Mapped I/O**: Hardware register access
- **Interrupt Handlers**: ISR function attributes
- **Pointer Arithmetic**: Direct memory manipulation
- **Bit Operations**: Bitwise operators for hardware control
- **Volatile Variables**: Hardware-mapped memory support

### Tooling
- **✅ Syntax Highlighter**: [VS Code extension for ÆLang](https://github.com/satyam16-ai/aelang-syntax-highlighter) - **Now Available!**
- **Debugger Support**: GDB integration
- **Cross-platform**: Windows and macOS support
- **Standard Library**: Expanded runtime functions

## 🤝 Contributing

### Development Setup
1. Fork the repository
2. Set up development environment with GCC and NASM
3. Build and test the compiler: `make -C compiler && ./build.sh`
4. Make changes and add tests
5. Submit pull request with detailed description

### Code Style
- **C code**: Follow existing formatting and naming conventions
- **ÆLang examples**: Use clear, demonstrative examples
- **Documentation**: Update relevant documentation for new features

### Testing
```bash
# Test all examples
for ae_file in examples/*.ae; do
    echo "Testing $ae_file..."
    ./compiler/build/aelang "$ae_file" "build/test.asm"
    nasm -f elf "build/test.asm" -o "build/test.o"
    gcc -m32 "build/test.o" c_libs/*.o -o "build/test"
done
```

## 📄 License


## 👨‍💻 Creator

**ÆLang** was created by **Satyam**, an experienced OS developer passionate about systems programming and low-level development. This project represents a dedication to providing OS developers with modern tooling while maintaining the performance and control required for systems programming.

## 🙏 Acknowledgments

- **NASM Project**: For the excellent assembler
- **GCC Team**: For the compiler and linker toolchain
- **Open Source Community**: For inspiration and feedback

---

**ÆLang Compiler** - Empowering the next generation of operating systems! 🔧⚡

*Built for OS developers, by OS developers*

