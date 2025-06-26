#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Enhanced read_num with better error handling and validation
float read_num_safe() {
    char buffer[256];
    float value;
    char *endptr;
    
    while (1) {
        // Read the entire line
        if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
            printf("Error reading input. Using 0.0\n");
            return 0.0f;
        }
        
        // Remove newline if present
        buffer[strcspn(buffer, "\n")] = 0;
        
        // Skip empty lines
        if (strlen(buffer) == 0) {
            continue;
        }
        
        // Try to parse as float using strtof for better validation
        value = strtof(buffer, &endptr);
        
        // Check if the entire string was consumed (valid number)
        if (*endptr == '\0') {
            return value;
        }
        
        // If we reach here, invalid input - use simple sscanf as fallback
        if (sscanf(buffer, "%f", &value) == 1) {
            return value;
        }
        
        // Still invalid, return 0
        printf("Invalid input, using 0.0\n");
        return 0.0f;
    }
}
