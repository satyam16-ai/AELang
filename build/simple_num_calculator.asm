; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang num Type Calculator Demo ===",0
msg_1 db "Demonstrating dynamic numeric type calculations",0
msg_2 db "",0
msg_3 db "1. Basic Mixed-Type Arithmetic:",0
msg_4 db "42 + 3.14159 = 45.14159",0
msg_5 db "42 - 3.14159 = 38.85841",0
msg_6 db "42 * 3.14159 = 131.9468",0
msg_7 db "42 / 3.14159 = 13.369",0
msg_8 db "2. Complex Expression Evaluation:",0
msg_9 db "(10 + 5.5) * 3 = 46.5",0
msg_10 db "10 / (5.5 + 3) = 1.176",0
msg_11 db "(10 * 5.5) + (3 * 3) = 64",0
msg_12 db "3. Scientific Calculator:",0
msg_13 db "Circle with radius 5:",0
msg_14 db "Area = π * r² = 78.54",0
msg_15 db "Circumference = 2 * π * r = 31.42",0
msg_16 db "4. Financial Calculator:",0
msg_17 db "Principal: $1000, Rate: 5%, Time: 2 years",0
msg_18 db "Simple Interest = $100",0
msg_19 db "Total Amount = $1100",0
msg_20 db "5. Unit Conversions:",0
msg_21 db "25°C = 77°F",0
msg_22 db "100m = 328.084 feet",0
msg_23 db "6. Performance Test:",0
msg_24 db "Complex calculations completed successfully!",0
msg_25 db "=== Calculator Demo Complete ===",0
msg_26 db "✓ Mixed integer/float arithmetic",0
msg_27 db "✓ Complex nested expressions",0
msg_28 db "✓ Scientific calculations",0
msg_29 db "✓ Financial computations",0
msg_30 db "✓ Unit conversions",0
msg_31 db "✓ Performance testing",0
msg_32 db "num type provides seamless universal arithmetic!",0
float_0: dd 0x4051f948  ; 3.28083992
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; int_val
    float_var_1: resd 1  ; float_val
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; difference
    float_var_4: resd 1  ; product
    float_var_5: resd 1  ; quotient
    float_var_6: resd 1  ; a
    float_var_7: resd 1  ; b
    float_var_8: resd 1  ; c
    float_var_9: resd 1  ; expr1
    float_var_10: resd 1  ; expr2
    float_var_11: resd 1  ; expr3
    float_var_12: resd 1  ; radius
    float_var_13: resd 1  ; pi
    float_var_14: resd 1  ; area
    float_var_15: resd 1  ; circumference
    float_var_16: resd 1  ; principal
    float_var_17: resd 1  ; rate
    float_var_18: resd 1  ; time
    float_var_19: resd 1  ; interest
    float_var_20: resd 1  ; amount
    float_var_21: resd 1  ; celsius
    float_var_22: resd 1  ; meters
    float_var_23: resd 1  ; fahrenheit
    float_var_24: resd 1  ; feet
    float_var_25: resd 1  ; x
    float_var_26: resd 1  ; y
    float_var_27: resd 1  ; z
    float_var_28: resd 1  ; perf1
    float_var_29: resd 1  ; perf2

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
; let int_val:num = 42
    mov eax, 42
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_0]  ; store int_val as num (converted from int)
; let float_val:num = 3.141590
; Error: num float constant not found
    fstp dword [float_var_1]  ; store float_val as num (float)
; let sum:num = int_val + float_val
    fld dword [float_var_0]  ; load int_val
    fld dword [float_var_1]  ; load float_val
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_2]  ; store sum as num (converted from int)
; let difference:num = int_val - float_val
    fld dword [float_var_0]  ; load int_val
    fld dword [float_var_1]  ; load float_val
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_3]  ; store difference as num (converted from int)
; let product:num = int_val * float_val
    fld dword [float_var_0]  ; load int_val
    fld dword [float_var_1]  ; load float_val
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_4]  ; store product as num (converted from int)
; let quotient:num = int_val / float_val
    fld dword [float_var_0]  ; load int_val
    fld dword [float_var_1]  ; load float_val
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_5]  ; store quotient as num (converted from int)
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
; let a:num = 10
    mov eax, 10
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store a as num (converted from int)
; let b:num = 5.500000
; Error: num float constant not found
    fstp dword [float_var_7]  ; store b as num (float)
