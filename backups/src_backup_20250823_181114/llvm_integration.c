#include "llvm_backend.h"
#include "ir.h"
#include "semantic.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

// Enhanced compiler options with LLVM backend
typedef struct {
    bool use_llvm_backend;
    bool emit_llvm_ir;
    bool emit_llvm_bitcode;
    bool emit_assembly;
    bool emit_object;
    int optimization_level;
    char* target_triple;
    char* output_filename;
    bool link_executable;
} CompilerOptions;

// Initialize default compiler options
static CompilerOptions get_default_options(void) {
    CompilerOptions opts = {
        .use_llvm_backend = true,      // Enable LLVM by default
        .emit_llvm_ir = false,
        .emit_llvm_bitcode = false,
        .emit_assembly = false,
        .emit_object = true,           // Emit object file by default
        .optimization_level = 1,       // O1 by default
        .target_triple = NULL,         // Auto-detect
        .output_filename = NULL,       // Auto-generate
        .link_executable = true        // Link to executable by default
    };
    return opts;
}

// Link object files into executable
static bool link_executable(const char* object_file, const char* executable_name, 
                           const char* runtime_lib_path) {
    char link_command[2048];
    
    // Determine linker based on platform
    #ifdef _WIN32
        snprintf(link_command, sizeof(link_command),
                "link.exe /OUT:%s %s %s\\aelang_unified_io.obj kernel32.lib msvcrt.lib",
                executable_name, object_file, runtime_lib_path);
    #elif defined(__APPLE__)
        snprintf(link_command, sizeof(link_command),
                "clang -o %s %s %s/aelang_unified_io.o -lc",
                executable_name, object_file, runtime_lib_path);
    #else
        snprintf(link_command, sizeof(link_command),
                "gcc -o %s %s %s/aelang_unified_io.o -lc -lm -no-pie",
                executable_name, object_file, runtime_lib_path);
    #endif
    
    printf("[Link] Executing: %s\n", link_command);
    int result = system(link_command);
    
    if (result != 0) {
        fprintf(stderr, "[Link Error] Failed to link executable (exit code: %d)\n", result);
        return false;
    }
    
    printf("[Link] Successfully created executable: %s\n", executable_name);
    return true;
}

// Compile runtime library to object file
static bool compile_runtime_library(const char* runtime_src_path, const char* output_dir) {
    char compile_command[2048];
    char output_path[512];
    
    #ifdef _WIN32
        snprintf(output_path, sizeof(output_path), "%s\\aelang_unified_io.obj", output_dir);
        snprintf(compile_command, sizeof(compile_command),
                "cl.exe /c /Fo:%s %s",
                output_path, runtime_src_path);
    #else
        snprintf(output_path, sizeof(output_path), "%s/aelang_unified_io.o", output_dir);
        snprintf(compile_command, sizeof(compile_command),
                "gcc -c -o %s %s -fPIC -fno-pie",
                output_path, runtime_src_path);
    #endif
    
    printf("[Runtime] Compiling runtime library: %s\n", compile_command);
    int result = system(compile_command);
    
    if (result != 0) {
        fprintf(stderr, "[Runtime Error] Failed to compile runtime library (exit code: %d)\n", result);
        return false;
    }
    
    printf("[Runtime] Successfully compiled runtime to: %s\n", output_path);
    return true;
}

