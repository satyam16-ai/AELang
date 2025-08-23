#!/bin/bash

# AELang LLVM Backend Build and Test Script
# This script handles building and testing the LLVM backend integration

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}$1${NC}"
}

# Check if LLVM is installed
check_llvm() {
    print_status "Checking LLVM installation..."
    
    if command -v llvm-config &> /dev/null; then
        LLVM_VERSION=$(llvm-config --version)
        print_success "LLVM found: version $LLVM_VERSION"
        
        # Check if we have the required LLVM components
        if llvm-config --libs core &> /dev/null; then
            print_success "LLVM development libraries found"
            return 0
        else
            print_error "LLVM development libraries not found"
            return 1
        fi
    else
        print_error "LLVM not found"
        return 1
    fi
}

# Install LLVM if needed
install_llvm() {
    print_header "Installing LLVM..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            # Ubuntu/Debian
            print_status "Installing LLVM on Ubuntu/Debian..."
            sudo apt update
            sudo apt install -y llvm-dev libllvm-dev clang
        elif command -v dnf &> /dev/null; then
            # Fedora
            print_status "Installing LLVM on Fedora..."
            sudo dnf install -y llvm-devel clang
        elif command -v pacman &> /dev/null; then
            # Arch Linux
            print_status "Installing LLVM on Arch Linux..."
            sudo pacman -S llvm clang
        else
            print_error "Unknown Linux distribution. Please install LLVM manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        print_status "Installing LLVM on macOS..."
        if command -v brew &> /dev/null; then
            brew install llvm
            # Add LLVM to PATH
            export PATH="/usr/local/opt/llvm/bin:$PATH"
        else
            print_error "Homebrew not found. Please install LLVM manually."
            exit 1
        fi
    else
        print_error "Unsupported operating system: $OSTYPE"
        exit 1
    fi
}

# Build with CMake
build_cmake() {
    print_header "Building with CMake..."
    
    # Create build directory
    mkdir -p build
    cd build
    
    # Configure
    print_status "Configuring build..."
    cmake .. -DCMAKE_BUILD_TYPE=Release
    
    # Build
    print_status "Building compiler..."
    make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
    
    cd ..
    
    if [ -f build/aelang ]; then
        print_success "Build successful! Compiler created: build/aelang"
        return 0
    else
        print_error "Build failed - no executable created"
        return 1
    fi
}

# Build with Make
build_make() {
    print_header "Building with Make..."
    
    # Use LLVM-enabled Makefile
    make -f Makefile.llvm clean
    make -f Makefile.llvm all
    
    if [ -f aelang ]; then
        print_success "Build successful! Compiler created: aelang"
        return 0
    else
        print_error "Build failed - no executable created"
        return 1
    fi
}

# Test the compiler
test_compiler() {
    print_header "Testing AELang LLVM Backend..."
    
    # Determine compiler path
    if [ -f build/aelang ]; then
        COMPILER="build/aelang"
    elif [ -f aelang ]; then
        COMPILER="./aelang"
    else
        print_error "Compiler not found"
        return 1
    fi
    
    print_status "Using compiler: $COMPILER"
    
    # Test basic functionality
    print_status "Testing basic compilation..."
    $COMPILER llvm_demo.ae --arch32 -O1
    
    if [ -f llvm_demo ]; then
        print_success "Compilation successful!"
        
        # Run the demo
        print_status "Running demo program..."
        ./llvm_demo
        
        print_success "Demo executed successfully!"
    else
        print_error "Compilation failed - no executable created"
        return 1
    fi
    
    # Test different output formats
    print_status "Testing LLVM IR generation..."
    $COMPILER llvm_demo.ae --arch32 --llvm-ir -O2
    
    if [ -f llvm_demo.ll ]; then
        print_success "LLVM IR generated successfully"
        print_status "First 10 lines of LLVM IR:"
        head -10 llvm_demo.ll
    fi
    
    # Test assembly generation
    print_status "Testing assembly generation..."
    $COMPILER llvm_demo.ae --arch32 --emit-asm -O2
    
    if [ -f llvm_demo.s ]; then
        print_success "Assembly generated successfully"
    fi
    
    # Test bitcode generation
    print_status "Testing bitcode generation..."
    $COMPILER llvm_demo.ae --arch32 --llvm-bc -O2
    
    if [ -f llvm_demo.bc ]; then
        print_success "Bitcode generated successfully"
        print_status "Bitcode size: $(ls -lh llvm_demo.bc | awk '{print $5}')"
    fi
    
    # Test cross-compilation
    print_status "Testing cross-compilation targets..."
    
    # WebAssembly
    print_status "Testing WebAssembly target..."
    $COMPILER llvm_demo.ae --arch32 --target wasm32-unknown-unknown --emit-obj -O1
    
    # Different architectures
    print_status "Testing different architectures..."
    $COMPILER llvm_demo.ae --arch64 --target x86_64-pc-linux-gnu -O2
    
    print_success "All tests completed!"
}

# Clean build artifacts
clean() {
    print_header "Cleaning build artifacts..."
    
    rm -rf build/
    rm -f aelang *.o *.asm *.ll *.bc *.s
    rm -f llvm_demo llvm_demo.ll llvm_demo.s llvm_demo.bc llvm_demo.o
    
    print_success "Cleanup completed"
}

# Main execution
main() {
    print_header "🔥 AELang LLVM Backend Build Script"
    print_header "===================================="
    
    case "${1:-all}" in
        "check")
            check_llvm
            ;;
        "install-llvm")
            install_llvm
            ;;
        "cmake")
            check_llvm || install_llvm
            build_cmake
            ;;
        "make")
            check_llvm || install_llvm
            build_make
            ;;
        "test")
            test_compiler
            ;;
        "clean")
            clean
            ;;
        "all")
            # Full build and test cycle
            check_llvm || install_llvm
            
            # Try CMake first, fallback to Make
            if command -v cmake &> /dev/null; then
                build_cmake || build_make
            else
                build_make
            fi
            
            test_compiler
            ;;
        "help")
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  all         - Full build and test (default)"
            echo "  check       - Check LLVM installation"
            echo "  install-llvm - Install LLVM if not present"
            echo "  cmake       - Build using CMake"
            echo "  make        - Build using Make"
            echo "  test        - Test the compiler"
            echo "  clean       - Clean build artifacts"
            echo "  help        - Show this help"
            ;;
        *)
            print_error "Unknown command: $1"
            print_status "Use '$0 help' for available commands"
            exit 1
            ;;
    esac
}

main "$@"
