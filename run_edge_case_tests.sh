#!/bin/bash

# ÆLang Edge Case Test Suite for 32-bit and 64-bit Architectures
# Tests various edge cases to ensure robust cross-architecture compatibility

set -e  # Exit on any error

COMPILER="./compiler/build/aelang"
C_LIB="c_libs/aelang_universal.c"
TEST_DIR="edge_case_results"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create results directory
mkdir -p "$TEST_DIR"

echo -e "${BLUE}=======================================================${NC}"
echo -e "${BLUE}    ÆLANG COMPREHENSIVE EDGE CASE TEST SUITE${NC}"
echo -e "${BLUE}=======================================================${NC}"

# Test files array
declare -a TEST_FILES=(
    "test_recursion_edge_cases.ae"
    "test_expression_edge_cases.ae" 
    "test_integer_boundaries.ae"
    "test_stack_edge_cases.ae"
    "test_comparison_edge_cases.ae"
)

# Test descriptions
declare -A TEST_DESCRIPTIONS=(
    ["test_recursion_edge_cases.ae"]="Deep recursion, mutual recursion, Fibonacci"
    ["test_expression_edge_cases.ae"]="Complex nested expressions and function calls"
    ["test_integer_boundaries.ae"]="Integer overflow, underflow, and boundary values"
    ["test_stack_edge_cases.ae"]="Many parameters, stack-intensive operations"
    ["test_comparison_edge_cases.ae"]="Logical operations, comparisons, edge conditions"
)

# Function to run test for specific architecture
run_test_arch() {
    local test_file="$1"
    local arch="$2"
    local arch_flag="$3"
    local output_suffix="$4"
    
    echo -e "${YELLOW}[INFO]${NC} Testing ${test_file} on ${arch} architecture..."
    
    # Check if test file exists
    if [[ ! -f "$test_file" ]]; then
        echo -e "${RED}[ERROR]${NC} Test file $test_file not found!"
        return 1
    fi
    
    local base_name=$(basename "$test_file" .ae)
    local asm_file="${TEST_DIR}/${base_name}_${output_suffix}.asm"
    local obj_file="${TEST_DIR}/${base_name}_${output_suffix}.o"
    local exe_file="${TEST_DIR}/${base_name}_${output_suffix}"
    local out_file="${TEST_DIR}/${base_name}_${output_suffix}.txt"
    
    # Compile to assembly
    if ! $COMPILER "$test_file" $arch_flag -o "$asm_file" 2>&1; then
        echo -e "${RED}[ERROR]${NC} Compilation failed for $test_file ($arch)"
        return 1
    fi
    
    # Assemble and link
    if [[ "$arch" == "32-bit" ]]; then
        # Use 32-bit format and linking for 32-bit assembly
        if ! nasm -f elf32 "$asm_file" -o "$obj_file" 2>/dev/null; then
            echo -e "${RED}[ERROR]${NC} Assembly failed for $test_file ($arch)"
            return 1
        fi
        
        if ! gcc -m32 -o "$exe_file" "$obj_file" "$C_LIB" 2>/dev/null; then
            echo -e "${RED}[ERROR]${NC} Linking failed for $test_file ($arch)"
            return 1
        fi
    else
        # Use 64-bit format and linking for 64-bit assembly
        if ! nasm -f elf64 "$asm_file" -o "$obj_file" 2>/dev/null; then
            echo -e "${RED}[ERROR]${NC} Assembly failed for $test_file ($arch)"
            return 1
        fi
        
        if ! gcc -o "$exe_file" "$obj_file" "$C_LIB" 2>/dev/null; then
            echo -e "${RED}[ERROR]${NC} Linking failed for $test_file ($arch)"
            return 1
        fi
    fi
    
    # Execute test with timeout
    if timeout 30s "$exe_file" > "$out_file" 2>&1; then
        echo -e "${GREEN}[SUCCESS]${NC} $test_file completed successfully on $arch"
        return 0
    else
        local exit_code=$?
        echo -e "${RED}[ERROR]${NC} $test_file failed on $arch (exit code: $exit_code)"
        if [[ $exit_code == 124 ]]; then
            echo -e "${RED}[ERROR]${NC} Test timed out (possible infinite loop)"
        elif [[ $exit_code == 139 ]]; then
            echo -e "${RED}[ERROR]${NC} Segmentation fault detected"
        fi
        return 1
    fi
}

