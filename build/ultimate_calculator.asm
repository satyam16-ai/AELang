; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Fixed: -nan bug and memory optimization",0
msg_1 db "Enter 4 numbers: 2 integers, 2 floats",0
msg_2 db "",0
msg_3 db "Your numbers:",0
msg_4 db "Integers: ",0
msg_5 db ", ",0
msg_6 db "Floats: ",0
msg_7 db "INTEGER RESULTS:",0
msg_8 db "Add: ",0
msg_9 db "Sub: ",0
msg_10 db "Mul: ",0
msg_11 db "Div: ",0
msg_12 db "FLOAT RESULTS:",0
msg_13 db "POWER OPERATIONS:",0
msg_14 db "Int1 squared: ",0
msg_15 db "Float1 squared: ",0
msg_16 db "Success: All operations completed!",0
msg_17 db "✓ No -nan bugs",0
msg_18 db "✓ Memory efficient",0
msg_19 db "✓ Type safe",0
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
; let int1:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store int1
; let int2:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store int2
; let float1:f32 = read_float()
    call read_float
    fstp dword [float_var_0]  ; store float1
; let float2:f32 = read_float()
    call read_float
    fstp dword [float_var_1]  ; store float2
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    call print_int
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load int2
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    fld dword [float_var_1]  ; load float2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_2
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_1]  ; load int2
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print
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
    push msg_10
    call print
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
    push msg_11
    call print
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
    push msg_2
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    faddp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_9
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fsubp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fmulp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_11
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_1]  ; load float2
    fdivp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_2
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load int1
    push eax
    mov eax, [int_var_0]  ; load int1
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_15
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float1
    fld dword [float_var_0]  ; load float1
    fmulp
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    pop ebp
    ret
