; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== LOGICAL AND DEBUG TEST ===",10,0
msg_1 db "Variables: x=%d, y=%d, z=%d",10,0
msg_2 db "Individual condition tests:",10,0
msg_3 db "x == z: ",0
msg_4 db "TRUE",10,0
msg_5 db "FALSE",10,0
msg_6 db "y > x: ",0
msg_7 db "Combined AND test (x == z && y > x):",10,0
msg_8 db "✓ SUCCESS: AND operation works correctly",10,0
msg_9 db "✗ FAILURE: AND operation has issues",10,0
msg_10 db "With explicit parentheses ((x == z) && (y > x)):",10,0
msg_11 db "✓ SUCCESS: Parentheses AND works correctly",10,0
msg_12 db "✗ FAILURE: Parentheses AND has issues",10,0

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
    sub rsp, 472
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-32], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-32]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-48], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-48]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-56], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-56]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-64], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-64]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-72], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-80], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-88], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-96], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-72]
    mov rsi, [rbp-80]
    mov rdx, [rbp-88]
    mov rcx, [rbp-96]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-152], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-144]
    mov rbx, qword [rbp-152]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-160], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-160]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-168], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-168]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-184], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-184]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-200], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-200]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-216], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-224], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-216]
    mov rbx, qword [rbp-224]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-232], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-232]
    test rax, rax
    jz else_2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_3
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-256]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-272], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-272]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-288], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-296], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-288]
    mov rbx, qword [rbp-296]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-304], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-312], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-320], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-312]
    mov rbx, qword [rbp-320]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-328], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-304]
    mov rbx, qword [rbp-328]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-336], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-336]
    test rax, rax
    jz else_4
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-344], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-344]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_5
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-360], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-360]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_5:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-376], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-376]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-392], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-400], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-392]
    mov rbx, qword [rbp-400]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-416], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-424], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-416]
    mov rbx, qword [rbp-424]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-432], rax
    ; IR: AND dest src1 src2
    mov rax, qword [rbp-408]
    mov rbx, qword [rbp-432]
    test rax, rax
    setne al
    test rbx, rbx
    setne bl
    and al, bl
    movzx rax, al
    mov qword [rbp-440], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-440]
    test rax, rax
    jz else_6
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_7
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_7:
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
