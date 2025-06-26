; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Arithmetic Calculator ===",0
msg_1 db "Enter first number: ",0
msg_2 db "Enter second number: ",0
msg_3 db "Your numbers are:",0
msg_4 db "First: ",0
msg_5 db "Second: ",0
msg_6 db "--- Results ---",0
msg_7 db "Addition (a + b): ",0
msg_8 db "Subtraction (a - b): ",0
msg_9 db "Multiplication (a * b): ",0
msg_10 db "Division (a / b): ",0
msg_11 db "=== Calculation Complete! ===",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; sum
    int_var_3: resd 1  ; diff
    int_var_4: resd 1  ; product
    int_var_5: resd 1  ; quotient

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
extern read_int
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
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
    push msg_2
    call print
    add esp, 4
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
; let sum:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store sum
    push msg_7
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load sum
    push eax
    call print_int
    add esp, 4
; let diff:i32 = a - b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store diff
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load diff
    push eax
    call print_int
    add esp, 4
; let product:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store product
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load product
    push eax
    call print_int
    add esp, 4
; let quotient:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store quotient
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load quotient
    push eax
    call print_int
    add esp, 4
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
