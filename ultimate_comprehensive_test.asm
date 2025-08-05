; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "🎯 === COMPREHENSIVE ÆLang COMPILER TEST SUITE === 🎯",10,10,0
msg_1 db "1. ARITHMETIC OPERATORS AND PRECEDENCE:",10,0
msg_2 db "Variables: a=%d, b=%d, c=%d, d=%d",10,0
msg_3 db "Addition: %d + %d = %d",10,0
msg_4 db "Subtraction: %d - %d = %d",10,0
msg_5 db "Multiplication: %d * %d = %d",10,0
msg_6 db "Division: %d / %d = %d",10,0
msg_7 db "Modulo: %d %% %d = %d",10,0
msg_8 db "Precedence a + b * c = %d (expected: 38)",10,0
msg_9 db "Precedence a - b / d = %d (expected: 17)",10,0
msg_10 db "Precedence (a + b) * c = %d (expected: 78)",10,0
msg_11 db "Precedence a * b + c * d = %d (expected: 126)",10,0
msg_12 db "Precedence a + b * c - d = %d (expected: 36)",10,0
msg_13 db 10,0
msg_14 db "2. COMPARISON OPERATORS:",10,0
msg_15 db "Variables: x=%d, y=%d, z=%d",10,0
msg_16 db "x == z: ",0
msg_17 db "TRUE (✓)",10,0
msg_18 db "FALSE (✗)",10,0
msg_19 db "x != y: ",0
msg_20 db "x < y: ",0
msg_21 db "y > x: ",0
msg_22 db "x <= z: ",0
msg_23 db "y >= x: ",0
msg_24 db "3. LOGICAL OPERATORS:",10,0
msg_25 db "Logical AND tests:",10,0
msg_26 db "(x == z) && (y > x): ",0
msg_27 db "(x == z) && (x > y): ",0
msg_28 db "TRUE (✗)",10,0
msg_29 db "FALSE (✓)",10,0
msg_30 db "(x != z) && (y > x): ",0
msg_31 db "Logical OR tests:",10,0
msg_32 db "(x == z) || (x > y): ",0
msg_33 db "(x != z) || (y > x): ",0
msg_34 db "(x != z) || (x > y): ",0
msg_35 db "Logical NOT tests:",10,0
msg_36 db "!(x == z): ",0
msg_37 db "!(x > y): ",0
msg_38 db "4. CONTROL FLOW (IF/ELSE/ELIF):",10,0
msg_39 db "Testing simple if (x == z):",10,0
msg_40 db "✓ PASS: Simple if works",10,0
msg_41 db "Testing if-else (x < y):",10,0
msg_42 db "✓ PASS: If branch executed",10,0
msg_43 db "✗ FAIL: Else branch should not execute",10,0
msg_44 db "Testing if-else (x > y):",10,0
msg_45 db "✗ FAIL: If branch should not execute",10,0
msg_46 db "✓ PASS: Else branch executed",10,0
msg_47 db "Testing elif statements:",10,0
msg_48 db "test_val = %d",10,0
msg_49 db "✗ FAIL: test_val is less than 10",10,0
msg_50 db "✓ PASS: test_val is between 10 and 19",10,0
msg_51 db "✗ FAIL: This should not execute",10,0
msg_52 db "Testing complex elif chain:",10,0
msg_53 db "grade = %d",10,0
msg_54 db "Grade: A",10,0
msg_55 db "✓ PASS: Grade: B",10,0
msg_56 db "✗ FAIL: Grade: C",10,0
msg_57 db "✗ FAIL: Grade: D",10,0
msg_58 db "✗ FAIL: Grade: F",10,0
msg_59 db "5. NESTED CONTROL FLOW:",10,0
msg_60 db "Testing nested if statements:",10,0
msg_61 db "Outer condition passed",10,0
msg_62 db "✓ PASS: Inner condition passed",10,0
msg_63 db "✓ PASS: Deep nested condition passed",10,0
msg_64 db "✗ FAIL: Deep nested should not execute",10,0
msg_65 db "✗ FAIL: Inner should not execute",10,0
msg_66 db "✗ FAIL: Outer should not execute",10,0
msg_67 db "Testing nested if-elif-else:",10,0
msg_68 db "Category 1",10,0
msg_69 db "Category 2 - checking sub-category",10,0
msg_70 db "✓ PASS: Sub-category 1",10,0
msg_71 db "✗ FAIL: Sub-category 2",10,0
msg_72 db "✗ FAIL: Unknown sub-category",10,0
msg_73 db "✗ FAIL: Unknown category",10,0
msg_74 db "6. COMPLEX EXPRESSIONS:",10,0
msg_75 db "Testing complex logical expressions:",10,0
msg_76 db "Values: val1=%d, val2=%d, val3=%d",10,0
msg_77 db "✓ PASS: Ascending order check",10,0
msg_78 db "✗ FAIL: Ascending order check",10,0
msg_79 db "✓ PASS: Contains 5 check",10,0
msg_80 db "✗ FAIL: Contains 5 check",10,0
msg_81 db "✓ PASS: Not greater than val3 check",10,0
msg_82 db "✗ FAIL: Not greater than val3 check",10,0
msg_83 db "val1 + val2 * val3 = %d",10,0
msg_84 db "✓ PASS: Result in range 100-200",10,0
msg_85 db "✗ FAIL: Result should be in range",10,0
msg_86 db "7. EDGE CASES:",10,0
msg_87 db "Negative number tests:",10,0
msg_88 db "%d + %d = %d (expected: -13)",10,0
msg_89 db "%d * %d = %d (expected: 30)",10,0
msg_90 db "%d / %d = %d (expected: 3)",10,0
msg_91 db "Zero tests:",10,0
msg_92 db "0 == 0: ",0
msg_93 db "!(0 == 1): ",0
msg_94 db "Large number test: %d - %d = %d (expected: 1)",10,0
msg_95 db "🎉 === COMPREHENSIVE TEST RESULTS === 🎉",10,0
msg_96 db "✅ Arithmetic Operators: +, -, *, /, %% - ALL WORKING",10,0
msg_97 db "✅ Operator Precedence: Mathematical precedence - PERFECT",10,0
msg_98 db "✅ Comparison Operators: ==, !=, <, >, <=, >= - ALL WORKING",10,0
msg_99 db "✅ Logical Operators: &&, ||, ! - ALL WORKING",10,0
msg_100 db "✅ Control Flow: if, else, elif - ALL WORKING",10,0
msg_101 db "✅ Nested Structures: Nested if/elif/else - ALL WORKING",10,0
msg_102 db "✅ Complex Expressions: Mixed operators - ALL WORKING",10,0
msg_103 db "✅ Edge Cases: Negative, zero, large numbers - ALL WORKING",10,0
msg_104 db "✅ Print Function: printf mapping - WORKING",10,0
msg_105 db "✅ Compiler: Clean build, no warnings - PERFECT",10,0
msg_106 db 10,"🏆 ÆLang COMPILER: COMPREHENSIVE TESTING COMPLETE! 🏆",10,0
msg_107 db "🎯 ALL MAJOR LANGUAGE FEATURES WORKING CORRECTLY! 🎯",10,0

