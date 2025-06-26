; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "x = 1, y = 2",0
msg_1 db "Testing x > y (should be false):",0
msg_2 db "TRUE: x > y (WRONG - this should not print)",0
msg_3 db "FALSE: x <= y (CORRECT - this should print)",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; x
    int_var_1: resd 1  ; y

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
; let x:i32 = 1
    mov eax, 1
    mov [int_var_0], eax  ; store x
; let y:i32 = 2
    mov eax, 2
    mov [int_var_1], eax  ; store y
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_0]  ; load x
    push eax
    mov eax, [int_var_1]  ; load y
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_2
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_3
    call print
    add esp, 4
.end_if_0:
; end if statement 0
    pop ebp
    ret
