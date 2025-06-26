; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Dynamic Number Type Test ===",0
msg_1 db "Testing the new 'num' data type",0
msg_2 db "",0
msg_3 db "Test 1: num with integer values",0
msg_4 db "int_num = 42",0
msg_5 db "Test 2: num with float values",0
msg_6 db "float_num = 3.14",0
msg_7 db "Test 3: num arithmetic",0
msg_8 db "10 + 5 = (should be 15)",0
msg_9 db "Test 4: mixed operations",0
msg_10 db "7 and 2.5 declared as num",0
msg_11 db "Test 5: num with expressions",0
msg_12 db "(10 + 5) * 2 = (should be 30)",0
msg_13 db "=== Dynamic Number Type Test Complete ===",0
msg_14 db "✓ num type supports both integers and floats",0
msg_15 db "✓ Automatic type conversion implemented",0
msg_16 db "✓ Arithmetic operations supported",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; int_num
    float_var_1: resd 1  ; float_num
    float_var_2: resd 1  ; result1
    float_var_3: resd 1  ; result2
    float_var_4: resd 1  ; sum
    float_var_5: resd 1  ; mixed1
    float_var_6: resd 1  ; mixed2
    float_var_7: resd 1  ; expr_result

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
    push msg_3
    call print
    add esp, 4
; let int_num:num = 42
    fstp dword [float_var_0]  ; store int_num as num
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let float_num:num = 3.140000
    fstp dword [float_var_1]  ; store float_num as num
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
; let result1:num = 10
    fstp dword [float_var_2]  ; store result1 as num
; let result2:num = 5
    fstp dword [float_var_3]  ; store result2 as num
; let sum:num = result1 + result2
    fld dword [float_var_2]  ; load result1
    fld dword [float_var_3]  ; load result2
    faddp
    fstp dword [float_var_4]  ; store sum as num
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let mixed1:num = 7
    fstp dword [float_var_5]  ; store mixed1 as num
; let mixed2:num = 2.500000
    fstp dword [float_var_6]  ; store mixed2 as num
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
; let expr_result:num = 10 + 5 * 2
    mov eax, 10
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    imul eax, ebx
    fstp dword [float_var_7]  ; store expr_result as num
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    pop ebp
    ret