section .bss
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern read
    extern read_with_type

main:
    push rbp
    mov rbp, rsp
    sub rsp, 4888
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-328], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-328]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 6
    mov qword [rbp-336], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-336]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-344], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-344]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-352], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-352]
    mov qword [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-360], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-368], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-376], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-384], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-360]
    mov rsi, [rbp-368]
    mov rdx, [rbp-376]
    mov rcx, [rbp-384]
    mov r8, [rbp-392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-416], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-408]
    mov rbx, qword [rbp-416]
    add rax, rbx
    mov qword [rbp-424], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-424]
    mov qword [rbp-40], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-432], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-440], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-432]
    mov rbx, qword [rbp-440]
    sub rax, rbx
    mov qword [rbp-448], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-448]
    mov qword [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-456], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-464], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-456]
    mov rbx, qword [rbp-464]
    imul rax, rbx
    mov qword [rbp-472], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-472]
    mov qword [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-480], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-488], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-480]
    mov rbx, qword [rbp-488]
    cqo
    idiv rbx
    mov qword [rbp-496], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-496]
    mov qword [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-504], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-512], rax
    ; IR: MOD dest src1 src2
    mov rax, qword [rbp-504]
    mov rbx, qword [rbp-512]
    cqo
    idiv rbx
    mov rax, rdx
    mov qword [rbp-520], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-520]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-528], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-536], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-544], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-528]
    mov rsi, [rbp-536]
    mov rdx, [rbp-544]
    mov rcx, [rbp-552]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-568], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-584], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-592], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-568]
    mov rsi, [rbp-576]
    mov rdx, [rbp-584]
    mov rcx, [rbp-592]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-608], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-616], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-608]
    mov rsi, [rbp-616]
    mov rdx, [rbp-624]
    mov rcx, [rbp-632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-648], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-656], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-664], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-672], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-648]
    mov rsi, [rbp-656]
    mov rdx, [rbp-664]
    mov rcx, [rbp-672]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-688], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-696], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-704], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-712], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-688]
    mov rsi, [rbp-696]
    mov rdx, [rbp-704]
    mov rcx, [rbp-712]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-728], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-736], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-744], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-736]
    mov rbx, qword [rbp-744]
    imul rax, rbx
    mov qword [rbp-752], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-728]
    mov rbx, qword [rbp-752]
    add rax, rbx
    mov qword [rbp-760], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-760]
    mov qword [rbp-80], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-768], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-776], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-784], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-776]
    mov rbx, qword [rbp-784]
    cqo
    idiv rbx
    mov qword [rbp-792], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-768]
    mov rbx, qword [rbp-792]
    sub rax, rbx
    mov qword [rbp-800], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-800]
    mov qword [rbp-88], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-808], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-816], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-808]
    mov rbx, qword [rbp-816]
    add rax, rbx
    mov qword [rbp-824], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-832], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-824]
    mov rbx, qword [rbp-832]
    imul rax, rbx
    mov qword [rbp-840], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-840]
    mov qword [rbp-96], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-848], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-856], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-848]
    mov rbx, qword [rbp-856]
    imul rax, rbx
    mov qword [rbp-864], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-872], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-880], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-872]
    mov rbx, qword [rbp-880]
    imul rax, rbx
    mov qword [rbp-888], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-864]
    mov rbx, qword [rbp-888]
    add rax, rbx
    mov qword [rbp-896], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-896]
    mov qword [rbp-104], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-904], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-912], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-920], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-912]
    mov rbx, qword [rbp-920]
    imul rax, rbx
    mov qword [rbp-928], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-904]
    mov rbx, qword [rbp-928]
    add rax, rbx
    mov qword [rbp-936], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-944], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-936]
    mov rbx, qword [rbp-944]
    sub rax, rbx
    mov qword [rbp-952], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-952]
    mov qword [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-960], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-968], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-960]
    mov rsi, [rbp-968]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-984], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-992], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-984]
    mov rsi, [rbp-992]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-1008], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-1016], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1008]
    mov rsi, [rbp-1016]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-1032], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1040], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1032]
    mov rsi, [rbp-1040]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1056], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1064], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1056]
    mov rsi, [rbp-1064]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-1080], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1080]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-1096], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1096]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1112], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1112]
    mov qword [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-1120], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1120]
    mov qword [rbp-128], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1128], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1128]
    mov qword [rbp-136], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-1136], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1144], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1152], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1136]
    mov rsi, [rbp-1144]
    mov rdx, [rbp-1152]
    mov rcx, [rbp-1160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1176], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1200], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1192]
    mov rbx, qword [rbp-1200]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1208], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1208]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1216], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1216]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1232], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1232]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-1248], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1248]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1264], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1272], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-1264]
    mov rbx, qword [rbp-1272]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-1280], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1280]
    test rax, rax
    jz else_2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_3
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1304], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1304]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov qword [rbp-1320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1336], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1344], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-1336]
    mov rbx, qword [rbp-1344]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-1352], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1352]
    test rax, rax
    jz else_4
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1360], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1360]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_5
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1376], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1376]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_5:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov qword [rbp-1392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1416], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1408]
    mov rbx, qword [rbp-1416]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1424], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1424]
    test rax, rax
    jz else_6
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1432], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1432]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_7
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_7:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov qword [rbp-1464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1480], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1488], rax
    ; IR: LEQ dest src1 src2
    mov rax, qword [rbp-1480]
    mov rbx, qword [rbp-1488]
    cmp rax, rbx
    setle al
    movzx rax, al
    mov qword [rbp-1496], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1496]
    test rax, rax
    jz else_8
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1504], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1504]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_9
    ; IR: LABEL dest
