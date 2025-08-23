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
                    // For variadic functions, floats are promoted to double
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
                        
                        // Process single newlines \\n -> \n
                        while ((pos = strstr(result, "\\n")) != NULL) {
                            *pos = '\n';
                            memmove(pos + 1, pos + 2, strlen(pos + 2) + 1);
                        }
                        
                        // Process double backslash newlines \\\\n -> \n
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
        } else if (*fmt_ptr == '\\' && *(fmt_ptr + 1) == 'n') {
            // Handle \n newlines in format string
            *output_ptr++ = '\n';
            fmt_ptr += 2;
        } else if (strncmp(fmt_ptr, MULTI_NEWLINE, strlen(MULTI_NEWLINE)) == 0) {
            // Handle multi-line newlines
            *output_ptr++ = '\n';
            *output_ptr++ = '\n';
            fmt_ptr += strlen(MULTI_NEWLINE);
        } else if (*fmt_ptr == '\n') {
            // Handle actual newlines from assembly (this is the key fix!)
            *output_ptr++ = '\n';
            fmt_ptr++;
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

// Type constants for universal read function
#define AELANG_TYPE_I8    1
#define AELANG_TYPE_I16   2  
#define AELANG_TYPE_I32   3
#define AELANG_TYPE_I64   4
#define AELANG_TYPE_U8    5
#define AELANG_TYPE_U16   6
#define AELANG_TYPE_U32   7
#define AELANG_TYPE_U64   8
#define AELANG_TYPE_F8    9
#define AELANG_TYPE_F16   10
#define AELANG_TYPE_F32   11
#define AELANG_TYPE_F64   12
#define AELANG_TYPE_NUM   13
#define AELANG_TYPE_BOOL  14
#define AELANG_TYPE_CHAR  15

// Universal read function with type validation
// Returns a union that can hold any numeric type
union AELangValue {
    int8_t   i8_val;
    int16_t  i16_val;
    int32_t  i32_val;
    int64_t  i64_val;
    uint8_t  u8_val;
    uint16_t u16_val;
    uint32_t u32_val;
    uint64_t u64_val;
    float    f32_val;
    double   f64_val;
    double   num_val;  // For 'num' type
    int      bool_val;
    char     char_val;
};

// Helper function to get type name string
const char* get_type_name(int type_id) {
    switch(type_id) {
        case AELANG_TYPE_I8:   return "i8";
        case AELANG_TYPE_I16:  return "i16";
        case AELANG_TYPE_I32:  return "i32";
        case AELANG_TYPE_I64:  return "i64";
        case AELANG_TYPE_U8:   return "u8";
        case AELANG_TYPE_U16:  return "u16";
        case AELANG_TYPE_U32:  return "u32";
        case AELANG_TYPE_U64:  return "u64";
        case AELANG_TYPE_F8:   return "f8";
        case AELANG_TYPE_F16:  return "f16";
        case AELANG_TYPE_F32:  return "f32";
        case AELANG_TYPE_F64:  return "f64";
        case AELANG_TYPE_NUM:  return "num";
        case AELANG_TYPE_BOOL: return "bool";
        case AELANG_TYPE_CHAR: return "char";
        default: return "unknown";
    }
}

// Universal read function with type checking and validation
union AELangValue read_universal(int expected_type) {
    union AELangValue result = {0};
    char input_buffer[256];
    
    // Get input from user
    if (!fgets(input_buffer, sizeof(input_buffer), stdin)) {
        fprintf(stderr, "Runtime Error: Failed to read input\n");
        exit(1);
    }
    
    // Remove trailing newline
    input_buffer[strcspn(input_buffer, "\n")] = 0;
    
    // Handle char type first (special case)
    if (expected_type == AELANG_TYPE_CHAR) {
        if (strlen(input_buffer) != 1) {
            fprintf(stderr, "Runtime Error: Invalid input '%s' for type %s. Expected single character.\n", 
                    input_buffer, get_type_name(expected_type));
            exit(1);
        }
        result.char_val = input_buffer[0];
        return result;
    }
    
    // Handle boolean types (special case)
    if (expected_type == AELANG_TYPE_BOOL) {
        if (strcasecmp(input_buffer, "true") == 0 || strcmp(input_buffer, "1") == 0) {
            result.bool_val = 1;
            return result;
        } else if (strcasecmp(input_buffer, "false") == 0 || strcmp(input_buffer, "0") == 0) {
            result.bool_val = 0;
            return result;
        } else {
            fprintf(stderr, "Runtime Error: Invalid input '%s' for type %s. Expected 'true', 'false', '1', or '0'.\n", 
                    input_buffer, get_type_name(expected_type));
            exit(1);
        }
    }
    
    // Parse as number
    char* endptr;
    
    // Try floating-point parsing for float types
    if (expected_type >= AELANG_TYPE_F8 && expected_type <= AELANG_TYPE_NUM) {
        double float_val = strtod(input_buffer, &endptr);
        
        if (*endptr != '\0') {
            fprintf(stderr, "Runtime Error: Invalid input '%s' for type %s. Expected a number.\n", 
                    input_buffer, get_type_name(expected_type));
            exit(1);
        }
        
        // Validate range for specific float types and store
        switch(expected_type) {
            case AELANG_TYPE_F8:
                // F8: Limited range (simulate with float but warn about precision)
                if (float_val < -128.0 || float_val > 127.0) {
                    fprintf(stderr, "Runtime Warning: Value %g may exceed f8 range [-128, 127]\n", float_val);
                }
                result.f32_val = (float)float_val;
                break;
            case AELANG_TYPE_F16:
                // F16: Half precision range
                if (float_val < -65504.0 || float_val > 65504.0) {
                    fprintf(stderr, "Runtime Warning: Value %g may exceed f16 range\n", float_val);
                }
                result.f32_val = (float)float_val;
                break;
            case AELANG_TYPE_F32:
                result.f32_val = (float)float_val;
                break;
            case AELANG_TYPE_F64:
            case AELANG_TYPE_NUM:
                result.f64_val = float_val;
                break;
        }
        return result;
    }
    
    // Try integer parsing for integer types
    if (expected_type >= AELANG_TYPE_I8 && expected_type <= AELANG_TYPE_U64) {
        // Check if input contains decimal point
        if (strchr(input_buffer, '.') != NULL) {
            fprintf(stderr, "Runtime Error: Invalid input '%s' for type %s. Expected an integer (no decimal point).\n", 
                    input_buffer, get_type_name(expected_type));
            exit(1);
        }
        
        long long int_val = strtoll(input_buffer, &endptr, 10);
        
        if (*endptr != '\0') {
            fprintf(stderr, "Runtime Error: Invalid input '%s' for type %s. Expected an integer.\n", 
                    input_buffer, get_type_name(expected_type));
            exit(1);
        }
        
        // Validate range for specific integer types and store
        switch(expected_type) {
            case AELANG_TYPE_I8:
                if (int_val < -128 || int_val > 127) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for i8 [-128, 127]\n", int_val);
                    exit(1);
                }
                result.i8_val = (int8_t)int_val;
                break;
            case AELANG_TYPE_I16:
                if (int_val < -32768 || int_val > 32767) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for i16 [-32768, 32767]\n", int_val);
                    exit(1);
                }
                result.i16_val = (int16_t)int_val;
                break;
            case AELANG_TYPE_I32:
                if (int_val < INT32_MIN || int_val > INT32_MAX) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for i32 [%d, %d]\n", 
                            int_val, INT32_MIN, INT32_MAX);
                    exit(1);
                }
                result.i32_val = (int32_t)int_val;
                break;
            case AELANG_TYPE_I64:
                result.i64_val = (int64_t)int_val;
                break;
            case AELANG_TYPE_U8:
                if (int_val < 0 || int_val > 255) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for u8 [0, 255]\n", int_val);
                    exit(1);
                }
                result.u8_val = (uint8_t)int_val;
                break;
            case AELANG_TYPE_U16:
                if (int_val < 0 || int_val > 65535) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for u16 [0, 65535]\n", int_val);
                    exit(1);
                }
                result.u16_val = (uint16_t)int_val;
                break;
            case AELANG_TYPE_U32:
                if (int_val < 0 || int_val > UINT32_MAX) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for u32 [0, %u]\n", 
                            int_val, UINT32_MAX);
                    exit(1);
                }
                result.u32_val = (uint32_t)int_val;
                break;
            case AELANG_TYPE_U64:
                if (int_val < 0) {
                    fprintf(stderr, "Runtime Error: Value %lld out of range for u64 (must be positive)\n", int_val);
                    exit(1);
                }
                result.u64_val = (uint64_t)int_val;
                break;
        }
        return result;
    }
    
    // Should never reach here
    fprintf(stderr, "Runtime Error: Unknown type %d\n", expected_type);
    exit(1);
}

