; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "",0
msg_1 db "=== FIRST NUMBER ===",0
msg_2 db "Enter as integer: ",0
msg_3 db "Enter same number as float: ",0
msg_4 db "=== SECOND NUMBER ===",0
msg_5 db "=== YOUR NUMBERS ===",0
msg_6 db "First number  - Int: ",0
msg_7 db " Float: ",0
msg_8 db "Second number - Int: ",0
msg_9 db "=== INTEGER ARITHMETIC ===",0
msg_10 db "Addition: ",0
msg_11 db " + ",0
msg_12 db " = ",0
msg_13 db "Subtraction: ",0
msg_14 db " - ",0
msg_15 db "Multiplication: ",0
msg_16 db " × ",0
msg_17 db "Division: ",0
msg_18 db " ÷ ",0
msg_19 db " (truncated)",0
msg_20 db "=== FLOAT ARITHMETIC ===",0
msg_21 db " (precise)",0
msg_22 db "=== MIXED OPERATIONS ===",0
msg_23 db "Float + Int: ",0
msg_24 db "Int × Float: ",0
msg_25 db "=== POWER OPERATIONS (using multiplication) ===",0
msg_26 db "Integer squared: ",0
msg_27 db "² = ",0
msg_28 db "Float squared: ",0
msg_29 db "=== CALCULATION COMPLETE ===",0
msg_30 db "✓ All arithmetic operations performed",0
msg_31 db "✓ Both integer and float precision",0
msg_32 db "✓ Mixed-type operations supported",0
msg_33 db "✓ Runtime type handling successful!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; num1_float
    float_var_1: resd 1  ; num2_float
    float_var_2: resd 1  ; float_add
    float_var_3: resd 1  ; float_sub
    float_var_4: resd 1  ; float_mul
    float_var_5: resd 1  ; float_div
    float_var_6: resd 1  ; mixed1
    float_var_7: resd 1  ; mixed2
    float_var_8: resd 1  ; float_square
    int_var_0: resd 1  ; num1_int
    int_var_1: resd 1  ; num2_int
    int_var_2: resd 1  ; int_add
    int_var_3: resd 1  ; int_sub
    int_var_4: resd 1  ; int_mul
    int_var_5: resd 1  ; int_div
    int_var_6: resd 1  ; int_square

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
    push msg_2
    call print
    add esp, 4
; let num1_int:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store num1_int
    push msg_3
    call print
    add esp, 4
; let num1_float:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store num1_float
    push msg_4
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
; let num2_int:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store num2_int
    push msg_3
    call print
    add esp, 4
; let num2_float:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store num2_float
    push msg_0
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_7
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_7
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_0
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let int_add:i32 = num1_int + num2_int
    mov eax, [int_var_0]  ; load num1_int
    push eax
    mov eax, [int_var_1]  ; load num2_int
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store int_add
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_11
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load int_add
    push eax
    call print_int
    add esp, 4
; let int_sub:i32 = num1_int - num2_int
    mov eax, [int_var_0]  ; load num1_int
    push eax
    mov eax, [int_var_1]  ; load num2_int
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store int_sub
    push msg_13
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load int_sub
    push eax
    call print_int
    add esp, 4
; let int_mul:i32 = num1_int * num2_int
    mov eax, [int_var_0]  ; load num1_int
    push eax
    mov eax, [int_var_1]  ; load num2_int
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store int_mul
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load int_mul
    push eax
    call print_int
    add esp, 4
; let int_div:i32 = num1_int / num2_int
    mov eax, [int_var_0]  ; load num1_int
    push eax
    mov eax, [int_var_1]  ; load num2_int
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store int_div
    push msg_17
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_18
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load int_div
    push eax
    call print_int
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
; let float_add:f32 = num1_float + num2_float
    fld dword [float_var_0]  ; load num1_float
    fld dword [float_var_1]  ; load num2_float
    faddp
    fstp dword [float_var_2]  ; store float_add
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_11
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_2]  ; load float_add
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_sub:f32 = num1_float - num2_float
    fld dword [float_var_0]  ; load num1_float
    fld dword [float_var_1]  ; load num2_float
    fsubp
    fstp dword [float_var_3]  ; store float_sub
    push msg_13
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_14
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_3]  ; load float_sub
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_mul:f32 = num1_float * num2_float
    fld dword [float_var_0]  ; load num1_float
    fld dword [float_var_1]  ; load num2_float
    fmulp
    fstp dword [float_var_4]  ; store float_mul
    push msg_15
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_16
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_4]  ; load float_mul
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let float_div:f32 = num1_float / num2_float
    fld dword [float_var_0]  ; load num1_float
    fld dword [float_var_1]  ; load num2_float
    fdivp
    fstp dword [float_var_5]  ; store float_div
    push msg_17
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_18
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_5]  ; load float_div
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_21
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
; let mixed1:f32 = num1_float + num2_int
    fld dword [float_var_0]  ; load num1_float
    mov eax, [int_var_1]  ; load num2_int
    faddp
    fstp dword [float_var_6]  ; store mixed1
    push msg_23
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_11
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load num2_int
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_6]  ; load mixed1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let mixed2:f32 = num1_int * num2_float
    mov eax, [int_var_0]  ; load num1_int
    fld dword [float_var_1]  ; load num2_float
    fmulp
    fstp dword [float_var_7]  ; store mixed2
    push msg_24
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    fld dword [float_var_1]  ; load num2_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_12
    call print
    add esp, 4
    fld dword [float_var_7]  ; load mixed2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_0
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
; let int_square:i32 = num1_int * num1_int
    mov eax, [int_var_0]  ; load num1_int
    push eax
    mov eax, [int_var_0]  ; load num1_int
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_6], eax  ; store int_square
    push msg_26
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1_int
    push eax
    call print_int
    add esp, 4
    push msg_27
    call print
    add esp, 4
    mov eax, [int_var_6]  ; load int_square
    push eax
    call print_int
    add esp, 4
; let float_square:f32 = num1_float * num1_float
    fld dword [float_var_0]  ; load num1_float
    fld dword [float_var_0]  ; load num1_float
    fmulp
    fstp dword [float_var_8]  ; store float_square
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_0]  ; load num1_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_27
    call print
    add esp, 4
    fld dword [float_var_8]  ; load float_square
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_0
    call print
    add esp, 4
    push msg_29
    call print
    add esp, 4
    push msg_30
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
    pop ebp
    ret
