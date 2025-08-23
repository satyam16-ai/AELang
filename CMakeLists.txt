cmake_minimum_required(VERSION 3.13)
project(AELang)

# Set C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Find LLVM
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Set up LLVM include directories and definitions
include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

# Find the LLVM C library components we need
llvm_map_components_to_libnames(llvm_libs 
    Core
    Analysis
    CodeGen
    MC
    MCParser
    Target
    TransformUtils
    ScalarOpts
    IPO
    Vectorize
    InstCombine
    Object
    Support
    # Add target backends
    X86
    ARM
    AArch64
    WebAssembly
    RISCV
)

# Include directories
include_directories(compiler/include)
include_directories(.)

# Source files
set(COMPILER_SOURCES
    compiler/src/main.c
    compiler/src/lexer.c
    compiler/src/parser.c
    compiler/src/semantic.c
    compiler/src/ir.c
    compiler/src/optimizer.c
    compiler/src/ir_codegen.c
    compiler/src/llvm_backend.c
    compiler/src/llvm_integration.c
)

# Create the compiler executable
add_executable(aelang ${COMPILER_SOURCES})

# Link LLVM libraries
target_link_libraries(aelang ${llvm_libs})

# Platform-specific linking
if(UNIX AND NOT APPLE)
    # Linux
    target_link_libraries(aelang dl pthread m)
elseif(APPLE)
    # macOS
    target_link_libraries(aelang)
elseif(WIN32)
    # Windows
    target_link_libraries(aelang)
endif()

# Set output directory
set_target_properties(aelang PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

# Debug information
set(CMAKE_BUILD_TYPE Debug)

# Add compile flags for debugging
target_compile_options(aelang PRIVATE -g -Wall -Wextra)

# Print configuration summary
message(STATUS "=== AELang Compiler Build Configuration ===")
message(STATUS "LLVM Version: ${LLVM_PACKAGE_VERSION}")
message(STATUS "LLVM Include Dirs: ${LLVM_INCLUDE_DIRS}")
message(STATUS "LLVM Libraries: ${llvm_libs}")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")
message(STATUS "Target: ${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_PROCESSOR}")

# Install target
install(TARGETS aelang DESTINATION bin)
install(FILES std_libs/aelang_unified_io.c DESTINATION lib/aelang/)
