#!/bin/bash

# ÆLang Complete Build Script for Unified I/O Programs
# Handles compilation, assembly, and linking with proper ABI for both 32-bit and 64-bit

if [ $# -eq 0 ]; then
    echo "Usage: $0 <source.ae> [output_name] [--arch32|--arch64]"
    echo "Example: $0 test.ae my_program --arch32"
    exit 1
fi

SOURCE_FILE="$1"
OUTPUT_NAME="${2:-${SOURCE_FILE%.*}}"
ARCH_FLAG=""

# Parse architecture flag
for arg in "$@"; do
    case $arg in
        --arch32)
            ARCH_FLAG="--arch32"
            BITS=32
            GCC_ARCH="-m32"
            NASM_FORMAT="elf32"
            shift
            ;;
        --arch64)
            ARCH_FLAG="--arch64"
            BITS=64
            GCC_ARCH="-m64"
            NASM_FORMAT="elf64"
            shift
            ;;
    esac
done

# Default to 32-bit if not specified
if [ -z "$BITS" ]; then
    BITS=32
    GCC_ARCH="-m32"
    NASM_FORMAT="elf32"
    ARCH_FLAG="--arch32"
fi

echo "🚀 Building ÆLang Unified I/O Program: $SOURCE_FILE (${BITS}-bit)"

# Step 1: Build the unified I/O library
echo "[1/5] Compiling Unified I/O Library (${BITS}-bit)..."
gcc $GCC_ARCH -Wall -Wextra -Wno-unused-parameter -O2 -c std_libs/aelang_unified_io.c -o std_libs/aelang_unified_io_${BITS}.o
if [ $? -ne 0 ]; then
    echo "❌ Library compilation failed!"
    exit 1
fi

# Step 2: Compile ÆLang source to assembly
echo "[2/5] Compiling ÆLang source..."
compiler/build/aelang "$SOURCE_FILE" $ARCH_FLAG -o "${OUTPUT_NAME}.asm"
if [ $? -ne 0 ]; then
    echo "❌ ÆLang compilation failed!"
    exit 1
fi

# Step 3: Assemble to object file
echo "[3/5] Assembling (${NASM_FORMAT})..."
nasm -f $NASM_FORMAT "${OUTPUT_NAME}.asm" -o "${OUTPUT_NAME}.o"
if [ $? -ne 0 ]; then
    echo "❌ Assembly failed!"
    exit 1
fi

# Step 4: Link with unified I/O library
echo "[4/5] Linking..."
if [ "$BITS" = "64" ]; then
    # Use -no-pie for 64-bit to avoid PIE relocation issues
    gcc $GCC_ARCH -no-pie -o "$OUTPUT_NAME" "${OUTPUT_NAME}.o" std_libs/aelang_unified_io_${BITS}.o -lm 2>/dev/null
else
    gcc $GCC_ARCH -o "$OUTPUT_NAME" "${OUTPUT_NAME}.o" std_libs/aelang_unified_io_${BITS}.o -lm 2>/dev/null
fi
if [ $? -ne 0 ]; then
    echo "❌ Linking failed!"
    exit 1
fi

# Step 5: Clean up intermediate files
echo "[5/5] Cleaning up..."
rm -f "${OUTPUT_NAME}.asm" "${OUTPUT_NAME}.o"

echo "✅ Build successful! Output: $OUTPUT_NAME (${BITS}-bit)"
echo "🎯 Run with: ./$OUTPUT_NAME"
