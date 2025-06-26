#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

// Function to read a number and return it as a float
// This will be used for the 'num' type which can handle both integers and floats
float read_num() {
    char buffer[256];
    float value;
    
    // Read the entire line to handle potential errors
    if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
        return 0.0f;  // Return 0 on error
    }
    
    // Remove newline if present
    buffer[strcspn(buffer, "\n")] = 0;
    
    // Try to parse as float
    if (sscanf(buffer, "%f", &value) == 1) {
        return value;
    }
    
    // If parsing fails, return 0
    return 0.0f;
}