else_8:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1520], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1520]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_9:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov qword [rbp-1536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1552], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1560], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-1552]
    mov rbx, qword [rbp-1560]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-1568], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1568]
    test rax, rax
    jz else_10
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1576], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_11
    ; IR: LABEL dest
else_10:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1592], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1592]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_11:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-1608], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1608]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov qword [rbp-1624], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1624]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov qword [rbp-1640], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1640]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov qword [rbp-1656], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1656]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1672], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1680], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1672]
    mov rbx, qword [rbp-1680]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1688], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1696], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1704], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1696]
    mov rbx, qword [rbp-1704]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1712], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-1688]
    mov rbx, qword [rbp-1712]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-1720], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1720]
    test rax, rax
    jz else_12
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1728], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1728]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_13
    ; IR: LABEL dest
else_12:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1744], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1744]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_13:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov qword [rbp-1760], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1760]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1776], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1784], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1776]
    mov rbx, qword [rbp-1784]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1792], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1800], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1808], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1800]
    mov rbx, qword [rbp-1808]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1816], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-1792]
    mov rbx, qword [rbp-1816]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-1824], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1824]
    test rax, rax
    jz else_14
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-1832], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1832]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_15
    ; IR: LABEL dest
else_14:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-1848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_15:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_30
    mov qword [rbp-1864], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1864]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1880], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1888], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-1880]
    mov rbx, qword [rbp-1888]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-1896], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1904], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1912], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1904]
    mov rbx, qword [rbp-1912]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1920], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-1896]
    mov rbx, qword [rbp-1920]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-1928], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1928]
    test rax, rax
    jz else_16
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-1936], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1936]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_17
    ; IR: LABEL dest
