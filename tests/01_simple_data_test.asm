; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== Simple AELang Test ===",10,0
msg_1 db "i32: %d",10,0
msg_2 db "f32: %.2f",10,0
msg_3 db "bool: %t",10,0
msg_4 db "char: %c",10,0
msg_5 db "Test complete!",10,0
float_0: dd 0x4048f5c3  ; 3.1400001

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern read
    extern read_with_type

main:
    push ebp
    mov ebp, esp
    sub esp, 96
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-20], eax
    ; IR: CALL src1
    push dword [ebp-20]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov dword [ebp-28], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-28]
    mov dword [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_0]
    mov dword [ebp-32], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-32]
    mov dword [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov dword [ebp-36], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-36]
    mov dword [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 65
    mov dword [ebp-40], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-40]
    mov dword [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-44], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-48], eax
    ; IR: CALL src1
    push dword [ebp-48]
    push dword [ebp-44]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov dword [ebp-56], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-60], eax
    ; IR: CALL src1
    push dword [ebp-60]
    push dword [ebp-56]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov dword [ebp-68], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-12]
    mov dword [ebp-72], eax
    ; IR: CALL src1
    push dword [ebp-72]
    push dword [ebp-68]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov dword [ebp-80], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-16]
    mov dword [ebp-84], eax
    ; IR: CALL src1
    push dword [ebp-84]
    push dword [ebp-80]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov dword [ebp-92], eax
    ; IR: CALL src1
    push dword [ebp-92]
    call printf
    add esp, 4  ; clean up stack
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
