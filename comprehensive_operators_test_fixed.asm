; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== COMPREHENSIVE OPERATORS AND EDGE CASES TEST ===",10,10,0
msg_1 db "1. ARITHMETIC OPERATORS:",10,0
msg_2 db "Variables: a=%d, b=%d, c=%d, d=%d",10,0
msg_3 db "Addition: %d + %d = %d",10,0
msg_4 db "Subtraction: %d - %d = %d",10,0
msg_5 db "Multiplication: %d * %d = %d",10,0
msg_6 db "Division: %d / %d = %d",10,0
msg_7 db "Modulo: %d %% %d = %d",10,0
msg_8 db "Precedence a + b * c = %d (expected: 38)",10,0
msg_9 db "Precedence a - b / c = %d (expected: 18)",10,0
msg_10 db "Precedence (a + b) * c = %d (expected: 78)",10,0
msg_11 db "Precedence a * b + c * c = %d (expected: 129)",10,0
msg_12 db 10,0
msg_13 db "2. COMPARISON OPERATORS:",10,0
msg_14 db "Variables: x=%d, y=%d, z=%d",10,0
msg_15 db "x == z: ",0
msg_16 db "1 (true)",10,0
msg_17 db "0 (false)",10,0
msg_18 db "x != y: ",0
msg_19 db "x < y: ",0
msg_20 db "y > x: ",0
msg_21 db "x <= z: ",0
msg_22 db "y >= x: ",0
msg_23 db "3. LOGICAL OPERATORS:",10,0
msg_24 db "Logical AND tests:",10,0
msg_25 db "(10 == 10) && (20 > 10): ",0
msg_26 db "(10 == 10) && (10 > 20): ",0
msg_27 db "(10 != 10) && (20 > 10): ",0
msg_28 db "(10 != 10) && (10 > 20): ",0
msg_29 db "Logical OR tests:",10,0
msg_30 db "(10 == 10) || (20 > 10): ",0
msg_31 db "(10 == 10) || (10 > 20): ",0
msg_32 db "(10 != 10) || (20 > 10): ",0
msg_33 db "(10 != 10) || (10 > 20): ",0
msg_34 db "Logical NOT tests:",10,0
msg_35 db "!(10 == 10): ",0
msg_36 db "!(10 != 10): ",0
msg_37 db "4. IF/ELSE CONTROL FLOW TESTS:",10,0
msg_38 db "Testing simple if (x == z):",10,0
msg_39 db "✓ PASS: x equals z (10 == 10)",10,0
msg_40 db "Testing if-else (x < y):",10,0
msg_41 db "✓ PASS: x is less than y (10 < 20)",10,0
msg_42 db "✗ FAIL: x should be less than y",10,0
msg_43 db "Testing if-else (x > y):",10,0
msg_44 db "✗ FAIL: x should not be greater than y",10,0
msg_45 db "✓ PASS: x is not greater than y (10 not > 20)",10,0
msg_46 db "Testing complex condition (x < y && z == x):",10,0
msg_47 db "✓ PASS: Both conditions are true",10,0
msg_48 db "✗ FAIL: Complex condition should be true",10,0
msg_49 db "Testing complex condition (x > y || z == x):",10,0
msg_50 db "✓ PASS: At least one condition is true (z == x)",10,0
msg_51 db "✗ FAIL: At least one condition should be true",10,0
msg_52 db "Testing nested if statements:",10,0
msg_53 db "Outer condition passed (outer_val > 10)",10,0
msg_54 db "✓ PASS: Inner condition also passed (inner_val > 5)",10,0
msg_55 db "✗ FAIL: Inner condition should pass",10,0
msg_56 db "✗ FAIL: Outer condition should pass",10,0
msg_57 db "5. EDGE CASES:",10,0
msg_58 db "Negative number tests:",10,0
msg_59 db "%d + %d = %d (expected: -13)",10,0
msg_60 db "%d * %d = %d (expected: 30)",10,0
msg_61 db "%d / %d = %d (expected: 3)",10,0
msg_62 db "Large number test: %d - %d = %d (expected: 1)",10,0
msg_63 db "Zero comparison tests:",10,0
msg_64 db "0 == 0: ",0
msg_65 db "0 != 0: ",0
msg_66 db "=== TEST SUMMARY ===",10,0
msg_67 db "✅ Arithmetic Operators: +, -, *, /, %% working",10,0
msg_68 db "✅ Operator Precedence: Correct evaluation order",10,0
msg_69 db "✅ Comparison Operators: ==, !=, <, >, <=, >= working",10,0
msg_70 db "✅ Logical Operators: &&, ||, ! working",10,0
msg_71 db "✅ Control Flow: if, else statements working",10,0
msg_72 db "✅ Edge Cases: Negative numbers, large numbers, zero working",10,0
msg_73 db 10,"🎉 COMPREHENSIVE OPERATOR TESTING COMPLETED! 🎉",10,0

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
    sub rsp, 3768
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-224], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-224]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-256], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-256]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 6
    mov qword [rbp-264], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-264]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-272], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-272]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-280], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-280]
    mov qword [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-304], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-312], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-288]
    mov rsi, [rbp-296]
    mov rdx, [rbp-304]
    mov rcx, [rbp-312]
    mov r8, [rbp-320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-336], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-344], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-336]
    mov rbx, qword [rbp-344]
    add rax, rbx
    mov qword [rbp-352], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-352]
    mov qword [rbp-40], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-360], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-368], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-360]
    mov rbx, qword [rbp-368]
    sub rax, rbx
    mov qword [rbp-376], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-376]
    mov qword [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-384], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-392], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-384]
    mov rbx, qword [rbp-392]
    imul rax, rbx
    mov qword [rbp-400], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-400]
    mov qword [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-416], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-408]
    mov rbx, qword [rbp-416]
    cqo
    idiv rbx
    mov qword [rbp-424], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-424]
    mov qword [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-432], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-440], rax
    ; IR: MOD dest src1 src2
    mov rax, qword [rbp-432]
    mov rbx, qword [rbp-440]
    cqo
    idiv rbx
    mov rax, rdx
    mov qword [rbp-448], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-448]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-456], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-472], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-480], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-456]
    mov rsi, [rbp-464]
    mov rdx, [rbp-472]
    mov rcx, [rbp-480]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-496], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-512], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-520], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-496]
    mov rsi, [rbp-504]
    mov rdx, [rbp-512]
    mov rcx, [rbp-520]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-536], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-544], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-536]
    mov rsi, [rbp-544]
    mov rdx, [rbp-552]
    mov rcx, [rbp-560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-584], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-592], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-576]
    mov rsi, [rbp-584]
    mov rdx, [rbp-592]
    mov rcx, [rbp-600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-616], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-632], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-640], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-616]
    mov rsi, [rbp-624]
    mov rdx, [rbp-632]
    mov rcx, [rbp-640]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-656], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-664], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-672], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-664]
    mov rbx, qword [rbp-672]
    imul rax, rbx
    mov qword [rbp-680], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-656]
    mov rbx, qword [rbp-680]
    add rax, rbx
    mov qword [rbp-688], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-688]
    mov qword [rbp-80], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-696], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-704], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-712], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-704]
    mov rbx, qword [rbp-712]
    cqo
    idiv rbx
    mov qword [rbp-720], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-696]
    mov rbx, qword [rbp-720]
    sub rax, rbx
    mov qword [rbp-728], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-728]
    mov qword [rbp-88], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-736], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-744], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-736]
    mov rbx, qword [rbp-744]
    add rax, rbx
    mov qword [rbp-752], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-760], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-752]
    mov rbx, qword [rbp-760]
    imul rax, rbx
    mov qword [rbp-768], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-768]
    mov qword [rbp-96], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-776], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-784], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-776]
    mov rbx, qword [rbp-784]
    imul rax, rbx
    mov qword [rbp-792], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-800], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-808], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-800]
    mov rbx, qword [rbp-808]
    imul rax, rbx
    mov qword [rbp-816], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-792]
    mov rbx, qword [rbp-816]
    add rax, rbx
    mov qword [rbp-824], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-824]
    mov qword [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-832], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-840], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-832]
    mov rsi, [rbp-840]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-856], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-864], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-856]
    mov rsi, [rbp-864]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-880], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-888], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-880]
    mov rsi, [rbp-888]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-904], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-912], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-904]
    mov rsi, [rbp-912]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-928], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-928]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-944], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-944]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-960], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-960]
    mov qword [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-968], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-968]
    mov qword [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-976], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-976]
    mov qword [rbp-128], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-984], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-992], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1000], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1008], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-984]
    mov rsi, [rbp-992]
    mov rdx, [rbp-1000]
    mov rcx, [rbp-1008]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-1024], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1024]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1040], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1048], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1040]
    mov rbx, qword [rbp-1048]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1056], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1064], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1064]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1080], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1080]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1096], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1096]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1112], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1120], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-1112]
    mov rbx, qword [rbp-1120]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-1128], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1136], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1136]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1152], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1152]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-1168], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1168]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1184], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1192], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-1184]
    mov rbx, qword [rbp-1192]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-1200], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1208], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1208]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1224], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1224]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_5:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov qword [rbp-1240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1256], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1264], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1256]
    mov rbx, qword [rbp-1264]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1272], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1280], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1280]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_7:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov qword [rbp-1312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1328], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1336], rax
    ; IR: LEQ dest src1 src2
    mov rax, qword [rbp-1328]
    mov rbx, qword [rbp-1336]
    cmp rax, rbx
    setle al
    movzx rax, al
    mov qword [rbp-1344], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_8:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1368], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1368]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_9:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov qword [rbp-1384], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1384]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1400], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1408], rax
    ; IR: GEQ dest src1 src2
    mov rax, qword [rbp-1400]
    mov rbx, qword [rbp-1408]
    cmp rax, rbx
    setge al
    movzx rax, al
    mov qword [rbp-1416], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1424], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1424]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_10:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_11:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1456], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1456]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov qword [rbp-1472], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1472]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov qword [rbp-1488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov qword [rbp-1504], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1504]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1520], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1528], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1520]
    mov rbx, qword [rbp-1528]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1536], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1544], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1552], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1544]
    mov rbx, qword [rbp-1552]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1560], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1576], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_12:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1592], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1592]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_13:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov qword [rbp-1608], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1608]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1624], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1632], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1624]
    mov rbx, qword [rbp-1632]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1640], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1648], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1656], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1648]
    mov rbx, qword [rbp-1656]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1664], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1680], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1680]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_14:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1696], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1696]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_15:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov qword [rbp-1712], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1712]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1728], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1736], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-1728]
    mov rbx, qword [rbp-1736]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-1744], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1752], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1760], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1752]
    mov rbx, qword [rbp-1760]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1768], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1784], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1784]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_16:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1800], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1800]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_17:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-1816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1832], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1840], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-1832]
    mov rbx, qword [rbp-1840]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-1848], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1856], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1864], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1856]
    mov rbx, qword [rbp-1864]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1872], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1888], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1888]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_18:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1904], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1904]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_19:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-1920], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1920]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_30
    mov qword [rbp-1936], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1936]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1952], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1960], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1952]
    mov rbx, qword [rbp-1960]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1968], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1976], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1984], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1976]
    mov rbx, qword [rbp-1984]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1992], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2008], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2008]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_20:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2024], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2024]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_21:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_31
    mov qword [rbp-2040], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2040]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2056], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2064], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2056]
    mov rbx, qword [rbp-2064]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2072], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2080], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2088], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2080]
    mov rbx, qword [rbp-2088]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2096], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_22:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_23:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_32
    mov qword [rbp-2144], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2144]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2160], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2168], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-2160]
    mov rbx, qword [rbp-2168]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-2176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2184], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2192], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2184]
    mov rbx, qword [rbp-2192]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2200], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2216], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2216]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_24:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2232], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2232]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_25:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_33
    mov qword [rbp-2248], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2248]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2264], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2272], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-2264]
    mov rbx, qword [rbp-2272]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-2280], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2288], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2296], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2288]
    mov rbx, qword [rbp-2296]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2304], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_26:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2336], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2336]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_27:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_34
    mov qword [rbp-2352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_35
    mov qword [rbp-2368], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2368]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2384], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2392], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2384]
    mov rbx, qword [rbp-2392]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2400], rax
    ; IR: NOT dest src1
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2416], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2416]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_28:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2432], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2432]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_29:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_36
    mov qword [rbp-2448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2464], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2472], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-2464]
    mov rbx, qword [rbp-2472]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-2480], rax
    ; IR: NOT dest src1
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-2496], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2496]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_30:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-2512], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2512]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_31:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-2528], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2528]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_37
    mov qword [rbp-2544], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2544]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_38
    mov qword [rbp-2560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2576], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2584], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2576]
    mov rbx, qword [rbp-2584]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2592], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_39
    mov qword [rbp-2600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_32:
    ; IR: LABEL dest
end_if_33:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_40
    mov qword [rbp-2616], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2616]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2632], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2640], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2632]
    mov rbx, qword [rbp-2640]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2648], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_41
    mov qword [rbp-2656], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2656]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_34:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_42
    mov qword [rbp-2672], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2672]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_35:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_43
    mov qword [rbp-2688], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2688]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2704], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2712], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2704]
    mov rbx, qword [rbp-2712]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2720], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_44
    mov qword [rbp-2728], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2728]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_36:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_45
    mov qword [rbp-2744], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2744]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_37:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_46
    mov qword [rbp-2760], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2760]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2776], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2784], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2776]
    mov rbx, qword [rbp-2784]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2792], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2800], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2808], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2800]
    mov rbx, qword [rbp-2808]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2816], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_47
    mov qword [rbp-2832], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2832]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_38:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_48
    mov qword [rbp-2848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_39:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_49
    mov qword [rbp-2864], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2864]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2880], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-2888], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2880]
    mov rbx, qword [rbp-2888]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2896], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-2904], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-2912], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-2904]
    mov rbx, qword [rbp-2912]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-2920], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_50
    mov qword [rbp-2936], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2936]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_40:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_51
    mov qword [rbp-2952], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2952]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_41:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_52
    mov qword [rbp-2968], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2968]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-2984], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2984]
    mov qword [rbp-136], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 8
    mov qword [rbp-2992], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2992]
    mov qword [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-3000], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-3008], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3000]
    mov rbx, qword [rbp-3008]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3016], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_53
    mov qword [rbp-3024], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3024]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-3040], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-3048], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-3040]
    mov rbx, qword [rbp-3048]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-3056], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_54
    mov qword [rbp-3064], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3064]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_44:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_55
    mov qword [rbp-3080], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3080]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_45:
    ; IR: GOTO src1
    ; IR: LABEL dest
