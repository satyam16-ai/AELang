# Simple ÆLang Build System
# Just run 'make' to build the compiler

# Default target - build the compiler
all:
	@echo "Building ÆLang compiler..."
	@$(MAKE) -C compiler
	@echo "✅ ÆLang compiler built successfully!"

# Build the compiler (same as all)
compiler:
	@$(MAKE) -C compiler

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf build/*.o build/*.asm build/aelang_* 2>/dev/null || true
	@$(MAKE) -C compiler clean
	@echo "✅ Clean complete!"

.PHONY: all compiler clean
