; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔════════════════════════════════════════════════════╗",0
msg_1 db "║              ÆLANG PROFESSIONAL CALCULATOR         ║",0
msg_2 db "║                Advanced Mathematics Suite          ║",0
msg_3 db "╚════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 Features:",0
msg_6 db "   • Clean formatted output (no garbage values)",0
msg_7 db "   • Robust input validation",0
msg_8 db "   • Professional mathematical operations",0
msg_9 db "   • Advanced scientific calculations",0
msg_10 db "   • Real-world problem solving",0
msg_11 db "═══════════════════════════════════════════════════",0
msg_12 db "📊 SECTION 1: BASIC CALCULATOR OPERATIONS",0
msg_13 db "Enter the first number: ",0
msg_14 db "Enter the second number: ",0
msg_15 db "✅ Input received - First: ",0
msg_16 db ", Second: ",0
msg_17 db "📋 BASIC OPERATIONS:",0
msg_18 db "─────────────────────",0
msg_19 db "➕ Addition:       ",0
msg_20 db " + ",0
msg_21 db " = ",0
msg_22 db "➖ Subtraction:    ",0
msg_23 db " - ",0
msg_24 db "✖️  Multiplication: ",0
msg_25 db " × ",0
msg_26 db "➗ Division:       ",0
msg_27 db " ÷ ",0
msg_28 db "🔬 SECTION 2: ADVANCED MATHEMATICAL ANALYSIS",0
msg_29 db "📊 STATISTICAL ANALYSIS:",0
msg_30 db "─────────────────────────",0
msg_31 db "📈 Arithmetic Mean:  ",0
msg_32 db "📐 Geometric Mean:   ",0
msg_33 db "🎯 Harmonic Mean:    ",0
msg_34 db "🧮 ALGEBRAIC EXPRESSIONS:",0
msg_35 db "──────────────────────────",0
msg_36 db "🔢 Sum of Squares:   ",0
msg_37 db "² + ",0
msg_38 db "² = ",0
msg_39 db "📊 (a - b)²:         ",0
msg_40 db "🎲 (a + b)³:         ",0
msg_41 db "🌟 SECTION 3: REAL-WORLD APPLICATIONS",0
msg_42 db "⚡ PHYSICS CALCULATIONS:",0
msg_43 db "────────────────────────",0
msg_44 db "🔋 If a = voltage (",0
msg_45 db "V) and b = resistance (",0
msg_46 db "Ω):",0
msg_47 db "   Current (I = V/R):     ",0
msg_48 db " A",0
msg_49 db "   Power (P = V²/R):      ",0
msg_50 db " W",0
msg_51 db "💰 FINANCIAL CALCULATIONS:",0
msg_52 db "───────────────────────────",0
msg_53 db "💵 If a = principal ($",0
msg_54 db ") and b = rate (",0
msg_55 db "%):",0
msg_56 db "   Simple Interest:       $",0
msg_57 db "   After 2 years (compound): $",0
msg_58 db "🏗️ ENGINEERING CALCULATIONS:",0
msg_59 db "─────────────────────────────",0
msg_60 db "📏 If a = length (",0
msg_61 db ") and b = width (",0
msg_62 db "):",0
msg_63 db "   Area (rectangle):      ",0
msg_64 db " units²",0
msg_65 db "   Perimeter:             ",0
msg_66 db " units",0
msg_67 db "   Diagonal² (Pythagoras): ",0
msg_68 db "🎉 CALCULATION SUMMARY",0
msg_69 db "✅ FEATURES DEMONSTRATED:",0
msg_70 db "   🎯 Clean formatted output (no extra decimals)",0
msg_71 db "   🔒 Robust input validation and error handling",0
msg_72 db "   📊 Professional mathematical operations",0
msg_73 db "   🧪 Advanced scientific calculations",0
msg_74 db "   💼 Real-world application examples",0
msg_75 db "   ⚡ High-performance num type arithmetic",0
msg_76 db "🚀 TECHNICAL ACHIEVEMENTS:",0
msg_77 db "   📝 Enhanced print_num() - Smart formatting",0
msg_78 db "   🛡️ read_num_safe() - Bulletproof input handling",0
msg_79 db "   🎨 print_clean() - Professional presentation",0
msg_80 db "   🔧 Zero garbage values or formatting issues",0
msg_81 db "   💯 Production-ready mathematical computing",0
msg_82 db "🏆 ÆLANG UNIVERSAL NUM TYPE: PRODUCTION COMPLETE!",0
msg_83 db "   Perfect for scientific, financial, and engineering applications.",0
msg_84 db "Thank you for using ÆLang Professional Calculator!",0
float_0: dd 0x40000000  ; 2
float_1: dd 0x40000000  ; 2
float_2: dd 0x40000000  ; 2
float_3: dd 0x42c80000  ; 100
float_4: dd 0x3f800000  ; 1
float_5: dd 0x42c80000  ; 100
float_6: dd 0x40000000  ; 2
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; difference
    float_var_4: resd 1  ; product
    float_var_5: resd 1  ; quotient
    float_var_6: resd 1  ; average
    float_var_7: resd 1  ; geometric_mean
    float_var_8: resd 1  ; harmonic_mean
    float_var_9: resd 1  ; squares_sum
    float_var_10: resd 1  ; difference_squared
    float_var_11: resd 1  ; sum_cubed
    float_var_12: resd 1  ; current
    float_var_13: resd 1  ; power
    float_var_14: resd 1  ; simple_interest
    float_var_15: resd 1  ; compound_base
    float_var_16: resd 1  ; compound_interest
    float_var_17: resd 1  ; area
    float_var_18: resd 1  ; perimeter
    float_var_19: resd 1  ; diagonal

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

