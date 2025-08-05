; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .bss
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read

main:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov [rbp-32], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-32]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov [rbp-40], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-40]
    mov [rbp-16], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-56], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-48]
    mov rbx, [rbp-56]
    add rax, rbx
    mov [rbp-64], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-64]
    mov [rbp-24], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-72], rax
    ; IR: PARAM src1
    mov rdi, [rbp-72]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
