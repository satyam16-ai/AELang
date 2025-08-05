; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Comprehensive Precedence Test ===",10,0
msg_1 db "a=%d, b=%d, c=%d, d=%d",10,0
msg_2 db "a + b * c = %d (expected: 14)",10,0
msg_3 db "a * b + c = %d (expected: 10)",10,0
msg_4 db "a + b * c - d = %d (expected: 9)",10,0
msg_5 db "a * b - c / d = %d (expected: 6)",10,0
msg_6 db "(a + b) * c = %d (expected: 20)",10,0
msg_7 db "a * (b + c) = %d (expected: 14)",10,0
msg_8 db 10,"🎉 ALL PRECEDENCE TESTS PASSED! 🎉",10,0
msg_9 db 10,"❌ Some precedence tests failed!",10,0

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
    sub rsp, 808
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
    mov rax, 2
    mov qword [rbp-104], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-104]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-112], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-112]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 4
    mov qword [rbp-120], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-120]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-128], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-128]
    mov qword [rbp-32], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-136], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-152], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-144]
    mov rbx, qword [rbp-152]
    imul rax, rbx
    mov qword [rbp-160], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-136]
    mov rbx, qword [rbp-160]
    add rax, rbx
    mov qword [rbp-168], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-168]
    mov qword [rbp-40], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-184], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-176]
    mov rbx, qword [rbp-184]
    imul rax, rbx
    mov qword [rbp-192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-200], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-192]
    mov rbx, qword [rbp-200]
    add rax, rbx
    mov qword [rbp-208], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-208]
    mov qword [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-216], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-232], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-224]
    mov rbx, qword [rbp-232]
    imul rax, rbx
    mov qword [rbp-240], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-216]
    mov rbx, qword [rbp-240]
    add rax, rbx
    mov qword [rbp-248], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-256], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-248]
    mov rbx, qword [rbp-256]
    sub rax, rbx
    mov qword [rbp-264], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-264]
    mov qword [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-272], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-280], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-272]
    mov rbx, qword [rbp-280]
    imul rax, rbx
    mov qword [rbp-288], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-296], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-304], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-296]
    mov rbx, qword [rbp-304]
    cqo
    idiv rbx
    mov qword [rbp-312], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-288]
    mov rbx, qword [rbp-312]
    sub rax, rbx
    mov qword [rbp-320], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-320]
    mov qword [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-328], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-336], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-328]
    mov rbx, qword [rbp-336]
    add rax, rbx
    mov qword [rbp-344], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-352], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-344]
    mov rbx, qword [rbp-352]
    imul rax, rbx
    mov qword [rbp-360], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-360]
    mov qword [rbp-72], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-368], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-376], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-384], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-376]
    mov rbx, qword [rbp-384]
    add rax, rbx
    mov qword [rbp-392], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-368]
    mov rbx, qword [rbp-392]
    imul rax, rbx
    mov qword [rbp-400], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-400]
    mov qword [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-408], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-416], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-424], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-432], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-408]
    mov rsi, [rbp-416]
    mov rdx, [rbp-424]
    mov rcx, [rbp-432]
    mov r8, [rbp-440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-456], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-456]
    mov rsi, [rbp-464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-480], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-480]
    mov rsi, [rbp-488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-512], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-504]
    mov rsi, [rbp-512]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-528], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-528]
    mov rsi, [rbp-536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-552]
    mov rsi, [rbp-560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-584], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-576]
    mov rsi, [rbp-584]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-600], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 14
    mov qword [rbp-608], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-600]
    mov rbx, qword [rbp-608]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-616], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-624], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-632], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-624]
    mov rbx, qword [rbp-632]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-640], rax
    ; IR: AND dest src1 src2
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-656], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 9
    mov qword [rbp-664], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-656]
    mov rbx, qword [rbp-664]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-672], rax
    ; IR: AND dest src1 src2
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-688], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 6
    mov qword [rbp-696], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-688]
    mov rbx, qword [rbp-696]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-704], rax
    ; IR: AND dest src1 src2
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-720], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-728], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-720]
    mov rbx, qword [rbp-728]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-736], rax
    ; IR: AND dest src1 src2
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-752], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 14
    mov qword [rbp-760], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-752]
    mov rbx, qword [rbp-760]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-768], rax
    ; IR: AND dest src1 src2
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-784], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-784]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-800], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-800]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_1:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