# Function to compare outputs between architectures
compare_outputs() {
    local test_file="$1"
    local base_name=$(basename "$test_file" .ae)
    local out_32="${TEST_DIR}/${base_name}_32bit.txt"
    local out_64="${TEST_DIR}/${base_name}_64bit.txt"
    
    if [[ -f "$out_32" ]] && [[ -f "$out_64" ]]; then
        if diff -q "$out_32" "$out_64" > /dev/null; then
            echo -e "${GREEN}[SUCCESS]${NC} ✅ Outputs match between 32-bit and 64-bit"
            return 0
        else
            echo -e "${RED}[WARNING]${NC} ⚠️  Outputs differ between architectures"
            echo -e "${YELLOW}[INFO]${NC} Saving diff to ${TEST_DIR}/${base_name}_diff.txt"
            diff "$out_32" "$out_64" > "${TEST_DIR}/${base_name}_diff.txt" || true
            return 1
        fi
    else
        echo -e "${RED}[ERROR]${NC} Cannot compare - missing output files"
        return 1
    fi
}

# Main test execution
total_tests=0
passed_tests=0
failed_tests=0
architecture_mismatches=0

echo -e "${BLUE}[INFO]${NC} Building compiler..."
if ! (cd compiler && make clean && make) > /dev/null 2>&1; then
    echo -e "${RED}[ERROR]${NC} Compiler build failed!"
    exit 1
fi
echo -e "${GREEN}[SUCCESS]${NC} Compiler built successfully"

echo ""
echo -e "${BLUE}=== RUNNING EDGE CASE TESTS ===${NC}"

for test_file in "${TEST_FILES[@]}"; do
    echo ""
    echo -e "${BLUE}--- Testing: $test_file ---${NC}"
    echo -e "${YELLOW}Description:${NC} ${TEST_DESCRIPTIONS[$test_file]}"
    
    total_tests=$((total_tests + 2))  # 2 architectures per test
    
    # Test 32-bit
    if run_test_arch "$test_file" "32-bit" "--arch32" "32bit"; then
        passed_tests=$((passed_tests + 1))
    else
        failed_tests=$((failed_tests + 1))
    fi
    
    # Test 64-bit
    if run_test_arch "$test_file" "64-bit" "--arch64" "64bit"; then
        passed_tests=$((passed_tests + 1))
    else
        failed_tests=$((failed_tests + 1))
    fi
    
    # Compare outputs
    echo -e "${YELLOW}[INFO]${NC} Comparing 32-bit vs 64-bit outputs..."
    if ! compare_outputs "$test_file"; then
        architecture_mismatches=$((architecture_mismatches + 1))
    fi
done

echo ""
echo -e "${BLUE}=======================================================${NC}"
echo -e "${BLUE}                 FINAL RESULTS${NC}"
echo -e "${BLUE}=======================================================${NC}"
echo -e "${GREEN}✅ Tests Passed:${NC} $passed_tests/$total_tests"
echo -e "${RED}❌ Tests Failed:${NC} $failed_tests/$total_tests"
echo -e "${YELLOW}⚠️  Architecture Mismatches:${NC} $architecture_mismatches/$(( ${#TEST_FILES[@]} ))"

if [[ $failed_tests -eq 0 ]] && [[ $architecture_mismatches -eq 0 ]]; then
    echo -e "${GREEN}🎉 ALL EDGE CASE TESTS PASSED! 🎉${NC}"
    echo -e "${GREEN}Perfect cross-architecture compatibility achieved!${NC}"
    exit 0
else
    echo -e "${RED}❌ Some tests failed or architectures don't match${NC}"
    echo -e "${YELLOW}Check results in: $TEST_DIR/${NC}"
    exit 1
fi
