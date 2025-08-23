#!/bin/bash
# cleanup_after_llvm.sh - Clean up unnecessary files after LLVM integration

echo "🧹 Cleaning up unnecessary files after LLVM integration..."

# Files to keep (essential)
KEEP_FILES=(
    "aelang"                    # Main compiler binary
    "aelang_unified_io.o"      # Runtime library
    "llvm_demo.ae"             # LLVM demo source
    "llvm_demo.ll"             # Example LLVM IR
    "llvm_demo.s.s"            # Example assembly
    "llvm_demo_arm64.s.s"      # Example ARM64 assembly  
    "llvm_demo.wasm.o"         # Example WebAssembly
    "LLVM_INTEGRATION_README.md" # Documentation
)

# Create backup directory
BACKUP_DIR="backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "📁 Creating backup in: $BACKUP_DIR"

# Function to check if file should be kept
should_keep() {
    local file="$1"
    for keep in "${KEEP_FILES[@]}"; do
        if [[ "$file" == "$keep" ]]; then
            return 0  # Keep this file
        fi
    done
    return 1  # Don't keep this file
}

# Clean up test executables (old builds)
echo "🗑️  Removing old test executables..."
removed_count=0

for file in *_test *_demo *_llvm_*; do
    if [[ -f "$file" && -x "$file" && ! "$file" =~ \.(ae|c|h|md)$ ]]; then
        if ! should_keep "$file"; then
            echo "  Removing executable: $file"
            mv "$file" "$BACKUP_DIR/"
            ((removed_count++))
        fi
    fi
done

# Clean up object files (except essential runtime)
echo "🗑️  Removing unnecessary object files..."
for file in *.o; do
    if [[ -f "$file" ]]; then
        if ! should_keep "$file"; then
            echo "  Removing object file: $file"
            mv "$file" "$BACKUP_DIR/"
            ((removed_count++))
        fi
    fi
done

# Clean up old assembly files (keep examples)
echo "🗑️  Removing old assembly files..."
for file in *.asm; do
    if [[ -f "$file" ]]; then
        if ! should_keep "$file"; then
            echo "  Removing assembly file: $file"
            mv "$file" "$BACKUP_DIR/"
            ((removed_count++))
        fi
    fi
done

# Clean up intermediate files
echo "🗑️  Removing intermediate files..."
for pattern in "*.s" "*.ll" "simple_*" "arithmetic_*" "comprehensive_*" "debug_*"; do
    for file in $pattern; do
        if [[ -f "$file" ]]; then
            if ! should_keep "$file"; then
                echo "  Removing intermediate file: $file"
                mv "$file" "$BACKUP_DIR/"
                ((removed_count++))
            fi
        fi
    done
done

# Clean up old build artifacts
echo "🗑️  Removing build artifacts..."
for file in calci_* *_test *_fixed *_clean *_final *_demo_*; do
    if [[ -f "$file" && ! "$file" =~ \.(ae|c|h|md)$ ]]; then
        if ! should_keep "$file"; then
            echo "  Removing build artifact: $file"
            mv "$file" "$BACKUP_DIR/"
            ((removed_count++))
        fi
    fi
done

# Summary
echo ""
echo "✅ Cleanup completed!"
echo "📊 Files moved to backup: $removed_count"
echo "💾 Backup location: $BACKUP_DIR"
echo ""
echo "🎯 Essential files preserved:"
for file in "${KEEP_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        echo "  ✅ $file"
    fi
done

echo ""
echo "🚀 LLVM Backend ready for production!"