// Type-specific wrapper functions for the compiler to call
int8_t read_i8() {
    union AELangValue result = read_universal(AELANG_TYPE_I8);
    return result.i8_val;
}

int16_t read_i16() {
    union AELangValue result = read_universal(AELANG_TYPE_I16);
    return result.i16_val;
}

int32_t read_i32() {
    union AELangValue result = read_universal(AELANG_TYPE_I32);
    return result.i32_val;
}

int64_t read_i64() {
    union AELangValue result = read_universal(AELANG_TYPE_I64);
    return result.i64_val;
}

uint8_t read_u8() {
    union AELangValue result = read_universal(AELANG_TYPE_U8);
    return result.u8_val;
}

uint16_t read_u16() {
    union AELangValue result = read_universal(AELANG_TYPE_U16);
    return result.u16_val;
}

uint32_t read_u32() {
    union AELangValue result = read_universal(AELANG_TYPE_U32);
    return result.u32_val;
}

uint64_t read_u64() {
    union AELangValue result = read_universal(AELANG_TYPE_U64);
    return result.u64_val;
}

float read_f32() {
    union AELangValue result = read_universal(AELANG_TYPE_F32);
    return result.f32_val;
}

double read_f64() {
    union AELangValue result = read_universal(AELANG_TYPE_F64);
    return result.f64_val;
}

