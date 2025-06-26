; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║        ÆLANG COMPARISON OPERATORS DEMONSTRATION          ║",0
msg_2 db "║          Boolean Results in If/Else Statements          ║",0
msg_3 db "╚══════════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 Comparison Operators:",0
msg_6 db "   • == (equal to)",0
msg_7 db "   • != (not equal to)",0
msg_8 db "   • < (less than)",0
msg_9 db "   • > (greater than)",0
msg_10 db "   • <= (less than or equal)",0
msg_11 db "   • >= (greater than or equal)",0
msg_12 db "═══════════════════════════════════════════════════════════",0
msg_13 db "🔹 SECTION 1: EQUALITY COMPARISONS",0
msg_14 db "Testing values: a = ",0
msg_15 db ", b = ",0
msg_16 db ", c = ",0
msg_17 db "✅ a == b is TRUE (10 == 10)",0
msg_18 db "❌ a == b is FALSE",0
msg_19 db "✅ a == c is TRUE",0
msg_20 db "❌ a == c is FALSE (10 != 20)",0
msg_21 db "✅ a != c is TRUE (10 != 20)",0
msg_22 db "❌ a != c is FALSE",0
msg_23 db "🔹 SECTION 2: MAGNITUDE COMPARISONS",0
msg_24 db "Testing values: x = ",0
msg_25 db ", y = ",0
msg_26 db "✅ x < y is TRUE (15 < 25)",0
msg_27 db "❌ x < y is FALSE",0
msg_28 db "✅ y > x is TRUE (25 > 15)",0
msg_29 db "❌ y > x is FALSE",0
msg_30 db "✅ x <= y is TRUE (15 <= 25)",0
msg_31 db "❌ x <= y is FALSE",0
msg_32 db "✅ x <= x is TRUE (15 <= 15)",0
msg_33 db "❌ x <= x is FALSE",0
msg_34 db "✅ y >= x is TRUE (25 >= 15)",0
msg_35 db "❌ y >= x is FALSE",0
msg_36 db "🔹 SECTION 3: COMPLEX CONDITIONAL LOGIC",0
msg_37 db "Student score: ",0
msg_38 db "🌟 Grade A - Excellent!",0
msg_39 db "👍 Grade B - Good work!",0
msg_40 db "✅ Grade C - Satisfactory",0
msg_41 db "⚠️  Grade D - Needs improvement",0
msg_42 db "❌ Grade F - Failing",0
msg_43 db "🔹 SECTION 4: RANGE CHECKING",0
msg_44 db "Temperature: ",0
msg_45 db " degrees Celsius",0
msg_46 db "🔥 It's hot outside!",0
msg_47 db "🌤️  Perfect weather!",0
msg_48 db "🌧️  Cool weather",0
msg_49 db "❄️  Cold weather",0
msg_50 db "🎉 COMPARISON OPERATORS SUMMARY",0
msg_51 db "✅ FEATURES DEMONSTRATED:",0
msg_52 db "   🔹 Equality operators (==, !=)",0
msg_53 db "   🔹 Magnitude operators (<, >, <=, >=)",0
msg_54 db "   🔹 Boolean results in if/else conditions",0
msg_55 db "   🔹 Complex conditional logic with comparisons",0
msg_56 db "   🔹 Range checking and grading systems",0
msg_57 db "🚀 TECHNICAL ACHIEVEMENTS:",0
msg_58 db "   📝 Native comparison operator support",0
msg_59 db "   🔧 Boolean result generation",0
msg_60 db "   🎯 Accurate numerical comparisons",0
msg_61 db "   🏗️  Integration with control flow",0
msg_62 db "   💯 Production-ready conditional expressions",0
msg_63 db "🏆 ÆLANG COMPARISON OPERATORS: IMPLEMENTATION COMPLETE!",0
msg_64 db "   Perfect for decision making and logical operations.",0
msg_65 db "Thank you for testing ÆLang Comparison Operators!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; c
    int_var_3: resd 1  ; x
    int_var_4: resd 1  ; y
    int_var_5: resd 1  ; score
    int_var_6: resd 1  ; temperature

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
extern print_int
extern print_bool_clean
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
    push msg_4
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
    push msg_4
    call print
    add esp, 4
; let a:i32 = 10
    mov eax, 10
    mov [int_var_0], eax  ; store a
; let b:i32 = 10
    mov eax, 10
    mov [int_var_1], eax  ; store b
; let c:i32 = 20
    mov eax, 20
    mov [int_var_2], eax  ; store c
    push msg_14
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_15
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print_clean
    add esp, 4
    mov eax, [int_var_2]  ; load c
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_17
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_18
    call print
    add esp, 4
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_19
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_20
    call print
    add esp, 4
