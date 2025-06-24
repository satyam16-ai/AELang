; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x00000000  ; 0
float_1: dd 0x3f800000  ; 1
float_2: dd 0x3dcccccd  ; 0.100000001
float_3: dd 0x4479f99a  ; 999.900024
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; zero
    float_var_1: resd 1  ; one
    float_var_2: resd 1  ; small
    float_var_3: resd 1  ; large
    float_var_4: resd 1  ; decimal_add
    float_var_5: resd 1  ; zero_add
    float_var_6: resd 1  ; zero_mul
    float_var_7: resd 1  ; div_result

section .text
    global main
    extern printf

; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let zero:f32 = 0.000000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store zero
; let one:f32 = 1.000000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store one
; let small:f32 = 0.100000
    fld dword [float_2]
    fstp dword [float_var_2]  ; store small
; let large:f32 = 999.900000
    fld dword [float_3]
    fstp dword [float_var_3]  ; store large
; let decimal_add:f32 = small + small
    fld dword [float_var_2]  ; load small
    fld dword [float_var_2]  ; load small
    faddp
    fstp dword [float_var_4]  ; store decimal_add
    fld dword [float_var_4]  ; load decimal_add
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let zero_add:f32 = zero + large
    fld dword [float_var_0]  ; load zero
    fld dword [float_var_3]  ; load large
    faddp
    fstp dword [float_var_5]  ; store zero_add
    fld dword [float_var_5]  ; load zero_add
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let zero_mul:f32 = zero * large
    fld dword [float_var_0]  ; load zero
    fld dword [float_var_3]  ; load large
    fmulp
    fstp dword [float_var_6]  ; store zero_mul
    fld dword [float_var_6]  ; load zero_mul
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let div_result:f32 = one / small
    fld dword [float_var_1]  ; load one
    fld dword [float_var_2]  ; load small
    fdivp
    fstp dword [float_var_7]  ; store div_result
    fld dword [float_var_7]  ; load div_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    pop ebp
    ret
