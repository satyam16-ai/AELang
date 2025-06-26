; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║           ÆLANG COMPARISON OPERATORS TEST SUITE         ║",0
msg_2 db "║              Complete Validation & Testing              ║",0
msg_3 db "╚══════════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🔍 Testing all comparison operators: ==, !=, <, >, <=, >=",0
msg_6 db "═══════════════════════════════════════════════════════════",0
msg_7 db "Test Values:",0
msg_8 db "a = ",0
msg_9 db ", b = ",0
msg_10 db ", c = ",0
msg_11 db ", d = ",0
msg_12 db "🔹 TESTING EQUALITY OPERATOR (==)",0
msg_13 db "─────────────────────────────────────",0
msg_14 db "Test 1: a == c (10 == 10)",0
msg_15 db "Expected: true, Actual: ",0
msg_16 db "✅ PASS",0
msg_17 db "❌ FAIL",0
msg_18 db "Test 2: a == b (10 == 20)",0
msg_19 db "Expected: false, Actual: ",0
msg_20 db "🔹 TESTING NOT EQUAL OPERATOR (!=)",0
msg_21 db "Test 3: a != b (10 != 20)",0
msg_22 db "Test 4: a != c (10 != 10)",0
msg_23 db "🔹 TESTING LESS THAN OPERATOR (<)",0
msg_24 db "Test 5: a < b (10 < 20)",0
msg_25 db "Test 6: b < a (20 < 10)",0
msg_26 db "Test 7: a < c (10 < 10)",0
msg_27 db "🔹 TESTING GREATER THAN OPERATOR (>)",0
msg_28 db "Test 8: b > a (20 > 10)",0
msg_29 db "Test 9: a > b (10 > 20)",0
msg_30 db "Test 10: a > c (10 > 10)",0
msg_31 db "🔹 TESTING LESS THAN OR EQUAL OPERATOR (<=)",0
msg_32 db "─────────────────────────────────────────────",0
msg_33 db "Test 11: a <= b (10 <= 20)",0
msg_34 db "Test 12: a <= c (10 <= 10)",0
msg_35 db "Test 13: b <= a (20 <= 10)",0
msg_36 db "🔹 TESTING GREATER THAN OR EQUAL OPERATOR (>=)",0
msg_37 db "─────────────────────────────────────────────────",0
msg_38 db "Test 14: b >= a (20 >= 10)",0
msg_39 db "Test 15: a >= c (10 >= 10)",0
msg_40 db "Test 16: a >= b (10 >= 20)",0
msg_41 db "🔹 TESTING EDGE CASES",0
msg_42 db "─────────────────────",0
msg_43 db "Test 17: zero == 0",0
msg_44 db "Test 18: 0 < a (0 < 10)",0
msg_45 db "🔹 TESTING COMPLEX EXPRESSIONS",0
msg_46 db "─────────────────────────────",0
msg_47 db "Test 19: Complex if statement with multiple conditions",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; c
    int_var_3: resd 1  ; d
    int_var_4: resd 1  ; result1
    int_var_5: resd 1  ; result2
    int_var_6: resd 1  ; result3
    int_var_7: resd 1  ; result4
    int_var_8: resd 1  ; result5
    int_var_9: resd 1  ; result6
    int_var_10: resd 1  ; result7
    int_var_11: resd 1  ; result8
    int_var_12: resd 1  ; result9
    int_var_13: resd 1  ; result10
    int_var_14: resd 1  ; result11
    int_var_15: resd 1  ; result12
    int_var_16: resd 1  ; result13
    int_var_17: resd 1  ; result14
    int_var_18: resd 1  ; result15
    int_var_19: resd 1  ; result16
    int_var_20: resd 1  ; zero
    int_var_21: resd 1  ; result17
    int_var_22: resd 1  ; negative
    int_var_23: resd 1  ; result18

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
extern print_bool
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
; let a:i32 = 10
    mov eax, 10
    mov [int_var_0], eax  ; store a
; let b:i32 = 20
    mov eax, 20
    mov [int_var_1], eax  ; store b
; let c:i32 = 10
    mov eax, 10
    mov [int_var_2], eax  ; store c
