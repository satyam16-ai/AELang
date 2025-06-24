; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x40f00000  ; 7.5
float_1: dd 0x40000000  ; 2
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; float_a
    float_var_1: resd 1  ; float_b
    float_var_2: resd 1  ; float_complex
    int_var_0: resd 1  ; int_a
    int_var_1: resd 1  ; int_b
    int_var_2: resd 1  ; int_complex
    int_var_3: resd 1  ; x
    int_var_4: resd 1  ; y
    int_var_5: resd 1  ; remainder_test

section .text
    global main
    extern printf

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let int_a:i32 = 15
    mov eax, 15
    mov [int_var_0], eax  ; store int_a
; let int_b:i32 = 3
    mov eax, 3
    mov [int_var_1], eax  ; store int_b
; let float_a:f32 = 7.500000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store float_a
; let float_b:f32 = 2.000000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store float_b
; let int_complex:i32 = int_a + int_b * int_b - int_a / int_b
    mov eax, [int_var_0]  ; load int_a
    push eax
    mov eax, [int_var_1]  ; load int_b
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_1]  ; load int_b
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, [int_var_0]  ; load int_a
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    mov eax, [int_var_1]  ; load int_b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_2], eax  ; store int_complex
    mov eax, [int_var_2]  ; load int_complex
    push eax
    call print_int
    add esp, 4
; let float_complex:f32 = float_a * float_b + float_a - float_b
    fld dword [float_var_0]  ; load float_a
    fld dword [float_var_1]  ; load float_b
    fmulp
    fld dword [float_var_0]  ; load float_a
    faddp
    fld dword [float_var_1]  ; load float_b
    fsubp
    fstp dword [float_var_2]  ; store float_complex
    fld dword [float_var_2]  ; load float_complex
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let x:i32 = 100
    mov eax, 100
    mov [int_var_3], eax  ; store x
; let y:i32 = 7
    mov eax, 7
    mov [int_var_4], eax  ; store y
; let remainder_test:i32 = x - y * 14
    mov eax, [int_var_3]  ; load x
    push eax
    mov eax, [int_var_4]  ; load y
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    mov eax, 14
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_5], eax  ; store remainder_test
    mov eax, [int_var_5]  ; load remainder_test
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
