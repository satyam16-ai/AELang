; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Universal Calculator ===",0
msg_1 db "Powered by the dynamic 'num' data type",0
msg_2 db "No more int vs float confusion!",0
msg_3 db "",0
msg_4 db "Example 1: Mixed Integer/Float Operations",0
msg_5 db "100 + 25.5 = 125.5",0
msg_6 db "100 - 25.5 = 74.5",0
msg_7 db "100 * 25.5 = 2550",0
msg_8 db "100 / 25.5 = 3.92...",0
msg_9 db "Example 2: Circle Area Calculator",0
msg_10 db "Circle with radius 7.5:",0
msg_11 db "Circumference = 2 × π × r = 47.12...",0
msg_12 db "Area = π × r² = 176.71...",0
msg_13 db "Example 3: Loan Calculator",0
msg_14 db "Loan: $5000 at 7.5% for 3 years",0
msg_15 db "Interest = $1125",0
msg_16 db "Total amount = $6125",0
msg_17 db "Example 4: Temperature Converter",0
msg_18 db "30°C converts to:",0
msg_19 db "86°F",0
msg_20 db "303.15 K",0
msg_21 db "Example 5: Pythagorean Theorem",0
msg_22 db "Right triangle with sides 3 and 4:",0
msg_23 db "a² + b² = 9 + 16 = 25",0
msg_24 db "Hypotenuse² = 25 (so c = 5)",0
msg_25 db "Example 6: Recipe Scaling",0
msg_26 db "Scaling recipe from 4 to 6 servings:",0
msg_27 db "Scale factor = 1.5",0
msg_28 db "Flour: 2 cups → 3 cups",0
msg_29 db "Sugar: 1.5 cups → 2.25 cups",0
msg_30 db "Butter: 0.5 cups → 0.75 cups",0
msg_31 db "Example 7: Engineering Formula",0
msg_32 db "Electrical calculations:",0
msg_33 db "V = 12V, I = 2.5A",0
msg_34 db "Resistance R = V/I = 4.8Ω",0
msg_35 db "Power P = V×I = 30W",0
msg_36 db "Example 8: Statistical Analysis",0
msg_37 db "Test scores: 85, 90, 78, 92, 88",0
msg_38 db "Sum = 433",0
msg_39 db "Average = 86.6",0
msg_40 db "=== Calculator Features Demonstrated ===",0
msg_41 db "✓ Mixed integer and float arithmetic",0
msg_42 db "✓ Scientific calculations (geometry, physics)",0
msg_43 db "✓ Financial computations (loans, interest)",0
msg_44 db "✓ Unit conversions (temperature, measurements)",0
msg_45 db "✓ Engineering formulas (electrical, mechanical)",0
msg_46 db "✓ Statistical analysis (averages, sums)",0
msg_47 db "✓ Recipe and ratio calculations",0
msg_48 db "✓ Complex nested expressions",0
msg_49 db "The 'num' type makes ÆLang the perfect language",0
msg_50 db "for mathematical computing and calculations!",0
msg_51 db "One type handles all numeric needs!",0
float_0: dd 0x43889333  ; 273.149994
float_1: dd 0x3fc00000  ; 1.5
float_2: dd 0x3f000000  ; 0.5
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
    float_var_6: resd 1  ; radius
    float_var_7: resd 1  ; pi
    float_var_8: resd 1  ; circumference
    float_var_9: resd 1  ; area
    float_var_10: resd 1  ; principal
    float_var_11: resd 1  ; rate
    float_var_12: resd 1  ; time
    float_var_13: resd 1  ; interest
    float_var_14: resd 1  ; total_amount
    float_var_15: resd 1  ; celsius
    float_var_16: resd 1  ; fahrenheit
    float_var_17: resd 1  ; kelvin
    float_var_18: resd 1  ; side_a
    float_var_19: resd 1  ; side_b
    float_var_20: resd 1  ; hypotenuse
    float_var_21: resd 1  ; original_servings
    float_var_22: resd 1  ; desired_servings
    float_var_23: resd 1  ; scale_factor
    float_var_24: resd 1  ; flour
    float_var_25: resd 1  ; sugar
    float_var_26: resd 1  ; butter
    float_var_27: resd 1  ; voltage
    float_var_28: resd 1  ; current
    float_var_29: resd 1  ; resistance
    float_var_30: resd 1  ; power
    float_var_31: resd 1  ; val1
    float_var_32: resd 1  ; val2
    float_var_33: resd 1  ; val3
    float_var_34: resd 1  ; val4
    float_var_35: resd 1  ; val5
    float_var_36: resd 1  ; sum_all
    float_var_37: resd 1  ; average

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
    push msg_4
    call print
    add esp, 4
; let int_val:num = 100
    mov eax, 100
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_0]  ; store int_val as num (converted from int)
; let float_val:num = 25.500000
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
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let radius:num = 7.500000
; Error: num float constant not found
    fstp dword [float_var_6]  ; store radius as num (float)
; let pi:num = 3.141590
; Error: num float constant not found
    fstp dword [float_var_7]  ; store pi as num (float)
; let circumference:num = 2 * pi * radius
    mov eax, 2
    fld dword [float_var_7]  ; load pi
    fmulp
    fld dword [float_var_6]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store circumference as num (converted from int)
