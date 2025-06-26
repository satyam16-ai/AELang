; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== COMPARISON DEBUG ===",0
msg_1 db "Testing direct comparison:",0
msg_2 db " >= ",0
msg_3 db " = ",0
msg_4 db "",0
msg_5 db "Testing in if statement:",0
msg_6 db "TRUE: x >= y",0
msg_7 db "FALSE: x < y",0
msg_8 db "Testing literal comparison:",0
msg_9 db "TRUE: x >= 90",0
msg_10 db "FALSE: x < 90",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; x
    int_var_1: resd 1  ; y
    int_var_2: resd 1  ; result

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
extern print_bool
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let x:i32 = 95
    mov eax, 95
    mov [int_var_0], eax  ; store x
; let y:i32 = 90
    mov eax, 90
    mov [int_var_1], eax  ; store y
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load x
    push eax
    call print_int
    add esp, 4
    push msg_2
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load y
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let result:bool = x >= y
    mov eax, [int_var_0]  ; load x
    push eax
    mov eax, [int_var_1]  ; load y
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_2], eax  ; store result (bool)
    mov eax, [int_var_2]  ; load result
    push eax
    call print_bool
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_1]  ; load y
    cmp eax, 0
    je .else_0
.then_0:
    push msg_6
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_7
    call print
    add esp, 4
.end_if_0:
; end if statement 0
    push msg_4
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
; if statement 1
    mov eax, 90
    cmp eax, 0
    je .else_1
.then_1:
    push msg_9
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_10
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    pop ebp
    ret
