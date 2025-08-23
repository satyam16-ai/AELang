# ÆLang Programming Language

ÆLang is a modern programming language with LLVM backend support, featuring comprehensive bitwise operations and a clean, readable syntax.

## Features

- ✅ **Complete Bitwise Operations**: AND (&), OR (|), XOR (^), NOT (~), Left Shift (<<), Right Shift (>>)
- ✅ **LLVM Backend**: High-performance compilation using LLVM 14
- ✅ **Type System**: Support for i32, i64, f32, f64, and more
- ✅ **String Interpolation**: Printf-style format specifiers
- ✅ **Memory Safety**: Enhanced scope management and variable tracking
- ✅ **Optimization**: Dead code elimination and optimization passes

## Quick Start

### Build the Compiler

```bash
make clean && make
```

### Compile and Run a Program

```bash
./aelang examples/bitwise_demo.ae --arch64
./bitwise_demo
```

## Project Structure

```
ae/
├── compiler/           # Core compiler source code
│   ├── src/           # Lexer, parser, semantic analyzer, IR, LLVM backend
│   ├── include/       # Header files
│   └── build/         # Compiled executable
├── std_libs/          # Standard library (I/O functions)
├── examples/          # Example programs
│   ├── bitwise_demo.ae    # Bitwise operators demonstration
│   └── unified_io_demo.ae # I/O functionality showcase
└── aelang             # Compiler executable (symlink)
```

## Language Syntax

### Variable Declaration
```aelang
let variable_name: type = value;
const constant_name: type = value;
```

### Functions
```aelang
func function_name(param: type): return_type {
    // function body
}
```

### Bitwise Operations
```aelang
let a: i32 = 15;
let b: i32 = 7;

let and_result: i32 = a & b;    // Bitwise AND
let or_result: i32 = a | b;     // Bitwise OR  
let xor_result: i32 = a ^ b;    // Bitwise XOR
let not_result: i32 = ~a;       // Bitwise NOT
let left_shift: i32 = a << 2;   // Left shift
let right_shift: i32 = a >> 1;  // Right shift
```

### String Interpolation
```aelang
extern print(format: str, ...);

func main(): void {
    let x: i32 = 42;
    print("The answer is %d\n", x);
}
```

## Dependencies

- **LLVM 14**: Required for code generation
- **GCC**: Used for linking
- **Make**: Build system

## Installation

1. Ensure LLVM 14 is installed:
   ```bash
   sudo apt-get install llvm-14 llvm-14-dev
   ```

2. Clone and build:
   ```bash
   git clone <repository-url>
   cd ae
   make
   ```

3. Test the installation:
   ```bash
   ./aelang examples/bitwise_demo.ae --arch64
   ./bitwise_demo
   ```

## Contributing

This is a clean, production-ready compiler implementation. All bitwise operators are fully functional and tested.

## License

[Add your license here]

