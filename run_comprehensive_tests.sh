#!/bin/bash

# Comprehensive Test Suite Runner for ÆLang Compiler
# This script runs all test files and analyzes the results

echo "================================="
echo "ÆLang Compiler Test Suite Runner"
echo "================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Create test results directory
mkdir -p test_results

# Function to run a single test
run_test() {
    local test_file=$1
    local arch=$2
    local test_name=$(basename "$test_file" .ae)
    local output_file="test_results/${test_name}_${arch}.asm"
    local log_file="test_results/${test_name}_${arch}.log"
    
    echo -e "${BLUE}Testing:${NC} $test_name with $arch architecture"
    
    # Compile the test
    if ./compiler/build/aelang "$test_file" --${arch} -o "$output_file" > "$log_file" 2>&1; then
        echo -e "${GREEN}✓ PASS:${NC} $test_name ($arch) - Compilation successful"
        ((PASSED_TESTS++))
        
        # Analyze the generated assembly
        echo "  → Generated assembly: $output_file"
        echo "  → Log file: $log_file"
        
        # Check for specific patterns in assembly
        if grep -q "section .text" "$output_file"; then
            echo -e "  ${GREEN}✓${NC} Assembly structure correct"
        fi
        
        if [[ "$arch" == "arch32" ]] && grep -q "eax\|ebx\|esp\|ebp" "$output_file"; then
            echo -e "  ${GREEN}✓${NC} 32-bit registers detected"
        elif [[ "$arch" == "arch64" ]] && grep -q "rax\|rbx\|rsp\|rbp" "$output_file"; then
            echo -e "  ${GREEN}✓${NC} 64-bit registers detected"
        fi
        
    else
        echo -e "${RED}✗ FAIL:${NC} $test_name ($arch) - Compilation failed"
        echo "  → Error log: $log_file"
        cat "$log_file" | head -10
        ((FAILED_TESTS++))
    fi
    
    ((TOTAL_TESTS++))
    echo ""
}

# Function to analyze IR generation
analyze_ir_patterns() {
    local asm_file=$1
    local test_name=$2
    
    echo -e "${YELLOW}IR Analysis for $test_name:${NC}"
    
    # Count IR comments
    local ir_instructions=$(grep -c "; IR:" "$asm_file" 2>/dev/null || echo "0")
    echo "  → IR instructions generated: $ir_instructions"
    
    # Check for specific IR patterns
    if grep -q "; IR: LOAD_CONST" "$asm_file"; then
        echo -e "  ${GREEN}✓${NC} Constant loading detected"
    fi
    
    if grep -q "; IR: STORE_VAR" "$asm_file"; then
        echo -e "  ${GREEN}✓${NC} Variable storage detected"
    fi
    
    if grep -q "; IR: ADD\|; IR: SUB\|; IR: MUL\|; IR: DIV" "$asm_file"; then
        echo -e "  ${GREEN}✓${NC} Arithmetic operations detected"
    fi
    
    if grep -q "; IR: CALL" "$asm_file"; then
        echo -e "  ${GREEN}✓${NC} Function calls detected"
    fi
    
    echo ""
}

# Main test execution
echo -e "${YELLOW}Starting comprehensive test suite...${NC}\n"

# Test 1: Data Types Test (32-bit and 64-bit)
run_test "tests/01_data_types_test.ae" "arch32"
run_test "tests/01_data_types_test.ae" "arch64"

# Test 2: Operators and Precedence Test
run_test "tests/02_operators_precedence_test.ae" "arch32"
run_test "tests/02_operators_precedence_test.ae" "arch64"

# Test 3: I/O Functions Test
run_test "tests/03_io_functions_test.ae" "arch32"
run_test "tests/03_io_functions_test.ae" "arch64"

# Test 4: Edge Cases Test
run_test "tests/04_edge_cases_test.ae" "arch32"
run_test "tests/04_edge_cases_test.ae" "arch64"

# Test 5: Architecture-specific tests
run_test "tests/05_architecture_32bit_test.ae" "arch32"
run_test "tests/06_architecture_64bit_test.ae" "arch64"

# Test 6: IR Analysis Test
run_test "tests/07_ir_analysis_test.ae" "arch32"
run_test "tests/07_ir_analysis_test.ae" "arch64"

# Analyze IR patterns for the IR analysis test
if [[ -f "test_results/07_ir_analysis_test_arch32.asm" ]]; then
    analyze_ir_patterns "test_results/07_ir_analysis_test_arch32.asm" "IR Analysis (32-bit)"
fi

if [[ -f "test_results/07_ir_analysis_test_arch64.asm" ]]; then
    analyze_ir_patterns "test_results/07_ir_analysis_test_arch64.asm" "IR Analysis (64-bit)"
fi

# Test existing files to ensure compatibility
echo -e "${YELLOW}Testing existing program files...${NC}\n"

if [[ -f "arithmetic_test.ae" ]]; then
    run_test "arithmetic_test.ae" "arch32"
    run_test "arithmetic_test.ae" "arch64"
fi

# Test summary
echo "================================="
echo -e "${BLUE}Test Suite Summary${NC}"
echo "================================="
echo -e "Total tests run: ${YELLOW}$TOTAL_TESTS${NC}"
echo -e "Tests passed: ${GREEN}$PASSED_TESTS${NC}"
echo -e "Tests failed: ${RED}$FAILED_TESTS${NC}"

if [[ $FAILED_TESTS -eq 0 ]]; then
    echo -e "\n${GREEN}🎉 ALL TESTS PASSED! 🎉${NC}"
    echo "Your ÆLang compiler is working correctly!"
else
    echo -e "\n${RED}⚠️  Some tests failed${NC}"
    echo "Check the log files in test_results/ directory for details"
fi

echo ""
echo "Test results available in: test_results/"
echo "Generated assembly files: test_results/*.asm"
echo "Compilation logs: test_results/*.log"
