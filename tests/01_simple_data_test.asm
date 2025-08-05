; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== Simple AELang Test ===\\n",0
msg_1 db "i32: %d\\n",0
msg_2 db "f32: %.2f\\n",0
msg_3 db "bool: %t\\n",0
msg_4 db "char: %c\\n",0
msg_5 db "Test complete!\\n",0
float_0: dd 0x4048f5c3  ; 3.1400001

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_int
    extern read_float
    extern read_num

main:
    push ebp
    mov ebp, esp
    sub esp, 96
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-20], eax
    ; IR: PARAM src1
    push dword [ebp-20]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-28], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-28]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-32], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-32]
    mov [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-36], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-36]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 65
    mov [ebp-40], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-40]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-44], eax
    ; IR: PARAM src1
    push dword [ebp-44]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-48], eax
    ; IR: PARAM src1
    push dword [ebp-48]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-56], eax
    ; IR: PARAM src1
    push dword [ebp-56]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-60], eax
    ; IR: PARAM src1
    push dword [ebp-60]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-68], eax
    ; IR: PARAM src1
    push dword [ebp-68]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-72], eax
    ; IR: PARAM src1
    push dword [ebp-72]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-80], eax
    ; IR: PARAM src1
    push dword [ebp-80]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-84], eax
    ; IR: PARAM src1
    push dword [ebp-84]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-92], eax
    ; IR: PARAM src1
    push dword [ebp-92]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
