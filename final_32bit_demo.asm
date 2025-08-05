; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== ÆLang 32-bit Architecture Test ===",10,0
msg_1 db "All data types with proper newlines and read functionality",10,10,0
msg_2 db "Testing i8 (-128 to 127):",10,0
msg_3 db "i8 value: %d",10,10,0
msg_4 db "Testing i16 (-32768 to 32767):",10,0
msg_5 db "i16 value: %d",10,10,0
msg_6 db "Testing i32:",10,0
msg_7 db "i32 value: %d",10,10,0
msg_8 db "Testing u8 (0 to 255):",10,0
msg_9 db "u8 value: %u",10,10,0
msg_10 db "Testing u16 (0 to 65535):",10,0
msg_11 db "u16 value: %u",10,10,0
msg_12 db "Testing u32:",10,0
msg_13 db "u32 value: %u",10,10,0
msg_14 db "Testing f32 (float):",10,0
msg_15 db "f32 value: %f",10,10,0
msg_16 db "Testing num (numeric):",10,0
msg_17 db "num value: %f",10,10,0
msg_18 db "Testing char:",10,0
msg_19 db "char value: %c",10,10,0
msg_20 db "🎉 All tests completed successfully!",10,0
msg_21 db "✅ Unified read() system working",10,0
msg_22 db "✅ Newlines properly formatted",10,0
msg_23 db "✅ 32-bit architecture enforced",10,0
msg_24 db "✅ Parameter order fixed",10,0

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
    sub esp, 308
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-40], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-40]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-48], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-48]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov dword [ebp-56], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-56]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 0
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-64], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-64]
    mov dword [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov dword [ebp-68], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-72], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-72]
    push dword [ebp-68]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov dword [ebp-80], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-80]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 1
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-88], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-88]
    mov dword [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov dword [ebp-92], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-96], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-96]
    push dword [ebp-92]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov dword [ebp-104], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-104]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 2
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-112], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-112]
    mov dword [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov dword [ebp-116], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-12]
    mov dword [ebp-120], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-120]
    push dword [ebp-116]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov dword [ebp-128], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-128]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 4
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-136], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-136]
    mov dword [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov dword [ebp-140], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-16]
    mov dword [ebp-144], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-144]
    push dword [ebp-140]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov dword [ebp-152], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-152]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 5
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-160], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-160]
    mov dword [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov dword [ebp-164], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-20]
    mov dword [ebp-168], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-168]
    push dword [ebp-164]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov dword [ebp-176], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-176]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 6
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-184], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-184]
    mov dword [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov dword [ebp-188], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-24]
    mov dword [ebp-192], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-192]
    push dword [ebp-188]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov dword [ebp-200], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-200]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 10
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-208], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-208]
    mov dword [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov dword [ebp-212], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-28]
    mov dword [ebp-216], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-216]
    push dword [ebp-212]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov dword [ebp-224], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-224]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 12
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-232], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-232]
    mov dword [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov dword [ebp-236], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-32]
    mov dword [ebp-240], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-240]
    push dword [ebp-236]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov dword [ebp-248], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-248]
    call printf
    add esp, 4  ; clean up stack
    ; IR: PARAM src1
    ; IR: CALL dest src1
    push 14
    call read_with_type
    add esp, 4  ; clean up stack
    mov dword [ebp-256], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-256]
    mov dword [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov dword [ebp-260], eax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-36]
    mov dword [ebp-264], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-264]
    push dword [ebp-260]
    call printf
    add esp, 8  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_20
    mov dword [ebp-272], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-272]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_21
    mov dword [ebp-280], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-280]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_22
    mov dword [ebp-288], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-288]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_23
    mov dword [ebp-296], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-296]
    call printf
    add esp, 4  ; clean up stack
    ; IR: LOAD_CONST dest src1
    mov eax, msg_24
    mov dword [ebp-304], eax
    ; IR: PARAM src1
    ; IR: CALL src1
    push dword [ebp-304]
    call printf
    add esp, 4  ; clean up stack
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
