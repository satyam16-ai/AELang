; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "Before read\\n",0
msg_1 db "After read\\\\n",0

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
    sub esp, 24
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-8], eax
    ; IR: PARAM src1
    push dword [ebp-8]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 2
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-16], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-16]
    mov dword [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-20], eax
    ; IR: PARAM src1
    push dword [ebp-20]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