extern print
extern print_clean
extern print_num
extern read_num_safe
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
    push msg_9
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let a:num = read_num_safe()
    call read_num_safe
    fstp dword [float_var_0]  ; store a as num (float)
    push msg_14
    call print
    add esp, 4
; let b:num = read_num_safe()
    call read_num_safe
    fstp dword [float_var_1]  ; store b as num (float)
    push msg_4
    call print
    add esp, 4
    push msg_15
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_16
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
; let sum:num = a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fstp dword [float_var_2]  ; store sum as num (float)
    push msg_19
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_20
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load sum
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let difference:num = a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fstp dword [float_var_3]  ; store difference as num (float)
    push msg_22
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_23
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load difference
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let product:num = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_4]  ; store product as num (float)
    push msg_24
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_25
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [float_var_4]  ; load product
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let quotient:num = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_5]  ; store quotient as num (float)
    push msg_26
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_27
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_28
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let average:num = a + b / 2.000000
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fld dword [float_0]
    fdivp
    fstp dword [float_var_6]  ; store average as num (float)
; let geometric_mean:num = a * b / 2.000000
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fld dword [float_0]
    fdivp
    fstp dword [float_var_7]  ; store geometric_mean as num (float)
; let harmonic_mean:num = 2.000000 * a * b / a + b
    fld dword [float_0]
    fld dword [float_var_0]  ; load a
    fmulp
    fld dword [float_var_1]  ; load b
    fmulp
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fdivp
    fstp dword [float_var_8]  ; store harmonic_mean as num (float)
    push msg_29
    call print
    add esp, 4
    push msg_30
    call print
    add esp, 4
    push msg_31
    call print_clean
    add esp, 4
    fld dword [float_var_6]  ; load average
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_32
    call print_clean
    add esp, 4
    fld dword [float_var_7]  ; load geometric_mean
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_33
    call print_clean
    add esp, 4
    fld dword [float_var_8]  ; load harmonic_mean
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_34
    call print
    add esp, 4
    push msg_35
    call print
    add esp, 4
