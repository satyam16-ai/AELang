; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read

main:
    push ebp
    mov ebp, esp
    sub esp, 40
    ; IR: LOAD_CONST dest src1
    mov eax, 10
    mov [ebp-16], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-16]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 5
    mov [ebp-20], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-20]
    mov [ebp-8], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-24], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-28], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-24]
    mov ebx, [ebp-28]
    add eax, ebx
    mov [ebp-32], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-32]
    mov [ebp-12], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-36], eax
    ; IR: PARAM src1
    push [ebp-36]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
