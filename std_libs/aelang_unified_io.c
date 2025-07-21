#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include <stdarg.h>
#include <stdint.h>

// =============================================================================
// ÆLANG SIMPLIFIED UNIFIED I/O LIBRARY
// Single print() function with format specifiers for everything
// =============================================================================

// Special newline keyword
#define NEWLINE "\\n"
#define MULTI_NEWLINE "\\nl"  // Special multi-line separator

// -----------------------------------------------------------------------------
// CORE UNIFIED PRINT FUNCTION
// -----------------------------------------------------------------------------

// Main print function - handles everything with format specifiers
void print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    
    char output_buffer[8192]; // Large buffer for complex formatting
    char* output_ptr = output_buffer;
    const char* fmt_ptr = format;
    
    while (*fmt_ptr) {
        if (*fmt_ptr == '%') {
            fmt_ptr++; // Skip '%'
            
            char temp_fmt[64];
            char* temp_ptr = temp_fmt;
            *temp_ptr++ = '%';

            // Copy flags, width, precision, length modifiers
            while (*fmt_ptr && strchr("diuoxXfFeEgGaAcspnb$PKt", *fmt_ptr) == NULL && *fmt_ptr != '%') {
                *temp_ptr++ = *fmt_ptr++;
            }
            
            char format_type = *fmt_ptr;
            if (format_type == '\0') { // End of format string
                *output_ptr++ = '%';
                break;
            }
            *temp_ptr++ = *fmt_ptr++;
            *temp_ptr = '\0';

            if (format_type == '%') {
                *output_ptr++ = '%';
                continue;
            }
            
            // Handle different format types
            switch (format_type) {
                case 'd': case 'i': {
                    if (strchr(temp_fmt, 'l')) {
                        long val = va_arg(args, long);
                        int written = sprintf(output_ptr, temp_fmt, val);
                        output_ptr += written;
                    } else {
                        int val = va_arg(args, int);
                        int written = sprintf(output_ptr, temp_fmt, val);
                        output_ptr += written;
                    }
                    break;
                }
                case 'u': case 'x': case 'X': case 'o': {
                    if (strchr(temp_fmt, 'l')) {
                        unsigned long val = va_arg(args, unsigned long);
                        int written = sprintf(output_ptr, temp_fmt, val);
                        output_ptr += written;
                    } else {
                        unsigned int val = va_arg(args, unsigned int);
                        int written = sprintf(output_ptr, temp_fmt, val);
                        output_ptr += written;
                    }
                    break;
                }
                case 'f': case 'F': case 'e': case 'E': case 'g': case 'G': {
                    double val = va_arg(args, double);
                    int written = sprintf(output_ptr, temp_fmt, val);
                    output_ptr += written;
                    break;
                }
                case 'c': {
                    int val = va_arg(args, int);
                    int written = sprintf(output_ptr, temp_fmt, (char)val);
                    output_ptr += written;
                    break;
                }
                case 's': {
                    char* val = va_arg(args, char*);
                    if (val) {
                        // Handle special newline processing for strings
                        char* temp_str = strdup(val);
                        char* result = temp_str;
                        char* pos;
                        
                        // Process multi-line newlines first (longer pattern)
                        while ((pos = strstr(result, "\\\\nl")) != NULL) {
                            *pos = '\n';
                            *(pos + 1) = '\n';
                            memmove(pos + 2, pos + 4, strlen(pos + 4) + 1);
                        }
                        
                        // Process single newlines
                        while ((pos = strstr(result, "\\\\n")) != NULL) {
                            *pos = '\n';
                            memmove(pos + 1, pos + 3, strlen(pos + 3) + 1);
                        }
                        
                        int written = sprintf(output_ptr, temp_fmt, result);
                        output_ptr += written;
                        free(temp_str);
                    } else {
                        int written = sprintf(output_ptr, "(null)");
                        output_ptr += written;
                    }
                    break;
                }
                case 'p': {
                    void* val = va_arg(args, void*);
                    int written = sprintf(output_ptr, temp_fmt, val);
                    output_ptr += written;
                    break;
                }
                case 'b': { // Binary format (custom)
                    unsigned int val = va_arg(args, unsigned int);
                    char bin_str[64] = "0b";
                    char* bin_ptr = bin_str + 2;
                    
                    if (val == 0) {
                        strcpy(bin_ptr, "0");
                    } else {
                        for (int i = 31; i >= 0; i--) {
                            if ((val >> i) & 1) {
                                *bin_ptr++ = '1';
                            } else if (bin_ptr > bin_str + 2) {
                                *bin_ptr++ = '0';
                            }
                            if (i % 4 == 0 && i > 0 && bin_ptr > bin_str + 2) {
                                *bin_ptr++ = '_';
                            }
                        }
                    }
                    *bin_ptr = '\0';
                    
                    strcpy(output_ptr, bin_str);
                    output_ptr += strlen(bin_str);
                    break;
                }
                case 't': { // Boolean (true/false) - custom
                    int val = va_arg(args, int);
                    const char* bool_str = val ? "true" : "false";
                    strcpy(output_ptr, bool_str);
                    output_ptr += strlen(bool_str);
                    break;
                }
                case '$': { // Currency format - custom
                    double val = va_arg(args, double);
                    int written = sprintf(output_ptr, "$%.2f", val);
                    output_ptr += written;
                    break;
                }
                case 'P': { // Percentage format - custom
                    double val = va_arg(args, double);
                    int written = sprintf(output_ptr, "%.1f%%", val * 100.0);
                    output_ptr += written;
                    break;
                }
                case 'K': { // Engineering format - custom
                    double val = va_arg(args, double);
                    if (fabs(val) >= 1e12) {
                        int written = sprintf(output_ptr, "%.2fT", val / 1e12);
                        output_ptr += written;
                    } else if (fabs(val) >= 1e9) {
                        int written = sprintf(output_ptr, "%.2fG", val / 1e9);
                        output_ptr += written;
                    } else if (fabs(val) >= 1e6) {
                        int written = sprintf(output_ptr, "%.2fM", val / 1e6);
                        output_ptr += written;
                    } else if (fabs(val) >= 1e3) {
                        int written = sprintf(output_ptr, "%.2fK", val / 1e3);
                        output_ptr += written;
                    } else {
                        int written = sprintf(output_ptr, "%.2f", val);
                        output_ptr += written;
                    }
                    break;
                }
                default:
                    // Unknown format, just copy it
                    strcpy(output_ptr, temp_fmt);
                    output_ptr += strlen(temp_fmt);
                    break;
            }
        } else if (*fmt_ptr == '\\' && *(fmt_ptr + 1) == '\\' && *(fmt_ptr + 2) == 'n' && *(fmt_ptr + 3) == 'l') {
            // Handle \\nl multi-line newlines first
            *output_ptr++ = '\n';
            *output_ptr++ = '\n';
            fmt_ptr += 4;
        } else if (*fmt_ptr == '\\' && *(fmt_ptr + 1) == '\\' && *(fmt_ptr + 2) == 'n') {
            // Handle \\n newlines
            *output_ptr++ = '\n';
            fmt_ptr += 3;
        } else if (strncmp(fmt_ptr, MULTI_NEWLINE, strlen(MULTI_NEWLINE)) == 0) {
            // Handle multi-line newlines
            *output_ptr++ = '\n';
            *output_ptr++ = '\n';
            fmt_ptr += strlen(MULTI_NEWLINE);
        } else {
            // Regular character
            *output_ptr++ = *fmt_ptr++;
        }
    }
    
    *output_ptr = '\0';
    printf("%s", output_buffer);
    fflush(stdout);
    
    va_end(args);
}