; let squares_sum:num = a * a + b * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_0]  ; load a
    fmulp
    fld dword [float_var_1]  ; load b
    fld dword [float_var_1]  ; load b
    fmulp
    faddp
    fstp dword [float_var_9]  ; store squares_sum as num (float)
    push msg_36
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_37
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_38
    call print_clean
    add esp, 4
    fld dword [float_var_9]  ; load squares_sum
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let difference_squared:num = a - b * a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fmulp
    fstp dword [float_var_10]  ; store difference_squared as num (float)
    push msg_39
    call print_clean
    add esp, 4
    fld dword [float_var_10]  ; load difference_squared
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let sum_cubed:num = a + b * a + b * a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fmulp
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fmulp
    fstp dword [float_var_11]  ; store sum_cubed as num (float)
    push msg_40
    call print_clean
    add esp, 4
    fld dword [float_var_11]  ; load sum_cubed
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_41
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_42
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    push msg_44
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_45
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_46
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let current:num = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_12]  ; store current as num (float)
    push msg_47
    call print_clean
    add esp, 4
    fld dword [float_var_12]  ; load current
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_48
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let power:num = a * a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_0]  ; load a
    fmulp
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_13]  ; store power as num (float)
    push msg_49
    call print_clean
    add esp, 4
    fld dword [float_var_13]  ; load power
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_50
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_51
    call print
    add esp, 4
    push msg_52
    call print
    add esp, 4
    push msg_53
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_54
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_55
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let simple_interest:num = a * b / 100.000000
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fld dword [float_3]
    fdivp
    fstp dword [float_var_14]  ; store simple_interest as num (float)
    push msg_56
    call print_clean
    add esp, 4
    fld dword [float_var_14]  ; load simple_interest
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let compound_base:num = 1.000000 + b / 100.000000
    fld dword [float_4]
    fld dword [float_var_1]  ; load b
    fld dword [float_3]
    fdivp
    faddp
    fstp dword [float_var_15]  ; store compound_base as num (float)
; let compound_interest:num = a * compound_base * compound_base
    fld dword [float_var_0]  ; load a
    fld dword [float_var_15]  ; load compound_base
    fmulp
    fld dword [float_var_15]  ; load compound_base
    fmulp
    fstp dword [float_var_16]  ; store compound_interest as num (float)
    push msg_57
    call print_clean
    add esp, 4
    fld dword [float_var_16]  ; load compound_interest
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
    push msg_59
    call print
    add esp, 4
    push msg_60
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_61
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_62
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let area:num = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_17]  ; store area as num (float)
    push msg_63
    call print_clean
    add esp, 4
    fld dword [float_var_17]  ; load area
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_64
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let perimeter:num = 2.000000 * a + b
    fld dword [float_0]
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fmulp
    fstp dword [float_var_18]  ; store perimeter as num (float)
    push msg_65
    call print_clean
    add esp, 4
    fld dword [float_var_18]  ; load perimeter
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_66
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let diagonal:num = a * a + b * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_0]  ; load a
    fmulp
    fld dword [float_var_1]  ; load b
    fld dword [float_var_1]  ; load b
    fmulp
    faddp
    fstp dword [float_var_19]  ; store diagonal as num (float)
    push msg_67
    call print_clean
    add esp, 4
    fld dword [float_var_19]  ; load diagonal
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_64
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_68
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_69
    call print
    add esp, 4
    push msg_70
    call print
    add esp, 4
    push msg_71
    call print
    add esp, 4
    push msg_72
    call print
    add esp, 4
    push msg_73
    call print
    add esp, 4
    push msg_74
    call print
    add esp, 4
    push msg_75
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_76
    call print
    add esp, 4
    push msg_77
    call print
    add esp, 4
    push msg_78
    call print
    add esp, 4
    push msg_79
    call print
    add esp, 4
    push msg_80
    call print
    add esp, 4
    push msg_81
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_82
    call print
    add esp, 4
    push msg_83
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_84
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
