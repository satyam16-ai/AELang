; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Testing simple parsing",0
msg_1 db "Variables declared",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; c

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let a:i32 = 1
    mov eax, 1
    mov [int_var_0], eax  ; store a
; let b:i32 = 2
    mov eax, 2
    mov [int_var_1], eax  ; store b
; let c:i32 = 3
    mov eax, 3
    mov [int_var_2], eax  ; store c
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_2]  ; load c
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
