; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x4048f5c3  ; 3.1400001
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; x

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

extern print_float
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let x:f32 = 3.140000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store x
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    pop ebp
    ret
