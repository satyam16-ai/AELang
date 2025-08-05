; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Simple Scope Test ===",10,0
msg_1 db "Global x: %d",10,0
msg_2 db "MAX_SIZE: %d",10,0
msg_3 db "15 + 27 = %d",10,0

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
    sub rsp, 192
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-48], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-48]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1000
    mov qword [rbp-56], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-56]
    mov qword [rbp-16], rax
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
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-112], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-104]
    mov rsi, [rbp-112]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-128], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-136], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-128]
    mov rsi, [rbp-136]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-152], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 27
    mov qword [rbp-160], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-152]
    mov rsi, [rbp-160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call simple_add
    mov qword [rbp-168], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-168]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-176], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-184], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-176]
    mov rsi, [rbp-184]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

simple_add:
    push rbp
    mov rbp, rsp
    sub rsp, 192
    ; Store parameter a from rdi
    mov qword [rbp-32], rdi
    ; Store parameter b from rsi
    mov qword [rbp-40], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-72], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-64]
    mov rbx, qword [rbp-72]
    add rax, rbx
    mov qword [rbp-80], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-80]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
