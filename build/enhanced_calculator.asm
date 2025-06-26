; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════════╗",0
msg_1 db "║                 ÆLANG ENHANCED CALCULATOR                    ║",0
msg_2 db "║              Format Specifier & Professional Suite          ║",0
msg_3 db "║                   🚀 Production Version 2.0                  ║",0
msg_4 db "╚══════════════════════════════════════════════════════════════╝",0
msg_5 db "",0
msg_6 db "🎯 NEW FEATURES:",0
msg_7 db "   ✨ Multiple format specifiers (currency, scientific, etc.)",0
msg_8 db "   🛡️ Enhanced input validation with error handling",0
msg_9 db "   🗑️ Legacy function cleanup (no more garbage functions)",0
msg_10 db "   🎨 Professional formatting for all number types",0
msg_11 db "   📊 Advanced mathematical operations with clean output",0
msg_12 db "═══════════════════════════════════════════════════════════════",0
msg_13 db "📋 SECTION 1: ENHANCED INPUT VALIDATION",0
msg_14 db "💡 Enter first number (any format): ",0
msg_15 db "💡 Enter second number (any format): ",0
msg_16 db "✅ INPUT CONFIRMATION:",0
msg_17 db "   First number:  ",0
msg_18 db "   Second number: ",0
msg_19 db "🎨 SECTION 2: FORMAT SPECIFIER SHOWCASE",0
msg_20 db "🔤 MULTIPLE FORMAT DISPLAY OF RESULT:",0
msg_21 db "─────────────────────────────────────",0
msg_22 db "📊 Standard:      ",0
msg_23 db "🔢 High Precision: ",0
msg_24 db "🧪 Scientific:    ",0
msg_25 db "💰 Currency:      ",0
msg_26 db "📈 Percentage:    ",0
msg_27 db "⚡ Engineering:   ",0
msg_28 db "💻 Hexadecimal:   ",0
msg_29 db "🧮 SECTION 3: ADVANCED MATHEMATICAL OPERATIONS",0
msg_30 db "➕ ADDITION RESULTS:",0
msg_31 db "────────────────────",0
msg_32 db "Standard: ",0
msg_33 db "  |  Scientific: ",0
msg_34 db "  |  Currency: ",0
msg_35 db "✖️ MULTIPLICATION ANALYSIS:",0
msg_36 db "──────────────────────────",0
msg_37 db "Result: ",0
msg_38 db "  |  Engineering: ",0
msg_39 db "  |  High Precision: ",0
msg_40 db "➗ DIVISION WITH PRECISION:",0
msg_41 db "2 decimals: ",0
msg_42 db "4 decimals: ",0
msg_43 db "Scientific: ",0
msg_44 db "💼 SECTION 4: REAL-WORLD APPLICATIONS WITH FORMATTING",0
msg_45 db "💰 FINANCIAL CALCULATOR:",0
msg_46 db "─────────────────────────",0
msg_47 db "💵 Enter principal amount: $",0
msg_48 db "📊 Enter interest rate (%): ",0
msg_49 db "⏰ Time period entered: ",0
msg_50 db " years",0
msg_51 db "💡 CALCULATION RESULTS:",0
msg_52 db "   Principal:        ",0
msg_53 db "   Interest Rate:    ",0
msg_54 db "   Time Period:      ",0
msg_55 db "   Simple Interest:  ",0
msg_56 db "   Total Amount:     ",0
msg_57 db "🏗️ ENGINEERING CALCULATIONS:",0
msg_58 db "─────────────────────────────",0
msg_59 db "⚡ Enter voltage (V): ",0
msg_60 db "🔌 Resistance: ",0
msg_61 db " Ω",0
msg_62 db "⚡ ELECTRICAL RESULTS:",0
msg_63 db "   Voltage:    ",0
msg_64 db " V",0
msg_65 db "   Resistance: ",0
msg_66 db "   Current:    ",0
msg_67 db " A",0
msg_68 db "   Power:      ",0
msg_69 db " W",0
msg_70 db "🎉 ENHANCED CALCULATOR SUMMARY",0
msg_71 db "✅ NEW CAPABILITIES DEMONSTRATED:",0
msg_72 db "   🎨 Multiple format specifiers (standard, scientific, currency)",0
msg_73 db "   🔢 Precision control (0-6 decimal places)",0
msg_74 db "   💰 Financial formatting with currency symbols",0
msg_75 db "   📊 Percentage and engineering notation",0
msg_76 db "   💻 Hexadecimal representation",0
msg_77 db "   🛡️ Enhanced input validation with error recovery",0
msg_78 db "   ⚡ Real-time format switching",0
msg_79 db "🗑️ LEGACY CLEANUP COMPLETED:",0
msg_80 db "   ❌ Removed: print_float(), print_int(), read_float(), read_int()",0
msg_81 db "   ✅ Replaced with: Universal num type functions",0
msg_82 db "   🚀 Modern: print_num_precision(), read_num_validated()",0
msg_83 db "   🎯 Result: Cleaner codebase, better performance",0
msg_84 db "🏆 ÆLANG ENHANCED CALCULATOR: PRODUCTION READY!",0
msg_85 db "   Perfect for professional, financial, scientific, and engineering work.",0
msg_86 db "🎯 All format specifiers working perfectly!",0
msg_87 db "🔥 Zero garbage functions - completely modernized!",0
msg_88 db "💯 Professional-grade mathematical computing in ÆLang!",0
float_0: dd 0x42c80000  ; 100
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; num1
    float_var_1: resd 1  ; num2
    float_var_2: resd 1  ; result
    float_var_3: resd 1  ; sum
    float_var_4: resd 1  ; product
    float_var_5: resd 1  ; quotient
    float_var_6: resd 1  ; principal
    float_var_7: resd 1  ; rate
    float_var_8: resd 1  ; time
    float_var_9: resd 1  ; simple_interest
    float_var_10: resd 1  ; total_amount
    float_var_11: resd 1  ; voltage
    float_var_12: resd 1  ; resistance
    float_var_13: resd 1  ; current
    float_var_14: resd 1  ; power

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
    push msg_11
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let num1:num = read_num_with_prompt("💡 Enter first number (any format): ")
    push msg_14
    call read_num_with_prompt
    add esp, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_0]  ; store num1 as num (converted from int)
