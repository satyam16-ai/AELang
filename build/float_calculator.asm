; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Float Calculator ===",0
msg_1 db "Enter first float number: ",0
msg_2 db "Enter second float number: ",0
msg_3 db "Your numbers are:",0
msg_4 db "First: ",0
msg_5 db "Second: ",0
msg_6 db "--- Float Results ---",0
msg_7 db "Addition (x + y): ",0
msg_8 db "Subtraction (x - y): ",0
msg_9 db "Multiplication (x * y): ",0
msg_10 db "Division (x / y): ",0
msg_11 db "=== Float Calculation Complete! ===",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; x
    float_var_1: resd 1  ; y
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; diff
    float_var_4: resd 1  ; product
    float_var_5: resd 1  ; quotient

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

extern read_float
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let x:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store x
    push msg_2
    call print
    add esp, 4
; let y:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store y
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_6
    call print
    add esp, 4
; let sum:f32 = x + y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    faddp
    fstp dword [float_var_2]  ; store sum
    push msg_7
    call print
    add esp, 4
    fld dword [float_var_2]  ; load sum
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let diff:f32 = x - y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fsubp
    fstp dword [float_var_3]  ; store diff
    push msg_8
    call print
    add esp, 4
    fld dword [float_var_3]  ; load diff
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let product:f32 = x * y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fmulp
    fstp dword [float_var_4]  ; store product
    push msg_9
    call print
    add esp, 4
    fld dword [float_var_4]  ; load product
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let quotient:f32 = x / y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fdivp
    fstp dword [float_var_5]  ; store quotient
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
