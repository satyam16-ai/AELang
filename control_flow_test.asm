; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== CONTROL FLOW AND OPERATORS TEST ===",10,10,0
msg_1 db "1. ARITHMETIC OPERATORS:",10,0
msg_2 db "Variables: a=%d, b=%d, c=%d",10,0
msg_3 db "Precedence a + b * c = %d (expected: 38)",10,0
msg_4 db "Precedence a - b / c = %d (expected: 18)",10,0
msg_5 db 10,0
msg_6 db "2. COMPARISON AND IF/ELSE TESTS:",10,0
msg_7 db "Variables: x=%d, y=%d, z=%d",10,0
msg_8 db "Testing if (x == z):",10,0
msg_9 db "✓ PASS: x equals z",10,0
msg_10 db "Testing if-else (x < y):",10,0
msg_11 db "✓ PASS: x is less than y",10,0
msg_12 db "✗ FAIL: This should not print",10,0
msg_13 db "Testing if-else (x > y):",10,0
msg_14 db "✓ PASS: x is not greater than y",10,0
msg_15 db "3. LOGICAL OPERATORS:",10,0
msg_16 db "Testing AND - both true (x == z && y > x):",10,0
msg_17 db "✓ PASS: Both conditions are true",10,0
msg_18 db "Testing AND - one false (x == z && x > y):",10,0
msg_19 db "✓ PASS: One condition is false",10,0
msg_20 db "Testing OR - one true (x > y || z == x):",10,0
msg_21 db "✓ PASS: At least one condition is true",10,0
msg_22 db "Testing NOT - !(x > y):",10,0
msg_23 db "✓ PASS: NOT works correctly",10,0
msg_24 db "4. NESTED IF TESTS:",10,0
msg_25 db "Testing nested if statements:",10,0
msg_26 db "Outer condition passed",10,0
msg_27 db "✓ PASS: Inner condition also passed",10,0
msg_28 db 10,"=== ALL TESTS COMPLETED ===",10,0

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
    sub rsp, 1216
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-88], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-88]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-104], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-104]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-120], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-120]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 6
    mov qword [rbp-128], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-128]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-136], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-136]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-144], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-152], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-160], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-168], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-144]
    mov rsi, [rbp-152]
    mov rdx, [rbp-160]
    mov rcx, [rbp-168]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-184], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-200], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-192]
    mov rbx, qword [rbp-200]
    imul rax, rbx
    mov qword [rbp-208], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-184]
    mov rbx, qword [rbp-208]
    add rax, rbx
    mov qword [rbp-216], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-216]
    mov qword [rbp-32], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-232], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-240], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-232]
    mov rbx, qword [rbp-240]
    cqo
    idiv rbx
    mov qword [rbp-248], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-224]
    mov rbx, qword [rbp-248]
    sub rax, rbx
    mov qword [rbp-256], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-256]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-264], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-272], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-264]
    mov rsi, [rbp-272]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-288]
    mov rsi, [rbp-296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-328], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-344], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-344]
    mov qword [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-352], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-352]
    mov qword [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-360], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-360]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-368], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-376], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-384], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-368]
    mov rsi, [rbp-376]
    mov rdx, [rbp-384]
    mov rcx, [rbp-392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-408], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-408]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-424], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-432], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-424]
    mov rbx, qword [rbp-432]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-440], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-440]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-480], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-488], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-480]
    mov rbx, qword [rbp-488]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-496], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-496]
    test rax, rax
    jz else_2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-504]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_3
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-520], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-520]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-552], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-560], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-552]
    mov rbx, qword [rbp-560]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-568], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-568]
    test rax, rax
    jz else_4
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_5
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-592], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-592]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_5:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-608], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-608]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-624]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-640], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-640]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-656], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-664], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-656]
    mov rbx, qword [rbp-664]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-672], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-680], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-688], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-680]
    mov rbx, qword [rbp-688]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-696], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-704]
    test rax, rax
    jz else_6
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-712], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-712]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_7
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-728], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-728]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_7:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-744], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-744]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-760], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-768], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-760]
    mov rbx, qword [rbp-768]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-776], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-784], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-792], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-784]
    mov rbx, qword [rbp-792]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-800], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-808]
    test rax, rax
    jz else_8
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_9
    ; IR: LABEL dest
else_8:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-832], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-832]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_9:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov qword [rbp-848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-864], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-872], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-864]
    mov rbx, qword [rbp-872]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-880], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-888], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-896], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-888]
    mov rbx, qword [rbp-896]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-904], rax
    ; IR: OR dest src1 src2
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-912]
    test rax, rax
    jz else_10
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov qword [rbp-920], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-920]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_11
    ; IR: LABEL dest
else_10:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-936], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-936]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_11:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov qword [rbp-952], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-952]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-968], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-976], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-968]
    mov rbx, qword [rbp-976]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-984], rax
    ; IR: NOT dest src1
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-992]
    test rax, rax
    jz else_12
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov qword [rbp-1000], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1000]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_13
    ; IR: LABEL dest
else_12:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1016], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1016]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_13:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-1032], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1032]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov qword [rbp-1048], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1048]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-1064], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1064]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 8
    mov qword [rbp-1072], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1072]
    mov qword [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov qword [rbp-1080], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1080]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-1096], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1104], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1096]
    mov rbx, qword [rbp-1104]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1112], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1112]
    test rax, rax
    jz else_14
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov qword [rbp-1120], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1120]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-1136], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-1144], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1136]
    mov rbx, qword [rbp-1144]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1152], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-1152]
    test rax, rax
    jz else_16
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov qword [rbp-1160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_17
    ; IR: LABEL dest
else_16:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1176], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_17:
    ; IR: GOTO dest
    jmp end_if_15
    ; IR: LABEL dest
else_14:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1192], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1192]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_15:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-1208], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1208]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