.end_if_1:
; end if statement 1
; if statement 2
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
    push msg_21
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
    push msg_22
    call print
    add esp, 4
.end_if_2:
; end if statement 2
    push msg_4
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let x:i32 = 15
    mov eax, 15
    mov [int_var_3], eax  ; store x
; let y:i32 = 25
    mov eax, 25
    mov [int_var_4], eax  ; store y
    push msg_24
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load x
    push eax
    call print_int
    add esp, 4
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load y
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 3
    mov eax, [int_var_3]  ; load x
    push eax
    mov eax, [int_var_4]  ; load y
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
    push msg_26
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
    push msg_27
    call print
    add esp, 4
.end_if_3:
; end if statement 3
; if statement 4
    mov eax, [int_var_4]  ; load y
    push eax
    mov eax, [int_var_3]  ; load x
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
    push msg_28
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
    push msg_29
    call print
    add esp, 4
.end_if_4:
; end if statement 4
; if statement 5
    mov eax, [int_var_3]  ; load x
    push eax
    mov eax, [int_var_4]  ; load y
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_5
.then_5:
    push msg_30
    call print
    add esp, 4
    jmp .end_if_5
.else_5:
    push msg_31
    call print
    add esp, 4
.end_if_5:
; end if statement 5
; if statement 6
    mov eax, [int_var_3]  ; load x
    push eax
    mov eax, [int_var_3]  ; load x
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_6
.then_6:
    push msg_32
    call print
    add esp, 4
    jmp .end_if_6
.else_6:
    push msg_33
    call print
    add esp, 4
.end_if_6:
; end if statement 6
; if statement 7
    mov eax, [int_var_4]  ; load y
    push eax
    mov eax, [int_var_3]  ; load x
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_7
.then_7:
    push msg_34
    call print
    add esp, 4
    jmp .end_if_7
.else_7:
    push msg_35
    call print
    add esp, 4
.end_if_7:
; end if statement 7
    push msg_4
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let score:i32 = 85
    mov eax, 85
    mov [int_var_5], eax  ; store score
    push msg_37
    call print_clean
    add esp, 4
    mov eax, [int_var_5]  ; load score
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 8
    mov eax, [int_var_5]  ; load score
    push eax
    mov eax, 90
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_8
.then_8:
    push msg_38
    call print
    add esp, 4
    jmp .end_if_8
.else_8:
; if statement 9
    mov eax, [int_var_5]  ; load score
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_9
.then_9:
    push msg_39
    call print
    add esp, 4
    jmp .end_if_9
.else_9:
; if statement 10
    mov eax, [int_var_5]  ; load score
    push eax
    mov eax, 70
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_10
.then_10:
    push msg_40
    call print
    add esp, 4
    jmp .end_if_10
.else_10:
; if statement 11
    mov eax, [int_var_5]  ; load score
    push eax
    mov eax, 60
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_11
.then_11:
    push msg_41
    call print
    add esp, 4
    jmp .end_if_11
.else_11:
    push msg_42
    call print
    add esp, 4
.end_if_11:
; end if statement 11
.end_if_10:
; end if statement 10
.end_if_9:
; end if statement 9
.end_if_8:
; end if statement 8
    push msg_4
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let temperature:i32 = 22
    mov eax, 22
    mov [int_var_6], eax  ; store temperature
    push msg_44
    call print_clean
    add esp, 4
    mov eax, [int_var_6]  ; load temperature
    push eax
    call print_int
    add esp, 4
    push msg_45
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 12
    mov eax, [int_var_6]  ; load temperature
    push eax
    mov eax, 30
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_12
.then_12:
    push msg_46
    call print
    add esp, 4
    jmp .end_if_12
.else_12:
; if statement 13
    mov eax, [int_var_6]  ; load temperature
    push eax
    mov eax, 20
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_13
.then_13:
    push msg_47
    call print
    add esp, 4
    jmp .end_if_13
.else_13:
; if statement 14
    mov eax, [int_var_6]  ; load temperature
    push eax
    mov eax, 10
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_14
.then_14:
    push msg_48
    call print
    add esp, 4
    jmp .end_if_14
.else_14:
    push msg_49
    call print
    add esp, 4
.end_if_14:
; end if statement 14
.end_if_13:
; end if statement 13
.end_if_12:
; end if statement 12
    push msg_4
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_50
    call print
    add esp, 4
    push msg_12
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
    push msg_4
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
    push msg_4
    call print
    add esp, 4
    push msg_63
    call print
    add esp, 4
    push msg_64
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_65
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    pop ebp
    ret