; let area:num = pi * radius * radius
    fld dword [float_var_7]  ; load pi
    fld dword [float_var_6]  ; load radius
    fmulp
    fld dword [float_var_6]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store area as num (converted from int)
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let principal:num = 5000
    mov eax, 5000
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_10]  ; store principal as num (converted from int)
; let rate:num = 7.500000
; Error: num float constant not found
    fstp dword [float_var_11]  ; store rate as num (float)
; let time:num = 3
    mov eax, 3
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_12]  ; store time as num (converted from int)
; let interest:num = principal * rate * time / 100
    fld dword [float_var_10]  ; load principal
    fld dword [float_var_11]  ; load rate
    fmulp
    fld dword [float_var_12]  ; load time
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
    fstp dword [float_var_13]  ; store interest as num (converted from int)
; let total_amount:num = principal + interest
    fld dword [float_var_10]  ; load principal
    fld dword [float_var_13]  ; load interest
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_14]  ; store total_amount as num (converted from int)
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
; let celsius:num = 30
    mov eax, 30
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_15]  ; store celsius as num (converted from int)
; let fahrenheit:num = celsius * 9 / 5 + 32
    fld dword [float_var_15]  ; load celsius
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
    fstp dword [float_var_16]  ; store fahrenheit as num (converted from int)
; let kelvin:num = celsius + 273.150000
    fld dword [float_var_15]  ; load celsius
    fld dword [float_0]
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_17]  ; store kelvin as num (converted from int)
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
; let side_a:num = 3
    mov eax, 3
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_18]  ; store side_a as num (converted from int)
; let side_b:num = 4
    mov eax, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_19]  ; store side_b as num (converted from int)
; let hypotenuse:num = side_a * side_a + side_b * side_b
    fld dword [float_var_18]  ; load side_a
    fld dword [float_var_18]  ; load side_a
    fmulp
    push eax
    fld dword [float_var_19]  ; load side_b
    fld dword [float_var_19]  ; load side_b
    fmulp
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_20]  ; store hypotenuse as num (converted from int)
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
; let original_servings:num = 4
    mov eax, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_21]  ; store original_servings as num (converted from int)
; let desired_servings:num = 6
    mov eax, 6
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_22]  ; store desired_servings as num (converted from int)
; let scale_factor:num = desired_servings / original_servings
    fld dword [float_var_22]  ; load desired_servings
    fld dword [float_var_21]  ; load original_servings
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_23]  ; store scale_factor as num (converted from int)
; let flour:num = 2 * scale_factor
    mov eax, 2
    fld dword [float_var_23]  ; load scale_factor
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_24]  ; store flour as num (converted from int)
; let sugar:num = 1.500000 * scale_factor
    fld dword [float_1]
    fld dword [float_var_23]  ; load scale_factor
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_25]  ; store sugar as num (converted from int)
; let butter:num = 0.500000 * scale_factor
    fld dword [float_2]
    fld dword [float_var_23]  ; load scale_factor
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_26]  ; store butter as num (converted from int)
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
    push msg_3
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
; let voltage:num = 12
    mov eax, 12
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_27]  ; store voltage as num (converted from int)
; let current:num = 2.500000
; Error: num float constant not found
    fstp dword [float_var_28]  ; store current as num (float)
; let resistance:num = voltage / current
    fld dword [float_var_27]  ; load voltage
    fld dword [float_var_28]  ; load current
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_29]  ; store resistance as num (converted from int)
; let power:num = voltage * current
    fld dword [float_var_27]  ; load voltage
    fld dword [float_var_28]  ; load current
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_30]  ; store power as num (converted from int)
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
; let val1:num = 85
    mov eax, 85
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_31]  ; store val1 as num (converted from int)
; let val2:num = 90
    mov eax, 90
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_32]  ; store val2 as num (converted from int)
; let val3:num = 78
    mov eax, 78
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_33]  ; store val3 as num (converted from int)
; let val4:num = 92
    mov eax, 92
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_34]  ; store val4 as num (converted from int)
; let val5:num = 88
    mov eax, 88
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_35]  ; store val5 as num (converted from int)
; let sum_all:num = val1 + val2 + val3 + val4 + val5
    fld dword [float_var_31]  ; load val1
    fld dword [float_var_32]  ; load val2
    faddp
    fld dword [float_var_33]  ; load val3
    faddp
    fld dword [float_var_34]  ; load val4
    faddp
    fld dword [float_var_35]  ; load val5
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_36]  ; store sum_all as num (converted from int)
; let average:num = sum_all / 5
    fld dword [float_var_36]  ; load sum_all
    mov eax, 5
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_37]  ; store average as num (converted from int)
    push msg_37
    call print
    add esp, 4
    push msg_38
    call print
    add esp, 4
    push msg_39
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_40
    call print
    add esp, 4
    push msg_41
    call print
    add esp, 4
    push msg_42
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    push msg_44
    call print
    add esp, 4
    push msg_45
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
    push msg_47
    call print
    add esp, 4
    push msg_48
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_49
    call print
    add esp, 4
    push msg_50
    call print
    add esp, 4
    push msg_51
    call print
    add esp, 4
    pop ebp
    ret
