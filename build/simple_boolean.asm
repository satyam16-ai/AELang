; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Boolean Type Demo ===",0
msg_1 db "",0
msg_2 db "Basic Boolean Values:",0
msg_3 db "flag1 = ",0
msg_4 db "flag2 = ",0
msg_5 db "Numeric Representation:",0
msg_6 db "flag1 (numeric) = ",0
msg_7 db "flag2 (numeric) = ",0
msg_8 db "Boolean Arithmetic:",0
msg_9 db "true + false = ",0
msg_10 db "true * false = ",0
msg_11 db "true - false = ",0
msg_12 db "=== Boolean Test Complete! ===",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; flag1
    int_var_1: resd 1  ; flag2
    int_var_2: resd 1  ; result1
    int_var_3: resd 1  ; result2
    int_var_4: resd 1  ; result3

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
extern print_clean
extern print_bool
extern print_bool_numeric
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
; let flag1:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store flag1 (bool)
; let flag2:bool = 0
    mov eax, 0
    mov [int_var_1], eax  ; store flag2 (bool)
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load flag1
    push eax
    call print_bool
    add esp, 4
    push msg_4
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load flag2
    push eax
    call print_bool
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load flag1
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_7
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load flag2
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let result1:bool = flag1 + flag2
    mov eax, [int_var_0]  ; load flag1
    push eax
    mov eax, [int_var_1]  ; load flag2
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store result1 (bool)
; let result2:bool = flag1 * flag2
    mov eax, [int_var_0]  ; load flag1
    push eax
    mov eax, [int_var_1]  ; load flag2
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_3], eax  ; store result2 (bool)
; let result3:bool = flag1 - flag2
    mov eax, [int_var_0]  ; load flag1
    push eax
    mov eax, [int_var_1]  ; load flag2
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_4], eax  ; store result3 (bool)
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print_clean
    add esp, 4
    mov eax, [int_var_2]  ; load result1
    push eax
    call print_bool
    add esp, 4
    push msg_10
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load result2
    push eax
    call print_bool
    add esp, 4
    push msg_11
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load result3
    push eax
    call print_bool
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    pop ebp
    ret
