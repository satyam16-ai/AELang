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
C_PRINT_OBJ=$BUILD/print.o
C_PRINT_FLOAT_OBJ=$BUILD/print_float.o
C_PRINT_INT_OBJ=$BUILD/print_int.o
C_READ_INT_OBJ=$BUILD/read_int.o
C_READ_FLOAT_OBJ=$BUILD/read_float.o

# Step 1: Build compiler if not present
if [ ! -f $COMPILER/build/aelang ]; then
  echo "[0] Building ÆLang compiler..."
  make -C $COMPILER
fi

# Step 2: Compile C stubs
echo "[1/4] Compiling C stubs..."
gcc -m32 -c $CLIBS/print.c -o $C_PRINT_OBJ
gcc -m32 -c $CLIBS/print_int.c -o $C_PRINT_INT_OBJ
gcc -m32 -c $CLIBS/print_float.c -o $C_PRINT_FLOAT_OBJ
gcc -m32 -c $CLIBS/read_int.c -o $C_READ_INT_OBJ
gcc -m32 -c $CLIBS/read_float.c -o $C_READ_FLOAT_OBJ

# Step 3: Compile ÆLang source to NASM
echo "[2/4] Compiling $AE_FILE to $ASM_FILE..."
$COMPILER/build/aelang $AE_FILE $ASM_FILE

# Step 4: Assemble to ELF object
echo "[3/4] Assembling NASM to ELF object..."
nasm -f elf $ASM_FILE -o $OBJ_FILE

# Step 5: Link final binary
echo "[4/4] Linking final binary..."
gcc -m32 -o $BIN_FILE $OBJ_FILE $C_PRINT_OBJ $C_PRINT_INT_OBJ $C_READ_INT_OBJ $C_READ_FLOAT_OBJ

# Run the result
echo -e "\n✅ Build complete. Running ÆLang program:\n"
$BIN_FILE
