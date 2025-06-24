; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x40200000  ; 2.5
float_1: dd 0x40400000  ; 3
float_2: dd 0x40000000  ; 2
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; mul
    float_var_3: resd 1  ; div

section .text
    global main
    extern printf

; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:f32 = 2.500000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store a
; let b:f32 = 3.000000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store b
; let mul:f32 = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_2]  ; store mul
; let div:f32 = mul / 2.000000
    fld dword [float_var_2]  ; load mul
    fld dword [float_2]
    fdivp
    fstp dword [float_var_3]  ; store div
    fld dword [float_var_3]  ; load div
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    pop ebp
    ret