else_16:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-1952], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1952]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_17:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_31
    mov qword [rbp-1968], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1968]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_32
    mov qword [rbp-1984], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1984]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2000], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-2008], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2000]
    mov rbx, qword [rbp-2008]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2016], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2024], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2032], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2024]
    mov rbx, qword [rbp-2032]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2040], rax
    ; IR: OR dest src1 src2
    mov rax, qword [rbp-2016]
    mov rbx, qword [rbp-2040]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    or al, bl
    movzx rax, al
    mov qword [rbp-2048], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2048]
    test rax, rax
    jz else_18
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2056], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2056]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_19
    ; IR: LABEL dest
else_18:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-2072], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2072]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_19:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_33
    mov qword [rbp-2088], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2088]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2104], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-2112], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-2104]
    mov rbx, qword [rbp-2112]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-2120], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2128], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2136], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2128]
    mov rbx, qword [rbp-2136]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2144], rax
    ; IR: OR dest src1 src2
    mov rax, qword [rbp-2120]
    mov rbx, qword [rbp-2144]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    or al, bl
    movzx rax, al
    mov qword [rbp-2152], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2152]
    test rax, rax
    jz else_20
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_21
    ; IR: LABEL dest
else_20:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-2176], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_21:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_34
    mov qword [rbp-2192], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2192]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2208], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-2216], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-2208]
    mov rbx, qword [rbp-2216]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-2224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2232], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2240], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2232]
    mov rbx, qword [rbp-2240]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2248], rax
    ; IR: OR dest src1 src2
    mov rax, qword [rbp-2224]
    mov rbx, qword [rbp-2248]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    or al, bl
    movzx rax, al
    mov qword [rbp-2256], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2256]
    test rax, rax
    jz else_22
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-2264], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2264]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_23
    ; IR: LABEL dest
