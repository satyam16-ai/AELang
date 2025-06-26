; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║          ÆLANG IF/ELSE/ELIF STATEMENT DEMONSTRATION      ║",0
msg_2 db "║           Conditional Logic and Control Flow            ║",0
msg_3 db "╚══════════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 Control Flow Features:",0
msg_6 db "   • if statements with boolean conditions",0
msg_7 db "   • else statements for alternative execution",0
msg_8 db "   • elif statements for chained conditions",0
msg_9 db "   • nested if/else statements",0
msg_10 db "   • complex boolean expressions",0
msg_11 db "═══════════════════════════════════════════════════════════",0
msg_12 db "🔹 SECTION 1: BASIC IF STATEMENT",0
msg_13 db "Testing number: ",0
msg_14 db "✅ Number is positive!",0
msg_15 db "   Executing then block...",0
msg_16 db "✅ Basic if statement completed",0
msg_17 db "🔹 SECTION 2: IF-ELSE STATEMENT",0
msg_18 db "📈 Number is even!",0
msg_19 db "📉 Number is odd!",0
msg_20 db "   Executing else block...",0
msg_21 db "✅ If-else statement completed",0
msg_22 db "🔹 SECTION 3: IF-ELIF-ELSE CHAIN",0
msg_23 db "Student grade: ",0
msg_24 db "🌟 Excellent work! Grade A",0
msg_25 db "   Outstanding performance!",0
msg_26 db "👍 Good job! Grade B",0
msg_27 db "   Above average work!",0
msg_28 db "✅ Passing grade! Grade C",0
msg_29 db "   Satisfactory work!",0
msg_30 db "❌ Needs improvement! Grade F",0
msg_31 db "   Additional study required!",0
msg_32 db "✅ If-elif-else chain completed",0
msg_33 db "🔹 SECTION 4: NESTED IF STATEMENTS",0
msg_34 db "🔐 Access Control System:",0
msg_35 db "   Has Access: ",0
msg_36 db "   Is Admin: ",0
msg_37 db "   Is Authenticated: ",0
msg_38 db "🚪 Access granted to system",0
msg_39 db "   👑 Admin privileges enabled",0
msg_40 db "   📝 Full system access granted",0
msg_41 db "   👤 Standard user privileges",0
msg_42 db "   ✅ User authenticated successfully",0
msg_43 db "   📊 Limited system access granted",0
msg_44 db "   ❌ Authentication required",0
msg_45 db "🚫 Access denied to system",0
msg_46 db "   Contact administrator for access",0
msg_47 db "✅ Nested if statements completed",0
msg_48 db "🔹 SECTION 5: COMPLEX CONDITIONS",0
msg_49 db "Temperature: ",0
msg_50 db " degrees",0
msg_51 db "🔥 It's hot outside!",0
msg_52 db "   Recommended: Stay hydrated",0
msg_53 db "🌤️  It's warm and pleasant!",0
msg_54 db "   Recommended: Perfect weather for activities",0
msg_55 db "❄️  It's cold outside!",0
msg_56 db "   Recommended: Dress warmly",0
msg_57 db "🌡️  Temperature is moderate",0
msg_58 db "   Recommended: Comfortable conditions",0
msg_59 db "✅ Complex conditions completed",0
msg_60 db "🎉 IF/ELSE/ELIF DEMONSTRATION SUMMARY",0
msg_61 db "✅ FEATURES DEMONSTRATED:",0
msg_62 db "   🔹 Basic if statements with boolean conditions",0
msg_63 db "   🔹 If-else statements for binary choices",0
msg_64 db "   🔹 If-elif-else chains for multiple conditions",0
msg_65 db "   🔹 Nested if statements for complex logic",0
msg_66 db "   🔹 Boolean variable evaluation in conditions",0
msg_67 db "   🔹 Proper code block execution",0
msg_68 db "🚀 TECHNICAL ACHIEVEMENTS:",0
msg_69 db "   📝 Native conditional statement support",0
msg_70 db "   🔧 Proper assembly code generation",0
msg_71 db "   🎯 Accurate condition evaluation",0
msg_72 db "   🏗️  Nested statement support",0
msg_73 db "   💯 Production-ready control flow",0
msg_74 db "🏆 ÆLANG IF/ELSE/ELIF: IMPLEMENTATION COMPLETE!",0
msg_75 db "   Perfect for decision making and program flow control.",0
msg_76 db "Thank you for testing ÆLang Control Flow!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; is_positive
    int_var_1: resd 1  ; number
    int_var_2: resd 1  ; is_even
    int_var_3: resd 1  ; test_num
    int_var_4: resd 1  ; grade
    int_var_5: resd 1  ; is_excellent
    int_var_6: resd 1  ; is_good
    int_var_7: resd 1  ; is_passing
    int_var_8: resd 1  ; has_access
    int_var_9: resd 1  ; is_admin
    int_var_10: resd 1  ; is_authenticated
    int_var_11: resd 1  ; temp
    int_var_12: resd 1  ; is_hot
    int_var_13: resd 1  ; is_warm
    int_var_14: resd 1  ; is_cold

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
extern print_bool
extern print_bool_clean
extern read_int
extern read_bool_safe
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
; let is_positive:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store is_positive (bool)
; let number:i32 = 42
    mov eax, 42
    mov [int_var_1], eax  ; store number
    push msg_13
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load number
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_0]  ; load is_positive
    cmp eax, 0
    je .else_0
