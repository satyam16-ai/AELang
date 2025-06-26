; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Dynamic Calculator with num Type ===",0
msg_1 db "Universal calculator supporting integers and floats",0
msg_2 db "",0
msg_3 db "Demo 1: Basic Arithmetic Operations",0
msg_4 db "a = 100 (int), b = 25.5 (float)",0
msg_5 db "Addition: 100 + 25.5 = (result in num)",0
msg_6 db "Subtraction: 100 - 25.5 = (result in num)",0
msg_7 db "Multiplication: 100 * 25.5 = (result in num)",0
msg_8 db "Division: 100 / 25.5 = (result in num)",0
msg_9 db "Demo 2: Complex Calculations",0
msg_10 db "x = 15, y = 4.2, z = 3",0
msg_11 db "(x + y) * z = (15 + 4.2) * 3",0
msg_12 db "x / (y - z) = 15 / (4.2 - 3)",0
msg_13 db "(x * y) + (z * z) = (15 * 4.2) + (3 * 3)",0
msg_14 db "Demo 3: Scientific Calculations",0
msg_15 db "Circle calculations:",0
msg_16 db "radius = 5.5, pi = 3.14159",0
msg_17 db "Circumference = 2 * pi * radius",0
msg_18 db "Area = pi * radius * radius",0
msg_19 db "Demo 4: Financial Calculations",0
msg_20 db "Simple Interest Calculator:",0
msg_21 db "Principal = 1000, Rate = 5.5%, Time = 2 years",0
msg_22 db "Simple Interest = (P * R * T) / 100",0
msg_23 db "Amount = Principal + Interest",0
msg_24 db "Demo 5: Unit Conversions",0
msg_25 db "Temperature: 25°C to Fahrenheit",0
msg_26 db "Distance: 100.5 meters to feet",0
msg_27 db "Weight: 75.2 kg to pounds",0
msg_28 db "Demo 6: Advanced Mathematical Expressions",0
msg_29 db "val1 = 12.5, val2 = 8, val3 = 4.75",0
msg_30 db "((val1 + val2) * val3) - (val1 / val2)",0
msg_31 db "(val1² + val2² + val3²)",0
msg_32 db "((val1 - val2) / val3) + ((val2 + val3) * val1)",0
msg_33 db "Demo 7: Real-World Problem Solving",0
msg_34 db "Room renovation calculator:",0
msg_35 db "Room: 15.5m × 10m",0
msg_36 db "Cost per sq.m: $25.75",0
msg_37 db "Tax rate: 8.5%",0
msg_38 db "Total area calculation...",0
msg_39 db "Cost calculation with tax...",0
msg_40 db "=== Calculator Results Summary ===",0
msg_41 db "✓ Mixed integer/float operations",0
msg_42 db "✓ Complex mathematical expressions",0
msg_43 db "✓ Scientific calculations",0
msg_44 db "✓ Financial computations",0
msg_45 db "✓ Unit conversions",0
msg_46 db "✓ Real-world problem solving",0
msg_47 db "num type enables universal calculations!",0
msg_48 db "No need to worry about int vs float types!",0
float_0: dd 0x41cc0000  ; 25.5
float_1: dd 0x40866666  ; 4.19999981
float_2: dd 0x40b00000  ; 5.5
float_3: dd 0x40490fd0  ; 3.14159012
float_4: dd 0x40b00000  ; 5.5
float_5: dd 0x42c90000  ; 100.5
float_6: dd 0x4051f948  ; 3.28083992
float_7: dd 0x42966666  ; 75.1999969
float_8: dd 0x400d187e  ; 2.20461988
float_9: dd 0x41480000  ; 12.5
float_10: dd 0x40980000  ; 4.75
float_11: dd 0x41780000  ; 15.5
float_12: dd 0x41ce0000  ; 25.75
float_13: dd 0x41080000  ; 8.5
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; addition
    float_var_3: resd 1  ; subtraction
    float_var_4: resd 1  ; multiplication
    float_var_5: resd 1  ; division
    float_var_6: resd 1  ; x
    float_var_7: resd 1  ; y
    float_var_8: resd 1  ; z
    float_var_9: resd 1  ; complex1
    float_var_10: resd 1  ; complex2
    float_var_11: resd 1  ; complex3
    float_var_12: resd 1  ; radius
    float_var_13: resd 1  ; pi
    float_var_14: resd 1  ; circumference
    float_var_15: resd 1  ; area
    float_var_16: resd 1  ; principal
    float_var_17: resd 1  ; rate
    float_var_18: resd 1  ; time
    float_var_19: resd 1  ; simple_interest
    float_var_20: resd 1  ; amount
    float_var_21: resd 1  ; celsius
    float_var_22: resd 1  ; fahrenheit
    float_var_23: resd 1  ; meters
    float_var_24: resd 1  ; feet
    float_var_25: resd 1  ; kilograms
    float_var_26: resd 1  ; pounds
    float_var_27: resd 1  ; val1
    float_var_28: resd 1  ; val2
    float_var_29: resd 1  ; val3
    float_var_30: resd 1  ; advanced1
    float_var_31: resd 1  ; advanced2
    float_var_32: resd 1  ; advanced3
    float_var_33: resd 1  ; length
    float_var_34: resd 1  ; width
    float_var_35: resd 1  ; room_area
    float_var_36: resd 1  ; cost_per_sqm
    float_var_37: resd 1  ; total_cost
    float_var_38: resd 1  ; tax_rate
    float_var_39: resd 1  ; tax_amount
    float_var_40: resd 1  ; final_cost

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num
    extern read_num_safe
    extern print_num
    extern print_clean
    extern print_num_precision
    extern print_num_scientific
    extern print_currency
    extern print_percentage
    extern print_num_engineering
    extern print_hex
    extern read_num_validated
    extern read_num_with_prompt
    extern read_positive_num
    extern read_integer_only

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
; let a:num = 100
    mov eax, 100
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_0]  ; store a as num (converted from int)
; let b:num = 25.500000
    fld dword [float_0]
    fstp dword [float_var_1]  ; store b as num (float)
