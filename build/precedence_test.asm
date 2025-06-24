; Generated NASM by ÆLang Compiler
section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; mul
    int_var_3: resd 1  ; div
    int_var_4: resd 1  ; step1
    int_var_5: resd 1  ; final

section .text
    global main
    extern printf

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:i32 = 15
    mov eax, 15
    mov [int_var_0], eax  ; store a
; let b:i32 = 3
    mov eax, 3
    mov [int_var_1], eax  ; store b
; let mul:i32 = b * b
    mov eax, [int_var_1]  ; load b
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_2], eax  ; store mul
    mov eax, [int_var_2]  ; load mul
    push eax
    call print_int
    add esp, 4
; let div:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_3], eax  ; store div
    mov eax, [int_var_3]  ; load div
    push eax
    call print_int
    add esp, 4
; let step1:i32 = a + mul
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load mul
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_4], eax  ; store step1
    mov eax, [int_var_4]  ; load step1
    push eax
    call print_int
    add esp, 4
; let final:i32 = step1 - div
    mov eax, [int_var_4]  ; load step1
    push eax
    mov eax, [int_var_3]  ; load div
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_5], eax  ; store final
    mov eax, [int_var_5]  ; load final
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
