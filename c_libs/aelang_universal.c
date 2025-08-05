#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

// Universal print function that can handle printf-style formatting
void print(const char* format, ...) {
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
    fflush(stdout);
}

// Universal read function for integers
int read() {
    int value;
    if (scanf("%d", &value) != 1) {
        printf("Error: Invalid input\n");
        exit(1);
    }
    return value;
}

// Universal read function for floating point numbers
double read_double() {
    double value;
    if (scanf("%lf", &value) != 1) {
        printf("Error: Invalid input\n");
        exit(1);
    }
    return value;
}

// Universal read function for strings
char* read_string() {
    static char buffer[1024];
    if (scanf("%1023s", buffer) != 1) {
        printf("Error: Invalid input\n");
        exit(1);
    }
    return buffer;
}

// Universal read function for characters
char read_char() {
    char c;
    if (scanf(" %c", &c) != 1) {
        printf("Error: Invalid input\n");
        exit(1);
    }
    return c;
}
