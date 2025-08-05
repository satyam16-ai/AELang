; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Integer Function Test ===",10,0
msg_1 db "i8 test: %d + %d = %d",10,0
msg_2 db "i16 test: %d * %d = %d",10,0
msg_3 db "=== Test Complete ===",10,0

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
    sub rsp, 208
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-72], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-72]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-88], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-96], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-104], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-112], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-120], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-88]
    mov rsi, [rbp-96]
    mov rdx, [rbp-104]
    mov rcx, [rbp-112]
    mov r8, [rbp-120]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i8
    mov qword [rbp-128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-144], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-152], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 200
    mov qword [rbp-160], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-168], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 200
    mov qword [rbp-176], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-144]
    mov rsi, [rbp-152]
    mov rdx, [rbp-160]
    mov rcx, [rbp-168]
    mov r8, [rbp-176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i16
    mov qword [rbp-184], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-184]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-200], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-200]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

test_i16:
    push rbp
    mov rbp, rsp
    sub rsp, 208
    ; Store parameter a from rdi
    mov qword [rbp-8], rdi
    ; Store parameter b from rsi
    mov qword [rbp-16], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-56], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-48]
    mov rbx, qword [rbp-56]
    imul rax, rbx
    mov qword [rbp-64], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-64]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_i8:
    push rbp
    mov rbp, rsp
    sub rsp, 208
    ; Store parameter a from rdi
    mov qword [rbp-8], rdi
    ; Store parameter b from rsi
    mov qword [rbp-16], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-24], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-32], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-24]
    mov rbx, qword [rbp-32]
    add rax, rbx
    mov qword [rbp-40], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-40]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