// Print without automatic newline
void print_clean(const char* format, ...) {
    va_list args;
    va_start(args, format);
    
    char output_buffer[8192];
    char* output_ptr = output_buffer;
    const char* fmt_ptr = format;
    
    while (*fmt_ptr) {
        if (*fmt_ptr == '%') {
            fmt_ptr++; // Skip '%'
            
            // Parse format specifier
            char spec_buffer[32];
            int spec_idx = 0;
            
            // Copy the format specifier
            while (*fmt_ptr && !isalpha(*fmt_ptr) && *fmt_ptr != '%' && *fmt_ptr != '$' && *fmt_ptr != 'P' && *fmt_ptr != 'K' && *fmt_ptr != 't' && *fmt_ptr != 'b') {
                spec_buffer[spec_idx++] = *fmt_ptr++;
            }
            
            if (*fmt_ptr == '%') {
                // Escaped %
                *output_ptr++ = '%';
                fmt_ptr++;
                continue;
            }
            
            // Get the format type
            char format_type = *fmt_ptr++;
            spec_buffer[spec_idx] = '\0';
            
            // Build complete format string
            char complete_fmt[64];
            snprintf(complete_fmt, sizeof(complete_fmt), "%%%s%c", spec_buffer, format_type);
            
            // Handle different format types (same as main print function)
            switch (format_type) {
                case 'd': case 'i': {
                    int val = va_arg(args, int);
                    int written = sprintf(output_ptr, complete_fmt, val);
                    output_ptr += written;
                    break;
                }
                case 's': {
                    char* val = va_arg(args, char*);
                    if (val) {
                        int written = sprintf(output_ptr, complete_fmt, val);
                        output_ptr += written;
                    } else {
                        int written = sprintf(output_ptr, "(null)");
                        output_ptr += written;
                    }
                    break;
                }
                default:
                    // For simplicity, just copy the format
                    *output_ptr++ = '%';
                    strcpy(output_ptr, spec_buffer);
                    output_ptr += strlen(spec_buffer);
                    *output_ptr++ = format_type;
                    break;
            }
        } else {
            // Regular character
            *output_ptr++ = *fmt_ptr++;
        }
    }
    
    *output_ptr = '\0';
    printf("%s", output_buffer);
    fflush(stdout);
    
    va_end(args);
}

