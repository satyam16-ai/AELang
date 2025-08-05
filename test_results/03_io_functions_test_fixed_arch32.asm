; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== Input/Output Functions Test ===\\n",0
msg_1 db "This test will verify print and read functions for all data types\\n",0
msg_2 db "=== Integer I/O Test ===\\n",0
msg_3 db "Enter an i32 integer: ",0
msg_4 db "You entered i32: %d\\n",0
msg_5 db "Enter an i16 integer: ",0
msg_6 db "You entered i16: %d\\n",0
msg_7 db "Enter an i8 integer: ",0
msg_8 db "You entered i8: %d\\n",0
msg_9 db "=== Unsigned Integer I/O Test ===\\n",0
msg_10 db "Enter a u32 unsigned integer: ",0
msg_11 db "You entered u32: %u\\n",0
msg_12 db "Enter a u16 unsigned integer: ",0
msg_13 db "You entered u16: %u\\n",0
msg_14 db "Enter a u8 unsigned integer: ",0
msg_15 db "You entered u8: %u\\n",0
msg_16 db "=== Floating Point I/O Test ===\\n",0
msg_17 db "Enter a f32 floating point number: ",0
msg_18 db "You entered f32: %.6f\\n",0
msg_19 db "=== Character I/O Test ===\\n",0
msg_20 db "Enter a single character: ",0
msg_21 db "You entered character: '%c'\\n",0
msg_22 db "=== String I/O Test ===\\n",0
msg_23 db "Enter a string: ",0
msg_24 db "You entered string: ",0
msg_25 db "\\n",0
msg_26 db "=== Print Format Specifiers Test ===\\n",0
msg_27 db "Format Test",0
msg_28 db "Integer (d): %d\\n",0
msg_29 db "Integer (i): %i\\n",0
msg_30 db "Unsigned (u): %u\\n",0
msg_31 db "Float (f): %f\\n",0
msg_32 db "Float (e): %e\\n",0
msg_33 db "Float (g): %g\\n",0
msg_34 db "Character (c): %c\\n",0
msg_35 db "String (s): ",0
float_0: dd 0x40490fd0  ; 3.14159012

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
    sub esp, 468
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-56], eax
    ; IR: PARAM src1
    push [ebp-56]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-64], eax
    ; IR: PARAM src1
    push [ebp-64]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-72], eax
    ; IR: PARAM src1
    push [ebp-72]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-80], eax
    ; IR: PARAM src1
    push [ebp-80]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-88], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-88]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-92], eax
    ; IR: PARAM src1
    push [ebp-92]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-96], eax
    ; IR: PARAM src1
    push [ebp-96]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-104], eax
    ; IR: PARAM src1
    push [ebp-104]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-112], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-112]
    mov [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-116], eax
    ; IR: PARAM src1
    push [ebp-116]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-120], eax
    ; IR: PARAM src1
    push [ebp-120]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-128], eax
    ; IR: PARAM src1
    push [ebp-128]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-136], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-136]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-140], eax
    ; IR: PARAM src1
    push [ebp-140]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-144], eax
    ; IR: PARAM src1
    push [ebp-144]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-152], eax
    ; IR: PARAM src1
    push [ebp-152]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov [ebp-160], eax
    ; IR: PARAM src1
    push [ebp-160]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-168], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-168]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-172], eax
    ; IR: PARAM src1
    push [ebp-172]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-176], eax
    ; IR: PARAM src1
    push [ebp-176]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov [ebp-184], eax
    ; IR: PARAM src1
    push [ebp-184]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-192], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-192]
    mov [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov [ebp-196], eax
    ; IR: PARAM src1
    push [ebp-196]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-200], eax
    ; IR: PARAM src1
    push [ebp-200]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov [ebp-208], eax
    ; IR: PARAM src1
    push [ebp-208]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-216], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-216]
    mov [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov [ebp-220], eax
    ; IR: PARAM src1
    push [ebp-220]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-224], eax
    ; IR: PARAM src1
    push [ebp-224]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov [ebp-232], eax
    ; IR: PARAM src1
    push [ebp-232]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov [ebp-240], eax
    ; IR: PARAM src1
    push [ebp-240]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-248], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-248]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov [ebp-252], eax
    ; IR: PARAM src1
    push [ebp-252]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-256], eax
    ; IR: PARAM src1
    push [ebp-256]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov [ebp-264], eax
    ; IR: PARAM src1
    push [ebp-264]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_20
    mov [ebp-272], eax
    ; IR: PARAM src1
    push [ebp-272]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-280], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-280]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_21
    mov [ebp-284], eax
    ; IR: PARAM src1
    push [ebp-284]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-288], eax
    ; IR: PARAM src1
    push [ebp-288]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_22
    mov [ebp-296], eax
    ; IR: PARAM src1
    push [ebp-296]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_23
    mov [ebp-304], eax
    ; IR: PARAM src1
    push [ebp-304]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    mov [ebp-312], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-312]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_24
    mov [ebp-316], eax
    ; IR: PARAM src1
    push [ebp-316]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-324], eax
    ; IR: PARAM src1
    push [ebp-324]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_25
    mov [ebp-332], eax
    ; IR: PARAM src1
    push [ebp-332]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_26
    mov [ebp-340], eax
    ; IR: PARAM src1
    push [ebp-340]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-348], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-348]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-352], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-352]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 90
    mov [ebp-356], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-356]
    mov [ebp-48], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_27
    mov [ebp-360], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-360]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_28
    mov [ebp-364], eax
    ; IR: PARAM src1
    push [ebp-364]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-368], eax
    ; IR: PARAM src1
    push [ebp-368]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_29
    mov [ebp-376], eax
    ; IR: PARAM src1
    push [ebp-376]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-380], eax
    ; IR: PARAM src1
    push [ebp-380]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_30
    mov [ebp-388], eax
    ; IR: PARAM src1
    push [ebp-388]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-392], eax
    ; IR: PARAM src1
    push [ebp-392]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_31
    mov [ebp-400], eax
    ; IR: PARAM src1
    push [ebp-400]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-404], eax
    ; IR: PARAM src1
    push [ebp-404]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_32
    mov [ebp-412], eax
    ; IR: PARAM src1
    push [ebp-412]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-416], eax
    ; IR: PARAM src1
    push [ebp-416]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_33
    mov [ebp-424], eax
    ; IR: PARAM src1
    push [ebp-424]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-428], eax
    ; IR: PARAM src1
    push [ebp-428]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_34
    mov [ebp-436], eax
    ; IR: PARAM src1
    push [ebp-436]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-440], eax
    ; IR: PARAM src1
    push [ebp-440]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_35
    mov [ebp-448], eax
    ; IR: PARAM src1
    push [ebp-448]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-456], eax
    ; IR: PARAM src1
    push [ebp-456]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_25
    mov [ebp-464], eax
    ; IR: PARAM src1
    push [ebp-464]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
