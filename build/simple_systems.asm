; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "ÆLang: Systems Programming Ready",0
msg_1 db "Memory page size: ",0
msg_2 db "Stack pointer: ",0
msg_3 db "Type-safe OS development!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; system_val
    int_var_1: resd 1  ; stack_ptr

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
; let system_val:i32 = 1024
    mov eax, 1024
    mov [int_var_0], eax  ; store system_val
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load system_val
    push eax
    call print_int
    add esp, 4
; let stack_ptr:i32 = 65536
    mov eax, 65536
    mov [int_var_1], eax  ; store stack_ptr
    push msg_2
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load stack_ptr
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    pop ebp
    ret
