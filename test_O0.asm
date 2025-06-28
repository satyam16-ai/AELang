; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x40600000  ; 3.5
float_1: dd 0x40b9999a  ; 5.80000019
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; pi
    float_var_1: resd 1  ; radius
    float_var_2: resd 1  ; res
    int_var_0: resd 1  ; x

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

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let pi:f32 = 3.500000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store pi
; let x:i32 = 5
    mov eax, 5
    mov [int_var_0], eax  ; store x
; let radius:f32 = 5.800000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store radius
; let res:f32 = pi + radius
    fld dword [float_var_0]  ; load pi
    fld dword [float_var_1]  ; load radius
    faddp
    fstp dword [float_var_2]  ; store res
    fld dword [float_var_2]  ; load res
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    mov eax, [int_var_0]  ; load x
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