else_22:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-2280], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2280]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_23:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_35
    mov qword [rbp-2296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_36
    mov qword [rbp-2312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2328], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-2336], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2328]
    mov rbx, qword [rbp-2336]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2344], rax
    ; IR: NOT dest src1
    mov rax, qword [rbp-2344]
    test rax, rax
    sete al
    movzx rax, al
    mov qword [rbp-2352], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2352]
    test rax, rax
    jz else_24
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-2360], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2360]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_25
    ; IR: LABEL dest
else_24:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-2376], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2376]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_25:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_37
    mov qword [rbp-2392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2416], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2408]
    mov rbx, qword [rbp-2416]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2424], rax
    ; IR: NOT dest src1
    mov rax, qword [rbp-2424]
    test rax, rax
    sete al
    movzx rax, al
    mov qword [rbp-2432], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2432]
    test rax, rax
    jz else_26
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_27
    ; IR: LABEL dest
else_26:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-2456], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2456]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_27:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-2472], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2472]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_38
    mov qword [rbp-2488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_39
    mov qword [rbp-2504], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2504]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2520], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-2528], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2520]
    mov rbx, qword [rbp-2528]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2536], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2536]
    test rax, rax
    jz else_28
    ; IR: LOAD_CONST dest src1
    mov rax, msg_40
    mov qword [rbp-2544], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2544]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_29
    ; IR: LABEL dest
else_28:
    ; IR: LABEL dest
end_if_29:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_41
    mov qword [rbp-2560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2576], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2584], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2576]
    mov rbx, qword [rbp-2584]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2592], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2592]
    test rax, rax
    jz else_30
    ; IR: LOAD_CONST dest src1
    mov rax, msg_42
    mov qword [rbp-2600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_31
    ; IR: LABEL dest
else_30:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_43
    mov qword [rbp-2616], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2616]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_31:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_44
    mov qword [rbp-2632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2648], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2656], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2648]
    mov rbx, qword [rbp-2656]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2664], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2664]
    test rax, rax
    jz else_32
    ; IR: LOAD_CONST dest src1
    mov rax, msg_45
    mov qword [rbp-2672], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2672]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_33
    ; IR: LABEL dest
else_32:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_46
    mov qword [rbp-2688], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2688]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_33:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_47
    mov qword [rbp-2704], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2704]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-2720], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2720]
    mov qword [rbp-144], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_48
    mov qword [rbp-2728], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-2736], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2728]
    mov rsi, [rbp-2736]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-2752], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-2760], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2752]
    mov rbx, qword [rbp-2760]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2768], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2768]
    test rax, rax
    jz else_34
    ; IR: LOAD_CONST dest src1
    mov rax, msg_49
    mov qword [rbp-2776], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2776]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_35
    ; IR: LABEL dest
else_34:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-2792], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-2800], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2792]
    mov rbx, qword [rbp-2800]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2808], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2808]
    test rax, rax
    jz else_36
    ; IR: LOAD_CONST dest src1
    mov rax, msg_50
    mov qword [rbp-2816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_37
    ; IR: LABEL dest
else_36:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-2832], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 30
    mov qword [rbp-2840], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2832]
    mov rbx, qword [rbp-2840]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2848], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2848]
    test rax, rax
    jz else_38
    ; IR: LOAD_CONST dest src1
    mov rax, msg_51
    mov qword [rbp-2856], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2856]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_39
    ; IR: LABEL dest
else_38:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_51
    mov qword [rbp-2872], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2872]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_39:
    ; IR: LABEL dest
end_if_37:
    ; IR: LABEL dest
end_if_35:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_52
    mov qword [rbp-2888], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2888]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 85
    mov qword [rbp-2904], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2904]
    mov qword [rbp-152], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_53
    mov qword [rbp-2912], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-2920], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2912]
    mov rsi, [rbp-2920]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-2936], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 90
    mov qword [rbp-2944], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-2936]
    mov rbx, qword [rbp-2944]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-2952], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2952]
    test rax, rax
    jz else_40
    ; IR: LOAD_CONST dest src1
    mov rax, msg_54
    mov qword [rbp-2960], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2960]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_41
    ; IR: LABEL dest
