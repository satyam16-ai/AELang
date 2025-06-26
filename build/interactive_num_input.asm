; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Interactive Num Calculator ===",0
msg_1 db "Demonstrating direct input to 'num' type variables",0
msg_2 db "",0
msg_3 db "Enter first number (integer or decimal): ",0
msg_4 db "Enter second number (integer or decimal): ",0
msg_5 db "=== CALCULATIONS WITH YOUR INPUT ===",0
msg_6 db "Addition: Your inputs added together",0
msg_7 db "Subtraction: First number minus second number",0
msg_8 db "Multiplication: Your inputs multiplied together",0
msg_9 db "Division: First number divided by second number",0
msg_10 db "=== MIXED ARITHMETIC DEMO ===",0
msg_11 db "Mixed operations completed successfully!",0
msg_12 db "✓ User input values stored in num variables",0
msg_13 db "✓ Arithmetic operations performed",0
msg_14 db "✓ Mixed integer/float calculations",0
msg_15 db "✓ Complex expressions evaluated",0
msg_16 db "=== INTERACTIVE NUM CALCULATOR COMPLETE ===",0
msg_17 db "Your input has been successfully processed with the num type!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; num1
    float_var_1: resd 1  ; num2
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; diff
    float_var_4: resd 1  ; prod
    float_var_5: resd 1  ; quot
    float_var_6: resd 1  ; fixed_int
    float_var_7: resd 1  ; fixed_float
    float_var_8: resd 1  ; mixed1
    float_var_9: resd 1  ; mixed2
    float_var_10: resd 1  ; complex

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num

extern print
extern print_int
extern print_float
extern read_num
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
; let num1:num = read_num()
    call read_num
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_0]  ; store num1 as num (converted from int)
    push msg_4
    call print
    add esp, 4
; let num2:num = read_num()
    call read_num
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_1]  ; store num2 as num (converted from int)
    push msg_2
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let sum:num = num1 + num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_2]  ; store sum as num (converted from int)
; let diff:num = num1 - num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_3]  ; store diff as num (converted from int)
; let prod:num = num1 * num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_4]  ; store prod as num (converted from int)
; let quot:num = num1 / num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_5]  ; store quot as num (converted from int)
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
; let fixed_int:num = 42
    mov eax, 42
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store fixed_int as num (converted from int)
; let fixed_float:num = 3.141590
; Error: num float constant not found
    fstp dword [float_var_7]  ; store fixed_float as num (float)
; let mixed1:num = num1 + fixed_int
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_6]  ; load fixed_int
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store mixed1 as num (converted from int)
; let mixed2:num = num2 * fixed_float
    fld dword [float_var_1]  ; load num2
    fld dword [float_var_7]  ; load fixed_float
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store mixed2 as num (converted from int)
; let complex:num = num1 + num2 / fixed_int + fixed_float
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    faddp
    push eax
    fld dword [float_var_6]  ; load fixed_int
    fld dword [float_var_7]  ; load fixed_float
    faddp
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_10]  ; store complex as num (converted from int)
    push msg_11
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
    pop ebp
    ret