// -----------------------------------------------------------------------------
// UNIFIED READ FUNCTION
// -----------------------------------------------------------------------------

// Universal read function with type detection
void* read_input(const char* prompt, char type_spec, void* buffer, size_t buffer_size) {
    if (prompt) {
        print("%s", prompt);
    }
    
    char input_buffer[1024];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        return NULL;
    }
    
    // Remove newline
    size_t len = strlen(input_buffer);
    if (len > 0 && input_buffer[len-1] == '\n') {
        input_buffer[len-1] = '\0';
    }
    
    char* endptr;
    
    switch (type_spec) {
        case 'd': case 'i': {
            long val = strtol(input_buffer, &endptr, 10);
            if (*endptr == '\0') {
                *(int*)buffer = (int)val;
                return buffer;
            }
            break;
        }
        case 'f': {
            double val = strtod(input_buffer, &endptr);
            if (*endptr == '\0') {
                *(float*)buffer = (float)val;
                return buffer;
            }
            break;
        }
        case 'l': { // long
            long val = strtol(input_buffer, &endptr, 10);
            if (*endptr == '\0') {
                *(long*)buffer = val;
                return buffer;
            }
            break;
        }
        case 'g': { // double
            double val = strtod(input_buffer, &endptr);
            if (*endptr == '\0') {
                *(double*)buffer = val;
                return buffer;
            }
            break;
        }
        case 'c': {
            if (strlen(input_buffer) == 1) {
                *(char*)buffer = input_buffer[0];
                return buffer;
            }
            break;
        }
        case 's': {
            if (buffer_size > strlen(input_buffer)) {
                strcpy((char*)buffer, input_buffer);
                return buffer;
            }
            break;
        }
        case 't': { // boolean
            if (strcasecmp(input_buffer, "true") == 0 || strcmp(input_buffer, "1") == 0) {
                *(int*)buffer = 1;
                return buffer;
            } else if (strcasecmp(input_buffer, "false") == 0 || strcmp(input_buffer, "0") == 0) {
                *(int*)buffer = 0;
                return buffer;
            }
            break;
        }
        case 'u': { // unsigned
            unsigned long val = strtoul(input_buffer, &endptr, 10);
            if (*endptr == '\0') {
                *(unsigned int*)buffer = (unsigned int)val;
                return buffer;
            }
            break;
        }
        case 'x': { // hex input
            unsigned long val = strtoul(input_buffer, &endptr, 16);
            if (*endptr == '\0') {
                *(unsigned int*)buffer = (unsigned int)val;
                return buffer;
            }
            break;
        }
    }
    
    return NULL; // Parsing failed
}

// Simplified read function
// -----------------------------------------------------------------------------
// UNIFIED READ FUNCTION
// -----------------------------------------------------------------------------

