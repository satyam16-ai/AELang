; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== Integer Types Test ===\\n",0
msg_1 db "i8 max: %d, min: %d, u8 max: %d\\n",0
msg_2 db "i16 max: %d, min: %d, u16 max: %d\\n",0
msg_3 db "i32 max: %d, min: %d, u32 max: %u\\n",0
msg_4 db "=== Floating Point Types Test ===\\n",0
msg_5 db "f32 positive: %.5f, negative: %.5f\\n",0
msg_6 db "=== Character and String Test ===\\n",0
msg_7 db "Character: %c\\n",0
msg_8 db "Hello AELang!",0
msg_9 db "String: %s\\n",0
msg_10 db "=== Boolean Test ===\\n",0
msg_11 db "Boolean true: %d, false: %d\\n",0
float_0: dd 0x40490fd0  ; 3.14159012
float_1: dd 0x402df84d  ; 2.71828008

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
    sub esp, 284
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-64], eax
    ; IR: PARAM src1
    push [ebp-64]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 127
    mov [ebp-72], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-72]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 128
    mov [ebp-76], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-80]
    mov [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 255
    mov [ebp-84], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-84]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-88], eax
    ; IR: PARAM src1
    push [ebp-88]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-92], eax
    ; IR: PARAM src1
    push [ebp-92]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-96], eax
    ; IR: PARAM src1
    push [ebp-96]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-100], eax
    ; IR: PARAM src1
    push [ebp-100]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 32767
    mov [ebp-108], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-108]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 32768
    mov [ebp-112], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-116]
    mov [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 65535
    mov [ebp-120], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-120]
    mov [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-124], eax
    ; IR: PARAM src1
    push [ebp-124]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-128], eax
    ; IR: PARAM src1
    push [ebp-128]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-132], eax
    ; IR: PARAM src1
    push [ebp-132]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-136], eax
    ; IR: PARAM src1
    push [ebp-136]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 2147483647
    mov [ebp-144], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-144]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, -2147483648
    mov [ebp-148], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-152]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, -1
    mov [ebp-156], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-156]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-160], eax
    ; IR: PARAM src1
    push [ebp-160]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-164], eax
    ; IR: PARAM src1
    push [ebp-164]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-168], eax
    ; IR: PARAM src1
    push [ebp-168]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-172], eax
    ; IR: PARAM src1
    push [ebp-172]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-180], eax
    ; IR: PARAM src1
    push [ebp-180]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-188], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-188]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-192], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-196]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-200], eax
    ; IR: PARAM src1
    push [ebp-200]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-204], eax
    ; IR: PARAM src1
    push [ebp-204]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-208], eax
    ; IR: PARAM src1
    push [ebp-208]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-216], eax
    ; IR: PARAM src1
    push [ebp-216]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 65
    mov [ebp-224], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-224]
    mov [ebp-48], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-228], eax
    ; IR: PARAM src1
    push [ebp-228]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-232], eax
    ; IR: PARAM src1
    push [ebp-232]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-240], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-240]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-244], eax
    ; IR: PARAM src1
    push [ebp-244]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-248], eax
    ; IR: PARAM src1
    push [ebp-248]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov [ebp-256], eax
    ; IR: PARAM src1
    push [ebp-256]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-264], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-264]
    mov [ebp-56], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-268], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-268]
    mov [ebp-60], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-272], eax
    ; IR: PARAM src1
    push [ebp-272]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-276], eax
    ; IR: PARAM src1
    push [ebp-276]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-280], eax
    ; IR: PARAM src1
    push [ebp-280]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
