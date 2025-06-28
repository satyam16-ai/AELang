; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== BOOLEAN TEST ===",0
msg_1 db "Boolean variables created",0
msg_2 db "True condition works",0
msg_3 db "This should not print",0
msg_4 db "False condition works",0
msg_5 db "=== CONSTANT TEST ===",0
msg_6 db "Constants declared",0
msg_7 db "Used constant in variable",0
msg_8 db "=== LOGICAL OPERATORS TEST ===",0
msg_9 db "Tests completed",0
float_0: dd 0x40490fd0  ; 3.14159012
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; PI_VALUE
    int_var_0: resd 1  ; flag
    int_var_1: resd 1  ; negative
    int_var_2: resd 1  ; MAX_VALUE
    int_var_3: resd 1  ; ENABLED
    int_var_4: resd 1  ; test_val

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
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let flag:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store flag (bool)
; let negative:bool = 0
    mov eax, 0
    mov [int_var_1], eax  ; store negative (bool)
    push msg_1
    call print
    add esp, 4
; if statement 0
    mov eax, 1
    cmp eax, 0
    je .else_0
.then_0:
    push msg_2
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, 0
    cmp eax, 0
    je .else_1
.then_1:
    push msg_3
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_4
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_5
    call print
    add esp, 4
; let MAX_VALUE:i32 = 100
    mov eax, 100
    mov [int_var_2], eax  ; store MAX_VALUE
; let PI_VALUE:f32 = 3.141590
    fld dword [float_0]
    fstp dword [float_var_0]  ; store PI_VALUE
; let ENABLED:bool = 1
    mov eax, 1
    mov [int_var_3], eax  ; store ENABLED (bool)
    push msg_6
    call print
    add esp, 4
; let test_val:i32 = MAX_VALUE
    mov eax, [int_var_2]  ; load MAX_VALUE
    mov [int_var_4], eax  ; store test_val
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
    pop ebp
    ret