.then_0:
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
.end_if_0:
; end if statement 0
    push msg_16
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let is_even:bool = 0
    mov eax, 0
    mov [int_var_2], eax  ; store is_even (bool)
; let test_num:i32 = 7
    mov eax, 7
    mov [int_var_3], eax  ; store test_num
    push msg_13
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load test_num
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 1
    mov eax, [int_var_2]  ; load is_even
    cmp eax, 0
    je .else_1
.then_1:
    push msg_18
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_19
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_21
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let grade:i32 = 85
    mov eax, 85
    mov [int_var_4], eax  ; store grade
; let is_excellent:bool = 1
    mov eax, 1
    mov [int_var_5], eax  ; store is_excellent (bool)
; let is_good:bool = 0
    mov eax, 0
    mov [int_var_6], eax  ; store is_good (bool)
; let is_passing:bool = 1
    mov eax, 1
    mov [int_var_7], eax  ; store is_passing (bool)
    push msg_23
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load grade
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 2
    mov eax, [int_var_5]  ; load is_excellent
    cmp eax, 0
    je .else_2
.then_2:
    push msg_24
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
; if statement 3
    mov eax, [int_var_6]  ; load is_good
    cmp eax, 0
    je .else_3
.then_3:
    push msg_26
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
; if statement 4
    mov eax, [int_var_7]  ; load is_passing
    cmp eax, 0
    je .else_4
.then_4:
    push msg_28
    call print
    add esp, 4
    push msg_29
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
    push msg_30
    call print
    add esp, 4
    push msg_31
    call print
    add esp, 4
.end_if_4:
; end if statement 4
.end_if_3:
; end if statement 3
.end_if_2:
; end if statement 2
    push msg_32
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_33
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let has_access:bool = 1
    mov eax, 1
    mov [int_var_8], eax  ; store has_access (bool)
; let is_admin:bool = 0
    mov eax, 0
    mov [int_var_9], eax  ; store is_admin (bool)
; let is_authenticated:bool = 1
    mov eax, 1
    mov [int_var_10], eax  ; store is_authenticated (bool)
    push msg_34
    call print
    add esp, 4
    push msg_35
    call print_clean
    add esp, 4
    mov eax, [int_var_8]  ; load has_access
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_36
    call print_clean
    add esp, 4
    mov eax, [int_var_9]  ; load is_admin
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_37
    call print_clean
    add esp, 4
    mov eax, [int_var_10]  ; load is_authenticated
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 5
    mov eax, [int_var_8]  ; load has_access
    cmp eax, 0
    je .else_5
.then_5:
    push msg_38
    call print
    add esp, 4
; if statement 6
    mov eax, [int_var_9]  ; load is_admin
    cmp eax, 0
    je .else_6
.then_6:
    push msg_39
    call print
    add esp, 4
    push msg_40
    call print
    add esp, 4
    jmp .end_if_6
.else_6:
    push msg_41
    call print
    add esp, 4
; if statement 7
    mov eax, [int_var_10]  ; load is_authenticated
    cmp eax, 0
    je .else_7
.then_7:
    push msg_42
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    jmp .end_if_7
.else_7:
    push msg_44
    call print
    add esp, 4
.end_if_7:
; end if statement 7
.end_if_6:
; end if statement 6
    jmp .end_if_5
.else_5:
    push msg_45
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
.end_if_5:
; end if statement 5
    push msg_47
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_48
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let temp:i32 = 25
    mov eax, 25
    mov [int_var_11], eax  ; store temp
; let is_hot:bool = 0
    mov eax, 0
    mov [int_var_12], eax  ; store is_hot (bool)
; let is_warm:bool = 1
    mov eax, 1
    mov [int_var_13], eax  ; store is_warm (bool)
; let is_cold:bool = 0
    mov eax, 0
    mov [int_var_14], eax  ; store is_cold (bool)
    push msg_49
    call print_clean
    add esp, 4
    mov eax, [int_var_11]  ; load temp
    push eax
    call print_int
    add esp, 4
    push msg_50
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 8
    mov eax, [int_var_12]  ; load is_hot
    cmp eax, 0
    je .else_8
.then_8:
    push msg_51
    call print
    add esp, 4
    push msg_52
    call print
    add esp, 4
    jmp .end_if_8
.else_8:
; if statement 9
    mov eax, [int_var_13]  ; load is_warm
    cmp eax, 0
    je .else_9
.then_9:
    push msg_53
    call print
    add esp, 4
    push msg_54
    call print
    add esp, 4
    jmp .end_if_9
.else_9:
; if statement 10
    mov eax, [int_var_14]  ; load is_cold
    cmp eax, 0
    je .else_10
.then_10:
    push msg_55
    call print
    add esp, 4
    push msg_56
    call print
    add esp, 4
    jmp .end_if_10
.else_10:
    push msg_57
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
.end_if_10:
; end if statement 10
.end_if_9:
; end if statement 9
.end_if_8:
; end if statement 8
    push msg_59
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_60
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_61
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
    push msg_71
    call print
    add esp, 4
    push msg_72
    call print
    add esp, 4
    push msg_73
    call print
    add esp, 4
    push msg_4
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
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
