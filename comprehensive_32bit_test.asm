; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== ÆLang 32-bit Data Type Test ===\n",0
msg_1 db "Enter an i8 value (-128 to 127): ",0
msg_2 db "You entered i8: %d\n",0
msg_3 db "Enter an i16 value (-32768 to 32767): ",0
msg_4 db "You entered i16: %d\n",0
msg_5 db "Enter an i32 value: ",0
msg_6 db "You entered i32: %d\n",0
msg_7 db "Enter a u8 value (0 to 255): ",0
msg_8 db "You entered u8: %d\n",0
msg_9 db "Enter a u16 value (0 to 65535): ",0
msg_10 db "You entered u16: %d\n",0
msg_11 db "Enter a u32 value: ",0
msg_12 db "You entered u32: %d\n",0
msg_13 db "Enter an f32 value: ",0
msg_14 db "You entered f32: %f\n",0
msg_15 db "Enter a num value: ",0
msg_16 db "You entered num: %f\n",0
msg_17 db "Enter a character: ",0
msg_18 db "You entered char: %c\n",0
msg_19 db "=== 32-bit data types tested successfully! ===\n",0

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
    sub esp, 268
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-40], eax
    ; IR: PARAM src1
    push dword [ebp-40]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-48], eax
    ; IR: PARAM src1
    push dword [ebp-48]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 0
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-56], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-56]
    mov dword [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov dword [ebp-60], eax
    ; IR: PARAM src1
    push dword [ebp-60]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-64], eax
    ; IR: PARAM src1
    push dword [ebp-64]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov dword [ebp-72], eax
    ; IR: PARAM src1
    push dword [ebp-72]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 1
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-80], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-80]
    mov dword [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov dword [ebp-84], eax
    ; IR: PARAM src1
    push dword [ebp-84]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-88], eax
    ; IR: PARAM src1
    push dword [ebp-88]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov dword [ebp-96], eax
    ; IR: PARAM src1
    push dword [ebp-96]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 2
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-104], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-104]
    mov dword [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov dword [ebp-108], eax
    ; IR: PARAM src1
    push dword [ebp-108]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-12]
    mov dword [ebp-112], eax
    ; IR: PARAM src1
    push dword [ebp-112]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov dword [ebp-120], eax
    ; IR: PARAM src1
    push dword [ebp-120]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 4
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-128], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-128]
    mov dword [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov dword [ebp-132], eax
    ; IR: PARAM src1
    push dword [ebp-132]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-16]
    mov dword [ebp-136], eax
    ; IR: PARAM src1
    push dword [ebp-136]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov dword [ebp-144], eax
    ; IR: PARAM src1
    push dword [ebp-144]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 5
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-152], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-152]
    mov dword [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov dword [ebp-156], eax
    ; IR: PARAM src1
    push dword [ebp-156]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-20]
    mov dword [ebp-160], eax
    ; IR: PARAM src1
    push dword [ebp-160]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov dword [ebp-168], eax
    ; IR: PARAM src1
    push dword [ebp-168]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 6
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-176], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-176]
    mov dword [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov dword [ebp-180], eax
    ; IR: PARAM src1
    push dword [ebp-180]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-24]
    mov dword [ebp-184], eax
    ; IR: PARAM src1
    push dword [ebp-184]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov dword [ebp-192], eax
    ; IR: PARAM src1
    push dword [ebp-192]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 10
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-200], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-200]
    mov dword [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov dword [ebp-204], eax
    ; IR: PARAM src1
    push dword [ebp-204]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-28]
    mov dword [ebp-208], eax
    ; IR: PARAM src1
    push dword [ebp-208]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov dword [ebp-216], eax
    ; IR: PARAM src1
    push dword [ebp-216]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 12
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-224], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-224]
    mov dword [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov dword [ebp-228], eax
    ; IR: PARAM src1
    push dword [ebp-228]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-32]
    mov dword [ebp-232], eax
    ; IR: PARAM src1
    push dword [ebp-232]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov dword [ebp-240], eax
    ; IR: PARAM src1
    push dword [ebp-240]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    push 14
    ; IR: CALL dest src1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-248], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-248]
    mov dword [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov dword [ebp-252], eax
    ; IR: PARAM src1
    push dword [ebp-252]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-36]
    mov dword [ebp-256], eax
    ; IR: PARAM src1
    push dword [ebp-256]
    ; IR: CALL src1
    call print
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov dword [ebp-264], eax
    ; IR: PARAM src1
    push dword [ebp-264]
    ; IR: CALL src1
    call print
    add esp, 4  ; clean up stack
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