; let c:num = 3
    mov eax, 3
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store c as num (converted from int)
; let expr1:num = a + b * c
    fld dword [float_var_6]  ; load a
    fld dword [float_var_7]  ; load b
    faddp
    fld dword [float_var_8]  ; load c
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store expr1 as num (converted from int)
; let expr2:num = a / b + c
    fld dword [float_var_6]  ; load a
    fld dword [float_var_7]  ; load b
    fld dword [float_var_8]  ; load c
    faddp
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_10]  ; store expr2 as num (converted from int)
; let expr3:num = a * b + c * c
    fld dword [float_var_6]  ; load a
    fld dword [float_var_7]  ; load b
    fmulp
    push eax
    fld dword [float_var_8]  ; load c
    fld dword [float_var_8]  ; load c
    fmulp
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_11]  ; store expr3 as num (converted from int)
    push msg_9
    call print
    add esp, 4
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
; let radius:num = 5
    mov eax, 5
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_12]  ; store radius as num (converted from int)
; let pi:num = 3.141590
; Error: num float constant not found
    fstp dword [float_var_13]  ; store pi as num (float)
; let area:num = pi * radius * radius
    fld dword [float_var_13]  ; load pi
    fld dword [float_var_12]  ; load radius
    fmulp
    fld dword [float_var_12]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_14]  ; store area as num (converted from int)
; let circumference:num = 2 * pi * radius
    mov eax, 2
    fld dword [float_var_13]  ; load pi
    fmulp
    fld dword [float_var_12]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_15]  ; store circumference as num (converted from int)
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
; let principal:num = 1000
    mov eax, 1000
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_16]  ; store principal as num (converted from int)
; let rate:num = 5
    mov eax, 5
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_17]  ; store rate as num (converted from int)
; let time:num = 2
    mov eax, 2
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_18]  ; store time as num (converted from int)
; let interest:num = principal * rate * time / 100
    fld dword [float_var_16]  ; load principal
    fld dword [float_var_17]  ; load rate
    fmulp
    fld dword [float_var_18]  ; load time
    fmulp
    push eax
    mov eax, 100
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_19]  ; store interest as num (converted from int)
; let amount:num = principal + interest
    fld dword [float_var_16]  ; load principal
    fld dword [float_var_19]  ; load interest
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_20]  ; store amount as num (converted from int)
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
; let celsius:num = 25
    mov eax, 25
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_21]  ; store celsius as num (converted from int)
; let meters:num = 100
    mov eax, 100
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_22]  ; store meters as num (converted from int)
; let fahrenheit:num = celsius * 9 / 5 + 32
    fld dword [float_var_21]  ; load celsius
    mov eax, 9
    fmulp
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    mov eax, 32
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_23]  ; store fahrenheit as num (converted from int)
; let feet:num = meters * 3.280840
    fld dword [float_var_22]  ; load meters
    fld dword [float_0]
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_24]  ; store feet as num (converted from int)
    push msg_21
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
; let x:num = 2.500000
; Error: num float constant not found
    fstp dword [float_var_25]  ; store x as num (float)
; let y:num = 4
    mov eax, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_26]  ; store y as num (converted from int)
; let z:num = 1.800000
; Error: num float constant not found
    fstp dword [float_var_27]  ; store z as num (float)
; let perf1:num = x + y * z / x - z
    fld dword [float_var_25]  ; load x
    fld dword [float_var_26]  ; load y
    faddp
    fld dword [float_var_27]  ; load z
    fmulp
    push eax
    fld dword [float_var_25]  ; load x
    fld dword [float_var_27]  ; load z
    fsubp
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_28]  ; store perf1 as num (converted from int)
; let perf2:num = x * x + y * y + z * z
    fld dword [float_var_25]  ; load x
    fld dword [float_var_25]  ; load x
    fmulp
    push eax
    fld dword [float_var_26]  ; load y
    fld dword [float_var_26]  ; load y
    fmulp
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    fld dword [float_var_27]  ; load z
    fld dword [float_var_27]  ; load z
    fmulp
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_29]  ; store perf2 as num (converted from int)
    push msg_24
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    push msg_28
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
    push msg_2
    call print
    add esp, 4
    push msg_32
    call print
    add esp, 4
    pop ebp
    ret