; let d:i32 = 5
    mov eax, 5
    mov [int_var_3], eax  ; store d
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load c
    push eax
    call print_int
    add esp, 4
    push msg_11
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load d
    push eax
    call print_int
    add esp, 4
    push msg_4
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
; let result1:bool = a == c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [int_var_4], eax  ; store result1 (bool)
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load result1
    push eax
    call print_bool
    add esp, 4
; if statement 0
    mov eax, [int_var_4]  ; load result1
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_17
    call print
    add esp, 4
.end_if_0:
; end if statement 0
    push msg_4
    call print
    add esp, 4
; let result2:bool = a == b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [int_var_5], eax  ; store result2 (bool)
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load result2
    push eax
    call print_bool
    add esp, 4
; if statement 1
    mov eax, [int_var_5]  ; load result2
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_17
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_4
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let result3:bool = a != b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    mov [int_var_6], eax  ; store result3 (bool)
    push msg_21
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_6]  ; load result3
    push eax
    call print_bool
    add esp, 4
; if statement 2
    mov eax, [int_var_6]  ; load result3
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
    push msg_17
    call print
    add esp, 4
.end_if_2:
; end if statement 2
    push msg_4
    call print
    add esp, 4
; let result4:bool = a != c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    mov [int_var_7], eax  ; store result4 (bool)
    push msg_22
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_7]  ; load result4
    push eax
    call print_bool
    add esp, 4
; if statement 3
    mov eax, [int_var_7]  ; load result4
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
    push msg_17
    call print
    add esp, 4
.end_if_3:
; end if statement 3
    push msg_4
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let result5:bool = a < b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    mov [int_var_8], eax  ; store result5 (bool)
    push msg_24
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_8]  ; load result5
    push eax
    call print_bool
    add esp, 4
; if statement 4
    mov eax, [int_var_8]  ; load result5
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
    push msg_17
    call print
    add esp, 4
.end_if_4:
; end if statement 4
    push msg_4
    call print
    add esp, 4
; let result6:bool = b < a
    mov eax, [int_var_1]  ; load b
    push eax
    mov eax, [int_var_0]  ; load a
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    mov [int_var_9], eax  ; store result6 (bool)
    push msg_25
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_9]  ; load result6
    push eax
    call print_bool
    add esp, 4
; if statement 5
    mov eax, [int_var_9]  ; load result6
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_5
.then_5:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_5
.else_5:
    push msg_17
    call print
    add esp, 4
.end_if_5:
; end if statement 5
    push msg_4
    call print
    add esp, 4
; let result7:bool = a < c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    mov [int_var_10], eax  ; store result7 (bool)
    push msg_26
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_10]  ; load result7
    push eax
    call print_bool
    add esp, 4
; if statement 6
    mov eax, [int_var_10]  ; load result7
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_6
.then_6:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_6
.else_6:
    push msg_17
    call print
    add esp, 4
.end_if_6:
; end if statement 6
    push msg_4
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let result8:bool = b > a
    mov eax, [int_var_1]  ; load b
    push eax
    mov eax, [int_var_0]  ; load a
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    mov [int_var_11], eax  ; store result8 (bool)
    push msg_28
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_11]  ; load result8
    push eax
    call print_bool
    add esp, 4
; if statement 7
    mov eax, [int_var_11]  ; load result8
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_7
.then_7:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_7
.else_7:
    push msg_17
    call print
    add esp, 4
.end_if_7:
; end if statement 7
    push msg_4
    call print
    add esp, 4
; let result9:bool = a > b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    mov [int_var_12], eax  ; store result9 (bool)
    push msg_29
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_12]  ; load result9
    push eax
    call print_bool
    add esp, 4
; if statement 8
    mov eax, [int_var_12]  ; load result9
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_8
.then_8:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_8
.else_8:
    push msg_17
    call print
    add esp, 4
.end_if_8:
; end if statement 8
    push msg_4
    call print
    add esp, 4
; let result10:bool = a > c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    mov [int_var_13], eax  ; store result10 (bool)
    push msg_30
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_13]  ; load result10
    push eax
    call print_bool
    add esp, 4
; if statement 9
    mov eax, [int_var_13]  ; load result10
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_9
.then_9:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_9
.else_9:
    push msg_17
    call print
    add esp, 4
.end_if_9:
; end if statement 9
    push msg_4
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
    push msg_32
    call print
    add esp, 4
