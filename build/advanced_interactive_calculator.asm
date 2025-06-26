; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════╗",0
msg_1 db "║     ÆLang Advanced Calculator        ║",0
msg_2 db "║   Interactive num Type Edition       ║",0
msg_3 db "╚══════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🌟 Welcome to the most advanced ÆLang calculator!",0
msg_6 db "   This calculator showcases the power of the 'num' type",0
msg_7 db "   with complete user interaction capabilities.",0
msg_8 db "🔢 Features:",0
msg_9 db "   • Universal input (integers and decimals)",0
msg_10 db "   • All arithmetic operations",0
msg_11 db "   • Advanced mathematical functions",0
msg_12 db "   • Mixed-type calculations",0
msg_13 db "   • Real-time user interaction",0
msg_14 db "═══════════════════════════════════════",0
msg_15 db "📥 INPUT PHASE",0
msg_16 db "Step 1: Enter your first number",0
msg_17 db "        (Can be integer like 42 or decimal like 3.14159)",0
msg_18 db "First number: ",0
msg_19 db "✅ Received: ",0
msg_20 db "   Stored as universal 'num' type",0
msg_21 db "Step 2: Enter your second number",0
msg_22 db "Second number: ",0
msg_23 db "🧮 BASIC ARITHMETIC OPERATIONS",0
msg_24 db "🔢 Computing all operations...",0
msg_25 db "➕ ADDITION:",0
msg_26 db "   ",0
msg_27 db " + ",0
msg_28 db " = ",0
msg_29 db "➖ SUBTRACTION:",0
msg_30 db " - ",0
msg_31 db "✖️  MULTIPLICATION:",0
msg_32 db " × ",0
msg_33 db "➗ DIVISION:",0
msg_34 db " ÷ ",0
msg_35 db "📊 ADVANCED CALCULATIONS",0
msg_36 db "🔬 Computing advanced functions...",0
msg_37 db "📈 STATISTICAL FUNCTIONS:",0
msg_38 db "   📊 Arithmetic Mean: ",0
msg_39 db "   🔢 Sum of Squares: ",0
msg_40 db "   📐 Product (Geometric): ",0
msg_41 db "🧮 ALGEBRAIC EXPRESSIONS:",0
msg_42 db "   🎯 (a + b) × (a - b): ",0
msg_43 db "   🎯 a² - b²: ",0
msg_44 db "   🎯 a ÷ (b + 1): ",0
msg_45 db "🌟 MIXED-TYPE DEMONSTRATIONS",0
msg_46 db "🧪 Mixing your input with mathematical constants...",0
msg_47 db "🥧 MATHEMATICAL CONSTANTS:",0
msg_48 db "   π × your first number: ",0
msg_49 db "   e + your second number: ",0
msg_50 db "   (a + b) ÷ φ (golden ratio): ",0
msg_51 db "🏆 CALCULATION COMPLETE",0
msg_52 db "🎉 Congratulations! All calculations completed successfully!",0
msg_53 db "📝 Summary of what was demonstrated:",0
msg_54 db "   ✅ Interactive user input with num type",0
msg_55 db "   ✅ Seamless handling of integers and floats",0
msg_56 db "   ✅ All four basic arithmetic operations",0
msg_57 db "   ✅ Advanced mathematical expressions",0
msg_58 db "   ✅ Statistical and algebraic functions",0
msg_59 db "   ✅ Mixed-type arithmetic with constants",0
msg_60 db "   ✅ Complex nested calculations",0
msg_61 db "   ✅ Real-time result display",0
msg_62 db "🚀 ÆLang's num type system capabilities:",0
msg_63 db "   🔬 Scientific computing ready",0
msg_64 db "   💰 Financial calculations capable",0
msg_65 db "   🏗️  Engineering applications suitable",0
msg_66 db "   🎓 Educational programming perfect",0
msg_67 db "   🎮 Game development math support",0
msg_68 db "💡 The universal 'num' type eliminates the need to",0
msg_69 db "   choose between integer and floating-point types,",0
msg_70 db "   making ÆLang perfect for mathematical computing!",0
msg_71 db "Thank you for using ÆLang Advanced Calculator!",0
float_0: dd 0x40000000  ; 2
float_1: dd 0x3f800000  ; 1
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; number1
    float_var_1: resd 1  ; number2
    float_var_2: resd 1  ; addition_result
    float_var_3: resd 1  ; subtraction_result
    float_var_4: resd 1  ; multiplication_result
    float_var_5: resd 1  ; division_result
    float_var_6: resd 1  ; average
    float_var_7: resd 1  ; sum_of_squares
    float_var_8: resd 1  ; geometric_mean_squared
    float_var_9: resd 1  ; expression1
    float_var_10: resd 1  ; expression2
    float_var_11: resd 1  ; expression3
    float_var_12: resd 1  ; pi
    float_var_13: resd 1  ; e
    float_var_14: resd 1  ; golden_ratio
    float_var_15: resd 1  ; with_pi
    float_var_16: resd 1  ; with_e
    float_var_17: resd 1  ; with_golden

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num

