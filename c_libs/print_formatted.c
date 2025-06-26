#include <stdio.h>
#include <math.h>

// Enhanced print function with precision control
void print_num_precision(float value, int precision) {
    if (precision == 0) {
        // Print as integer
        printf("%.0f", value);
    } else if (precision == -1) {
        // Auto precision - smart formatting
        if (value == (int)value) {
            printf("%.0f", value);
        } else {
            printf("%.2f", value);
        }
    } else {
        // Custom precision
        switch(precision) {
            case 1: printf("%.1f", value); break;
            case 2: printf("%.2f", value); break;
            case 3: printf("%.3f", value); break;
            case 4: printf("%.4f", value); break;
            case 5: printf("%.5f", value); break;
            case 6: printf("%.6f", value); break;
            default: printf("%.2f", value); break;
        }
    }
}

// Scientific notation formatting
void print_num_scientific(float value) {
    printf("%.2e", value);
}

// Currency formatting (2 decimal places with $)
void print_currency(float value) {
    printf("$%.2f", value);
}

// Percentage formatting
void print_percentage(float value) {
    printf("%.1f%%", value);
}

// Engineering notation (thousands separator simulation)
void print_num_engineering(float value) {
    if (fabs(value) >= 1000000) {
        printf("%.2fM", value / 1000000);
    } else if (fabs(value) >= 1000) {
        printf("%.2fK", value / 1000);
    } else {
        printf("%.2f", value);
    }
}

// Binary representation (for integers)
void print_binary(float value) {
    int intVal = (int)value;
    printf("0b");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (intVal >> i) & 1);
        if (i % 4 == 0 && i > 0) printf("_"); // Group by 4 bits
    }
}

// Hexadecimal representation
void print_hex(float value) {
    printf("0x%X", (int)value);
}
