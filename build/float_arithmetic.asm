; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x41080000  ; 8.5
float_1: dd 0x40200000  ; 2.5
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; add_result
    float_var_3: resd 1  ; sub_result
    float_var_4: resd 1  ; mul_result
    float_var_5: resd 1  ; div_result

section .text
    global main
    extern printf

; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let a:f32 = 8.500000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store a
; let b:f32 = 2.500000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store b
; let add_result:f32 = a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fstp dword [float_var_2]  ; store add_result
    fld dword [float_var_2]  ; load add_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let sub_result:f32 = a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fstp dword [float_var_3]  ; store sub_result
    fld dword [float_var_3]  ; load sub_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let mul_result:f32 = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_4]  ; store mul_result
    fld dword [float_var_4]  ; load mul_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let div_result:f32 = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_5]  ; store div_result
    fld dword [float_var_5]  ; load div_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    pop ebp
    ret
