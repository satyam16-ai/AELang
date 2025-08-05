#!/bin/bash

set -e

# ÆLang Professional Build Script (Updated for professional runtime library)
# Uses the new aelang_runtime.c from std_libs/ directory
# All .ae programs are now in ae_programs/ directory
# Supports both 32-bit and 64-bit architectures

# Architecture Configuration (default to 32-bit)
ARCH=${2:-32}
if [[ "$ARCH" == "64" ]]; then
    ARCH_FLAGS="-m64"
    NASM_FLAGS="-f elf64"
    ARCH_SUFFIX="64"
else
    ARCH_FLAGS="-m32" 
    NASM_FLAGS="-f elf32"
    ARCH_SUFFIX="32"
fi

echo "Building for ${ARCH_SUFFIX}-bit architecture..."

# Paths
BUILD=build
AE_PROGRAMS=ae_programs
COMPILER=compiler
INCLUDE=$COMPILER/include
SRC=$COMPILER/src
STD_LIBS=std_libs

# Input/Output Files
INPUT_FILE=${1:-$AE_PROGRAMS/unified_io_test.ae}
BASENAME=$(basename "$INPUT_FILE" .ae)
AE_FILE=$INPUT_FILE
ASM_FILE=$BUILD/${BASENAME}_${ARCH_SUFFIX}.asm
OBJ_FILE=$BUILD/${BASENAME}_${ARCH_SUFFIX}.o
BIN_FILE=$BUILD/${BASENAME}_${ARCH_SUFFIX}
# ÆLang Runtime Library object file
AELANG_RUNTIME_OBJ=$BUILD/aelang_runtime_${ARCH_SUFFIX}.o

# Step 1: Build compiler if not present
if [ ! -f $COMPILER/build/aelang ]; then
  echo "[0] Building ÆLang compiler..."
  make -C $COMPILER
fi

# Step 2: Compile ÆLang Runtime Library
echo "[1/4] Compiling ÆLang runtime library (${ARCH_SUFFIX}-bit)..."
gcc $ARCH_FLAGS -c $STD_LIBS/aelang_runtime.c -o $AELANG_RUNTIME_OBJ

# Step 3: Compile ÆLang source to NASM
echo "[2/4] Compiling $AE_FILE to $ASM_FILE..."
if [[ "$ARCH" == "64" ]]; then
    $COMPILER/build/aelang $AE_FILE --arch64 -o $ASM_FILE
else
    $COMPILER/build/aelang $AE_FILE -o $ASM_FILE
fi

# Step 4: Assemble to ELF object
echo "[3/4] Assembling NASM to ELF object (${ARCH_SUFFIX}-bit)..."
nasm $NASM_FLAGS $ASM_FILE -o $OBJ_FILE

# Step 5: Link final binary
echo "[4/4] Linking final binary (${ARCH_SUFFIX}-bit)..."
gcc $ARCH_FLAGS -no-pie -o $BIN_FILE $OBJ_FILE $AELANG_RUNTIME_OBJ

# Run the result
echo -e "\n✅ Build complete (${ARCH_SUFFIX}-bit). Running ÆLang program:\n"
echo "=================================================="
$BIN_FILE
echo "=================================================="
echo -e "\nUsage: $0 <program.ae> [32|64]"
echo "Example: $0 ae_programs/add.ae 64"
# ÆLang Runtime Library object file
AELANG_RUNTIME_OBJ=$BUILD/aelang_runtime_${ARCH_SUFFIX}.o

# Step 1: Build compiler if not present
if [ ! -f $COMPILER/build/aelang ]; then
  echo "[0] Building ÆLang compiler..."
  make -C $COMPILER
fi

# Step 2: Compile ÆLang Runtime Library
echo "[1/4] Compiling ÆLang runtime library (${ARCH_SUFFIX}-bit)..."
gcc $ARCH_FLAGS -c $STD_LIBS/aelang_runtime.c -o $AELANG_RUNTIME_OBJ

# Step 3: Compile ÆLang source to NASM
echo "[2/4] Compiling $AE_FILE to $ASM_FILE..."
if [[ "$ARCH" == "64" ]]; then
    $COMPILER/build/aelang $AE_FILE --arch64 -o $ASM_FILE
else
    $COMPILER/build/aelang $AE_FILE -o $ASM_FILE
fi

# Step 4: Assemble to ELF object
echo "[3/4] Assembling NASM to ELF object (${ARCH_SUFFIX}-bit)..."
nasm $NASM_FLAGS $ASM_FILE -o $OBJ_FILE

# Step 5: Link final binary
echo "[4/4] Linking final binary (${ARCH_SUFFIX}-bit)..."
gcc $ARCH_FLAGS -no-pie -o $BIN_FILE $OBJ_FILE $AELANG_RUNTIME_OBJ

# Run the result
echo -e "\n✅ Build complete (${ARCH_SUFFIX}-bit). Running ÆLang program:\n"
echo "=================================================="
$BIN_FILE
echo "=================================================="
echo -e "\nUsage: $0 <program.ae> [32|64]"
echo "Example: $0 ae_programs/add.ae 64"
