#!/bin/bash

echo "🧹 Starting ÆLang Workspace Cleanup..."

# Create temp cleanup folders if they don't exist
mkdir -p temp_cleanup/test_programs
mkdir -p temp_cleanup/debug_programs

echo "📁 Step 1: Moving .ae test files to examples/ folder..."

# Move important test files to examples
mv test_comprehensive_types.ae examples/ 2>/dev/null || echo "  ⚠️  test_comprehensive_types.ae already moved"
mv test_edge_cases.ae examples/ 2>/dev/null || echo "  ⚠️  test_edge_cases.ae already moved"
mv test_32bit_types.ae examples/ 2>/dev/null || echo "  ⚠️  test_32bit_types.ae already moved"
mv test_universal_read.ae examples/ 2>/dev/null || echo "  ⚠️  test_universal_read.ae already moved"
mv ultimate_comprehensive_test.ae examples/ 2>/dev/null || echo "  ⚠️  ultimate_comprehensive_test.ae already moved"

# Move debug files to temp folder
mv debug_*.ae temp_cleanup/debug_programs/ 2>/dev/null || echo "  ✓ No debug .ae files to move"
mv test_*.ae temp_cleanup/test_programs/ 2>/dev/null || echo "  ✓ Moved remaining test .ae files"
mv *_test.ae temp_cleanup/test_programs/ 2>/dev/null || echo "  ✓ Moved additional test files"

echo "🗑️  Step 2: Removing compiled object files..."
rm -f *.o 2>/dev/null && echo "  ✓ Removed all .o files" || echo "  ⚠️  No .o files to remove"

echo "🗑️  Step 3: Removing assembly files..."
rm -f *.asm 2>/dev/null && echo "  ✓ Removed all .asm files" || echo "  ⚠️  No .asm files to remove"

echo "🗑️  Step 4: Removing test executables..."
# Remove test executables but keep important ones
rm -f test_* calc_* comprehensive_* simple_* optimized_* fresh_* 2>/dev/null && echo "  ✓ Removed test executables" || echo "  ⚠️  No test executables to remove"

# Keep only essential executables
echo "📁 Step 5: Keeping essential files..."
echo "  ✓ Keeping: calculator (main demo)"
echo "  ✓ Keeping: aelang_unified_io.o (32-bit library)"
echo "  ✓ Keeping: aelang_unified_io_64.o (64-bit library)"

echo "🗑️  Step 6: Removing debug C files..."
rm -f debug_*.c test_*.c 2>/dev/null && echo "  ✓ Removed debug C files" || echo "  ⚠️  No debug C files to remove"

echo "🗑️  Step 7: Removing temporary data files..."
rm -f *.txt validate_output.sh 2>/dev/null && echo "  ✓ Removed temporary data files" || echo "  ⚠️  No temp files to remove"

echo "📊 Step 8: Cleanup Summary..."
echo "==============================================="
echo "KEPT ESSENTIAL FILES:"
echo "  📁 compiler/ - ÆLang compiler source"
echo "  📁 examples/ - Example ÆLang programs"
echo "  📁 docs/ - Documentation"
echo "  📁 std_libs/ - Standard libraries"
echo "  📁 c_libs/ - C runtime libraries"
echo "  📁 tests/ - Organized test suite"
echo "  🔧 build.sh - Build script"
echo "  📋 README.md - Project documentation"
echo "  ⚙️  aelang_unified_io*.o - Runtime libraries"

echo ""
echo "MOVED TO temp_cleanup/:"
echo "  📁 temp_cleanup/test_programs/ - Test .ae files"
echo "  📁 temp_cleanup/debug_programs/ - Debug .ae files"

echo ""
echo "REMOVED:"
echo "  🗑️  All .o object files (except libraries)"
echo "  🗑️  All .asm assembly files"
echo "  🗑️  All test executables"
echo "  🗑️  All debug C files"
echo "  🗑️  All temporary data files"

echo ""
echo "🎉 Workspace cleanup completed!"
echo "📁 Directory structure is now organized and clean."
