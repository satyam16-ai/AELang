; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x40490fd0  ; 3.14159012
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; PI
    int_var_0: resd 1  ; MAX_SIZE
    int_var_1: resd 1  ; ZERO
    int_var_2: resd 1  ; ONE
    int_var_3: resd 1  ; NEGATIVE

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num
    extern read_num_safe
    extern print_num
    extern print_clean
    extern print_num_precision
    extern print_num_scientific
    extern print_currency
    extern print_percentage
    extern print_num_engineering
    extern print_hex
    extern read_num_validated
    extern read_num_with_prompt
    extern read_positive_num
    extern read_integer_only

extern print
extern print_int
extern print_float
extern read_int
extern read_float
