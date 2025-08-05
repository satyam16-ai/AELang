#!/usr/bin/env python3
"""
Pytest integration for ÆLang compiler tests
"""

import pytest
import sys
from pathlib import Path
from test_framework import ÆLangTestFramework, TestStage

class TestÆLangCompiler:
    """Pytest test class for ÆLang compiler"""
    
    @classmethod
    def setup_class(cls):
        """Setup test framework"""
        cls.framework = ÆLangTestFramework(
            compiler_dir=Path("compiler"),
            test_dir=Path("tests")
        )
        cls.framework.setup()
        cls.test_cases = cls.framework.discover_tests()
    
    @classmethod
    def teardown_class(cls):
        """Cleanup test framework"""
        cls.framework.cleanup()
    
    @pytest.mark.parametrize("test_case", 
        [tc for tc in [] if hasattr(TestÆLangCompiler, 'test_cases')],
        ids=lambda tc: f"{tc.category}/{tc.name}"
    )
    def test_compiler_stage(self, test_case):
        """Test individual compiler stages"""
        results = self.framework.run_test_case(test_case)
        
        # Check that all stages passed
        failed_stages = [stage for stage, result in results.items() if not result.passed]
        
        if failed_stages:
            error_msg = f"Failed stages: {', '.join(stage.value for stage in failed_stages)}\n"
            for stage in failed_stages:
                result = results[stage]
                if result.error_message:
                    error_msg += f"{stage.value}: {result.error_message}\n"
                if result.diff:
                    error_msg += f"{stage.value} diff:\n" + ''.join(result.diff)
            
            pytest.fail(error_msg)
    
    def test_basic_hello_world(self):
        """Test basic hello world program"""
        hello_test = next(
            (tc for tc in self.test_cases if tc.name == "hello" and tc.category == "basic"),
            None
        )
        if hello_test:
            results = self.framework.run_test_case(hello_test)
            assert all(result.passed for result in results.values())
    
    def test_function_parameters(self):
        """Test function parameter passing"""
        add_test = next(
            (tc for tc in self.test_cases if tc.name == "simple_add" and tc.category == "functions"),
            None
        )
        if add_test:
            results = self.framework.run_test_case(add_test)
            assert all(result.passed for result in results.values())
    
    def test_control_flow(self):
        """Test if-else control flow"""
        if_test = next(
            (tc for tc in self.test_cases if tc.name == "simple_if" and tc.category == "control_flow"),
            None
        )
        if if_test:
            results = self.framework.run_test_case(if_test)
            assert all(result.passed for result in results.values())

if __name__ == "__main__":
    # Run pytest programmatically
    sys.exit(pytest.main([__file__, "-v"]))