else_42:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_56
    mov qword [rbp-3096], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3096]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_43:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-3112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_57
    mov qword [rbp-3128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-3144], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3152]
    mov qword [rbp-152], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-3160], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3168]
    mov qword [rbp-160], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3184], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-3176]
    mov rbx, qword [rbp-3184]
    add rax, rbx
    mov qword [rbp-3192], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3192]
    mov qword [rbp-168], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3200], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3208], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-3200]
    mov rbx, qword [rbp-3208]
    imul rax, rbx
    mov qword [rbp-3216], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3216]
    mov qword [rbp-176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3232], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-3224]
    mov rbx, qword [rbp-3232]
    cqo
    idiv rbx
    mov qword [rbp-3240], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3240]
    mov qword [rbp-184], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_58
    mov qword [rbp-3248], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3248]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_59
    mov qword [rbp-3264], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3272], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3280], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-168]
    mov qword [rbp-3288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3264]
    mov rsi, [rbp-3272]
    mov rdx, [rbp-3280]
    mov rcx, [rbp-3288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_60
    mov qword [rbp-3304], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3312], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3320], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-176]
    mov qword [rbp-3328], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3304]
    mov rsi, [rbp-3312]
    mov rdx, [rbp-3320]
    mov rcx, [rbp-3328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_61
    mov qword [rbp-3344], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-3352], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-3360], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-184]
    mov qword [rbp-3368], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3344]
    mov rsi, [rbp-3352]
    mov rdx, [rbp-3360]
    mov rcx, [rbp-3368]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 1000000
    mov qword [rbp-3384], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3384]
    mov qword [rbp-192], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 999999
    mov qword [rbp-3392], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3392]
    mov qword [rbp-200], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3400], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3408], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-3400]
    mov rbx, qword [rbp-3408]
    sub rax, rbx
    mov qword [rbp-3416], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3416]
    mov qword [rbp-208], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_62
    mov qword [rbp-3424], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-3432], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-3440], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-3448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3424]
    mov rsi, [rbp-3432]
    mov rdx, [rbp-3440]
    mov rcx, [rbp-3448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-3464], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-3464]
    mov qword [rbp-216], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_63
    mov qword [rbp-3472], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3472]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_64
    mov qword [rbp-3488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-3504], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-3512], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-3504]
    mov rbx, qword [rbp-3512]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-3520], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-3528], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3528]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_46:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-3544], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3544]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_47:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_65
    mov qword [rbp-3560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-3576], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-3584], rax
    ; IR: NEQ dest src1 src2
    mov rax, qword [rbp-3576]
    mov rbx, qword [rbp-3584]
    cmp rax, rbx
    setne al
    movzx rax, al
    mov qword [rbp-3592], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-3600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_48:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-3616], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3616]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_49:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-3632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_66
    mov qword [rbp-3648], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3648]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_67
    mov qword [rbp-3664], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3664]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_68
    mov qword [rbp-3680], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3680]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_69
    mov qword [rbp-3696], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3696]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_70
    mov qword [rbp-3712], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3712]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_71
    mov qword [rbp-3728], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3728]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_72
    mov qword [rbp-3744], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3744]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_73
    mov qword [rbp-3760], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-3760]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
