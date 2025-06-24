#include <stdio.h>

// Our print_float function
void print_float(float x) {
    printf("%.6f\n", x);
    fflush(stdout);
}

int main() {
    float val = 3.5f;
    print_float(val);
    return 0;
}
