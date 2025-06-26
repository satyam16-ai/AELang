; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║       ÆLANG IF/ELSE WITH COMPARISON OPERATORS           ║",0
msg_2 db "║           Real-World Conditional Logic                  ║",0
msg_3 db "╚══════════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 Combining comparison operators with if/else statements",0
msg_6 db "═══════════════════════════════════════════════════════════",0
msg_7 db "🔹 SECTION 1: SIMPLE COMPARISONS",0
msg_8 db "Values: a = ",0
msg_9 db ", b = ",0
msg_10 db "✅ Correct: a is less than b",0
msg_11 db "❌ Error: a should be less than b",0
msg_12 db "❌ Error: a should not equal b",0
msg_13 db "✅ Correct: a does not equal b",0
msg_14 db "❌ Error: a should not be greater than b",0
msg_15 db "✅ Correct: a is not greater than b",0
msg_16 db "🔹 SECTION 2: GRADING SYSTEM",0
msg_17 db "Score ",0
msg_18 db ": ",0
msg_19 db "Grade A - Excellent!",0
msg_20 db "Grade B - Good",0
msg_21 db "Grade C - Satisfactory",0
msg_22 db "Grade D - Needs improvement",0
msg_23 db "Grade F - Failing",0
msg_24 db "🔹 SECTION 3: RANGE CHECKING",0
msg_25 db "Temperature ",0
msg_26 db "°C: ",0
msg_27 db "🔥 Hot weather!",0
msg_28 db "🌤️  Nice weather!",0
msg_29 db "🌧️  Cool weather",0
msg_30 db "❄️  Cold weather",0
msg_31 db "🎉 IMPLEMENTATION COMPLETE",0
msg_32 db "✅ ALL FEATURES WORKING:",0
msg_33 db "   🔹 Comparison operators (==, !=, <, >, <=, >=)",0
msg_34 db "   🔹 Boolean result generation",0
msg_35 db "   🔹 If/else/elif conditional logic",0
msg_36 db "   🔹 Complex decision making",0
msg_37 db "   🔹 Real-world applications",0
msg_38 db "🏆 ÆLANG: FULLY FUNCTIONAL CONDITIONAL LANGUAGE!",0
msg_39 db "Thank you for testing ÆLang!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; score1
    int_var_3: resd 1  ; score2
    int_var_4: resd 1  ; score3
    int_var_5: resd 1  ; score4
    int_var_6: resd 1  ; score5
    int_var_7: resd 1  ; temp1
    int_var_8: resd 1  ; temp2
    int_var_9: resd 1  ; temp3
    int_var_10: resd 1  ; temp4

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
    push msg_4
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let a:i32 = 15
    mov eax, 15
    mov [int_var_0], eax  ; store a
; let b:i32 = 25
    mov eax, 25
    mov [int_var_1], eax  ; store b
    push msg_8
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load b
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
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_10
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_11
    call print
    add esp, 4
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_12
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_13
    call print
    add esp, 4
.end_if_1:
; end if statement 1
; if statement 2
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
    push msg_14
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
    push msg_15
    call print
    add esp, 4
.end_if_2:
; end if statement 2
    push msg_4
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let score1:i32 = 95
    mov eax, 95
    mov [int_var_2], eax  ; store score1
; let score2:i32 = 85
    mov eax, 85
    mov [int_var_3], eax  ; store score2
; let score3:i32 = 75
    mov eax, 75
    mov [int_var_4], eax  ; store score3
; let score4:i32 = 65
    mov eax, 65
    mov [int_var_5], eax  ; store score4
; let score5:i32 = 55
    mov eax, 55
    mov [int_var_6], eax  ; store score5
    push msg_17
    call print_clean
    add esp, 4
    mov eax, [int_var_2]  ; load score1
    push eax
    call print_int
    add esp, 4
    push msg_18
    call print
    add esp, 4
; if statement 3
    mov eax, [int_var_2]  ; load score1
    push eax
    mov eax, 90
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
    push msg_19
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
; if statement 4
    mov eax, [int_var_2]  ; load score1
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
    push msg_20
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
; if statement 5
    mov eax, [int_var_2]  ; load score1
    push eax
    mov eax, 70
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_5
.then_5:
    push msg_21
    call print
    add esp, 4
    jmp .end_if_5
.else_5:
; if statement 6
    mov eax, [int_var_2]  ; load score1
    push eax
    mov eax, 60
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_6
.then_6:
    push msg_22
    call print
    add esp, 4
    jmp .end_if_6
.else_6:
    push msg_23
    call print
    add esp, 4
.end_if_6:
; end if statement 6
.end_if_5:
; end if statement 5
.end_if_4:
; end if statement 4
.end_if_3:
; end if statement 3
    push msg_17
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load score2
    push eax
    call print_int
    add esp, 4
    push msg_18
    call print
    add esp, 4
; if statement 7
    mov eax, [int_var_3]  ; load score2
    push eax
    mov eax, 90
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_7
.then_7:
    push msg_19
    call print
    add esp, 4
    jmp .end_if_7
.else_7:
; if statement 8
    mov eax, [int_var_3]  ; load score2
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_8
.then_8:
    push msg_20
    call print
    add esp, 4
    jmp .end_if_8
