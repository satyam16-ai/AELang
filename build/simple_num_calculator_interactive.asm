; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "═══════════════════════════",0
msg_1 db "  ÆLang num Type Calculator",0
msg_2 db "",0
msg_3 db "🔢 This calculator demonstrates:",0
msg_4 db "   • Interactive num type input",0
msg_5 db "   • Universal numeric handling",0
msg_6 db "   • Real-time calculations",0
msg_7 db "Enter first number: ",0
msg_8 db "Enter second number: ",0
msg_9 db "Your inputs:",0
msg_10 db "  First:  ",0
msg_11 db "  Second: ",0
msg_12 db "Basic Operations:",0
msg_13 db "─────────────────",0
msg_14 db "Addition: ",0
msg_15 db "Subtraction: ",0
msg_16 db "Multiplication: ",0
msg_17 db "Division: ",0
msg_18 db "✅ SUCCESS: num type input and arithmetic completed!",0
msg_19 db "🎯 ÆLang's universal num type handles both integers",0
msg_20 db "   and decimals seamlessly through user input!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; sum
    float_var_3: resd 1  ; diff
    float_var_4: resd 1  ; prod
    float_var_5: resd 1  ; quot

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
    push msg_0
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
    push msg_2
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
; let a:num = read_num()
    call read_num
    fstp dword [float_var_0]  ; store a as num (float)
    push msg_8
    call print
    add esp, 4
; let b:num = read_num()
    call read_num
    fstp dword [float_var_1]  ; store b as num (float)
    push msg_2
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
    fld dword [float_var_0]  ; load a
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_11
    call print
    add esp, 4
    fld dword [float_var_1]  ; load b
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_2
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let sum:num = a + b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fstp dword [float_var_2]  ; store sum as num (float)
    push msg_14
    call print
    add esp, 4
    fld dword [float_var_2]  ; load sum
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let diff:num = a - b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fsubp
    fstp dword [float_var_3]  ; store diff as num (float)
    push msg_15
    call print
    add esp, 4
    fld dword [float_var_3]  ; load diff
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let prod:num = a * b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fstp dword [float_var_4]  ; store prod as num (float)
    push msg_16
    call print
    add esp, 4
    fld dword [float_var_4]  ; load prod
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
; let quot:num = a / b
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fdivp
    fstp dword [float_var_5]  ; store quot as num (float)
    push msg_17
    call print
    add esp, 4
    fld dword [float_var_5]  ; load quot
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_2
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
    pop ebp
    ret
