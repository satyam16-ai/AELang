#!/bin/bash
# ÆLang Comprehensive Test Runner - 32-bit Architecture
# Tests all data types with extreme values and edge cases

set -e  # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AE_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$AE_DIR/build"
TEST_DIR="$AE_DIR/tests"

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                 ÆLang 32-bit Test Suite Runner                  ║"
echo "║              Testing All Data Types - Extreme Cases             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [[ ! -f "$AE_DIR/compiler/Makefile" ]]; then
    echo "Error: Please run this script from the ÆLang root directory"
    exit 1
fi

# Clean and build compiler
echo "🔧 Building ÆLang Compiler..."
make -C "$AE_DIR/compiler" clean > /dev/null 2>&1
make -C "$AE_DIR/compiler" > /dev/null 2>&1
echo "✅ Compiler built successfully"

# Clean and build runtime library
echo "🔧 Building Runtime Library..."
cd "$AE_DIR"
gcc -Wall -Wextra -std=c99 -c std_libs/aelang_unified_io.c -o std_libs/aelang_unified_io.o
echo "✅ Runtime library built successfully"

# Compile test for 32-bit architecture
echo "🔧 Compiling 32-bit Test..."
"$AE_DIR/compiler/build/aelang" "$TEST_DIR/comprehensive_32bit_test.ae" --arch32 -o "$BUILD_DIR/test_32bit.asm"
echo "✅ 32-bit test compiled successfully"

# Assemble and link
echo "🔧 Assembling and Linking..."
nasm -f elf64 "$BUILD_DIR/test_32bit.asm" -o "$BUILD_DIR/test_32bit.o"
gcc -Wall -g -o "$BUILD_DIR/test_32bit" "$BUILD_DIR/test_32bit.o" "$AE_DIR/std_libs/aelang_unified_io.o" -lm
echo "✅ 32-bit test executable created"

# Run the test
echo ""
echo "🚀 Running 32-bit Comprehensive Test Suite..."
echo "📊 Testing with extreme values and edge cases"
echo "⚠️  Note: 64-bit values will be truncated to 32-bit"
echo ""

# Check if test data file exists
if [[ ! -f "$TEST_DIR/test_data_32bit.txt" ]]; then
    echo "⚠️  Test data file not found. Running interactive test..."
    "$BUILD_DIR/test_32bit"
else
    echo "📁 Using test data from: test_data_32bit.txt"
    # Remove comments and empty lines, then run test
    grep -v '^#' "$TEST_DIR/test_data_32bit.txt" | grep -v '^$' | "$BUILD_DIR/test_32bit"
fi

echo ""
echo "🎉 32-bit Test Suite Complete!"
echo ""
echo "📈 Test Coverage Summary:"
echo "   ✅ All signed integer types (i8, i16, i32, i64*)"
echo "   ✅ All unsigned integer types (u8, u16, u32, u64*)"
echo "   ✅ All floating point types (f32, f64, num)"
echo "   ✅ Boolean and character types"
echo "   ✅ Edge cases and overflow conditions"
echo "   ✅ Boundary value testing"
echo ""
echo "   * 64-bit types tested with 32-bit truncation"
echo ""
echo "🔍 Check the output above for any issues or unexpected behaviors"
echo "📝 Compare with expected values in test_data_32bit.txt"