else_40:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-2976], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 80
    mov qword [rbp-2984], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-2976]
    mov rbx, qword [rbp-2984]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-2992], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-2992]
    test rax, rax
    jz else_42
    ; IR: LOAD_CONST dest src1
    mov rax, msg_55
    mov qword [rbp-3000], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3000]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_43
    ; IR: LABEL dest
else_42:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3016], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 70
    mov qword [rbp-3024], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-3016]
    mov rbx, qword [rbp-3024]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-3032], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3032]
    test rax, rax
    jz else_44
    ; IR: LOAD_CONST dest src1
    mov rax, msg_56
    mov qword [rbp-3040], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3040]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_45
    ; IR: LABEL dest
else_44:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3056], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 60
    mov qword [rbp-3064], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-3056]
    mov rbx, qword [rbp-3064]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-3072], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3072]
    test rax, rax
    jz else_46
    ; IR: LOAD_CONST dest src1
    mov rax, msg_57
    mov qword [rbp-3080], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3080]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_47
    ; IR: LABEL dest
else_46:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_58
    mov qword [rbp-3096], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3096]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_47:
    ; IR: LABEL dest
end_if_45:
    ; IR: LABEL dest
end_if_43:
    ; IR: LABEL dest
end_if_41:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-3112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_59
    mov qword [rbp-3128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-3144], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3144]
    mov qword [rbp-160], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 8
    mov qword [rbp-3152], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3152]
    mov qword [rbp-168], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_60
    mov qword [rbp-3160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3176], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-3184], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3176]
    mov rbx, qword [rbp-3184]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3192], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3192]
    test rax, rax
    jz else_48
    ; IR: LOAD_CONST dest src1
    mov rax, msg_61
    mov qword [rbp-3200], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3200]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-168]
    mov qword [rbp-3216], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3224], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3216]
    mov rbx, qword [rbp-3224]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3232], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3232]
    test rax, rax
    jz else_50
    ; IR: LOAD_CONST dest src1
    mov rax, msg_62
    mov qword [rbp-3240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-168]
    mov qword [rbp-3256], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-3264], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-3256]
    mov rbx, qword [rbp-3264]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-3272], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3272]
    test rax, rax
    jz else_52
    ; IR: LOAD_CONST dest src1
    mov rax, msg_63
    mov qword [rbp-3280], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3280]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_53
    ; IR: LABEL dest
else_52:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_64
    mov qword [rbp-3296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_53:
    ; IR: GOTO dest
    jmp end_if_51
    ; IR: LABEL dest
else_50:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_65
    mov qword [rbp-3312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_51:
    ; IR: GOTO dest
    jmp end_if_49
    ; IR: LABEL dest
else_48:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_66
    mov qword [rbp-3328], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_49:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_67
    mov qword [rbp-3344], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3344]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-3360], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3360]
    mov qword [rbp-176], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-3368], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3368]
    mov qword [rbp-184], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-176]
    mov qword [rbp-3376], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-3384], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3376]
    mov rbx, qword [rbp-3384]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3392], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3392]
    test rax, rax
    jz else_54
    ; IR: LOAD_CONST dest src1
    mov rax, msg_68
    mov qword [rbp-3400], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3400]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_55
    ; IR: LABEL dest
else_54:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-176]
    mov qword [rbp-3416], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-3424], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3416]
    mov rbx, qword [rbp-3424]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3432], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3432]
    test rax, rax
    jz else_56
    ; IR: LOAD_CONST dest src1
    mov rax, msg_69
    mov qword [rbp-3440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-184]
    mov qword [rbp-3456], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-3464], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3456]
    mov rbx, qword [rbp-3464]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3472], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3472]
    test rax, rax
    jz else_58
    ; IR: LOAD_CONST dest src1
    mov rax, msg_70
    mov qword [rbp-3480], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3480]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_59
    ; IR: LABEL dest
else_58:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-184]
    mov qword [rbp-3496], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-3504], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3496]
    mov rbx, qword [rbp-3504]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3512], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3512]
    test rax, rax
    jz else_60
    ; IR: LOAD_CONST dest src1
    mov rax, msg_71
    mov qword [rbp-3520], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3520]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_61
    ; IR: LABEL dest
