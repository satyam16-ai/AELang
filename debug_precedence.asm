; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Precedence Debug Test ===",10,0
msg_1 db "Variables: a=%d, b=%d, c=%d, d=%d",10,0
msg_2 db "b * c = %d",10,0
msg_3 db "d / d = %d",10,0
msg_4 db "a + (b*c) = %d",10,0
msg_5 db "(a + b*c) - (d/d) = %d",10,0
msg_6 db "Full expression a + b * c - d / d = %d",10,0
msg_7 db "Expected: 24",10,0

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
    mov qword [rbp-80], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-80]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-96], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-96]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-104], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-104]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-112], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-112]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-120], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-120]
    mov qword [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-128], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-136], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-144], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-152], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-128]
    mov rsi, [rbp-136]
    mov rdx, [rbp-144]
    mov rcx, [rbp-152]
    mov r8, [rbp-160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-184], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-176]
    mov rbx, qword [rbp-184]
    imul rax, rbx
    mov qword [rbp-192], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-192]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-200], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-208], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-200]
    mov rsi, [rbp-208]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-232], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-224]
    mov rbx, qword [rbp-232]
    cqo
    idiv rbx
    mov qword [rbp-240], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-240]
    mov qword [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-248], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-248]
    mov rsi, [rbp-256]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-272], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-280], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-272]
    mov rbx, qword [rbp-280]
    add rax, rbx
    mov qword [rbp-288], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-288]
    mov qword [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-304], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-296]
    mov rsi, [rbp-304]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-320], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-328], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-320]
    mov rbx, qword [rbp-328]
    sub rax, rbx
    mov qword [rbp-336], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-336]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-344], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-344]
    mov rsi, [rbp-352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-368], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-376], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-384], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-376]
    mov rbx, qword [rbp-384]
    imul rax, rbx
    mov qword [rbp-392], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-368]
    mov rbx, qword [rbp-392]
    add rax, rbx
    mov qword [rbp-400], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-416], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-408]
    mov rbx, qword [rbp-416]
    cqo
    idiv rbx
    mov qword [rbp-424], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-400]
    mov rbx, qword [rbp-424]
    sub rax, rbx
    mov qword [rbp-432], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-432]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-440], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-440]
    mov rsi, [rbp-448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
