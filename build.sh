#!/bin/bash

set -e

# ÆLang Project Build Script (matching current tree structure)

# Paths
BUILD=build
EXAMPLES=examples
COMPILER=compiler
INCLUDE=$COMPILER/include
SRC=$COMPILER/src
CLIBS=c_libs

# Input/Output Files
INPUT_FILE=${1:-$EXAMPLES/hello.ae}
BASENAME=$(basename "$INPUT_FILE" .ae)
AE_FILE=$INPUT_FILE
ASM_FILE=$BUILD/$BASENAME.asm
OBJ_FILE=$BUILD/$BASENAME.o
BIN_FILE=$BUILD/$BASENAME
# Universal C library object file
C_UNIVERSAL_OBJ=$BUILD/aelang_universal.o

# Step 1: Build compiler if not present
if [ ! -f $COMPILER/build/aelang ]; then
  echo "[0] Building ÆLang compiler..."
  make -C $COMPILER
fi

# Step 2: Compile universal C library
echo "[1/4] Compiling universal C library..."
gcc -m32 -c $CLIBS/aelang_universal.c -o $C_UNIVERSAL_OBJ

# Step 3: Compile ÆLang source to NASM
echo "[2/4] Compiling $AE_FILE to $ASM_FILE..."
$COMPILER/build/aelang $AE_FILE $ASM_FILE

# Step 4: Assemble to ELF object
echo "[3/4] Assembling NASM to ELF object..."
nasm -f elf $ASM_FILE -o $OBJ_FILE

# Step 5: Link final binary
echo "[4/4] Linking final binary..."
gcc -m32 -o $BIN_FILE $OBJ_FILE $C_UNIVERSAL_OBJ

# Run the result
echo -e "\n✅ Build complete. Running ÆLang program:\n"
$BIN_FILE
