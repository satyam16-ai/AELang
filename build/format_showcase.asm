; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔═══════════════════════════════════════════════════════╗",0
msg_1 db "║           ÆLang Format Specifier Showcase            ║",0
msg_2 db "║               🎨 All Features Working!               ║",0
msg_3 db "╚═══════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🚀 DEMONSTRATION: Multiple Format Display",0
msg_6 db "─────────────────────────────────────────",0
msg_7 db "💡 Test Value: 1234.56",0
msg_8 db "━━━━━━━━━━━━━━━━━━━━━━━━",0
msg_9 db "📊 Standard:        ",0
msg_10 db "🔢 High Precision:  ",0
msg_11 db "🧪 Scientific:     ",0
msg_12 db "💰 Currency:       ",0
msg_13 db "📈 Percentage:     ",0
msg_14 db "⚡ Engineering:    ",0
msg_15 db "💻 Hexadecimal:    ",0
msg_16 db "🔬 PRECISION TESTING:",0
msg_17 db "────────────────────",0
msg_18 db "💡 Pi Example: 3.14159265",0
msg_19 db "1 decimal:  ",0
msg_20 db "2 decimals: ",0
msg_21 db "4 decimals: ",0
msg_22 db "6 decimals: ",0
msg_23 db "📊 LARGE NUMBER FORMATTING:",0
msg_24 db "──────────────────────────",0
msg_25 db "💡 Large Value: 1,500,000",0
msg_26 db "Standard:     ",0
msg_27 db "Scientific:   ",0
msg_28 db "Engineering:  ",0
msg_29 db "Currency:     ",0
msg_30 db "🔬 SMALL NUMBER FORMATTING:",0
msg_31 db "💡 Small Value: 0.00123",0
msg_32 db "High Precision: ",0
msg_33 db "💰 FINANCIAL CALCULATIONS:",0
msg_34 db "─────────────────────────",0
msg_35 db "Principal:        ",0
msg_36 db "Interest Rate:    ",0
msg_37 db "Time Period:      ",0
msg_38 db " years",0
msg_39 db "Simple Interest:  ",0
msg_40 db "Total Amount:     ",0
msg_41 db "✅ SUCCESS: All format specifiers working perfectly!",0
msg_42 db "🎯 ÆLang enhanced calculator features:",0
msg_43 db "   • Multiple format specifiers (currency, scientific, etc.)",0
msg_44 db "   • Precision control (1-6 decimal places)",0
msg_45 db "   • Engineering notation for large numbers",0
msg_46 db "   • Professional financial formatting",0
msg_47 db "   • Clean mathematical display",0
msg_48 db "🏆 PRODUCTION-READY MATHEMATICAL COMPUTING IN ÆLANG!",0
msg_49 db "║             🔥 Format Specifiers Complete!           ║",0
float_0: dd 0x42c80000  ; 100
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; test_value
    float_var_1: resd 1  ; precise_val
    float_var_2: resd 1  ; large_num
    float_var_3: resd 1  ; small_num
    float_var_4: resd 1  ; principal
    float_var_5: resd 1  ; rate
    float_var_6: resd 1  ; time
    float_var_7: resd 1  ; interest
    float_var_8: resd 1  ; total

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
    push msg_4
    call print
    add esp, 4
; let test_value:num = 1234.560000
; Error: num float constant not found
    fstp dword [float_var_0]  ; store test_value as num (float)
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_10
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    mov eax, 4
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_12
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_13
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_percentage
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_14
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_num_engineering
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_15
    call print_clean
    add esp, 4
    fld dword [float_var_0]  ; load test_value
    sub esp, 8
    fstp qword [esp]
    call print_hex
    add esp, 8
    push msg_4
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
; let precise_val:num = 3.141593
; Error: num float constant not found
    fstp dword [float_var_1]  ; store precise_val as num (float)
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load precise_val
    mov eax, 1
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_20
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load precise_val
    mov eax, 2
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load precise_val
    mov eax, 4
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_22
    call print_clean
    add esp, 4
    fld dword [float_var_1]  ; load precise_val
    mov eax, 6
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
; let large_num:num = 1500000.000000
; Error: num float constant not found
    fstp dword [float_var_2]  ; store large_num as num (float)
    push msg_25
    call print
    add esp, 4
    push msg_26
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load large_num
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_27
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load large_num
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_28
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load large_num
    sub esp, 8
    fstp qword [esp]
    call print_num_engineering
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_29
    call print_clean
    add esp, 4
    fld dword [float_var_2]  ; load large_num
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_30
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
; let small_num:num = 0.001230
; Error: num float constant not found
    fstp dword [float_var_3]  ; store small_num as num (float)
    push msg_31
    call print
    add esp, 4
    push msg_26
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load small_num
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_27
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load small_num
    sub esp, 8
    fstp qword [esp]
    call print_num_scientific
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_32
    call print_clean
    add esp, 4
    fld dword [float_var_3]  ; load small_num
    mov eax, 5
    push eax
    sub esp, 8
    fstp qword [esp]
    call print_num_precision
    add esp, 12
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
    push msg_34
    call print
    add esp, 4
; let principal:num = 5000.000000
; Error: num float constant not found
    fstp dword [float_var_4]  ; store principal as num (float)
; let rate:num = 3.500000
; Error: num float constant not found
    fstp dword [float_var_5]  ; store rate as num (float)
; let time:num = 2.000000
; Error: num float constant not found
    fstp dword [float_var_6]  ; store time as num (float)
; let interest:num = principal * rate * time / 100.000000
    fld dword [float_var_4]  ; load principal
    fld dword [float_var_5]  ; load rate
    fmulp
    fld dword [float_var_6]  ; load time
    fmulp
    fld dword [float_0]
    fdivp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_7]  ; store interest as num (converted from int)
; let total:num = principal + interest
    fld dword [float_var_4]  ; load principal
    fld dword [float_var_7]  ; load interest
    faddp
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp dword [float_var_8]  ; store total as num (converted from int)
    push msg_35
    call print_clean
    add esp, 4
    fld dword [float_var_4]  ; load principal
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_36
    call print_clean
    add esp, 4
    fld dword [float_var_5]  ; load rate
    sub esp, 8
    fstp qword [esp]
    call print_percentage
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_37
    call print_clean
    add esp, 4
    fld dword [float_var_6]  ; load time
    sub esp, 8
    fstp qword [esp]
    call print_num
    add esp, 8
    push msg_38
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_39
    call print_clean
    add esp, 4
    fld dword [float_var_7]  ; load interest
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_40
    call print_clean
    add esp, 4
    fld dword [float_var_8]  ; load total
    sub esp, 8
    fstp qword [esp]
    call print_currency
    add esp, 8
    push msg_4
    call print
    add esp, 4
    push msg_4
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
    push msg_4
    call print
    add esp, 4
    push msg_48
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_49
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    pop ebp
    ret