// Main LLVM compilation function
bool compile_with_llvm_backend(const char* source_file, IRProgram* ir_program, 
                              CompilerOptions* opts, bool is_32bit) {
    if (!ir_program || !ir_program->functions) {
        fprintf(stderr, "[LLVM Error] No IR functions to compile\n");
        return false;
    }
    
    printf("[LLVM] Starting compilation with LLVM backend\n");
    printf("[LLVM] Source: %s\n", source_file);
    printf("[LLVM] Target: %s\n", opts->target_triple ? opts->target_triple : "auto-detect");
    printf("[LLVM] Architecture: %s\n", is_32bit ? "32-bit" : "64-bit");
    printf("[LLVM] Optimization level: O%d\n", opts->optimization_level);
    
    // Create LLVM backend
    char module_name[256];
    snprintf(module_name, sizeof(module_name), "%s_module", source_file);
    
    LLVMBackend* backend = create_llvm_backend(module_name);
    if (!backend) {
        fprintf(stderr, "[LLVM Error] Failed to create LLVM backend\n");
        return false;
    }
    
    // Set target triple if specified
    if (opts->target_triple) {
    // Set target triple if specified
    if (opts->target_triple) {
        // Store target triple in backend
        backend->target_triple = strdup(opts->target_triple);
    }
    }
    
    // Generate LLVM IR from ÆLang IR
    if (!llvm_generate_from_ir(backend, ir_program)) {
        fprintf(stderr, "[LLVM Error] Failed to generate LLVM IR\n");
        free_llvm_backend(backend);
        return false;
    }
    
    // Apply optimizations
    if (opts->optimization_level > 0) {
        llvm_optimize(backend, opts->optimization_level);
    }
    
    // Generate output filename if not specified
    char base_filename[256];
    if (opts->output_filename) {
        strncpy(base_filename, opts->output_filename, sizeof(base_filename));
    } else {
        // Extract base name from source file
        const char* last_dot = strrchr(source_file, '.');
        const char* last_slash = strrchr(source_file, '/');
        const char* start = last_slash ? last_slash + 1 : source_file;
        size_t len = last_dot ? (size_t)(last_dot - start) : strlen(start);
        snprintf(base_filename, len + 1, "%s", start);
    }
    
    bool success = true;
    
    // Emit LLVM IR if requested
    if (opts->emit_llvm_ir) {
        char ir_filename[512];
        snprintf(ir_filename, sizeof(ir_filename), "%s.ll", base_filename);
        
        char* ir_string = LLVMPrintModuleToString(backend->module);
        FILE* ir_file = fopen(ir_filename, "w");
        if (ir_file) {
            fprintf(ir_file, "%s", ir_string);
            fclose(ir_file);
            printf("[LLVM] Generated LLVM IR: %s\n", ir_filename);
        } else {
            fprintf(stderr, "[LLVM Warning] Failed to write LLVM IR file\n");
        }
        LLVMDisposeMessage(ir_string);
    }
    
    // Emit bitcode if requested
    if (opts->emit_llvm_bitcode) {
        char bc_filename[512];
        snprintf(bc_filename, sizeof(bc_filename), "%s.bc", base_filename);
        if (!llvm_emit_ir(backend, bc_filename)) {
            success = false;
        }
    }
    
    // Emit assembly if requested
    if (opts->emit_assembly) {
        char asm_filename[512];
        snprintf(asm_filename, sizeof(asm_filename), "%s.s", base_filename);
        if (!llvm_emit_assembly(backend, asm_filename)) {
            success = false;
        }
    }
    
    // Emit object file
    char obj_filename[512];
    if (opts->emit_object || opts->link_executable) {
        #ifdef _WIN32
            snprintf(obj_filename, sizeof(obj_filename), "%s.obj", base_filename);
        #else
            snprintf(obj_filename, sizeof(obj_filename), "%s.o", base_filename);
        #endif
        
        if (!llvm_emit_object(backend, obj_filename, opts->target_triple)) {
            success = false;
        }
    }
    
    // Link executable if requested
    if (success && opts->link_executable) {
        char exe_filename[512];
        #ifdef _WIN32
            snprintf(exe_filename, sizeof(exe_filename), "%s.exe", base_filename);
        #else
            snprintf(exe_filename, sizeof(exe_filename), "%s", base_filename);
        #endif
        
        // Compile runtime library first
        char runtime_src_path[512];
        snprintf(runtime_src_path, sizeof(runtime_src_path), "std_libs/aelang_unified_io.c");
        
        if (!compile_runtime_library(runtime_src_path, ".")) {
            fprintf(stderr, "[LLVM Error] Failed to compile runtime library\n");
            success = false;
        } else {
            // Link with runtime
            if (!link_executable(obj_filename, exe_filename, ".")) {
                fprintf(stderr, "[LLVM Error] Failed to link executable\n");
                success = false;
            }
        }
    }
    
    // Cleanup
    free_llvm_backend(backend);
    
    if (success) {
        printf("[LLVM] ✅ Compilation completed successfully!\n");
        if (opts->link_executable) {
            printf("[LLVM] 🚀 Executable ready: %s\n", base_filename);
        }
    } else {
        printf("[LLVM] ❌ Compilation failed\n");
    }
    
    return success;
}

