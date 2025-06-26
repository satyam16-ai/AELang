; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== NUM INPUT TEST ===",0
msg_1 db "Enter first number: ",0
msg_2 db "Enter second number: ",0
msg_3 db "",0
msg_4 db "Your numbers:",0
msg_5 db "First number: ",0
msg_6 db "Second number: ",0
msg_7 db "Calculations:",0
msg_8 db "Sum: ",0
msg_9 db "Product: ",0
msg_10 db "✓ Successfully read and processed num type inputs!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; num1
    float_var_1: resd 1  ; num2
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; product

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num

extern print
extern print_float
extern read_num
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
; let num1:num = read_num()
    call read_num
    fstp dword [float_var_0]  ; store num1 as num (float)
    push msg_2
    call print
    add esp, 4
; let num2:num = read_num()
    call read_num
    fstp dword [float_var_1]  ; store num2 as num (float)
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
; let sum:num = num1 + num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_2]  ; store sum as num (converted from int)
; let product:num = num1 * num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_3]  ; store product as num (converted from int)
    push msg_8
    call print
    add esp, 4
    fld dword [float_var_2]  ; load sum
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_9
    call print
    add esp, 4
    fld dword [float_var_3]  ; load product
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
    pop ebp
    ret