// Unified read function - automatically infers type from assignment context
// The compiler determines the expected type and handles type checking
int read() {
    char input_buffer[256];
    
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\n");
        return 0;
    }
    
    // Remove trailing newline
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    // Try to parse as integer first
    char* endptr;
    long int_val = strtol(input_buffer, &endptr, 10);
    
    if (*endptr == '\0') {
        // Valid integer
        return (int)int_val;
    }
    
    // Try as float
    double float_val = strtod(input_buffer, &endptr);
    if (*endptr == '\0') {
        // Valid float - store as int bits for return (compiler will handle conversion)
        union { float f; int i; } converter;
        converter.f = (float)float_val;
        return converter.i;
    }
    
    // Try as boolean
    if (strcasecmp(input_buffer, "true") == 0 || strcmp(input_buffer, "1") == 0) {
        return 1;
    } else if (strcasecmp(input_buffer, "false") == 0 || strcmp(input_buffer, "0") == 0) {
        return 0;
    }
    
    // Input doesn't match any expected format
    fprintf(stderr, "Error: Invalid input format '%s'. Expected integer, float, or boolean.\n", input_buffer);
    return 0;
}

// Convenience functions that use the unified read function
int read_with_prompt(const char* prompt, const char* format, void* result, size_t result_size) {
    if (prompt && strlen(prompt) > 0) {
        print("%s", prompt);
    }
    return read(format, result, result_size);
}

// Type-safe wrapper functions
int read_int_safe() {
    int value;
    if (read("%d", &value, sizeof(value))) {
        return value;
    }
    return 0; // Default on error
}

float read_float_safe() {
    float value;
    if (read("%f", &value, sizeof(value))) {
        return value;
    }
    return 0.0f; // Default on error
}

int read_bool_safe() {
    int value;
    if (read("%t", &value, sizeof(value))) {
        return value;
    }
    return 0; // Default on error
}

#define READ(prompt, type, var) read_input(prompt, type, &var, sizeof(var))

// -----------------------------------------------------------------------------
// UNIFIED READ FUNCTION
// -----------------------------------------------------------------------------

// Unified read function - automatically infers type from assignment context
// The compiler determines the expected type and handles type checking
// -----------------------------------------------------------------------------
// UNIFIED READ SYSTEM - All Data Types
// -----------------------------------------------------------------------------

// Type-specific read functions for all ÆLang data types
int8_t read_i8() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    long val = strtol(input_buffer, &endptr, 10);
    if (*endptr != '\0' || val < -128 || val > 127) {
        fprintf(stderr, "Error: Invalid i8 input '%s'. Expected integer from -128 to 127.\n", input_buffer);
        return 0;
    }
    return (int8_t)val;
}

int16_t read_i16() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    long val = strtol(input_buffer, &endptr, 10);

    // Trim trailing whitespace from endptr
    while (isspace((unsigned char)*endptr)) {
        endptr++;
    }

    if (*endptr != '\0' || val < -32768 || val > 32767) {
        fprintf(stderr, "Error: Invalid i16 input '%s'. Expected integer from -32768 to 32767.\\n", input_buffer);
        return 0;
    }
    return (int16_t)val;
}

int32_t read_i32() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    long val = strtol(input_buffer, &endptr, 10);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid i32 input '%s'. Expected integer.\n", input_buffer);
        return 0;
    }
    return (int32_t)val;
}

int64_t read_i64() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    long long val = strtoll(input_buffer, &endptr, 10);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid i64 input '%s'. Expected 64-bit integer.\n", input_buffer);
        return 0;
    }
    return (int64_t)val;
}

uint8_t read_u8() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    unsigned long val = strtoul(input_buffer, &endptr, 10);
    if (*endptr != '\0' || val > 255) {
        fprintf(stderr, "Error: Invalid u8 input '%s'. Expected unsigned integer from 0 to 255.\n", input_buffer);
        return 0;
    }
    return (uint8_t)val;
}

uint16_t read_u16() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    unsigned long val = strtoul(input_buffer, &endptr, 10);
    if (*endptr != '\0' || val > 65535) {
        fprintf(stderr, "Error: Invalid u16 input '%s'. Expected unsigned integer from 0 to 65535.\n", input_buffer);
        return 0;
    }
    return (uint16_t)val;
}

