; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "ÆLang Memory-Optimized Calculator",0
msg_1 db "Enter numbers for calculation:",0
msg_2 db "",0
msg_3 db "Results:",0
msg_4 db "Int: ",0
msg_5 db " ",0
msg_6 db "Float: ",0
msg_7 db "Complete!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; x
    float_var_1: resd 1  ; y
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
extern print_float
extern read_int
extern read_float
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
; let x:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store x
; let y:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store y
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    faddp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fsubp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fmulp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fdivp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_7
    call print
    add esp, 4
    pop ebp
    ret
