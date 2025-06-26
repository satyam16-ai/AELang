#include <stdio.h>

// Clean print function for formatted output without newlines
void print_clean(const char* msg) {
    printf("%s", msg);
    fflush(stdout);  // Ensure immediate output
}
