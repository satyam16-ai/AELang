#!/usr/bin/env python3
"""
ÆLang Compiler Test Framework
A comprehensive testing system for the ÆLang compiler pipeline.
"""

import os
import sys
import subprocess
import json
import difflib
import argparse
import glob
from pathlib import Path
from typing import Dict, List, Tuple, Optional
from dataclasses import dataclass
from enum import Enum
import tempfile
import shutil
import re
from colorama import Fore, Back, Style, init

# Initialize colorama for cross-platform colored output
init(autoreset=True)

class TestStage(Enum):
    LEXER = "lexer"
    PARSER = "parser"
    SEMANTIC = "semantic"
    IR = "ir"
    OPTIMIZER = "optimizer"
    CODEGEN = "codegen"
    EXECUTION = "execution"

@dataclass
class TestResult:
    stage: TestStage
    passed: bool
    expected: str
    actual: str
    error_message: str = ""
    diff: List[str] = None

@dataclass
class TestCase:
    name: str
    category: str
    source_file: Path
    expected_files: Dict[TestStage, Path]
    description: str = ""

class ÆLangTestFramework:
    def __init__(self, compiler_dir: Path, test_dir: Path):
        self.compiler_dir = Path(compiler_dir).resolve()
        self.test_dir = Path(test_dir).resolve()
        self.compiler_binary = self.compiler_dir / "build" / "aelang"
        self.build_script = Path("build_clean.sh").resolve()
        self.temp_dir = None
        
        # Statistics
        self.total_tests = 0
        self.passed_tests = 0
        self.failed_tests = 0
        self.skipped_tests = 0
        
    def setup(self):
        """Setup the test environment"""
        print(f"{Fore.CYAN}🔧 Setting up ÆLang Test Framework{Style.RESET_ALL}")
        
        # Ensure compiler is built
        if not self.compiler_binary.exists():
            print(f"{Fore.YELLOW}⚠️  Compiler not found, building...{Style.RESET_ALL}")
            self._build_compiler()
        
        # Create temporary directory for test outputs
        self.temp_dir = Path(tempfile.mkdtemp(prefix="aelang_test_"))
        print(f"{Fore.GREEN}✅ Test environment ready{Style.RESET_ALL}")
        
    def cleanup(self):
        """Clean up test environment"""
        if self.temp_dir and self.temp_dir.exists():
            shutil.rmtree(self.temp_dir)
    
    def _build_compiler(self):
        """Build the ÆLang compiler"""
        try:
            result = subprocess.run(
                ["make", "clean", "&&", "make"],
                cwd=self.compiler_dir,
                shell=True,
                capture_output=True,
                text=True,
                timeout=60
            )
            if result.returncode != 0:
                raise RuntimeError(f"Compiler build failed: {result.stderr}")
        except Exception as e:
            print(f"{Fore.RED}❌ Failed to build compiler: {e}{Style.RESET_ALL}")
            sys.exit(1)
    
    def discover_tests(self) -> List[TestCase]:
        """Discover all test cases in the test directory"""
        test_cases = []
        
        # Find all .ae test files
        for ae_file in self.test_dir.rglob("*.ae"):
            category = ae_file.parent.name
            test_name = ae_file.stem
            
            # Find expected output files
            expected_files = {}
            base_path = ae_file.parent / test_name
            
            for stage in TestStage:
                ext_map = {
                    TestStage.LEXER: ".tokens",
                    TestStage.PARSER: ".ast", 
                    TestStage.SEMANTIC: ".sem",
                    TestStage.IR: ".ir",
                    TestStage.OPTIMIZER: ".opt.ir",
                    TestStage.CODEGEN: ".asm",
                    TestStage.EXECUTION: ".out"
                }
                
                expected_file = Path(str(base_path) + ext_map[stage])
                if expected_file.exists():
                    expected_files[stage] = expected_file
            
            # Read description from comment in source file
            description = self._extract_description(ae_file)
            
            test_cases.append(TestCase(
                name=test_name,
                category=category,
                source_file=ae_file,
                expected_files=expected_files,
                description=description
            ))
        
        return sorted(test_cases, key=lambda tc: (tc.category, tc.name))
    
    def _extract_description(self, source_file: Path) -> str:
        """Extract test description from source file comments"""
        try:
            with open(source_file, 'r') as f:
                first_line = f.readline().strip()
                if first_line.startswith("//"):
                    return first_line[2:].strip()
        except:
            pass
        return ""
    
    def run_test_case(self, test_case: TestCase) -> Dict[TestStage, TestResult]:
        """Run a single test case through all stages"""
        results = {}
        
        print(f"\n{Fore.BLUE}🧪 Running test: {test_case.category}/{test_case.name}{Style.RESET_ALL}")
        if test_case.description:
            print(f"   {Fore.CYAN}{test_case.description}{Style.RESET_ALL}")
        
        # Create test-specific temp directory
        test_temp_dir = self.temp_dir / f"{test_case.category}_{test_case.name}"
        test_temp_dir.mkdir(parents=True, exist_ok=True)
        
        # Copy source file to temp directory
        temp_source = test_temp_dir / f"{test_case.name}.ae"
        shutil.copy2(test_case.source_file, temp_source)
        
        # Run through each stage
        for stage in TestStage:
            if stage not in test_case.expected_files:
                continue
                
            try:
                result = self._run_stage(stage, temp_source, test_temp_dir, test_case)
                results[stage] = result
                
                if not result.passed:
                    print(f"   {Fore.RED}❌ {stage.value} stage failed{Style.RESET_ALL}")
                    break  # Fail fast
                else:
                    print(f"   {Fore.GREEN}✅ {stage.value} stage passed{Style.RESET_ALL}")
                    
            except Exception as e:
                results[stage] = TestResult(
                    stage=stage,
                    passed=False,
                    expected="",
                    actual="",
                    error_message=str(e)
                )
                print(f"   {Fore.RED}❌ {stage.value} stage error: {e}{Style.RESET_ALL}")
                break
        
        return results
    
    def _run_stage(self, stage: TestStage, source_file: Path, temp_dir: Path, test_case: TestCase) -> TestResult:
        """Run a specific compilation stage"""
        expected_file = test_case.expected_files[stage]
        
        if stage == TestStage.LEXER:
            return self._run_lexer_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.PARSER:
            return self._run_parser_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.SEMANTIC:
            return self._run_semantic_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.IR:
            return self._run_ir_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.OPTIMIZER:
            return self._run_optimizer_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.CODEGEN:
            return self._run_codegen_test(source_file, expected_file, temp_dir)
        elif stage == TestStage.EXECUTION:
            return self._run_execution_test(source_file, expected_file, temp_dir)
        else:
            raise ValueError(f"Unknown test stage: {stage}")
    
    def _run_lexer_test(self, source_file: Path, expected_file: Path, temp_dir: Path) -> TestResult:
        """Test lexer output"""
        result = subprocess.run([
            str(self.compiler_binary), 
            str(source_file), 
            "--arch32",
            "-o", str(temp_dir / "dummy.asm")
        ], capture_output=True, text=True, cwd=temp_dir)
        
        # Extract token information from debug output
        actual_tokens = self._extract_tokens_from_debug(result.stdout)
        expected_tokens = expected_file.read_text().strip()
        
        passed = actual_tokens.strip() == expected_tokens.strip()
        diff = None
        if not passed:
            diff = list(difflib.unified_diff(
                expected_tokens.splitlines(keepends=True),
                actual_tokens.splitlines(keepends=True),
                fromfile="expected",
                tofile="actual"
            ))
        
        return TestResult(
            stage=TestStage.LEXER,
            passed=passed,
            expected=expected_tokens,
            actual=actual_tokens,
            diff=diff
        )
    
    def _run_parser_test(self, source_file: Path, expected_file: Path, temp_dir: Path) -> TestResult:
        """Test parser AST output"""
        result = subprocess.run([
            str(self.compiler_binary),
            str(source_file),
            "--arch32", 
            "-o", str(temp_dir / "dummy.asm")
        ], capture_output=True, text=True, cwd=temp_dir)
        
        actual_ast = self._extract_ast_from_debug(result.stderr)
        expected_ast = expected_file.read_text().strip()
        
        passed = actual_ast.strip() == expected_ast.strip()
        diff = None
        if not passed:
            diff = list(difflib.unified_diff(
                expected_ast.splitlines(keepends=True),
                actual_ast.splitlines(keepends=True),
                fromfile="expected",
                tofile="actual"
            ))
        
        return TestResult(
            stage=TestStage.PARSER,
            passed=passed,
            expected=expected_ast,
            actual=actual_ast,
            diff=diff
        )
    
    def _run_ir_test(self, source_file: Path, expected_file: Path, temp_dir: Path) -> TestResult:
        """Test IR generation output"""
        result = subprocess.run([
            str(self.compiler_binary),
            str(source_file),
            "--arch32",
            "-o", str(temp_dir / "dummy.asm")
        ], capture_output=True, text=True, cwd=temp_dir)
        
        actual_ir = self._extract_ir_from_debug(result.stdout)
        expected_ir = expected_file.read_text().strip()
        
        passed = actual_ir.strip() == expected_ir.strip()
        diff = None
        if not passed:
            diff = list(difflib.unified_diff(
                expected_ir.splitlines(keepends=True),
                actual_ir.splitlines(keepends=True),
                fromfile="expected",
                tofile="actual"
            ))
        
        return TestResult(
            stage=TestStage.IR,
            passed=passed,
            expected=expected_ir,
            actual=actual_ir,
            diff=diff
        )
    
    def _run_codegen_test(self, source_file: Path, expected_file: Path, temp_dir: Path) -> TestResult:
        """Test assembly code generation"""
        asm_output = temp_dir / f"{source_file.stem}.asm"
        
        result = subprocess.run([
            str(self.compiler_binary),
            str(source_file),
            "--arch32",
            "-o", str(asm_output)
        ], capture_output=True, text=True, cwd=temp_dir)
        
        if result.returncode != 0:
            return TestResult(
                stage=TestStage.CODEGEN,
                passed=False,
                expected="",
                actual="",
                error_message=f"Compilation failed: {result.stderr}"
            )
        
        actual_asm = asm_output.read_text()
        expected_asm = expected_file.read_text()
        
        # Normalize assembly for comparison (remove timestamps, addresses, etc.)
        actual_normalized = self._normalize_assembly(actual_asm)
        expected_normalized = self._normalize_assembly(expected_asm)
        
        passed = actual_normalized == expected_normalized
        diff = None
        if not passed:
            diff = list(difflib.unified_diff(
                expected_normalized.splitlines(keepends=True),
                actual_normalized.splitlines(keepends=True),
                fromfile="expected",
                tofile="actual"
            ))
        
        return TestResult(
            stage=TestStage.CODEGEN,
            passed=passed,
            expected=expected_normalized,
            actual=actual_normalized,
            diff=diff
        )
    
    def _run_execution_test(self, source_file: Path, expected_file: Path, temp_dir: Path) -> TestResult:
        """Test program execution output"""
        # Copy build script and ensure it can find the compiler
        build_script_copy = temp_dir / "build_clean.sh"
        shutil.copy2(self.build_script, build_script_copy)
        build_script_copy.chmod(0o755)
        
        # Create a symlink to the compiler directory so the build script can find it
        compiler_link = temp_dir / "compiler"
        if not compiler_link.exists():
            compiler_link.symlink_to(self.compiler_dir.resolve())
        
        # Create symlink to std_libs directory
        std_libs_link = temp_dir / "std_libs"
        if not std_libs_link.exists():
            std_libs_path = Path("std_libs").resolve()
            if std_libs_path.exists():
                std_libs_link.symlink_to(std_libs_path)
        
        # Build and run the program
        result = subprocess.run([
            str(build_script_copy),
            str(source_file.name),
            "32"
        ], capture_output=True, text=True, cwd=temp_dir)
        
        if result.returncode != 0:
            return TestResult(
                stage=TestStage.EXECUTION,
                passed=False,
                expected="",
                actual="",
                error_message=f"Execution failed: {result.stderr}"
            )
        
        # Extract program output between the separators
        actual_output = self._extract_program_output(result.stdout)
        expected_output = expected_file.read_text().strip()
        
        passed = actual_output.strip() == expected_output.strip()
        diff = None
        if not passed:
            diff = list(difflib.unified_diff(
                expected_output.splitlines(keepends=True),
                actual_output.splitlines(keepends=True),
                fromfile="expected",
                tofile="actual"
            ))
        
        return TestResult(
            stage=TestStage.EXECUTION,
            passed=passed,
            expected=expected_output,
            actual=actual_output,
            diff=diff
        )
    
    def _extract_tokens_from_debug(self, debug_output: str) -> str:
        """Extract token information from compiler debug output"""
        tokens = []
        lines = debug_output.split('\n')
        
        for line in lines:
            # Match lines like "  [0] TOKEN_EXTERN: 'extern'"
            match = re.search(r'\s*\[\d+\] (TOKEN_\w+): \'([^\']*)\'', line)
            if match:
                token_type = match.group(1)
                token_value = match.group(2)
                tokens.append(f"{token_type}: '{token_value}'")
        
        return '\n'.join(tokens)
    
    def _extract_ast_from_debug(self, debug_output: str) -> str:
        """Extract AST information from compiler debug output"""
        # This would need to be implemented based on your compiler's debug output format
        return "AST extraction not implemented yet"
    
    def _extract_ir_from_debug(self, debug_output: str) -> str:
        """Extract IR information from compiler debug output"""
        ir_lines = []
        lines = debug_output.split('\n')
        
        for line in lines:
            if '[IR Debug]' in line:
                ir_lines.append(line.split('[IR Debug] ')[1])
        
        return '\n'.join(ir_lines)
    
    def _normalize_assembly(self, asm_code: str) -> str:
        """Normalize assembly code for comparison"""
        lines = []
        for line in asm_code.split('\n'):
            line = line.strip()
            # Skip empty lines and comments
            if not line or line.startswith(';'):
                continue
            # Normalize whitespace
            line = re.sub(r'\s+', ' ', line)
            lines.append(line)
        return '\n'.join(lines)
    
    def _extract_program_output(self, stdout: str) -> str:
        """Extract program output from build script output"""
        lines = stdout.split('\n')
        in_output = False
        output_lines = []
        
        for line in lines:
            if '==========================' in line and not in_output:
                in_output = True
                continue
            elif '==========================' in line and in_output:
                break
            elif in_output:
                output_lines.append(line)
        
        return '\n'.join(output_lines)
    
    def print_test_results(self, test_case: TestCase, results: Dict[TestStage, TestResult]):
        """Print detailed test results"""
        all_passed = all(result.passed for result in results.values())
        
        if all_passed:
            self.passed_tests += 1
            print(f"{Fore.GREEN}✅ {test_case.category}/{test_case.name} PASSED{Style.RESET_ALL}")
        else:
            self.failed_tests += 1
            print(f"{Fore.RED}❌ {test_case.category}/{test_case.name} FAILED{Style.RESET_ALL}")
            
            # Print details for failed stages
            for stage, result in results.items():
                if not result.passed:
                    print(f"\n{Fore.RED}🔍 {stage.value.upper()} STAGE FAILED:{Style.RESET_ALL}")
                    
                    if result.error_message:
                        print(f"{Fore.YELLOW}Error: {result.error_message}{Style.RESET_ALL}")
                    
                    if result.diff:
                        print(f"\n{Fore.CYAN}Diff:{Style.RESET_ALL}")
                        for line in result.diff:
                            if line.startswith('+'):
                                print(f"{Fore.GREEN}{line.rstrip()}{Style.RESET_ALL}")
                            elif line.startswith('-'):
                                print(f"{Fore.RED}{line.rstrip()}{Style.RESET_ALL}")
                            elif line.startswith('@@'):
                                print(f"{Fore.CYAN}{line.rstrip()}{Style.RESET_ALL}")
                            else:
                                print(line.rstrip())
    
    def run_all_tests(self, category_filter: str = None) -> bool:
        """Run all discovered tests"""
        test_cases = self.discover_tests()
        
        if category_filter:
            test_cases = [tc for tc in test_cases if tc.category == category_filter]
        
        self.total_tests = len(test_cases)
        
        print(f"\n{Fore.CYAN}🚀 Running {self.total_tests} test cases{Style.RESET_ALL}")
        
        for test_case in test_cases:
            results = self.run_test_case(test_case)
            self.print_test_results(test_case, results)
        
        # Print summary
        self.print_summary()
        
        return self.failed_tests == 0
    
    def print_summary(self):
        """Print test run summary"""
        print(f"\n{Fore.CYAN}📊 TEST SUMMARY{Style.RESET_ALL}")
        print(f"{'='*50}")
        print(f"Total tests:  {self.total_tests}")
        print(f"{Fore.GREEN}Passed:       {self.passed_tests}{Style.RESET_ALL}")
        print(f"{Fore.RED}Failed:       {self.failed_tests}{Style.RESET_ALL}")
        print(f"Skipped:      {self.skipped_tests}")
        
        if self.failed_tests == 0:
            print(f"\n{Fore.GREEN}{Back.GREEN}🎉 ALL TESTS PASSED! 🎉{Style.RESET_ALL}")
        else:
            print(f"\n{Fore.RED}{Back.RED}❌ {self.failed_tests} TESTS FAILED ❌{Style.RESET_ALL}")

def main():
    parser = argparse.ArgumentParser(description="ÆLang Compiler Test Framework")
    parser.add_argument("--compiler-dir", default="compiler", help="Path to compiler directory")
    parser.add_argument("--test-dir", default="tests", help="Path to test directory")
    parser.add_argument("--category", help="Run tests only for specific category")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
    
    args = parser.parse_args()
    
    framework = ÆLangTestFramework(
        compiler_dir=Path(args.compiler_dir),
        test_dir=Path(args.test_dir)
    )
    
    try:
        framework.setup()
        success = framework.run_all_tests(category_filter=args.category)
        sys.exit(0 if success else 1)
    except KeyboardInterrupt:
        print(f"\n{Fore.YELLOW}⚠️  Tests interrupted by user{Style.RESET_ALL}")
        sys.exit(130)
    except Exception as e:
        print(f"\n{Fore.RED}💥 Test framework error: {e}{Style.RESET_ALL}")
        sys.exit(1)
    finally:
        framework.cleanup()

if __name__ == "__main__":
    main()
