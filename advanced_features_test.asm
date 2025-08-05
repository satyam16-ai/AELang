; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Advanced Function and Scoping Test ===",10,0
msg_1 db "Initial global_x: %d",10,0
msg_2 db "Global pi: %.2f",10,0
msg_3 db "MAX_SIZE constant: %d",10,0
msg_4 db "MIN_VALUE constant: %d",10,0
msg_5 db "15 + 27 = %d",10,0
msg_6 db "5! = %d",10,0
msg_7 db "Modified global_x: %d",10,0
msg_8 db "Inner scope: %d",10,0
msg_9 db "Back to outer scope: %d",10,0
msg_10 db "Local x: %d",10,0
msg_11 db "Global x: %d",10,0

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
    sub rsp, 664
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-328], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-344], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-344]
    mov rsi, [rbp-352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-368], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-376], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-368]
    mov rsi, [rbp-376]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-392], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-400], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-392]
    mov rsi, [rbp-400]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-416], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-424], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-416]
    mov rsi, [rbp-424]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-440], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 27
    mov qword [rbp-448], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-440]
    mov rsi, [rbp-448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call simple_add
    mov qword [rbp-456], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-456]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-472], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-464]
    mov rsi, [rbp-472]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-488], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call factorial
    mov qword [rbp-496], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-496]
    mov qword [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-512], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-504]
    mov rsi, [rbp-512]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_scoping
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call modify_global
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-544], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-544]
    mov rsi, [rbp-552]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 99
    mov qword [rbp-568], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-568]
    mov qword [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-576], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 50
    mov qword [rbp-584], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-576]
    mov rbx, qword [rbp-584]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-592], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-592]
    test rax, rax
    jz else_2
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-600], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-608], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-600]
    mov rbx, qword [rbp-608]
    imul rax, rbx
    mov qword [rbp-616], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-616]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-624]
    mov rsi, [rbp-632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO dest
    jmp end_if_3
    ; IR: LABEL dest
else_2:
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-648], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-656], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-648]
    mov rsi, [rbp-656]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

modify_global:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-304], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-312], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-304]
    mov rbx, qword [rbp-312]
    add rax, rbx
    mov qword [rbp-320], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-320]
    mov qword [rbp-8], rax

test_scoping:
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov qword [rbp-248], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-248]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-264], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-256]
    mov rsi, [rbp-264]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-280], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-280]
    mov rsi, [rbp-288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf

factorial:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-168], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-176], rax
    ; IR: LEQ dest src1 src2
    mov rax, qword [rbp-168]
    mov rbx, qword [rbp-176]
    cmp rax, rbx
    setle al
    movzx rax, al
    mov qword [rbp-184], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-184]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-192], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-192]
    mov rsp, rbp
    pop rbp
    ret
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-200], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-208], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-216], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-208]
    mov rbx, qword [rbp-216]
    sub rax, rbx
    mov qword [rbp-224], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-224]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call factorial
    mov qword [rbp-232], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-200]
    mov rbx, qword [rbp-232]
    imul rax, rbx
    mov qword [rbp-240], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-240]
    mov rsp, rbp
    pop rbp
    ret
    ; IR: LABEL dest
end_if_1:

simple_add:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-152], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-144]
    mov rbx, qword [rbp-152]
    add rax, rbx
    mov qword [rbp-160], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-160]
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
