; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "PI value: %.5f",10,0
float_0: dd 0x40490fd0  ; 3.14159012

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
    sub rsp, 40
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_0]
    mov dword [rbp-16], eax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-16]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-24], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-32], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-24]
    mov rsi, [rbp-32]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
