; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Memory Stress Test ===",0
msg_1 db "Testing variable allocation limits",0
msg_2 db "",0
msg_3 db "Integer sums:",0
msg_4 db "Float sums:",0
msg_5 db "Memory allocation test completed!",0
float_0: dd 0x3f8ccccd  ; 1.10000002
float_1: dd 0x400ccccd  ; 2.20000005
float_2: dd 0x40533333  ; 3.29999995
float_3: dd 0x408ccccd  ; 4.4000001
float_4: dd 0x40b00000  ; 5.5
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; b1
    float_var_1: resd 1  ; b2
    float_var_2: resd 1  ; b3
    float_var_3: resd 1  ; b4
    float_var_4: resd 1  ; b5
    float_var_5: resd 1  ; fsum1
    float_var_6: resd 1  ; fsum2
    int_var_0: resd 1  ; a1
    int_var_1: resd 1  ; a2
    int_var_2: resd 1  ; a3
    int_var_3: resd 1  ; a4
    int_var_4: resd 1  ; a5
    int_var_5: resd 1  ; a6
    int_var_6: resd 1  ; a7
    int_var_7: resd 1  ; a8
    int_var_8: resd 1  ; a9
    int_var_9: resd 1  ; a10
    int_var_10: resd 1  ; sum1
    int_var_11: resd 1  ; sum2
    int_var_12: resd 1  ; sum3

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
extern print_float
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
; let a1:i32 = 1
    mov eax, 1
    mov [int_var_0], eax  ; store a1
; let a2:i32 = 2
    mov eax, 2
    mov [int_var_1], eax  ; store a2
; let a3:i32 = 3
    mov eax, 3
    mov [int_var_2], eax  ; store a3
; let a4:i32 = 4
    mov eax, 4
    mov [int_var_3], eax  ; store a4
; let a5:i32 = 5
    mov eax, 5
    mov [int_var_4], eax  ; store a5
; let a6:i32 = 6
    mov eax, 6
    mov [int_var_5], eax  ; store a6
; let a7:i32 = 7
    mov eax, 7
    mov [int_var_6], eax  ; store a7
; let a8:i32 = 8
    mov eax, 8
    mov [int_var_7], eax  ; store a8
; let a9:i32 = 9
    mov eax, 9
    mov [int_var_8], eax  ; store a9
; let a10:i32 = 10
    mov eax, 10
    mov [int_var_9], eax  ; store a10
; let b1:f32 = 1.100000
    fld dword [float_0]
    fstp dword [float_var_0]  ; store b1
; let b2:f32 = 2.200000
    fld dword [float_1]
    fstp dword [float_var_1]  ; store b2
; let b3:f32 = 3.300000
    fld dword [float_2]
    fstp dword [float_var_2]  ; store b3
; let b4:f32 = 4.400000
    fld dword [float_3]
    fstp dword [float_var_3]  ; store b4
; let b5:f32 = 5.500000
    fld dword [float_4]
    fstp dword [float_var_4]  ; store b5
; let sum1:i32 = a1 + a2 + a3
    mov eax, [int_var_0]  ; load a1
    push eax
    mov eax, [int_var_1]  ; load a2
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_2]  ; load a3
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_10], eax  ; store sum1
; let sum2:i32 = a4 + a5 + a6
    mov eax, [int_var_3]  ; load a4
    push eax
    mov eax, [int_var_4]  ; load a5
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_5]  ; load a6
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_11], eax  ; store sum2
; let sum3:i32 = a7 + a8 + a9 + a10
    mov eax, [int_var_6]  ; load a7
    push eax
    mov eax, [int_var_7]  ; load a8
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_8]  ; load a9
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_9]  ; load a10
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_12], eax  ; store sum3
; let fsum1:f32 = b1 + b2
    fld dword [float_var_0]  ; load b1
    fld dword [float_var_1]  ; load b2
    faddp
    fstp dword [float_var_5]  ; store fsum1
; let fsum2:f32 = b3 + b4 + b5
    fld dword [float_var_2]  ; load b3
    fld dword [float_var_3]  ; load b4
    faddp
    fld dword [float_var_4]  ; load b5
    faddp
    fstp dword [float_var_6]  ; store fsum2
    push msg_3
    call print
    add esp, 4
    mov eax, [int_var_10]  ; load sum1
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_11]  ; load sum2
    push eax
    call print_int
    add esp, 4
    mov eax, [int_var_12]  ; load sum3
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
    fld dword [float_var_5]  ; load fsum1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    fld dword [float_var_6]  ; load fsum2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_5
    call print
    add esp, 4
    pop ebp
    ret
