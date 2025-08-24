#!/bin/bash

# Simple ÆLang Test Builder
# Compiles .ae files using the working approach from existing tests

echo "=== Simple ÆLang Test Builder ==="

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <filename.ae>"
    exit 1
fi

TEST_FILE="$1"
BASENAME=$(basename "$TEST_FILE" .ae)

echo "Compiling: $TEST_FILE"

# Step 1: Make sure compiler is built
if [[ ! -f compiler/build/aelang ]]; then
    echo "Building compiler..."
    make -C compiler
fi

# Step 2: Compile the .ae file directly
echo "Compiling $TEST_FILE to assembly..."
if compiler/build/aelang "$TEST_FILE" --arch32 -o "${BASENAME}.asm"; then
    echo "✓ Compilation to assembly successful"
    
    # Step 3: Assemble to object file
    echo "Assembling to object file..."
    if nasm -f elf32 "${BASENAME}.asm" -o "${BASENAME}.o"; then
        echo "✓ Assembly successful"
        
        # Step 4: Link with the unified IO library
        echo "Linking final executable..."
        if gcc -m32 -no-pie "${BASENAME}.o" aelang_unified_io.o -o "$BASENAME"; then
            echo "✓ Linking successful"
            echo ""
            echo "Running $BASENAME:"
            echo "================================"
            ./"$BASENAME"
            echo "================================"
            echo "✅ Test completed successfully!"
            
            # Cleanup intermediate files
            rm -f "${BASENAME}.asm"
            
            exit 0
        else
            echo "❌ Linking failed"
            exit 1
        fi
    else
        echo "❌ Assembly failed"
        exit 1
    fi
else
    echo "❌ Compilation failed"
    exit 1
fi
