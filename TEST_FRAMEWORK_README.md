# ÆLang Compiler Test Framework

A comprehensive, automated testing framework for the ÆLang compiler that validates each stage of the compilation pipeline.

## 🎯 Features

- **Multi-stage Testing**: Tests lexer, parser, semantic analysis, IR generation, optimization, code generation, and execution
- **Automatic Test Discovery**: Finds and runs all `.ae` test files in the test directory
- **Golden File Comparison**: Compares outputs against expected results stored in `.tokens`, `.ast`, `.ir`, `.asm`, and `.out` files
- **Fail-Fast Diagnostics**: Stops at the first failing stage with detailed error reporting
- **Colored Diff Output**: Clear visual indication of differences between expected and actual outputs
- **Category-based Organization**: Tests grouped by feature (basic, functions, control_flow, arithmetic, etc.)
- **CI/CD Integration**: GitHub Actions workflow for automated testing
- **Pytest Integration**: Compatible with standard Python testing frameworks
- **Extensible Architecture**: Easy to add new test cases and stages

## 🚀 Quick Start

### Prerequisites

```bash
# Install Python dependencies
pip install colorama pytest pytest-html pytest-cov

# Ensure compiler is built
cd compiler && make clean && make
```

### Running Tests

```bash
# Run all tests
./test_framework.py

# Run tests for specific category
./test_framework.py --category basic
./test_framework.py --category functions

# Run with pytest
python -m pytest test_pytest.py -v

# Generate coverage report
python -m pytest test_pytest.py --cov=test_framework --cov-report=html
```

### Using Makefile

```bash
# Install dependencies and run all tests
make -f Makefile.test ci-test

# Run specific test categories
make -f Makefile.test test-basic
make -f Makefile.test test-functions

# Create a new test
make -f Makefile.test new-test

# Show test statistics
make -f Makefile.test test-stats
```

## 📁 Directory Structure

```
tests/
├── basic/
│   ├── hello.ae          # Test source code
│   ├── hello.tokens      # Expected lexer output
│   ├── hello.ir          # Expected IR output
│   ├── hello.asm         # Expected assembly output
│   └── hello.out         # Expected execution output
├── functions/
│   ├── simple_add.ae
│   └── simple_add.out
├── control_flow/
│   ├── simple_if.ae
│   └── simple_if.out
└── arithmetic/
    └── ...
```

## 🧪 Test Case Format

### Source File (`*.ae`)
```aelang
// Test description comment
extern print(format: str, ...);

func main(): void {
    print("Hello, ÆLang!\n");
}
```

### Expected Outputs

- **`*.tokens`**: Expected lexer token sequence
- **`*.ast`**: Expected AST structure (when debug output available)
- **`*.ir`**: Expected IR debug output
- **`*.asm`**: Expected assembly code (normalized)
- **`*.out`**: Expected program execution output

## 🔧 Test Framework Architecture

### Core Components

1. **`ÆLangTestFramework`**: Main test runner class
2. **`TestCase`**: Represents individual test with source and expected files
3. **`TestResult`**: Contains test outcome and comparison data
4. **`TestStage`**: Enum of compilation stages to test

### Test Stages

1. **Lexer**: Validates tokenization
2. **Parser**: Validates AST generation (when available)
3. **Semantic**: Validates semantic analysis
4. **IR**: Validates intermediate representation
5. **Optimizer**: Validates optimization passes
6. **Codegen**: Validates assembly generation
7. **Execution**: Validates program output

### Stage-by-Stage Testing

Each test case runs through stages sequentially:

```python
for stage in [LEXER, PARSER, IR, CODEGEN, EXECUTION]:
    result = run_stage(stage, test_case)
    if not result.passed:
        break  # Fail fast
```

## 📝 Creating New Tests

### 1. Manual Creation

```bash
# Create test directory
mkdir -p tests/my_category

# Create source file
cat > tests/my_category/my_test.ae << EOF
// My test description
extern print(format: str, ...);

func main(): void {
    print("My test output\n");
}
EOF

# Create expected output
echo "My test output" > tests/my_category/my_test.out
```

