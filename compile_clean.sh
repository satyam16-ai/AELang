#!/bin/bash

# ÆLang Clean Compilation Script
# Compiles C programs with ÆLang Unified I/O Library without warnings

if [ $# -eq 0 ]; then
    echo "Usage: $0 <source_file> [output_name]"
    echo "Example: $0 test.c test_program"
    exit 1
fi

SOURCE_FILE="$1"
OUTPUT_NAME="${2:-${SOURCE_FILE%.*}}"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' not found!"
    exit 1
fi

# Check if unified I/O library exists
if [ ! -f "std_libs/aelang_unified_io.c" ]; then
    echo "Error: ÆLang Unified I/O library not found at std_libs/aelang_unified_io.c"
    exit 1
fi

# Compile with clean flags
echo "Compiling $SOURCE_FILE with ÆLang Unified I/O Library..."
gcc -Wall -Wextra -Wno-unused-parameter -O2 -o "$OUTPUT_NAME" "$SOURCE_FILE" std_libs/aelang_unified_io.c -lm

if [ $? -eq 0 ]; then
    echo "✅ Compilation successful! Output: $OUTPUT_NAME"
    echo "🚀 Run with: ./$OUTPUT_NAME"
else
    echo "❌ Compilation failed!"
    exit 1
fi
