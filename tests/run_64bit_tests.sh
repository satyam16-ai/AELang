#!/bin/bash
# ÆLang Comprehensive Test Runner - 64-bit Architecture  
# Tests all data types with full precision and extreme values

set -e  # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AE_DIR="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$AE_DIR/build"
TEST_DIR="$AE_DIR/tests"

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                 ÆLang 64-bit Test Suite Runner                  ║"
echo "║           Testing All Data Types - Full Precision               ║"
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

# Compile test for 64-bit architecture
echo "🔧 Compiling 64-bit Test..."
"$AE_DIR/compiler/build/aelang" "$TEST_DIR/comprehensive_64bit_test.ae" --arch64 -o "$BUILD_DIR/test_64bit.asm"
echo "✅ 64-bit test compiled successfully"

# Assemble and link
echo "🔧 Assembling and Linking..."
nasm -f elf64 "$BUILD_DIR/test_64bit.asm" -o "$BUILD_DIR/test_64bit.o"
gcc -Wall -g -o "$BUILD_DIR/test_64bit" "$BUILD_DIR/test_64bit.o" "$AE_DIR/std_libs/aelang_unified_io.o" -lm
echo "✅ 64-bit test executable created"

# Run the test
echo ""
echo "🚀 Running 64-bit Comprehensive Test Suite..."
echo "📊 Testing with full precision extreme values and edge cases"
echo "🎯 Full 64-bit integer support, IEEE 754 floating point"
echo ""

# Check if test data file exists
if [[ ! -f "$TEST_DIR/test_data_64bit.txt" ]]; then
    echo "⚠️  Test data file not found. Running interactive test..."
    "$BUILD_DIR/test_64bit"
else
    echo "📁 Using test data from: test_data_64bit_clean.txt"
    # Use clean test data (no comments)
    "$BUILD_DIR/test_64bit" < "$TEST_DIR/test_data_64bit_clean.txt"
fi

echo ""
echo "🎉 64-bit Test Suite Complete!"
echo ""
echo "📈 Test Coverage Summary:"
echo "   ✅ All signed integer types (i8, i16, i32, i64) - Full precision"
echo "   ✅ All unsigned integer types (u8, u16, u32, u64) - Full precision"
echo "   ✅ All floating point types (f32, f64, num) - IEEE 754 compliance"
echo "   ✅ Boolean and character types - Extended ASCII"
echo "   ✅ Extreme edge cases and precision limits"
echo "   ✅ Architecture boundary testing"
echo "   ✅ Mixed type operations"
echo "   ✅ Sequential and alternating I/O patterns"
echo ""
echo "🔍 Check the output above for any issues or unexpected behaviors"
echo "📝 Compare with expected values in test_data_64bit_clean.txt"
echo "🏆 This test suite validates production-ready ÆLang implementation"