; let addition:num = a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fstp dword [float_var_2]  ; store addition as num (float)
; let subtraction:num = a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fstp dword [float_var_3]  ; store subtraction as num (float)
; let multiplication:num = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_4]  ; store multiplication as num (float)
; let division:num = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_5]  ; store division as num (float)
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
    push msg_8
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
; let x:num = 15
    mov eax, 15
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store x as num (converted from int)
; let y:num = 4.200000
    fld dword [float_1]
    fstp dword [float_var_7]  ; store y as num (float)
; let z:num = 3
    mov eax, 3
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store z as num (converted from int)
; let complex1:num = x + y * z
    fld dword [float_var_6]  ; load x
    fld dword [float_var_7]  ; load y
    faddp
    fld dword [float_var_8]  ; load z
    fmulp
    fstp dword [float_var_9]  ; store complex1 as num (float)
; let complex2:num = x / y - z
    fld dword [float_var_6]  ; load x
    fld dword [float_var_7]  ; load y
    fld dword [float_var_8]  ; load z
    fsubp
    fdivp
    fstp dword [float_var_10]  ; store complex2 as num (float)
; let complex3:num = x * y + z * z
    fld dword [float_var_6]  ; load x
    fld dword [float_var_7]  ; load y
    fmulp
    fld dword [float_var_8]  ; load z
    fld dword [float_var_8]  ; load z
    fmulp
    faddp
    fstp dword [float_var_11]  ; store complex3 as num (float)
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
; let radius:num = 5.500000
    fld dword [float_2]
    fstp dword [float_var_12]  ; store radius as num (float)
; let pi:num = 3.141590
    fld dword [float_3]
    fstp dword [float_var_13]  ; store pi as num (float)
; let circumference:num = 2 * pi * radius
    mov eax, 2
    fld dword [float_var_13]  ; load pi
    fmulp
    fld dword [float_var_12]  ; load radius
    fmulp
    fstp dword [float_var_14]  ; store circumference as num (float)
; let area:num = pi * radius * radius
    fld dword [float_var_13]  ; load pi
    fld dword [float_var_12]  ; load radius
    fmulp
    fld dword [float_var_12]  ; load radius
    fmulp
    fstp dword [float_var_15]  ; store area as num (float)
    push msg_15
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
    push msg_2
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
; let principal:num = 1000
    mov eax, 1000
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_16]  ; store principal as num (converted from int)
; let rate:num = 5.500000
    fld dword [float_2]
    fstp dword [float_var_17]  ; store rate as num (float)
; let time:num = 2
    mov eax, 2
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_18]  ; store time as num (converted from int)
; let simple_interest:num = principal * rate * time / 100
    fld dword [float_var_16]  ; load principal
    fld dword [float_var_17]  ; load rate
    fmulp
    fld dword [float_var_18]  ; load time
    fmulp
    mov eax, 100
    fdivp
    fstp dword [float_var_19]  ; store simple_interest as num (float)
; let amount:num = principal + simple_interest
    fld dword [float_var_16]  ; load principal
    fld dword [float_var_19]  ; load simple_interest
    faddp
    fstp dword [float_var_20]  ; store amount as num (float)
    push msg_20
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
; let celsius:num = 25
    mov eax, 25
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_21]  ; store celsius as num (converted from int)
; let fahrenheit:num = celsius * 9 / 5 + 32
    fld dword [float_var_21]  ; load celsius
    mov eax, 9
    fmulp
    mov eax, 5
    fdivp
    mov eax, 32
    faddp
    fstp dword [float_var_22]  ; store fahrenheit as num (float)