// F8 and F16 return as float but with validation
float read_f8() {
    union AELangValue result = read_universal(AELANG_TYPE_F8);
    return result.f32_val;
}

float read_f16() {
    union AELangValue result = read_universal(AELANG_TYPE_F16);
    return result.f32_val;
}

double read_num() {
    union AELangValue result = read_universal(AELANG_TYPE_NUM);
    return result.f64_val;
}

int read_bool() {
    union AELangValue result = read_universal(AELANG_TYPE_BOOL);
    return result.bool_val;
}

char read_char() {
    union AELangValue result = read_universal(AELANG_TYPE_CHAR);
    return result.char_val;
}

// Legacy universal read function (backwards compatibility)
double read() {
    union AELangValue result = read_universal(AELANG_TYPE_NUM);
    return result.f64_val;
}

// Enhanced context-aware read function 
// This function will be called by the compiler with the expected type
int read_with_type(int semantic_type) {
    // Map from SemanticType enum (0-based) to our AELANG_TYPE constants (1-based)
    int expected_type;
    switch (semantic_type) {
        case 0:  expected_type = AELANG_TYPE_I8; break;    // TYPE_I8
        case 1:  expected_type = AELANG_TYPE_I16; break;   // TYPE_I16  
        case 2:  expected_type = AELANG_TYPE_I32; break;   // TYPE_I32
        case 3:  expected_type = AELANG_TYPE_I64; break;   // TYPE_I64
        case 4:  expected_type = AELANG_TYPE_U8; break;    // TYPE_U8
        case 5:  expected_type = AELANG_TYPE_U16; break;   // TYPE_U16
        case 6:  expected_type = AELANG_TYPE_U32; break;   // TYPE_U32
        case 7:  expected_type = AELANG_TYPE_U64; break;   // TYPE_U64
        case 8:  expected_type = AELANG_TYPE_F8; break;    // TYPE_F8
        case 9:  expected_type = AELANG_TYPE_F16; break;   // TYPE_F16
        case 10: expected_type = AELANG_TYPE_F32; break;   // TYPE_F32
        case 11: expected_type = AELANG_TYPE_F64; break;   // TYPE_F64
        case 12: expected_type = AELANG_TYPE_NUM; break;   // TYPE_NUM
        case 13: expected_type = AELANG_TYPE_CHAR; break;  // TYPE_STR (treat as char for now)
        case 14: expected_type = AELANG_TYPE_CHAR; break;  // TYPE_CHAR
        case 15: expected_type = AELANG_TYPE_BOOL; break;  // TYPE_BOOL
        default:
            printf("Runtime Error: Unknown semantic type %d\n", semantic_type);
            exit(1);
    }
    
    // Use the full universal read system
    union AELangValue result = read_universal(expected_type);
    
    // For character type, return the character value directly
    if (expected_type == AELANG_TYPE_CHAR) {
        return (int)result.char_val;
    }
    
    // For integer types, return the appropriate value
    switch (expected_type) {
        case AELANG_TYPE_I8:   return (int)result.i8_val;
        case AELANG_TYPE_I16:  return (int)result.i16_val;
        case AELANG_TYPE_I32:  return (int)result.i32_val;
        case AELANG_TYPE_I64:  return (int)result.i64_val;  // Note: truncation for 32-bit
        case AELANG_TYPE_U8:   return (int)result.u8_val;
        case AELANG_TYPE_U16:  return (int)result.u16_val;
        case AELANG_TYPE_U32:  return (int)result.u32_val;
        case AELANG_TYPE_U64:  return (int)result.u64_val;  // Note: truncation for 32-bit
        case AELANG_TYPE_CHAR: return (int)result.char_val;
        case AELANG_TYPE_BOOL: return result.bool_val;
        case AELANG_TYPE_F32:  
        case AELANG_TYPE_F8:
        case AELANG_TYPE_F16:
            // Return the float bits as int - print function needs to decode
            return *(int*)&result.f32_val;
        case AELANG_TYPE_F64:  
        case AELANG_TYPE_NUM:  
            // For doubles, convert to float first, then return bits
            float f = (float)result.f64_val;
            return *(int*)&f;
        default:
            printf("Warning: Unknown type %d, returning 0\n", expected_type);
            return 0;
    }
}
