#ifndef AELANG_RUNTIME_H
#define AELANG_RUNTIME_H

#include <stdio.h>
#include <stddef.h>
#include <stdarg.h>

// =============================================================================
// ÆLANG RUNTIME LIBRARY HEADER
// Professional runtime system with unified I/O operations
// Single print() function with format specifiers for everything
// =============================================================================

#ifdef __cplusplus
extern "C" {
#endif

// Special newline keywords
#define NEWLINE "\\n"
#define MULTI_NEWLINE "\\nl"

// -----------------------------------------------------------------------------
// CORE FUNCTIONS
// -----------------------------------------------------------------------------

// Main unified print function - handles everything with format specifiers
void print(const char* format, ...);

// Print without automatic newline
void print_clean(const char* format, ...);

// Unified read function - automatically infers type from assignment context
int read();

// Read with prompt
int read_with_prompt(const char* prompt, const char* format, void* result, size_t result_size);

// Universal read function with type detection (low-level)
void* read_input(const char* prompt, char type_spec, void* buffer, size_t buffer_size);

// -----------------------------------------------------------------------------
// FORMAT SPECIFIERS DOCUMENTATION
// -----------------------------------------------------------------------------

/*
Standard Format Specifiers (printf-style):
  %d, %i    - signed integer
  %u        - unsigned integer
  %x, %X    - hexadecimal
  %o        - octal
  %f, %F    - float/double
  %e, %E    - scientific notation
  %g, %G    - general format (shortest)
  %c        - character
  %s        - string
  %p        - pointer

Custom Format Specifiers:
  %b        - binary format (0b1111_0000)
  %t        - boolean (true/false)
  %$        - currency format ($123.45)
  %P        - percentage (123.4%)
  %K        - engineering format (1.23K, 4.56M, 7.89G, 1.23T)

Width and Precision:
  %5d       - minimum width 5
  %05d      - zero-padded width 5
  %.2f      - 2 decimal places
  %10.3f    - width 10, 3 decimal places
  %-10s     - left-aligned string in width 10

Special Newlines:
  \n        - single newline
  \\nl      - double newline (paragraph break)
  
Examples:
  print("Hello %s!\n", "World");
  print("Number: %d, Hex: %x, Binary: %b\n", 42, 42, 42);
  print("Float: %.2f, Currency: %$, Percent: %P\n", 3.14, 3.14, 3.14);
  print("Boolean: %t\n", 1);
  print("Multi-line text:\\nl\\nlNew paragraph here");
*/

// -----------------------------------------------------------------------------
// LEGACY COMPATIBILITY FUNCTIONS
// -----------------------------------------------------------------------------

void print_int(int value);
void print_float(float value);
void print_str(const char* value);
void print_clean_str(const char* value);
void print_bool(int value);
void print_num(float value);

float read_num(void);
int read_int(void);
float read_float(void);
int read_bool(void);
char read_char(void);
void read_string(char* buffer, int max_length);

// -----------------------------------------------------------------------------
// CONVENIENCE MACROS
// -----------------------------------------------------------------------------

// Read macro for type-safe reading
#define READ(prompt, type, var) read_input(prompt, type, &var, sizeof(var))

// Print shortcuts
#define PRINT_HEX(val) print("0x%x", val)
#define PRINT_BIN(val) print("%b", val)
#define PRINT_BOOL(val) print("%t", val)
#define PRINT_CURRENCY(val) print("%$", val)
#define PRINT_PERCENT(val) print("%P", val)
#define PRINT_ENGINEERING(val) print("%K", val)
#define PRINTLN(format, ...) print(format "\\n", ##__VA_ARGS__)
#define PRINT_MULTILINE(format, ...) print(format "\\nl", ##__VA_ARGS__)

// Read shortcuts
#define READ_INT(var) READ("", 'd', var)
#define READ_FLOAT(var) READ("", 'f', var)
#define READ_CHAR(var) READ("", 'c', var)
#define READ_BOOL(var) READ("", 't', var)
#define READ_STRING(var, size) read_input("", 's', var, size)

#ifdef __cplusplus
}
#endif

#endif // AELANG_RUNTIME_H
