#include <stdio.h>

// Enhanced print function with format specifier for clean number display
void print_num(float value) {
    // Check if the value is effectively an integer
    if (value == (int)value) {
        // Print as integer if no fractional part
        printf("%.0f", value);
    } else {
        // Print with 2 decimal places for cleaner output
        printf("%.2f", value);
    }
}
