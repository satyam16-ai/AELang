; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Advanced num Type Showcase ===",0
msg_1 db "Demonstrating sophisticated mathematical operations",0
msg_2 db "with the universal 'num' data type",0
msg_3 db "",0
msg_4 db "=== 1. MATHEMATICAL CONSTANTS ===",0
msg_5 db "π (pi) = 3.14159265359",0
msg_6 db "e (Euler's number) = 2.71828182846",0
msg_7 db "φ (golden ratio) = 1.61803398875",0
msg_8 db "√2 (square root of 2) = 1.41421356237",0
msg_9 db "=== 2. GEOMETRIC CALCULATIONS ===",0
msg_10 db "Circle/Sphere with radius 12.5:",0
msg_11 db "Diameter = 25",0
msg_12 db "Circumference = 78.54",0
msg_13 db "Area = 490.87",0
msg_14 db "Sphere volume = 8181.23",0
msg_15 db "=== 3. PHYSICS FORMULAS ===",0
msg_16 db "Physics calculations (m=75kg, v=25.5m/s, h=100m):",0
msg_17 db "Kinetic Energy = ½mv² = 24393.75 J",0
msg_18 db "Potential Energy = mgh = 73575 J",0
msg_19 db "Momentum = mv = 1912.5 kg⋅m/s",0
msg_20 db "Gravitational Force = mg = 735.75 N",0
msg_21 db "=== 4. FINANCIAL MATHEMATICS ===",0
msg_22 db "Investment Analysis ($10,000 at 8.5% for 5 years):",0
msg_23 db "Simple Interest = $4,250",0
msg_24 db "Simple Total = $14,250",0
msg_25 db "Compound Interest (quarterly) ≈ $5,023",0
msg_26 db "Compound Total ≈ $15,023",0
msg_27 db "=== 5. ENGINEERING CALCULATIONS ===",0
msg_28 db "Electrical Engineering (V=240V, I=15.5A, f=60Hz):",0
msg_29 db "Resistance R = V/I = 15.48 Ω",0
msg_30 db "Power P = V×I = 3,720 W",0
msg_31 db "Inductive Reactance XL = 94.25 Ω",0
msg_32 db "Total Impedance Z ≈ 15.48 Ω",0
msg_33 db "=== 6. STATISTICAL ANALYSIS ===",0
msg_34 db "Statistical Analysis of 5 samples:",0
msg_35 db "Data: 85.5, 92.3, 78.9, 88.7, 94.1",0
msg_36 db "Sum = 439.5",0
msg_37 db "Mean = 87.9",0
msg_38 db "Range = 15.2",0
msg_39 db "Standard analysis completed",0
msg_40 db "=== 7. ALGORITHM PERFORMANCE ===",0
msg_41 db "Algorithm Complexity (n=1,000,000):",0
msg_42 db "Linear O(n) = 1,000,000 operations",0
msg_43 db "Logarithmic O(n log n) = 20,000,000 operations",0
msg_44 db "Quadratic O(n²) = 1,000,000,000,000 operations",0
msg_45 db "Performance analysis demonstrates scaling",0
msg_46 db "=== 8. UNIT CONVERSIONS ===",0
msg_47 db "Temperature Conversions (37.5°C):",0
msg_48 db "Fahrenheit = 99.5°F",0
msg_49 db "Kelvin = 310.65 K",0
msg_50 db "Distance Conversions (1 mile):",0
msg_51 db "Meters = 1609.344 m",0
msg_52 db "Feet = 5280 ft",0
msg_53 db "Inches = 63360 in",0
msg_54 db "=== ADVANCED SHOWCASE COMPLETE ===",0
msg_55 db "✓ Mathematical constants and formulas",0
msg_56 db "✓ Geometric and trigonometric calculations",0
msg_57 db "✓ Physics and engineering applications",0
msg_58 db "✓ Financial mathematics and interest",0
msg_59 db "✓ Statistical analysis and data science",0
msg_60 db "✓ Algorithm complexity analysis",0
msg_61 db "✓ Multi-domain unit conversions",0
msg_62 db "✓ Complex nested expression evaluation",0
msg_63 db "The 'num' type enables ÆLang to be a powerful",0
msg_64 db "mathematical and scientific computing language!",0
msg_65 db "One universal type handles all numeric domains!",0
float_0: dd 0x42bc3333  ; 94.0999985
float_1: dd 0x429dcccd  ; 78.9000015
float_2: dd 0x43889333  ; 273.149994
float_3: dd 0x4051f948  ; 3.28083992
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; pi
    float_var_1: resd 1  ; e
    float_var_2: resd 1  ; golden_ratio
    float_var_3: resd 1  ; sqrt2
    float_var_4: resd 1  ; radius
    float_var_5: resd 1  ; diameter
    float_var_6: resd 1  ; circumference
    float_var_7: resd 1  ; area
    float_var_8: resd 1  ; volume_sphere
    float_var_9: resd 1  ; mass
    float_var_10: resd 1  ; velocity
    float_var_11: resd 1  ; height
    float_var_12: resd 1  ; gravity
    float_var_13: resd 1  ; kinetic_energy
    float_var_14: resd 1  ; potential_energy
    float_var_15: resd 1  ; momentum
    float_var_16: resd 1  ; force
    float_var_17: resd 1  ; principal
    float_var_18: resd 1  ; annual_rate
    float_var_19: resd 1  ; years
    float_var_20: resd 1  ; compounds_per_year
    float_var_21: resd 1  ; simple_interest
    float_var_22: resd 1  ; simple_total
    float_var_23: resd 1  ; rate_per_period
    float_var_24: resd 1  ; periods
    float_var_25: resd 1  ; voltage
    float_var_26: resd 1  ; current
    float_var_27: resd 1  ; frequency
    float_var_28: resd 1  ; inductance
    float_var_29: resd 1  ; resistance
    float_var_30: resd 1  ; power
    float_var_31: resd 1  ; reactance
    float_var_32: resd 1  ; impedance
    float_var_33: resd 1  ; sample1
    float_var_34: resd 1  ; sample2
    float_var_35: resd 1  ; sample3
    float_var_36: resd 1  ; sample4
    float_var_37: resd 1  ; sample5
    float_var_38: resd 1  ; n
    float_var_39: resd 1  ; sum
    float_var_40: resd 1  ; mean
    float_var_41: resd 1  ; range
    float_var_42: resd 1  ; diff1
    float_var_43: resd 1  ; diff2
    float_var_44: resd 1  ; diff3
    float_var_45: resd 1  ; diff4
    float_var_46: resd 1  ; diff5
    float_var_47: resd 1  ; array_size
    float_var_48: resd 1  ; log_n
    float_var_49: resd 1  ; n_squared
    float_var_50: resd 1  ; linear_ops
    float_var_51: resd 1  ; logarithmic_ops
    float_var_52: resd 1  ; quadratic_ops
    float_var_53: resd 1  ; celsius
    float_var_54: resd 1  ; fahrenheit
    float_var_55: resd 1  ; kelvin
    float_var_56: resd 1  ; meters
    float_var_57: resd 1  ; feet
    float_var_58: resd 1  ; inches

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
; let pi:num = 3.141593
; Error: num float constant not found
    fstp dword [float_var_0]  ; store pi as num (float)
