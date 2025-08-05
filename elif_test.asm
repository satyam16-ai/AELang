; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Else-If Statement Test ===",10,0
msg_1 db "=== Test Complete ===",10,0
msg_2 db "x is negative: %d",10,0
msg_3 db "x is zero: %d",10,0
msg_4 db "x is single digit positive: %d",10,0
msg_5 db "x is two digit: %d",10,0
msg_6 db "x is large: %d",10,0

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
    sub rsp, 344
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-232], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-232]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-248], rax
    ; IR: UNKNOWN dest src1
    mov rax, qword [rbp-248]
    neg rax
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-256]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_elif
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-272], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-272]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_elif
    ; IR: LOAD_CONST dest src1
    mov rax, 7
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_elif
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov qword [rbp-304], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-304]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_elif
    ; IR: LOAD_CONST dest src1
    mov rax, 999
    mov qword [rbp-320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_elif
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-336], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-336]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

test_elif:
    push rbp
    mov rbp, rsp
    sub rsp, 344
    ; Store parameter x from rdi
    mov qword [rbp-8], rdi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-24], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-16]
    mov rbx, qword [rbp-24]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-32], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-32]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-40], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-48], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-40]
    mov rsi, [rbp-48]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-72], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-64]
    mov rbx, qword [rbp-72]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-80], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-80]
    test rax, rax
    jz else_2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-88], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-96], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-88]
    mov rsi, [rbp-96]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_3
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-120], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-112]
    mov rbx, qword [rbp-120]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-128], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-128]
    test rax, rax
    jz else_4
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-136], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-144], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-136]
    mov rsi, [rbp-144]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_5
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-160], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-168], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-160]
    mov rbx, qword [rbp-168]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-176], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-176]
    test rax, rax
    jz else_6
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-184], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-192], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-184]
    mov rsi, [rbp-192]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_7
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-208], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-216], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-208]
    mov rsi, [rbp-216]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_7:
    ; IR: LABEL dest
end_if_5:
    ; IR: LABEL dest
end_if_3:
    ; IR: LABEL dest
end_if_1:
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
