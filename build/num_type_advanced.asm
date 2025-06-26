; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang num Type: Advanced Demo ===",0
msg_1 db "Demonstrating dynamic int/float number type",0
msg_2 db "",0
msg_3 db "Demo 1: Integer storage",0
msg_4 db "int_value: num = 100",0
msg_5 db "another_int: num = 25",0
msg_6 db "Demo 2: Float storage",0
msg_7 db "float_value: num = 3.14159",0
msg_8 db "precision: num = 2.5",0
msg_9 db "Demo 3: Mixed arithmetic",0
msg_10 db "100 + 25 = mixed_sum",0
msg_11 db "3.14159 * 2.5 = mixed_product",0
msg_12 db "Demo 4: Complex expressions",0
msg_13 db "(100 + 3.14159) / 2.5 = complex_result",0
msg_14 db "Demo 5: Nested expressions",0
msg_15 db "((100 + 25) * 2.5) + 3.14159 = nested",0
msg_16 db "=== num Type Benefits ===",0
msg_17 db "✓ Single type for both integers and floats",0
msg_18 db "✓ Automatic type handling in expressions",0
msg_19 db "✓ Simplified variable declarations",0
msg_20 db "✓ Maintains precision for floating-point values",0
msg_21 db "✓ Seamless arithmetic operations",0
msg_22 db "ÆLang num type implementation: SUCCESS!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; int_value
    float_var_1: resd 1  ; another_int
    float_var_2: resd 1  ; float_value
    float_var_3: resd 1  ; precision
    float_var_4: resd 1  ; mixed_sum
    float_var_5: resd 1  ; mixed_product
    float_var_6: resd 1  ; complex_result
    float_var_7: resd 1  ; nested

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
; let int_value:num = 100
    fstp dword [float_var_0]  ; store int_value as num
; let another_int:num = 25
    fstp dword [float_var_1]  ; store another_int as num
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
; let float_value:num = 3.141590
    fstp dword [float_var_2]  ; store float_value as num
; let precision:num = 2.500000
    fstp dword [float_var_3]  ; store precision as num
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let mixed_sum:num = int_value + another_int
    fld dword [float_var_0]  ; load int_value
    fld dword [float_var_1]  ; load another_int
    faddp
    fstp dword [float_var_4]  ; store mixed_sum as num
; let mixed_product:num = float_value * precision
    fld dword [float_var_2]  ; load float_value
    fld dword [float_var_3]  ; load precision
    fmulp
    fstp dword [float_var_5]  ; store mixed_product as num
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
; let complex_result:num = int_value + float_value / precision
    fld dword [float_var_0]  ; load int_value
    fld dword [float_var_2]  ; load float_value
    faddp
    fld dword [float_var_3]  ; load precision
    fdivp
    fstp dword [float_var_6]  ; store complex_result as num
    push msg_13
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
; let nested:num = int_value + another_int * precision + float_value
    fld dword [float_var_0]  ; load int_value
    fld dword [float_var_1]  ; load another_int
    faddp
    fld dword [float_var_3]  ; load precision
    fmulp
    fld dword [float_var_2]  ; load float_value
    faddp
    fstp dword [float_var_7]  ; store nested as num
    push msg_15
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
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
    push msg_20
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    pop ebp
    ret