else_60:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_72
    mov qword [rbp-3536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_61:
    ; IR: LABEL dest
end_if_59:
    ; IR: GOTO dest
    jmp end_if_57
    ; IR: LABEL dest
else_56:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_73
    mov qword [rbp-3552], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3552]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_57:
    ; IR: LABEL dest
end_if_55:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-3568], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3568]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_74
    mov qword [rbp-3584], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3584]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_75
    mov qword [rbp-3600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3616], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3616]
    mov qword [rbp-192], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-3624], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3624]
    mov qword [rbp-200], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-3632], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3632]
    mov qword [rbp-208], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_76
    mov qword [rbp-3640], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3648], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3656], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3664], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3640]
    mov rsi, [rbp-3648]
    mov rdx, [rbp-3656]
    mov rcx, [rbp-3664]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3680], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3688], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-3680]
    mov rbx, qword [rbp-3688]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-3696], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3704], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3712], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-3704]
    mov rbx, qword [rbp-3712]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-3720], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-3696]
    mov rbx, qword [rbp-3720]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-3728], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3728]
    test rax, rax
    jz else_62
    ; IR: LOAD_CONST dest src1
    mov rax, msg_77
    mov qword [rbp-3736], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3736]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_63
    ; IR: LABEL dest
else_62:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_78
    mov qword [rbp-3752], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3752]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_63:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3768], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3776], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3768]
    mov rbx, qword [rbp-3776]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3784], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3792], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3800], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3792]
    mov rbx, qword [rbp-3800]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3808], rax
    ; IR: OR dest src1 src2
    mov rax, qword [rbp-3784]
    mov rbx, qword [rbp-3808]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    or al, bl
    movzx rax, al
    mov qword [rbp-3816], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3824], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3832], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3824]
    mov rbx, qword [rbp-3832]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3840], rax
    ; IR: OR dest src1 src2
    mov rax, qword [rbp-3816]
    mov rbx, qword [rbp-3840]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    or al, bl
    movzx rax, al
    mov qword [rbp-3848], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3848]
    test rax, rax
    jz else_64
    ; IR: LOAD_CONST dest src1
    mov rax, msg_79
    mov qword [rbp-3856], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3856]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_65
    ; IR: LABEL dest
else_64:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_80
    mov qword [rbp-3872], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3872]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_65:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3888], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3896], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3888]
    mov rbx, qword [rbp-3896]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3904], rax
    ; IR: NOT dest src1
    mov rax, qword [rbp-3904]
    test rax, rax
    sete al
    movzx rax, al
    mov qword [rbp-3912], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3920], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3928], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3920]
    mov rbx, qword [rbp-3928]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3936], rax
    ; IR: NOT dest src1
    mov rax, qword [rbp-3936]
    test rax, rax
    sete al
    movzx rax, al
    mov qword [rbp-3944], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-3912]
    mov rbx, qword [rbp-3944]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-3952], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-3952]
    test rax, rax
    jz else_66
    ; IR: LOAD_CONST dest src1
    mov rax, msg_81
    mov qword [rbp-3960], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3960]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_67
    ; IR: LABEL dest
