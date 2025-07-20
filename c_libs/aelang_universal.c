#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

// =============================================================================
// ÆLANG UNIVERSAL C LIBRARY - ALL FUNCTIONS IN ONE FILE
// Consolidated library for enhanced mathematical computing with format specifiers
// =============================================================================

// -----------------------------------------------------------------------------
// BASIC OUTPUT FUNCTIONS
// -----------------------------------------------------------------------------

// Basic print function for strings
void print(const char *str) {
    printf("%s\n", str);
    fflush(stdout);
}

// Clean print without newline
void print_clean(const char *str) {
    printf("%s", str);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// ENHANCED NUMBER FORMATTING FUNCTIONS
// -----------------------------------------------------------------------------

// Smart number formatting (auto-detects integer vs float)
void print_num(float value) {
    if (value == (int)value) {
        printf("%.0f", value);
    } else {
        printf("%.2f", value);
    }
    fflush(stdout);
}

// Precision-controlled formatting
void print_num_precision(float value, int precision) {
    if (precision == 0) {
        printf("%.0f", value);
    } else if (precision == -1) {
        // Auto precision
        if (value == (int)value) {
            printf("%.0f", value);
        } else {
            printf("%.2f", value);
        }
    } else {
        // Custom precision (1-6 decimal places)
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
    fflush(stdout);
}

// Scientific notation formatting
void print_num_scientific(float value) {
    printf("%.2e", value);
    fflush(stdout);
}

// Currency formatting with $ symbol
void print_currency(float value) {
    printf("$%.2f", value);
    fflush(stdout);
}

// Percentage formatting with % symbol
void print_percentage(float value) {
    printf("%.1f%%", value);
    fflush(stdout);
}

// Engineering notation (K/M for thousands/millions)
void print_num_engineering(float value) {
    if (fabs(value) >= 1000000) {
        printf("%.2fM", value / 1000000);
    } else if (fabs(value) >= 1000) {
        printf("%.2fK", value / 1000);
    } else {
        printf("%.2f", value);
    }
    fflush(stdout);
}

// Hexadecimal representation
void print_hex(float value) {
    printf("0x%X", (int)value);
    fflush(stdout);
}

// Binary representation with grouping
void print_binary(float value) {
    int intVal = (int)value;
    printf("0b");
    for (int i = 31; i >= 0; i--) {
        printf("%d", (intVal >> i) & 1);
        if (i % 4 == 0 && i > 0) printf("_");
    }
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// LEGACY FUNCTIONS (for compatibility - use print_num instead)
// -----------------------------------------------------------------------------

// Legacy float printing (deprecated - use print_num)
void print_float(float value) {
    printf("%.6f\n", value);
    fflush(stdout);
}

// Legacy integer printing (deprecated - use print_num)
void print_int(int value) {
    printf("%d\n", value);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// ENHANCED INPUT FUNCTIONS
// -----------------------------------------------------------------------------

// Basic number input
float read_num() {
    float value;
    if (scanf("%f", &value) == 1) {
        // Clear input buffer
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0.0f;
}

// Safe number input with comprehensive validation
float read_num_safe() {
    char buffer[256];
    float value;
    int valid = 0;
    
    while (!valid) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            // Remove newline
            buffer[strcspn(buffer, "\n")] = 0;
            
            // Check for empty input
            if (strlen(buffer) == 0) {
                printf("Error: Empty input. Please enter a number: ");
                continue;
            }
            
            // Validate input characters
            int hasDigit = 0;
            int hasDecimal = 0;
            int hasSign = 0;
            
            for (int i = 0; i < strlen(buffer); i++) {
                char c = buffer[i];
                if (isdigit(c)) {
                    hasDigit = 1;
                } else if (c == '.' && !hasDecimal) {
                    hasDecimal = 1;
                } else if ((c == '+' || c == '-') && i == 0 && !hasSign) {
                    hasSign = 1;
                } else if (c == ' ') {
                    continue; // Skip spaces
                } else {
                    printf("Error: Invalid character '%c'. Please enter a valid number: ", c);
                    hasDigit = 0;
                    break;
                }
            }
            
            if (hasDigit && sscanf(buffer, "%f", &value) == 1) {
                if (isfinite(value) && !isnan(value)) {
                    valid = 1;
                } else {
                    printf("Error: Number out of range. Please try again: ");
                }
            } else if (hasDigit) {
                printf("Error: Could not parse number. Please try again: ");
            }
        } else {
            printf("Error: Failed to read input. Please try again: ");
        }
    }
    
    return value;
}

// Validated input with custom prompt
float read_num_validated() {
    return read_num_safe();
}

// Input with custom prompt message
float read_num_with_prompt(const char* prompt) {
    printf("%s", prompt);
    fflush(stdout);
    return read_num_safe();
}

// Read positive numbers only
float read_positive_num() {
    float value;
    int valid = 0;
    
    while (!valid) {
        value = read_num_safe();
        if (value > 0) {
            valid = 1;
        } else {
            printf("Error: Please enter a positive number: ");
        }
    }
    
    return value;
}

// Read integers only (validates whole numbers)
float read_integer_only() {
    float value;
    int valid = 0;
    
    while (!valid) {
        value = read_num_safe();
        if (value == (int)value) {
            valid = 1;
        } else {
            printf("Error: Please enter a whole number only: ");
        }
    }
    
    return value;
}

// -----------------------------------------------------------------------------
// LEGACY INPUT FUNCTIONS (for compatibility)
// -----------------------------------------------------------------------------

// Legacy integer input (deprecated - use read_num)
int read_int() {
    int value;
    if (scanf("%d", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0;
}

// Legacy float input (deprecated - use read_num)
float read_float() {
    float value;
    if (scanf("%f", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0.0f;
}

// -----------------------------------------------------------------------------
// BOOLEAN TYPE FUNCTIONS
// -----------------------------------------------------------------------------

// Print boolean value with different formats
void print_bool(int value) {
    printf("%s\n", value ? "true" : "false");
    fflush(stdout);
}

// Print boolean as 1/0
void print_bool_numeric(int value) {
    printf("%d\n", value);
    fflush(stdout);
}

// Print boolean without newline
void print_bool_clean(int value) {
    printf("%s", value ? "true" : "false");
    fflush(stdout);
}

// Read boolean value (accepts true/false, 1/0, yes/no)
int read_bool() {
    char buffer[10];
    if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
        // Remove newline
        buffer[strcspn(buffer, "\n")] = 0;
        
        // Convert to lowercase for comparison
        for (int i = 0; buffer[i]; i++) {
            buffer[i] = tolower(buffer[i]);
        }
        
        // Check various representations
        if (strcmp(buffer, "true") == 0 || strcmp(buffer, "1") == 0 || 
            strcmp(buffer, "yes") == 0 || strcmp(buffer, "y") == 0) {
            return 1;
        } else if (strcmp(buffer, "false") == 0 || strcmp(buffer, "0") == 0 || 
                   strcmp(buffer, "no") == 0 || strcmp(buffer, "n") == 0) {
            return 0;
        }
    }
    return 0; // Default to false
}

// Safe boolean input with validation
int read_bool_safe() {
    char buffer[256];
    int valid = 0;
    int result = 0;
    
    while (!valid) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            // Remove newline
            buffer[strcspn(buffer, "\n")] = 0;
            
            // Check for empty input
            if (strlen(buffer) == 0) {
                printf("Error: Empty input. Please enter true/false, 1/0, or yes/no: ");
                continue;
            }
            
            // Convert to lowercase for comparison
            for (int i = 0; buffer[i]; i++) {
                buffer[i] = tolower(buffer[i]);
            }
            
            // Check various representations
            if (strcmp(buffer, "true") == 0 || strcmp(buffer, "1") == 0 || 
                strcmp(buffer, "yes") == 0 || strcmp(buffer, "y") == 0) {
                result = 1;
                valid = 1;
            } else if (strcmp(buffer, "false") == 0 || strcmp(buffer, "0") == 0 || 
                       strcmp(buffer, "no") == 0 || strcmp(buffer, "n") == 0) {
                result = 0;
                valid = 1;
            } else {
                printf("Error: Invalid input '%s'. Please enter true/false, 1/0, or yes/no: ", buffer);
            }
        } else {
            printf("Error: Failed to read input. Please try again: ");
        }
    }
    
    return result;
}

// =============================================================================
// ENHANCED TYPE-SPECIFIC PRINT FUNCTIONS
// Added for ÆLang enhanced integer and floating-point type system
// =============================================================================

// -----------------------------------------------------------------------------
// SIGNED INTEGER PRINT FUNCTIONS
// -----------------------------------------------------------------------------

void print_i8(signed char value) {
    printf("%d\n", (int)value);
    fflush(stdout);
}

void print_i16(short value) {
    printf("%d\n", (int)value);
    fflush(stdout);
}

void print_i32(int value) {
    printf("%d\n", value);
    fflush(stdout);
}

void print_i64(long long value) {
    printf("%lld\n", value);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// UNSIGNED INTEGER PRINT FUNCTIONS
// -----------------------------------------------------------------------------

void print_u8(unsigned char value) {
    printf("%u\n", (unsigned int)value);
    fflush(stdout);
}

void print_u16(unsigned short value) {
    printf("%u\n", (unsigned int)value);
    fflush(stdout);
}

void print_u32(unsigned int value) {
    printf("%u\n", value);
    fflush(stdout);
}

void print_u64(unsigned long long value) {
    printf("%llu\n", value);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// FLOATING POINT PRINT FUNCTIONS
// -----------------------------------------------------------------------------

void print_f32(float value) {
    printf("%.6f\n", value);
    fflush(stdout);
}

void print_f64(double value) {
    printf("%.15f\n", value);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// STRING AND CHARACTER PRINT FUNCTIONS
// -----------------------------------------------------------------------------

void print_str(const char *value) {
    printf("%s\n", value);
    fflush(stdout);
}

void print_char(char value) {
    printf("%c\n", value);
    fflush(stdout);
}

// -----------------------------------------------------------------------------
// ENHANCED INPUT FUNCTIONS FOR NEW TYPES
// -----------------------------------------------------------------------------

signed char read_i8() {
    int value;
    if (scanf("%d", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return (signed char)value;
    }
    return 0;
}

short read_i16() {
    int value;
    if (scanf("%d", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return (short)value;
    }
    return 0;
}

int read_i32() {
    int value;
    if (scanf("%d", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0;
}

long long read_i64() {
    long long value;
    if (scanf("%lld", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0;
}

unsigned char read_u8() {
    unsigned int value;
    if (scanf("%u", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return (unsigned char)value;
    }
    return 0;
}

unsigned short read_u16() {
    unsigned int value;
    if (scanf("%u", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return (unsigned short)value;
    }
    return 0;
}

unsigned int read_u32() {
    unsigned int value;
    if (scanf("%u", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0;
}

unsigned long long read_u64() {
    unsigned long long value;
    if (scanf("%llu", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0;
}

float read_f32() {
    float value;
    if (scanf("%f", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0.0f;
}

double read_f64() {
    double value;
    if (scanf("%lf", &value) == 1) {
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return 0.0;
}

// -----------------------------------------------------------------------------
// STRING AND CHARACTER INPUT FUNCTIONS
// -----------------------------------------------------------------------------

void read_str(char *buffer, int max_length) {
    if (fgets(buffer, max_length, stdin) != NULL) {
        // Remove newline if present
        size_t len = strlen(buffer);
        if (len > 0 && buffer[len - 1] == '\n') {
            buffer[len - 1] = '\0';
        }
    } else {
        buffer[0] = '\0';  // Empty string on error
    }
}

char read_char() {
    char value;
    if (scanf(" %c", &value) == 1) {  // Space before %c to skip whitespace
        int c;
        while ((c = getchar()) != '\n' && c != EOF);
        return value;
    }
    return '\0';
}
