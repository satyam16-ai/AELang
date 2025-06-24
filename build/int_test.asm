; Generated NASM by ÆLang Compiler
section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; sum
    int_var_3: resd 1  ; diff

section .text
    global main
    extern printf

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:i32 = 10
    mov eax, 10
    mov [int_var_0], eax  ; store a
; let b:i32 = 3
    mov eax, 3
    mov [int_var_1], eax  ; store b
; let sum:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store sum
; let diff:i32 = a - b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store diff
    mov eax, [int_var_2]  ; load sum
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_3]  ; load diff
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
