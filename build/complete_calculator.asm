; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== INTEGER ARITHMETIC ===",0
msg_1 db "Enter first integer: ",0
msg_2 db "Enter second integer: ",0
msg_3 db "",0
msg_4 db "Your integers:",0
msg_5 db "First: ",0
msg_6 db "Second: ",0
msg_7 db "Integer Results:",0
msg_8 db "Addition: ",0
msg_9 db " + ",0
msg_10 db " = ",0
msg_11 db "Subtraction: ",0
msg_12 db " - ",0
msg_13 db "Multiplication: ",0
msg_14 db " × ",0
msg_15 db "Division: ",0
msg_16 db " ÷ ",0
msg_17 db "=== FLOAT ARITHMETIC ===",0
msg_18 db "Enter first float: ",0
msg_19 db "Enter second float: ",0
msg_20 db "Your floats:",0
msg_21 db "Float Results:",0
msg_22 db "=== PRECISION COMPARISON ===",0
msg_23 db "Demonstrating integer vs float precision:",0
msg_24 db "Integer division (truncated): ",0
msg_25 db "Float division (precise): ",0
msg_26 db "=== ADVANCED OPERATIONS ===",0
msg_27 db "Complex integer (a*2+b): ",0
msg_28 db "Complex float (x*2.5+y): ",0
msg_29 db "Large integer (a*1000): ",0
msg_30 db "Small float (x*0.001): ",0
msg_31 db "=== CALCULATOR TEST COMPLETE! ===",0
msg_32 db "✓ Integer arithmetic tested",0
msg_33 db "✓ Float arithmetic tested",0
msg_34 db "✓ Precision comparison demonstrated",0
msg_35 db "✓ Complex expressions tested",0
msg_36 db "ÆLang successfully handles both types!",0
float_0: dd 0x40200000  ; 2.5
float_1: dd 0x3a83126f  ; 0.00100000005
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; x
    float_var_1: resd 1  ; y
    float_var_2: resd 1  ; float_sum
    float_var_3: resd 1  ; float_diff
    float_var_4: resd 1  ; float_product
    float_var_5: resd 1  ; float_quotient
    float_var_6: resd 1  ; complex_float
    float_var_7: resd 1  ; precise_float
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; int_sum
    int_var_3: resd 1  ; int_diff
    int_var_4: resd 1  ; int_product
    int_var_5: resd 1  ; int_quotient
    int_var_6: resd 1  ; complex_int
    int_var_7: resd 1  ; large_int

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
; Unhandled node type UNKNOWN
; Unhandled node type UNKNOWN
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
    push msg_2
    call print
    add esp, 4
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_7
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
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
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
    push msg_11
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load int_diff
    push eax
    call print_int
    add esp, 4
; let int_product:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store int_product
    push msg_13
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load int_product
    push eax
    call print_int
    add esp, 4
; let int_quotient:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store int_quotient
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load int_quotient
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
; let x:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store x
    push msg_19
    call print
    add esp, 4
; let y:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store y
    push msg_3
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
; let float_sum:f32 = x + y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    faddp
    fstp dword [float_var_2]  ; store float_sum
    push msg_8
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_9
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
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
    push msg_11
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_3]  ; load float_diff
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_product:f32 = x * y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fmulp
    fstp dword [float_var_4]  ; store float_product
    push msg_13
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_14
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_4]  ; load float_product
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_quotient:f32 = x / y
    fld dword [float_var_0]  ; load x
    fld dword [float_var_1]  ; load y
    fdivp
    fstp dword [float_var_5]  ; store float_quotient
    push msg_15
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_16
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_5]  ; load float_quotient
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load int_quotient
    push eax
    call print_int
    add esp, 4
    push msg_25
    call print
    add esp, 4
    fld dword [float_var_0]  ; load x
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_16
    call print
    add esp, 4
    fld dword [float_var_1]  ; load y
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_5]  ; load float_quotient
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
; let complex_int:i32 = a * 2 + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_6], eax  ; store complex_int
    push msg_27
    call print
    add esp, 4
    mov eax, [int_var_6]  ; load complex_int
    push eax
    call print_int
    add esp, 4
; let complex_float:f32 = x * 2.500000 + y
    fld dword [float_var_0]  ; load x
    fld dword [float_0]
    fmulp
    fld dword [float_var_1]  ; load y
    faddp
    fstp dword [float_var_6]  ; store complex_float
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_6]  ; load complex_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let large_int:i32 = a * 1000
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, 1000
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_7], eax  ; store large_int
    push msg_29
    call print
    add esp, 4
    mov eax, [int_var_7]  ; load large_int
    push eax
    call print_int
    add esp, 4
; let precise_float:f32 = x * 0.001000
    fld dword [float_var_0]  ; load x
    fld dword [float_1]
    fmulp
    fstp dword [float_var_7]  ; store precise_float
    push msg_30
    call print
    add esp, 4
    fld dword [float_var_7]  ; load precise_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
    push msg_32
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
    push msg_34
    call print
    add esp, 4
    push msg_35
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
    pop ebp
    ret