; let e:num = 2.718282
; Error: num float constant not found
    fstp dword [float_var_1]  ; store e as num (float)
; let golden_ratio:num = 1.618034
; Error: num float constant not found
    fstp dword [float_var_2]  ; store golden_ratio as num (float)
; let sqrt2:num = 1.414214
; Error: num float constant not found
    fstp dword [float_var_3]  ; store sqrt2 as num (float)
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
; let radius:num = 12.500000
; Error: num float constant not found
    fstp dword [float_var_4]  ; store radius as num (float)
; let diameter:num = 2 * radius
    mov eax, 2
    fld dword [float_var_4]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_5]  ; store diameter as num (converted from int)
; let circumference:num = 2 * pi * radius
    mov eax, 2
    fld dword [float_var_0]  ; load pi
    fmulp
    fld dword [float_var_4]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store circumference as num (converted from int)
; let area:num = pi * radius * radius
    fld dword [float_var_0]  ; load pi
    fld dword [float_var_4]  ; load radius
    fmulp
    fld dword [float_var_4]  ; load radius
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_7]  ; store area as num (converted from int)
; let volume_sphere:num = 4 * pi * radius * radius * radius / 3
    mov eax, 4
    fld dword [float_var_0]  ; load pi
    fmulp
    fld dword [float_var_4]  ; load radius
    fmulp
    fld dword [float_var_4]  ; load radius
    fmulp
    fld dword [float_var_4]  ; load radius
    fmulp
    push eax
    mov eax, 3
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store volume_sphere as num (converted from int)
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
    push msg_14
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
; let mass:num = 75
    mov eax, 75
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store mass as num (converted from int)
; let velocity:num = 25.500000
; Error: num float constant not found
    fstp dword [float_var_10]  ; store velocity as num (float)
