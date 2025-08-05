; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "Before read_with_type",10,0
msg_1 db "After printf",10,0

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_with_type

main:
    push ebp
    mov ebp, esp
    sub esp, 16
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-4], eax
    ; IR: PARAM src1
    push dword [ebp-4]
    ; IR: CALL src1
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-12], eax
    ; IR: PARAM src1
    push dword [ebp-12]
    ; IR: CALL src1
    call printf
    add esp, 4  ; clean up stack
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
