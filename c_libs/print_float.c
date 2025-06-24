#include <stdio.h>

// Ensure cdecl calling convention
__attribute__((cdecl))
void print_float(float x) {
    printf("%.6f\n", x);  // Print with fixed precision
    fflush(stdout);       // Ensure output is displayed
}