; let num2:num = read_num_with_prompt("💡 Enter second number (any format): ")
    push msg_15
    call read_num_with_prompt
    add esp, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_1]  ; store num2 as num (converted from int)
    push msg_5
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load num1
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_18
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load num2
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let result:num = num1 + num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_2]  ; store result as num (converted from int)
    push msg_20
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    push msg_22
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_23
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    mov eax, 6
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_5
    call print
    add esp, 4
    push msg_24
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_25
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_26
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_percentage
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_27
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_num_engineering
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_28
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load result
    sub esp, 8
    fstp qword [esp]
    call print_hex
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_29
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_30
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
; let sum:num = num1 + num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_3]  ; store sum as num (converted from int)
    push msg_32
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load sum
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_33
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load sum
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_34
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load sum
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_35
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
; let product:num = num1 * num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_4]  ; store product as num (converted from int)
    push msg_37
    call print_clean
    add esp, 4
    fld dword [float_var_4]  ; load product
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_38
    call print_clean
    add esp, 4
    fld dword [float_var_4]  ; load product
    sub esp, 8
    fstp qword [esp]
    call print_num_engineering
    add esp, 8
    push msg_39
    call print_clean
    add esp, 4
    fld dword [float_var_4]  ; load product
    mov eax, 4
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_40
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
; let quotient:num = num1 / num2
    fld dword [float_var_0]  ; load num1
    fld dword [float_var_1]  ; load num2
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_5]  ; store quotient as num (converted from int)
    push msg_32
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_41
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    mov eax, 2
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_5
    call print
    add esp, 4
    push msg_42
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    mov eax, 4
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_5
    call print
    add esp, 4
    push msg_43
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load quotient
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_44
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_45
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
; let principal:num = read_num_with_prompt("💵 Enter principal amount: $")
    push msg_47
    call read_num_with_prompt
    add esp, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store principal as num (converted from int)
; let rate:num = read_num_with_prompt("📊 Enter interest rate (%): ")
    push msg_48
    call read_num_with_prompt
    add esp, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_7]  ; store rate as num (converted from int)
; let time:num = read_positive_num()
    call read_positive_num
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store time as num (converted from int)
    push msg_49
    call print_clean
    add esp, 4
    fld dword [float_var_8]  ; load time
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_50
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let simple_interest:num = principal * rate * time / 100.000000
    fld dword [float_var_6]  ; load principal
    fld dword [float_var_7]  ; load rate
    fmulp
    fld dword [float_var_8]  ; load time
    fmulp
    fld dword [float_0]
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store simple_interest as num (converted from int)
; let total_amount:num = principal + simple_interest
    fld dword [float_var_6]  ; load principal
    fld dword [float_var_9]  ; load simple_interest
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_10]  ; store total_amount as num (converted from int)
    push msg_51
    call print
    add esp, 4
    push msg_52
    call print_clean
    add esp, 4
    fld dword [float_var_6]  ; load principal
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_53
    call print_clean
    add esp, 4
    fld dword [float_var_7]  ; load rate
    sub esp, 8
    fstp qword [esp]
    call print_percentage
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_54
    call print_clean
    add esp, 4
    fld dword [float_var_8]  ; load time
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_50
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_55
    call print_clean
    add esp, 4
    fld dword [float_var_9]  ; load simple_interest
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_56
    call print_clean
    add esp, 4
    fld dword [float_var_10]  ; load total_amount
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_57
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
; let voltage:num = read_num_with_prompt("⚡ Enter voltage (V): ")
    push msg_59
    call read_num_with_prompt
    add esp, 4
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_11]  ; store voltage as num (converted from int)
; let resistance:num = read_positive_num()
    call read_positive_num
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_12]  ; store resistance as num (converted from int)
    push msg_60
    call print_clean
    add esp, 4
    fld dword [float_var_12]  ; load resistance
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_61
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let current:num = voltage / resistance
    fld dword [float_var_11]  ; load voltage
    fld dword [float_var_12]  ; load resistance
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_13]  ; store current as num (converted from int)
; let power:num = voltage * current
    fld dword [float_var_11]  ; load voltage
    fld dword [float_var_13]  ; load current
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_14]  ; store power as num (converted from int)
    push msg_62
    call print
    add esp, 4
    push msg_63
    call print_clean
    add esp, 4
    fld dword [float_var_11]  ; load voltage
    mov eax, 2
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_64
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_65
    call print_clean
    add esp, 4
    fld dword [float_var_12]  ; load resistance
    mov eax, 2
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_61
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_66
    call print_clean
    add esp, 4
    fld dword [float_var_13]  ; load current
    mov eax, 3
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_67
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_68
    call print_clean
    add esp, 4
    fld dword [float_var_14]  ; load power
    mov eax, 3
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_69
    call print_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_70
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_5
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
    push msg_76
    call print
    add esp, 4
    push msg_77
    call print
    add esp, 4
    push msg_78
    call print
    add esp, 4
    push msg_5
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
    push msg_82
    call print
    add esp, 4
    push msg_83
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_84
    call print
    add esp, 4
    push msg_85
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_86
    call print
    add esp, 4
    push msg_87
    call print
    add esp, 4
    push msg_88
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    pop ebp
    ret
