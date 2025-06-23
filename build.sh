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
AE_FILE=$EXAMPLES/hello.ae
ASM_FILE=$BUILD/hello.asm
OBJ_FILE=$BUILD/hello.o
BIN_FILE=$BUILD/hello
C_STUB_OBJ=$BUILD/print.o

# Step 1: Build compiler if not present
if [ ! -f $COMPILER/build/aelang ]; then
  echo "[0] Building ÆLang compiler..."
  make -C $COMPILER
fi

# Step 2: Compile print.c stub
echo "[1/4] Compiling C print stub..."
gcc -m32 -c $CLIBS/print.c -o $C_STUB_OBJ

# Step 3: Compile ÆLang source to NASM
echo "[2/4] Compiling $AE_FILE to $ASM_FILE..."
$COMPILER/build/aelang $AE_FILE $ASM_FILE

# Step 4: Assemble to ELF object
echo "[3/4] Assembling NASM to ELF object..."
nasm -f elf $ASM_FILE -o $OBJ_FILE

# Step 5: Link final binary
# Use ld with -lc and -dynamic-linker for C library support
ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o $BIN_FILE $OBJ_FILE $C_STUB_OBJ -lc

# Run the result
echo -e "\n✅ Build complete. Running ÆLang program:\n"
$BIN_FILE
