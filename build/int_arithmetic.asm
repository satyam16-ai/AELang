; Generated NASM by ÆLang Compiler
section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; add_result
    int_var_3: resd 1  ; sub_result
    int_var_4: resd 1  ; mul_result
    int_var_5: resd 1  ; div_result

section .text
    global main
    extern printf

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:i32 = 20
    mov eax, 20
    mov [int_var_0], eax  ; store a
; let b:i32 = 4
    mov eax, 4
    mov [int_var_1], eax  ; store b
; let add_result:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store add_result
    mov eax, [int_var_2]  ; load add_result
    push eax
    call print_int
    add esp, 4
; let sub_result:i32 = a - b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store sub_result
    mov eax, [int_var_3]  ; load sub_result
    push eax
    call print_int
    add esp, 4
; let mul_result:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store mul_result
    mov eax, [int_var_4]  ; load mul_result
    push eax
    call print_int
    add esp, 4
; let div_result:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store div_result
    mov eax, [int_var_5]  ; load div_result
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