extern print
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
    push msg_4
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
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
; let number1:num = read_num()
    call read_num
    fstp dword [float_var_0]  ; store number1 as num (float)
    push msg_4
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    fld dword [float_var_0]  ; load number1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_20
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
; let number2:num = read_num()
    call read_num
    fstp dword [float_var_1]  ; store number2 as num (float)
    push msg_4
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    fld dword [float_var_1]  ; load number2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_20
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
; let addition_result:num = number1 + number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_2]  ; store addition_result as num (converted from int)
; let subtraction_result:num = number1 - number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fsubp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_3]  ; store subtraction_result as num (converted from int)
; let multiplication_result:num = number1 * number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_4]  ; store multiplication_result as num (converted from int)
; let division_result:num = number1 / number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_5]  ; store division_result as num (converted from int)
    push msg_4
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    fld dword [float_var_0]  ; load number1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_27
    call print
    add esp, 4
    fld dword [float_var_1]  ; load number2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_2]  ; load addition_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_29
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    fld dword [float_var_0]  ; load number1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_30
    call print
    add esp, 4
    fld dword [float_var_1]  ; load number2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_3]  ; load subtraction_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    fld dword [float_var_0]  ; load number1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_32
    call print
    add esp, 4
    fld dword [float_var_1]  ; load number2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_4]  ; load multiplication_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    fld dword [float_var_0]  ; load number1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_34
    call print
    add esp, 4
    fld dword [float_var_1]  ; load number2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_28
    call print
    add esp, 4
    fld dword [float_var_5]  ; load division_result
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_35
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let average:num = number1 + number2 / 2.000000
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    faddp
    fld dword [float_0]
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_6]  ; store average as num (converted from int)
; let sum_of_squares:num = number1 * number1 + number2 * number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_0]  ; load number1
    fmulp
    push eax
    fld dword [float_var_1]  ; load number2
    fld dword [float_var_1]  ; load number2
    fmulp
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_7]  ; store sum_of_squares as num (converted from int)
; let geometric_mean_squared:num = number1 * number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store geometric_mean_squared as num (converted from int)
    push msg_37
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_38
    call print
    add esp, 4
    fld dword [float_var_6]  ; load average
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_39
    call print
    add esp, 4
    fld dword [float_var_7]  ; load sum_of_squares
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_40
    call print
    add esp, 4
    fld dword [float_var_8]  ; load geometric_mean_squared
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
; let expression1:num = number1 + number2 * number1 - number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    faddp
    push eax
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fsubp
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_9]  ; store expression1 as num (converted from int)
; let expression2:num = number1 * number1 - number2 * number2
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_0]  ; load number1
    fmulp
    push eax
    fld dword [float_var_1]  ; load number2
    fld dword [float_var_1]  ; load number2
    fmulp
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_10]  ; store expression2 as num (converted from int)
; let expression3:num = number1 / number2 + 1.000000
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    fld dword [float_1]
    faddp
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_11]  ; store expression3 as num (converted from int)
    push msg_41
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_42
    call print
    add esp, 4
    fld dword [float_var_9]  ; load expression1
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    fld dword [float_var_10]  ; load expression2
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_44
    call print
    add esp, 4
    fld dword [float_var_11]  ; load expression3
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_45
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let pi:num = 3.141593
; Error: num float constant not found
    fstp dword [float_var_12]  ; store pi as num (float)
; let e:num = 2.718282
; Error: num float constant not found
    fstp dword [float_var_13]  ; store e as num (float)
; let golden_ratio:num = 1.618034
; Error: num float constant not found
    fstp dword [float_var_14]  ; store golden_ratio as num (float)
; let with_pi:num = number1 * pi
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_12]  ; load pi
    fmulp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_15]  ; store with_pi as num (converted from int)
; let with_e:num = number2 + e
    fld dword [float_var_1]  ; load number2
    fld dword [float_var_13]  ; load e
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_16]  ; store with_e as num (converted from int)
; let with_golden:num = number1 + number2 / golden_ratio
    fld dword [float_var_0]  ; load number1
    fld dword [float_var_1]  ; load number2
    faddp
    fld dword [float_var_14]  ; load golden_ratio
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_17]  ; store with_golden as num (converted from int)
    push msg_47
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_48
    call print
    add esp, 4
    fld dword [float_var_15]  ; load with_pi
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_49
    call print
    add esp, 4
    fld dword [float_var_16]  ; load with_e
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_50
    call print
    add esp, 4
    fld dword [float_var_17]  ; load with_golden
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_51
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_52
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_53
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
    push msg_4
    call print
    add esp, 4
    push msg_62
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
    push msg_66
    call print
    add esp, 4
    push msg_67
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_68
    call print
    add esp, 4
    push msg_69
    call print
    add esp, 4
    push msg_70
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_71
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    pop ebp
    ret
