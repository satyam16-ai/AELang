; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "Hello from ÆLang!\\n",0
msg_1 db "Sum: %d + %d = %d\\n",0

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
    sub esp, 60
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-16], eax
    ; IR: PARAM src1
    push [ebp-16]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-24], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-24]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 7
    mov [ebp-28], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-28]
    mov [ebp-8], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-32], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-36], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-32]
    mov ebx, [ebp-36]
    add eax, ebx
    mov [ebp-40], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-40]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-44], eax
    ; IR: PARAM src1
    push [ebp-44]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-48], eax
    ; IR: PARAM src1
    push [ebp-48]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-52], eax
    ; IR: PARAM src1
    push [ebp-52]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-56], eax
    ; IR: PARAM src1
    push [ebp-56]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