; let meters:num = 100.500000
    fld dword [float_5]
    fstp dword [float_var_23]  ; store meters as num (float)
; let feet:num = meters * 3.280840
    fld dword [float_var_23]  ; load meters
    fld dword [float_6]
    fmulp
    fstp dword [float_var_24]  ; store feet as num (float)
; let kilograms:num = 75.200000
    fld dword [float_7]
    fstp dword [float_var_25]  ; store kilograms as num (float)
; let pounds:num = kilograms * 2.204620
    fld dword [float_var_25]  ; load kilograms
    fld dword [float_8]
    fmulp
    fstp dword [float_var_26]  ; store pounds as num (float)
    push msg_25
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_28
    call print
    add esp, 4
; let val1:num = 12.500000
    fld dword [float_9]
    fstp dword [float_var_27]  ; store val1 as num (float)
; let val2:num = 8
    mov eax, 8
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_28]  ; store val2 as num (converted from int)
; let val3:num = 4.750000
    fld dword [float_10]
    fstp dword [float_var_29]  ; store val3 as num (float)
; let advanced1:num = val1 + val2 * val3 - val1 / val2
    fld dword [float_var_27]  ; load val1
    fld dword [float_var_28]  ; load val2
    faddp
    fld dword [float_var_29]  ; load val3
    fmulp
    fld dword [float_var_27]  ; load val1
    fld dword [float_var_28]  ; load val2
    fdivp
    fsubp
    fstp dword [float_var_30]  ; store advanced1 as num (float)
; let advanced2:num = val1 * val1 + val2 * val2 + val3 * val3
    fld dword [float_var_27]  ; load val1
    fld dword [float_var_27]  ; load val1
    fmulp
    fld dword [float_var_28]  ; load val2
    fld dword [float_var_28]  ; load val2
    fmulp
    faddp
    fld dword [float_var_29]  ; load val3
    fld dword [float_var_29]  ; load val3
    fmulp
    faddp
    fstp dword [float_var_31]  ; store advanced2 as num (float)
; let advanced3:num = val1 - val2 / val3 + val2 + val3 * val1
    fld dword [float_var_27]  ; load val1
    fld dword [float_var_28]  ; load val2
    fsubp
    fld dword [float_var_29]  ; load val3
    fdivp
    fld dword [float_var_28]  ; load val2
    fld dword [float_var_29]  ; load val3
    faddp
    fld dword [float_var_27]  ; load val1
    fmulp
    faddp
    fstp dword [float_var_32]  ; store advanced3 as num (float)
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
    push msg_2
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
; let length:num = 15.500000
    fld dword [float_11]
    fstp dword [float_var_33]  ; store length as num (float)
; let width:num = 10
    mov eax, 10
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_34]  ; store width as num (converted from int)
; let room_area:num = length * width
    fld dword [float_var_33]  ; load length
    fld dword [float_var_34]  ; load width
    fmulp
    fstp dword [float_var_35]  ; store room_area as num (float)
; let cost_per_sqm:num = 25.750000
    fld dword [float_12]
    fstp dword [float_var_36]  ; store cost_per_sqm as num (float)
; let total_cost:num = room_area * cost_per_sqm
    fld dword [float_var_35]  ; load room_area
    fld dword [float_var_36]  ; load cost_per_sqm
    fmulp
    fstp dword [float_var_37]  ; store total_cost as num (float)
; let tax_rate:num = 8.500000
    fld dword [float_13]
    fstp dword [float_var_38]  ; store tax_rate as num (float)
; let tax_amount:num = total_cost * tax_rate / 100
    fld dword [float_var_37]  ; load total_cost
    fld dword [float_var_38]  ; load tax_rate
    fmulp
    mov eax, 100
    fdivp
    fstp dword [float_var_39]  ; store tax_amount as num (float)
; let final_cost:num = total_cost + tax_amount
    fld dword [float_var_37]  ; load total_cost
    fld dword [float_var_39]  ; load tax_amount
    faddp
    fstp dword [float_var_40]  ; store final_cost as num (float)
    push msg_34
    call print
    add esp, 4
    push msg_35
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
    push msg_37
    call print
    add esp, 4
    push msg_38
    call print
    add esp, 4
    push msg_39
    call print
    add esp, 4
    push msg_2
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
    push msg_2
    call print
    add esp, 4
    push msg_47
    call print
    add esp, 4
    push msg_48
    call print
    add esp, 4
    pop ebp
    ret
