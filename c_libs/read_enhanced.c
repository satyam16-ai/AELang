#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

// Enhanced input function with format validation
float read_num_validated() {
    char buffer[256];
    float value;
    int valid = 0;
    
    while (!valid) {
        if (fgets(buffer, sizeof(buffer), stdin) != NULL) {
            // Remove newline character
            buffer[strcspn(buffer, "\n")] = 0;
            
            // Check if input is empty
            if (strlen(buffer) == 0) {
                printf("Error: Empty input. Please enter a number: ");
                continue;
            }
            
            // Validate that input contains only valid number characters
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
                    // Skip spaces
                    continue;
                } else {
                    printf("Error: Invalid character '%c'. Please enter a valid number: ", c);
                    hasDigit = 0;
                    break;
                }
            }
            
            if (hasDigit && sscanf(buffer, "%f", &value) == 1) {
                // Additional validation - check for reasonable range
                if (isfinite(value) && !isnan(value)) {
                    valid = 1;
                } else {
                    printf("Error: Number out of valid range. Please try again: ");
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

// Read a number with a specific prompt
float read_num_with_prompt(const char* prompt) {
    printf("%s", prompt);
    return read_num_validated();
}

// Read integer only (validates that input is whole number)
float read_integer_only() {
    float value;
    int valid = 0;
    
    while (!valid) {
        value = read_num_validated();
        if (value == (int)value) {
            valid = 1;
        } else {
            printf("Error: Please enter a whole number only: ");
        }
    }
    
    return value;
}

// Read positive number only
float read_positive_num() {
    float value;
    int valid = 0;
    
    while (!valid) {
        value = read_num_validated();
        if (value > 0) {
            valid = 1;
        } else {
            printf("Error: Please enter a positive number: ");
        }
    }
    
    return value;
}
