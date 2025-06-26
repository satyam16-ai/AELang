; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x42c80000  ; 100
float_1: dd 0x4048f5c3  ; 3.1400001
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; diff
    float_var_4: resd 1  ; prod
    float_var_5: resd 1  ; quot

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

extern print_num
extern read_num_safe
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:num = 100.000000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store a as num (float)
; let b:num = 3.140000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store b as num (float)
; let sum:num = a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fstp dword [float_var_2]  ; store sum as num (float)
; let diff:num = a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fstp dword [float_var_3]  ; store diff as num (float)
; let prod:num = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_4]  ; store prod as num (float)
; let quot:num = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_5]  ; store quot as num (float)
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    fld dword [float_var_2]  ; load sum
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    fld dword [float_var_3]  ; load diff
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    fld dword [float_var_4]  ; load prod
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    fld dword [float_var_5]  ; load quot
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    pop ebp
    ret