; let result11:bool = a <= b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    mov [int_var_14], eax  ; store result11 (bool)
    push msg_33
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_14]  ; load result11
    push eax
    call print_bool
    add esp, 4
; if statement 10
    mov eax, [int_var_14]  ; load result11
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_10
.then_10:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_10
.else_10:
    push msg_17
    call print
    add esp, 4
.end_if_10:
; end if statement 10
    push msg_4
    call print
    add esp, 4
; let result12:bool = a <= c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    mov [int_var_15], eax  ; store result12 (bool)
    push msg_34
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_15]  ; load result12
    push eax
    call print_bool
    add esp, 4
; if statement 11
    mov eax, [int_var_15]  ; load result12
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_11
.then_11:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_11
.else_11:
    push msg_17
    call print
    add esp, 4
.end_if_11:
; end if statement 11
    push msg_4
    call print
    add esp, 4
; let result13:bool = b <= a
    mov eax, [int_var_1]  ; load b
    push eax
    mov eax, [int_var_0]  ; load a
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    mov [int_var_16], eax  ; store result13 (bool)
    push msg_35
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_16]  ; load result13
    push eax
    call print_bool
    add esp, 4
; if statement 12
    mov eax, [int_var_16]  ; load result13
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_12
.then_12:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_12
.else_12:
    push msg_17
    call print
    add esp, 4
.end_if_12:
; end if statement 12
    push msg_4
    call print
    add esp, 4
    push msg_36
    call print
    add esp, 4
    push msg_37
    call print
    add esp, 4
; let result14:bool = b >= a
    mov eax, [int_var_1]  ; load b
    push eax
    mov eax, [int_var_0]  ; load a
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_17], eax  ; store result14 (bool)
    push msg_38
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_17]  ; load result14
    push eax
    call print_bool
    add esp, 4
; if statement 13
    mov eax, [int_var_17]  ; load result14
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_13
.then_13:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_13
.else_13:
    push msg_17
    call print
    add esp, 4
.end_if_13:
; end if statement 13
    push msg_4
    call print
    add esp, 4
; let result15:bool = a >= c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_18], eax  ; store result15 (bool)
    push msg_39
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_18]  ; load result15
    push eax
    call print_bool
    add esp, 4
; if statement 14
    mov eax, [int_var_18]  ; load result15
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_14
.then_14:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_14
.else_14:
    push msg_17
    call print
    add esp, 4
.end_if_14:
; end if statement 14
    push msg_4
    call print
    add esp, 4
; let result16:bool = a >= b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_19], eax  ; store result16 (bool)
    push msg_40
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    mov eax, [int_var_19]  ; load result16
    push eax
    call print_bool
    add esp, 4
; if statement 15
    mov eax, [int_var_19]  ; load result16
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_15
.then_15:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_15
.else_15:
    push msg_17
    call print
    add esp, 4
.end_if_15:
; end if statement 15
    push msg_4
    call print
    add esp, 4
    push msg_41
    call print
    add esp, 4
    push msg_42
    call print
    add esp, 4
; let zero:i32 = 0
    mov eax, 0
    mov [int_var_20], eax  ; store zero
; let result17:bool = zero == 0
    mov eax, [int_var_20]  ; load zero
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [int_var_21], eax  ; store result17 (bool)
    push msg_43
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_21]  ; load result17
    push eax
    call print_bool
    add esp, 4
; if statement 16
    mov eax, [int_var_21]  ; load result17
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_16
.then_16:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_16
.else_16:
    push msg_17
    call print
    add esp, 4
.end_if_16:
; end if statement 16
    push msg_4
    call print
    add esp, 4
; let negative:i32 = 0
    mov eax, 0
    mov [int_var_22], eax  ; store negative
; let result18:bool = negative < a
    mov eax, [int_var_22]  ; load negative
    push eax
    mov eax, [int_var_0]  ; load a
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    mov [int_var_23], eax  ; store result18 (bool)
    push msg_44
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_23]  ; load result18
    push eax
    call print_bool
    add esp, 4
; if statement 17
    mov eax, [int_var_23]  ; load result18
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_17
.then_17:
    push msg_16
    call print
    add esp, 4
    jmp .end_if_17
.else_17:
    push msg_17
    call print
    add esp, 4
.end_if_17:
; end if statement 17
    push msg_4
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
    pop ebp
    ret