; let height:num = 100
    mov eax, 100
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_11]  ; store height as num (converted from int)
; let gravity:num = 9.810000
; Error: num float constant not found
    fstp dword [float_var_12]  ; store gravity as num (float)
; let kinetic_energy:num = mass * velocity * velocity / 2
    fld dword [float_var_9]  ; load mass
    fld dword [float_var_10]  ; load velocity
    fmulp
    fld dword [float_var_10]  ; load velocity
    fmulp
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_13]  ; store kinetic_energy as num (converted from int)
; let potential_energy:num = mass * gravity * height
    fld dword [float_var_9]  ; load mass
    fld dword [float_var_12]  ; load gravity
    fmulp
    fld dword [float_var_11]  ; load height
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_14]  ; store potential_energy as num (converted from int)
; let momentum:num = mass * velocity
    fld dword [float_var_9]  ; load mass
    fld dword [float_var_10]  ; load velocity
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_15]  ; store momentum as num (converted from int)
; let force:num = mass * gravity
    fld dword [float_var_9]  ; load mass
    fld dword [float_var_12]  ; load gravity
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_16]  ; store force as num (converted from int)
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
    push msg_3
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
; let principal:num = 10000
    mov eax, 10000
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_17]  ; store principal as num (converted from int)
; let annual_rate:num = 8.500000
; Error: num float constant not found
    fstp dword [float_var_18]  ; store annual_rate as num (float)
; let years:num = 5
    mov eax, 5
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_19]  ; store years as num (converted from int)
; let compounds_per_year:num = 4
    mov eax, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_20]  ; store compounds_per_year as num (converted from int)
; let simple_interest:num = principal * annual_rate * years / 100
    fld dword [float_var_17]  ; load principal
    fld dword [float_var_18]  ; load annual_rate
    fmulp
    fld dword [float_var_19]  ; load years
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
    fstp dword [float_var_21]  ; store simple_interest as num (converted from int)
; let simple_total:num = principal + simple_interest
    fld dword [float_var_17]  ; load principal
    fld dword [float_var_21]  ; load simple_interest
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_22]  ; store simple_total as num (converted from int)
; let rate_per_period:num = annual_rate / 100 * compounds_per_year
    fld dword [float_var_18]  ; load annual_rate
    mov eax, 100
    fld dword [float_var_20]  ; load compounds_per_year
    fmulp
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_23]  ; store rate_per_period as num (converted from int)
; let periods:num = compounds_per_year * years
    fld dword [float_var_20]  ; load compounds_per_year
    fld dword [float_var_19]  ; load years
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_24]  ; store periods as num (converted from int)
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
; let voltage:num = 240
    mov eax, 240
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_25]  ; store voltage as num (converted from int)
; let current:num = 15.500000
; Error: num float constant not found
    fstp dword [float_var_26]  ; store current as num (float)
; let frequency:num = 60
    mov eax, 60
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_27]  ; store frequency as num (converted from int)
; let inductance:num = 0.250000
; Error: num float constant not found
    fstp dword [float_var_28]  ; store inductance as num (float)
; let resistance:num = voltage / current
    fld dword [float_var_25]  ; load voltage
    fld dword [float_var_26]  ; load current
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_29]  ; store resistance as num (converted from int)
; let power:num = voltage * current
    fld dword [float_var_25]  ; load voltage
    fld dword [float_var_26]  ; load current
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_30]  ; store power as num (converted from int)
; let reactance:num = 2 * pi * frequency * inductance
    mov eax, 2
    fld dword [float_var_0]  ; load pi
    fmulp
    fld dword [float_var_27]  ; load frequency
    fmulp
    fld dword [float_var_28]  ; load inductance
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_31]  ; store reactance as num (converted from int)
; let impedance:num = resistance
    fld dword [float_var_29]  ; load resistance
    fstp dword [float_var_32]  ; store impedance as num (float)
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
    push msg_32
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
; let sample1:num = 85.500000
; Error: num float constant not found
    fstp dword [float_var_33]  ; store sample1 as num (float)
; let sample2:num = 92.300000
; Error: num float constant not found
    fstp dword [float_var_34]  ; store sample2 as num (float)
; let sample3:num = 78.900000
    fld dword [float_1]
    fstp dword [float_var_35]  ; store sample3 as num (float)
; let sample4:num = 88.700000
; Error: num float constant not found
    fstp dword [float_var_36]  ; store sample4 as num (float)
