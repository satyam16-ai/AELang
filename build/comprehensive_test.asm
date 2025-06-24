; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x4048f5c3  ; 3.1400001
float_1: dd 0x40000000  ; 2
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; float1
    float_var_1: resd 1  ; float2
    int_var_0: resd 1  ; int1
    int_var_1: resd 1  ; int2

section .text
    global main
    extern printf

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let int1:i32 = 100
    mov eax, 100
    mov [int_var_0], eax  ; store int1
; let int2:i32 = 25
    mov eax, 25
    mov [int_var_1], eax  ; store int2
; let float1:f32 = 3.140000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store float1
; let float2:f32 = 2.000000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store float2
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_1]  ; load int2
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_1]  ; load int2
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_1]  ; load int2
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_1]  ; load int2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    faddp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fsubp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fmulp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fdivp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    pop ebp
    ret