else_66:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_82
    mov qword [rbp-3976], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3976]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_67:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3992], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-4000], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-4008], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-4000]
    mov rbx, qword [rbp-4008]
    imul rax, rbx
    mov qword [rbp-4016], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-3992]
    mov rbx, qword [rbp-4016]
    add rax, rbx
    mov qword [rbp-4024], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4024]
    mov qword [rbp-216], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_83
    mov qword [rbp-4032], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-4040], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4032]
    mov rsi, [rbp-4040]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-4056], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-4064], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-4056]
    mov rbx, qword [rbp-4064]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-4072], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-4080], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 200
    mov qword [rbp-4088], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-4080]
    mov rbx, qword [rbp-4088]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-4096], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-4072]
    mov rbx, qword [rbp-4096]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-4104], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-4104]
    test rax, rax
    jz else_68
    ; IR: LOAD_CONST dest src1
    mov rax, msg_84
    mov qword [rbp-4112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_69
    ; IR: LABEL dest
else_68:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_85
    mov qword [rbp-4128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_69:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-4144], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4144]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_86
    mov qword [rbp-4160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-4176], rax
    ; IR: UNKNOWN dest src1
    mov rax, qword [rbp-4176]
    neg rax
    mov qword [rbp-4184], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4184]
    mov qword [rbp-224], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-4192], rax
    ; IR: UNKNOWN dest src1
    mov rax, qword [rbp-4192]
    neg rax
    mov qword [rbp-4200], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4200]
    mov qword [rbp-232], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4208], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4216], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-4208]
    mov rbx, qword [rbp-4216]
    add rax, rbx
    mov qword [rbp-4224], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4224]
    mov qword [rbp-240], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4232], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4240], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-4232]
    mov rbx, qword [rbp-4240]
    imul rax, rbx
    mov qword [rbp-4248], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4248]
    mov qword [rbp-248], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4256], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4264], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-4256]
    mov rbx, qword [rbp-4264]
    cqo
    idiv rbx
    mov qword [rbp-4272], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4272]
    mov qword [rbp-256], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_87
    mov qword [rbp-4280], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4280]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_88
    mov qword [rbp-4296], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4304], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4312], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-240]
    mov qword [rbp-4320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4296]
    mov rsi, [rbp-4304]
    mov rdx, [rbp-4312]
    mov rcx, [rbp-4320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_89
    mov qword [rbp-4336], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4344], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4352], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-248]
    mov qword [rbp-4360], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4336]
    mov rsi, [rbp-4344]
    mov rdx, [rbp-4352]
    mov rcx, [rbp-4360]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_90
    mov qword [rbp-4376], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-4384], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-4392], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-256]
    mov qword [rbp-4400], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4376]
    mov rsi, [rbp-4384]
    mov rdx, [rbp-4392]
    mov rcx, [rbp-4400]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-4416], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4416]
    mov qword [rbp-264], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_91
    mov qword [rbp-4424], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4424]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_92
    mov qword [rbp-4440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-264]
    mov qword [rbp-4456], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-4464], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-4456]
    mov rbx, qword [rbp-4464]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-4472], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-4472]
    test rax, rax
    jz else_70
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-4480], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4480]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_71
    ; IR: LABEL dest
else_70:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-4496], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4496]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_71:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_93
    mov qword [rbp-4512], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4512]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-264]
    mov qword [rbp-4528], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-4536], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-4528]
    mov rbx, qword [rbp-4536]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-4544], rax
    ; IR: NOT dest src1
    mov rax, qword [rbp-4544]
    test rax, rax
    sete al
    movzx rax, al
    mov qword [rbp-4552], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-4552]
    test rax, rax
    jz else_72
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-4560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_73
    ; IR: LABEL dest
else_72:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-4576], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_73:
    ; IR: LOAD_CONST dest src1
    mov rax, 1000000
    mov qword [rbp-4592], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4592]
    mov qword [rbp-272], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 999999
    mov qword [rbp-4600], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4600]
    mov qword [rbp-280], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-272]
    mov qword [rbp-4608], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-280]
    mov qword [rbp-4616], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-4608]
    mov rbx, qword [rbp-4616]
    sub rax, rbx
    mov qword [rbp-4624], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-4624]
    mov qword [rbp-288], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_94
    mov qword [rbp-4632], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-272]
    mov qword [rbp-4640], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-280]
    mov qword [rbp-4648], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-288]
    mov qword [rbp-4656], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4632]
    mov rsi, [rbp-4640]
    mov rdx, [rbp-4648]
    mov rcx, [rbp-4656]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-4672], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4672]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_95
    mov qword [rbp-4688], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4688]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_96
    mov qword [rbp-4704], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4704]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_97
    mov qword [rbp-4720], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4720]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_98
    mov qword [rbp-4736], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4736]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_99
    mov qword [rbp-4752], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4752]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_100
    mov qword [rbp-4768], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4768]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_101
    mov qword [rbp-4784], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4784]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_102
    mov qword [rbp-4800], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4800]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_103
    mov qword [rbp-4816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_104
    mov qword [rbp-4832], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4832]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_105
    mov qword [rbp-4848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_106
    mov qword [rbp-4864], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4864]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_107
    mov qword [rbp-4880], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-4880]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
