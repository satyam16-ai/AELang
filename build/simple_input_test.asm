; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Enter a number: ",0
msg_1 db "You entered: ",0
msg_2 db "Doubled: ",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; doubled

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
extern read_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
; let doubled:i32 = a * 2
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_1], eax  ; store doubled
    push msg_2
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load doubled
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