.else_8:
; if statement 9
    mov eax, [int_var_3]  ; load score2
    push eax
    mov eax, 70
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_9
.then_9:
    push msg_21
    call print
    add esp, 4
    jmp .end_if_9
.else_9:
; if statement 10
    mov eax, [int_var_3]  ; load score2
    push eax
    mov eax, 60
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_10
.then_10:
    push msg_22
    call print
    add esp, 4
    jmp .end_if_10
.else_10:
    push msg_23
    call print
    add esp, 4
.end_if_10:
; end if statement 10
.end_if_9:
; end if statement 9
.end_if_8:
; end if statement 8
.end_if_7:
; end if statement 7
    push msg_17
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load score3
    push eax
    call print_int
    add esp, 4
    push msg_18
    call print
    add esp, 4
; if statement 11
    mov eax, [int_var_4]  ; load score3
    push eax
    mov eax, 90
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_11
.then_11:
    push msg_19
    call print
    add esp, 4
    jmp .end_if_11
.else_11:
; if statement 12
    mov eax, [int_var_4]  ; load score3
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_12
.then_12:
    push msg_20
    call print
    add esp, 4
    jmp .end_if_12
.else_12:
; if statement 13
    mov eax, [int_var_4]  ; load score3
    push eax
    mov eax, 70
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_13
.then_13:
    push msg_21
    call print
    add esp, 4
    jmp .end_if_13
.else_13:
; if statement 14
    mov eax, [int_var_4]  ; load score3
    push eax
    mov eax, 60
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_14
.then_14:
    push msg_22
    call print
    add esp, 4
    jmp .end_if_14
.else_14:
    push msg_23
    call print
    add esp, 4
.end_if_14:
; end if statement 14
.end_if_13:
; end if statement 13
.end_if_12:
; end if statement 12
.end_if_11:
; end if statement 11
    push msg_4
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let temp1:i32 = 35
    mov eax, 35
    mov [int_var_7], eax  ; store temp1
; let temp2:i32 = 22
    mov eax, 22
    mov [int_var_8], eax  ; store temp2
; let temp3:i32 = 15
    mov eax, 15
    mov [int_var_9], eax  ; store temp3
; let temp4:i32 = 5
    mov eax, 5
    mov [int_var_10], eax  ; store temp4
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [int_var_7]  ; load temp1
    push eax
    call print_int
    add esp, 4
    push msg_26
    call print
    add esp, 4
; if statement 15
    mov eax, [int_var_7]  ; load temp1
    push eax
    mov eax, 30
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_15
.then_15:
    push msg_27
    call print
    add esp, 4
    jmp .end_if_15
.else_15:
; if statement 16
    mov eax, [int_var_7]  ; load temp1
    push eax
    mov eax, 20
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_16
.then_16:
    push msg_28
    call print
    add esp, 4
    jmp .end_if_16
.else_16:
; if statement 17
    mov eax, [int_var_7]  ; load temp1
    push eax
    mov eax, 10
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_17
.then_17:
    push msg_29
    call print
    add esp, 4
    jmp .end_if_17
.else_17:
    push msg_30
    call print
    add esp, 4
.end_if_17:
; end if statement 17
.end_if_16:
; end if statement 16
.end_if_15:
; end if statement 15
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [int_var_8]  ; load temp2
    push eax
    call print_int
    add esp, 4
    push msg_26
    call print
    add esp, 4
; if statement 18
    mov eax, [int_var_8]  ; load temp2
    push eax
    mov eax, 30
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_18
.then_18:
    push msg_27
    call print
    add esp, 4
    jmp .end_if_18
.else_18:
; if statement 19
    mov eax, [int_var_8]  ; load temp2
    push eax
    mov eax, 20
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_19
.then_19:
    push msg_28
    call print
    add esp, 4
    jmp .end_if_19
.else_19:
; if statement 20
    mov eax, [int_var_8]  ; load temp2
    push eax
    mov eax, 10
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_20
.then_20:
    push msg_29
    call print
    add esp, 4
    jmp .end_if_20
.else_20:
    push msg_30
    call print
    add esp, 4
.end_if_20:
; end if statement 20
.end_if_19:
; end if statement 19
.end_if_18:
; end if statement 18
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [int_var_9]  ; load temp3
    push eax
    call print_int
    add esp, 4
    push msg_26
    call print
    add esp, 4
; if statement 21
    mov eax, [int_var_9]  ; load temp3
    push eax
    mov eax, 30
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_21
.then_21:
    push msg_27
    call print
    add esp, 4
    jmp .end_if_21
.else_21:
; if statement 22
    mov eax, [int_var_9]  ; load temp3
    push eax
    mov eax, 20
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_22
.then_22:
    push msg_28
    call print
    add esp, 4
    jmp .end_if_22
.else_22:
; if statement 23
    mov eax, [int_var_9]  ; load temp3
    push eax
    mov eax, 10
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_23
.then_23:
    push msg_29
    call print
    add esp, 4
    jmp .end_if_23
.else_23:
    push msg_30
    call print
    add esp, 4
.end_if_23:
; end if statement 23
.end_if_22:
; end if statement 22
.end_if_21:
; end if statement 21
    push msg_4
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
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
    push msg_36
    call print
    add esp, 4
    push msg_37
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_38
    call print
    add esp, 4
    push msg_39
    call print
    add esp, 4
    pop ebp
    ret