; let sample5:num = 94.100000
    fld dword [float_0]
    fstp dword [float_var_37]  ; store sample5 as num (float)
; let n:num = 5
    mov eax, 5
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_38]  ; store n as num (converted from int)
; let sum:num = sample1 + sample2 + sample3 + sample4 + sample5
    fld dword [float_var_33]  ; load sample1
    fld dword [float_var_34]  ; load sample2
    faddp
    fld dword [float_var_35]  ; load sample3
    faddp
    fld dword [float_var_36]  ; load sample4
    faddp
    fld dword [float_var_37]  ; load sample5
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_39]  ; store sum as num (converted from int)
; let mean:num = sum / n
    fld dword [float_var_39]  ; load sum
    fld dword [float_var_38]  ; load n
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_40]  ; store mean as num (converted from int)
; let range:num = 94.100000 - 78.900000
    fld dword [float_0]
    fld dword [float_1]
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_41]  ; store range as num (converted from int)
; let diff1:num = sample1 - mean
    fld dword [float_var_33]  ; load sample1
    fld dword [float_var_40]  ; load mean
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_42]  ; store diff1 as num (converted from int)
; let diff2:num = sample2 - mean
    fld dword [float_var_34]  ; load sample2
    fld dword [float_var_40]  ; load mean
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_43]  ; store diff2 as num (converted from int)
; let diff3:num = sample3 - mean
    fld dword [float_var_35]  ; load sample3
    fld dword [float_var_40]  ; load mean
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_44]  ; store diff3 as num (converted from int)
; let diff4:num = sample4 - mean
    fld dword [float_var_36]  ; load sample4
    fld dword [float_var_40]  ; load mean
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_45]  ; store diff4 as num (converted from int)
; let diff5:num = sample5 - mean
    fld dword [float_var_37]  ; load sample5
    fld dword [float_var_40]  ; load mean
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_46]  ; store diff5 as num (converted from int)
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
    push msg_3
    call print
    add esp, 4
    push msg_40
    call print
    add esp, 4
; let array_size:num = 1000000
    mov eax, 1000000
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_47]  ; store array_size as num (converted from int)
; let log_n:num = 20
    mov eax, 20
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_48]  ; store log_n as num (converted from int)
; let n_squared:num = array_size * array_size
    fld dword [float_var_47]  ; load array_size
    fld dword [float_var_47]  ; load array_size
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_49]  ; store n_squared as num (converted from int)
; let linear_ops:num = array_size
    fld dword [float_var_47]  ; load array_size
    fstp dword [float_var_50]  ; store linear_ops as num (float)
; let logarithmic_ops:num = array_size * log_n
    fld dword [float_var_47]  ; load array_size
    fld dword [float_var_48]  ; load log_n
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_51]  ; store logarithmic_ops as num (converted from int)
; let quadratic_ops:num = n_squared / 1000000
    fld dword [float_var_49]  ; load n_squared
    mov eax, 1000000
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_52]  ; store quadratic_ops as num (converted from int)
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
    push msg_3
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
; let celsius:num = 37.500000
; Error: num float constant not found
    fstp dword [float_var_53]  ; store celsius as num (float)
; let fahrenheit:num = celsius * 9 / 5 + 32
    fld dword [float_var_53]  ; load celsius
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
    fstp dword [float_var_54]  ; store fahrenheit as num (converted from int)
; let kelvin:num = celsius + 273.150000
    fld dword [float_var_53]  ; load celsius
    fld dword [float_2]
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_55]  ; store kelvin as num (converted from int)
; let meters:num = 1609.344000
; Error: num float constant not found
    fstp dword [float_var_56]  ; store meters as num (float)
; let feet:num = meters * 3.280840
    fld dword [float_var_56]  ; load meters
    fld dword [float_3]
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_57]  ; store feet as num (converted from int)
; let inches:num = feet * 12
    fld dword [float_var_57]  ; load feet
    mov eax, 12
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_58]  ; store inches as num (converted from int)
    push msg_47
    call print
    add esp, 4
    push msg_48
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
    push msg_52
    call print
    add esp, 4
    push msg_53
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_54
    call print
    add esp, 4
    push msg_55
    call print
    add esp, 4
    push msg_56
    call print
    add esp, 4
    push msg_57
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
    push msg_59
    call print
    add esp, 4
    push msg_60
    call print
    add esp, 4
    push msg_61
    call print
    add esp, 4
    push msg_62
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_63
    call print
    add esp, 4
    push msg_64
    call print
    add esp, 4
    push msg_65
    call print
    add esp, 4
    pop ebp
    ret