### 2. Using Makefile Template

```bash
make -f Makefile.test new-test
# Follow prompts to create test template
```

### 3. Generate Expected Files

Run the compiler manually to generate expected files:

```bash
# Generate expected assembly
./compiler/build/aelang tests/my_category/my_test.ae --arch32 -o expected.asm

# Generate expected execution output
./build_clean.sh tests/my_category/my_test.ae 32 > expected.out
```

## 🎨 Output Examples

### Successful Test Run
```
🧪 Running test: basic/hello
   Basic hello world test
   ✅ lexer stage passed
   ✅ ir stage passed
   ✅ codegen stage passed
   ✅ execution stage passed
✅ basic/hello PASSED
```

### Failed Test Run
```
🧪 Running test: functions/broken_add
   Function with syntax error
   ❌ parser stage failed
❌ functions/broken_add FAILED

🔍 PARSER STAGE FAILED:
Error: Syntax error at line 5: unexpected token

Diff:
- expected function declaration
+ found invalid token 'invalid'
```

## 🔄 CI/CD Integration

### GitHub Actions

The framework includes a complete GitHub Actions workflow (`.github/workflows/test.yml`) that:

- Tests multiple GCC versions (9, 10, 11)
- Tests both 32-bit and 64-bit architectures
- Generates coverage reports
- Uploads test artifacts
- Runs benchmark and integration tests

### Local CI Simulation

```bash
# Run the full CI test suite locally
make -f Makefile.test ci-test
```

## 🎯 Advanced Features

### Custom Stage Testing

Extend the framework to test additional stages:

```python
class CustomTestStage(TestStage):
    CUSTOM_ANALYSIS = "custom_analysis"

def _run_custom_analysis_test(self, source_file, expected_file, temp_dir):
    # Custom test implementation
    pass
```

### Snapshot Testing

Update expected outputs automatically:

```bash
./test_framework.py --update-snapshots
```

### Parallel Test Execution

```python
# Run tests in parallel using pytest-xdist
python -m pytest test_pytest.py -n auto
```

### Performance Benchmarking

```bash
# Time test execution
time ./test_framework.py --category functions
```

## 🔍 Debugging Failed Tests

### 1. Check Diff Output
The framework shows detailed diffs for failed comparisons with color coding:
- 🟢 Green: Added lines
- 🔴 Red: Removed lines
- 🔵 Blue: Context lines

### 2. Examine Temporary Files
Failed tests leave temporary files for inspection:
```bash
ls /tmp/aelang_test_*/
```

### 3. Run Individual Stages
Test specific stages in isolation:
```bash
./test_framework.py --category basic --stage execution
```

### 4. Verbose Output
Enable detailed logging:
```bash
./test_framework.py --verbose
```

## 🤝 Contributing

### Adding New Test Categories

1. Create directory: `tests/new_category/`
2. Add test files: `*.ae` and expected outputs
3. Update documentation
4. Submit pull request

### Improving the Framework

- Add new test stages
- Enhance diff formatting
- Improve error messages
- Add performance metrics
- Extend CI/CD pipeline

## 📊 Test Metrics

The framework tracks comprehensive metrics:

- Total tests run
- Pass/fail counts by category
- Execution time per stage
- Coverage statistics
- Performance benchmarks

Generate metrics report:
```bash
make -f Makefile.test test-stats
```

## 🚨 Troubleshooting

### Common Issues

1. **Compiler not found**: Ensure `compiler/build/aelang` exists
2. **Missing dependencies**: Run `make -f Makefile.test install-deps`
3. **Permission denied**: Check file permissions with `chmod +x test_framework.py`
4. **Test timeout**: Increase timeout in framework configuration

### Debug Mode

Enable debug output:
```bash
export AELANG_TEST_DEBUG=1
./test_framework.py
```

---

**The ÆLang Test Framework provides comprehensive, automated testing that ensures the reliability and correctness of every stage of the ÆLang compiler pipeline.**
