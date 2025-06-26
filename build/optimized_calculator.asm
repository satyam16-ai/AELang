; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Fixed mixed-type operations and memory optimization",0
msg_1 db "",0
msg_2 db "Enter first number as integer: ",0
msg_3 db "Enter first number as float: ",0
msg_4 db "Enter second number as integer: ",0
msg_5 db "Enter second number as float: ",0
msg_6 db "=== INTEGER OPERATIONS ===",0
msg_7 db "Sum: ",0
msg_8 db "Difference: ",0
msg_9 db "Product: ",0
msg_10 db "Quotient: ",0
msg_11 db "=== FLOAT OPERATIONS ===",0
msg_12 db "=== OPTIMIZED CALCULATOR COMPLETE ===",0
msg_13 db "Memory efficient - no mixed operations",0
msg_14 db "Type safety maintained throughout",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; x
    float_var_1: resd 1  ; y
    float_var_2: resd 1  ; float_sum
    float_var_3: resd 1  ; float_diff
    float_var_4: resd 1  ; float_prod
    float_var_5: resd 1  ; float_quot
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; int_sum
    int_var_3: resd 1  ; int_diff
    int_var_4: resd 1  ; int_prod
    int_var_5: resd 1  ; int_quot

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
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
    push msg_3
    call print
    add esp, 4
; let x:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store x
    push msg_4
    call print
    add esp, 4
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
    push msg_5
    call print
    add esp, 4
; let y:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store y
    push msg_1
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
; let int_sum:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store int_sum
    push msg_7
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load int_sum
    push eax
    call print_int
    add esp, 4
; let int_diff:i32 = a - b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store int_diff
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load int_diff
    push eax
    call print_int
    add esp, 4
; let int_prod:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store int_prod
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load int_prod
    push eax
    call print_int
    add esp, 4
; let int_quot:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store int_quot
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load int_quot
    push eax
    call print_int
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
; let float_sum:f32 = x + y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    faddp
    fstp dword [float_var_2]  ; store float_sum
    push msg_7
    call print
    add esp, 4
    fld dword [float_var_2]  ; load float_sum
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_diff:f32 = x - y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fsubp
    fstp dword [float_var_3]  ; store float_diff
    push msg_8
    call print
    add esp, 4
    fld dword [float_var_3]  ; load float_diff
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_prod:f32 = x * y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fmulp
    fstp dword [float_var_4]  ; store float_prod
    push msg_9
    call print
    add esp, 4
    fld dword [float_var_4]  ; load float_prod
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_quot:f32 = x / y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fdivp
    fstp dword [float_var_5]  ; store float_quot
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_5]  ; load float_quot
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_1
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    pop ebp
    ret