uint32_t read_u32() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    unsigned long val = strtoul(input_buffer, &endptr, 10);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid u32 input '%s'. Expected unsigned 32-bit integer.\n", input_buffer);
        return 0;
    }
    return (uint32_t)val;
}

uint64_t read_u64() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    unsigned long long val = strtoull(input_buffer, &endptr, 10);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid u64 input '%s'. Expected unsigned 64-bit integer.\n", input_buffer);
        return 0;
    }
    return (uint64_t)val;
}

float read_f32() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0.0f;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    double val = strtod(input_buffer, &endptr);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid f32 input '%s'. Expected floating-point number.\n", input_buffer);
        return 0.0f;
    }
    return (float)val;
}

double read_f64() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0.0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    double val = strtod(input_buffer, &endptr);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid f64 input '%s'. Expected double-precision floating-point number.\n", input_buffer);
        return 0.0;
    }
    return val;
}

char read_char() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return '\0';
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    if (strlen(input_buffer) != 1) {
        fprintf(stderr, "Error: Invalid char input '%s'. Expected single character.\\n", input_buffer);
        return '\0';
    }
    return input_buffer[0];
}

int read_bool() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\n");
        return 0;
    }
    // Remove trailing newline and whitespace
    char* end = input_buffer + strlen(input_buffer) - 1;
    while (end >= input_buffer && isspace((unsigned char)*end)) {
        *end = '\0';
        end--;
    }
    
    // Convert to lowercase for comparison
    for (int i = 0; input_buffer[i]; i++) {
        input_buffer[i] = tolower(input_buffer[i]);
    }

    if (strcmp(input_buffer, "true") == 0 || strcmp(input_buffer, "1") == 0) {
        return 1;
    } else if (strcmp(input_buffer, "false") == 0 || strcmp(input_buffer, "0") == 0) {
        return 0;
    } else {
        fprintf(stderr, "Error: Invalid bool input '%s'. Expected 'true', 'false', '1', or '0'.\n", input_buffer);
        return 0;
    }
}

// String input with dynamic allocation
char* read_str() {
    char input_buffer[1024];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return NULL;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* result = malloc(strlen(input_buffer) + 1);
    if (!result) {
        fprintf(stderr, "Error: Memory allocation failed\n");
        return NULL;
    }
    strcpy(result, input_buffer);
    return result;
}

// Universal numeric type (chooses best fit)
double read_num() {
    char input_buffer[256];
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Error: Failed to read input\\n");
        return 0.0;
    }
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    char* endptr;
    double val = strtod(input_buffer, &endptr);
    if (*endptr != '\0') {
        fprintf(stderr, "Error: Invalid num input '%s'. Expected numeric value.\n", input_buffer);
        return 0.0;
    }
    return val;
}

// Legacy functions for backward compatibility
void print_int(int value) {
    print("%d\n", value);
}

void print_float(float value) {
    print("%.6f\n", value);
}

void print_str(const char* value) {
    print("%s\n", value);
}

void print_clean_str(const char* value) {
    print("%s", value);
}

void print_bool(int value) {
    print("%t\n", value);
}

void print_num(float value) {
    if (value == (int)value) {
        print("%.0f", value);
    } else {
        print("%.2f", value);
    }
}

// -----------------------------------------------------------------------------
// MACRO SHORTCUTS
// -----------------------------------------------------------------------------

// Convenient macros for common operations
#define PRINT_HEX(val) print("0x%x", val)
#define PRINT_BIN(val) print("%b", val)
#define PRINT_BOOL(val) print("%t", val)
#define PRINT_CURRENCY(val) print("%$", val)
#define PRINT_PERCENT(val) print("%P", val)
#define PRINT_ENGINEERING(val) print("%K", val)
#define PRINTLN(format, ...) print(format "\\n", ##__VA_ARGS__)
#define PRINT_MULTILINE(format, ...) print(format "\\nl", ##__VA_ARGS__)

// Read macros
#define READ_INT(var) READ("", 'd', var)
#define READ_FLOAT(var) READ("", 'f', var)
#define READ_CHAR(var) READ("", 'c', var)
#define READ_BOOL(var) READ("", 't', var)
#define READ_STRING(var, size) read_input("", 's', var, size)