// Parse LLVM-specific command line arguments
CompilerOptions parse_llvm_options(int argc, char** argv) {
    CompilerOptions opts = get_default_options();
    
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--llvm-ir") == 0) {
            opts.emit_llvm_ir = true;
        } else if (strcmp(argv[i], "--llvm-bc") == 0) {
            opts.emit_llvm_bitcode = true;
        } else if (strcmp(argv[i], "--emit-asm") == 0) {
            opts.emit_assembly = true;
        } else if (strcmp(argv[i], "--emit-obj") == 0) {
            opts.emit_object = true;
            opts.link_executable = false;
        } else if (strcmp(argv[i], "--no-link") == 0) {
            opts.link_executable = false;
        } else if (strcmp(argv[i], "--target") == 0 && i + 1 < argc) {
            opts.target_triple = strdup(argv[++i]);
        } else if (strncmp(argv[i], "-O", 2) == 0) {
            opts.optimization_level = atoi(argv[i] + 2);
            if (opts.optimization_level < 0) opts.optimization_level = 0;
            if (opts.optimization_level > 3) opts.optimization_level = 3;
        } else if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) {
            opts.output_filename = strdup(argv[++i]);
        } else if (strcmp(argv[i], "--list-targets") == 0) {
            // List available targets (placeholder)
            printf("Available targets: x86_64, aarch64, riscv64, wasm32\n");
            exit(0);
        }
    }
    
    return opts;
}

// Print LLVM backend help
void print_llvm_help(void) {
    printf("\n🔥 LLVM Backend Options:\n");
    printf("  --llvm-ir           Emit LLVM IR (.ll file)\n");
    printf("  --llvm-bc           Emit LLVM bitcode (.bc file)\n");
    printf("  --emit-asm          Emit assembly (.s file)\n");
    printf("  --emit-obj          Emit object file only (don't link)\n");
    printf("  --no-link           Don't create executable\n");
    printf("  --target <triple>   Set target triple (e.g., x86_64-pc-linux-gnu)\n");
    printf("  --list-targets      List available target triples\n");
    printf("  -O<level>           Optimization level (0-3, default: 1)\n");
    printf("  -o <file>           Output filename\n");
    printf("\n🎯 Example Usage:\n");
    printf("  ./compiler program.ae --llvm-ir --emit-asm -O2\n");
    printf("  ./compiler program.ae --target wasm32-unknown-unknown\n");
    printf("  ./compiler program.ae -O3 -o optimized_program\n");
    printf("\n🌍 Cross-compilation Examples:\n");
    printf("  ./compiler program.ae --target x86_64-pc-windows-msvc  # Windows 64-bit\n");
    printf("  ./compiler program.ae --target aarch64-apple-darwin    # macOS ARM64\n");
    printf("  ./compiler program.ae --target wasm32-unknown-unknown  # WebAssembly\n");
}

// Free compiler options
void free_compiler_options(CompilerOptions* opts) {
    if (opts->target_triple) {
        free(opts->target_triple);
        opts->target_triple = NULL;
    }
    if (opts->output_filename) {
        free(opts->output_filename);
        opts->output_filename = NULL;
    }
}
