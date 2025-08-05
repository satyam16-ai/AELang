; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "Line 1",10,0
msg_1 db "Line 2",10,0
msg_2 db "Done!",10,0

section .bss
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_with_type

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-8], rax
    ; IR: PARAM src1
    mov rdi, [rbp-8]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-24], rax
    ; IR: PARAM src1
    mov rdi, [rbp-24]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-40], rax
    ; IR: PARAM src1
    mov rdi, [rbp-40]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
