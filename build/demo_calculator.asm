; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Showcasing int and float arithmetic",0
msg_1 db "",0
msg_2 db "INTEGER DEMO:",0
msg_3 db "Enter two integers for calculation:",0
msg_4 db "Results:",0
msg_5 db " + ",0
msg_6 db " = ",0
msg_7 db " × ",0
msg_8 db "FLOAT DEMO:",0
msg_9 db "Enter two floats for calculation:",0
msg_10 db " ÷ ",0
msg_11 db "ÆLang handles both integers and floats!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; x
    float_var_1: resd 1  ; y
    float_var_2: resd 1  ; float_sum
    float_var_3: resd 1  ; quotient
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; sum
    int_var_3: resd 1  ; product

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
; Unhandled node type UNKNOWN
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
    push msg_4
    call print
    add esp, 4
; let sum:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store sum
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load sum
    push eax
    call print_int
    add esp, 4
; let product:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_3], eax  ; store product
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_7
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load product
    push eax
    call print_int
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let x:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store x
; let y:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store y
    push msg_4
    call print
    add esp, 4
; let float_sum:f32 = x + y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    faddp
    fstp dword [float_var_2]  ; store float_sum
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_2]  ; load float_sum
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let quotient:f32 = x / y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fdivp
    fstp dword [float_var_3]  ; store quotient
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_3]  ; load quotient
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_1
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
