; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "Testing negative numbers:",10,0
msg_1 db "neg_a = %d",10,0
msg_2 db "neg_b = %d",10,0
msg_3 db "%d + %d = %d (expected: -13)",10,0
msg_4 db "%d * %d = %d (expected: 30)",10,0
msg_5 db "%d / %d = %d (expected: 3)",10,0

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
    sub rsp, 328
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-48], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-48]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-64], rax
    ; IR: UNKNOWN dest src1
    mov rax, qword [rbp-64]
    neg rax
    mov qword [rbp-72], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-72]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-80], rax
    ; IR: UNKNOWN dest src1
    mov rax, qword [rbp-80]
    neg rax
    mov qword [rbp-88], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-88]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-96], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-104], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-96]
    mov rsi, [rbp-104]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-120], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-120]
    mov rsi, [rbp-128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-152], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-144]
    mov rbx, qword [rbp-152]
    add rax, rbx
    mov qword [rbp-160], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-160]
    mov qword [rbp-24], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-168], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-176], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-168]
    mov rbx, qword [rbp-176]
    imul rax, rbx
    mov qword [rbp-184], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-184]
    mov qword [rbp-32], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-200], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-192]
    mov rbx, qword [rbp-200]
    cqo
    idiv rbx
    mov qword [rbp-208], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-208]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-216], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-224], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-232], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-216]
    mov rsi, [rbp-224]
    mov rdx, [rbp-232]
    mov rcx, [rbp-240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-264], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-272], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-280], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-256]
    mov rsi, [rbp-264]
    mov rdx, [rbp-272]
    mov rcx, [rbp-280]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-304], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-312], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-296]
    mov rsi, [rbp-304]
    mov rdx, [rbp-312]
    mov rcx, [rbp-320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
