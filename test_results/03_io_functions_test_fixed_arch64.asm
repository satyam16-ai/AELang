; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
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
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read

main:
    push rbp
    mov rbp, rsp
    sub rsp, 936
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov [rbp-112], rax
    ; IR: PARAM src1
    mov rdi, [rbp-112]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov [rbp-128], rax
    ; IR: PARAM src1
    mov rdi, [rbp-128]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov [rbp-144], rax
    ; IR: PARAM src1
    mov rdi, [rbp-144]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov [rbp-160], rax
    ; IR: PARAM src1
    mov rdi, [rbp-160]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-176], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-176]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov [rbp-184], rax
    ; IR: PARAM src1
    mov rdi, [rbp-184]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-192], rax
    ; IR: PARAM src1
    mov rsi, [rbp-192]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov [rbp-208], rax
    ; IR: PARAM src1
    mov rdi, [rbp-208]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-224], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-224]
    mov [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov [rbp-232], rax
    ; IR: PARAM src1
    mov rdi, [rbp-232]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-240], rax
    ; IR: PARAM src1
    mov rsi, [rbp-240]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov [rbp-256], rax
    ; IR: PARAM src1
    mov rdi, [rbp-256]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-272], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-272]
    mov [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov [rbp-280], rax
    ; IR: PARAM src1
    mov rdi, [rbp-280]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-288], rax
    ; IR: PARAM src1
    mov rsi, [rbp-288]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov [rbp-304], rax
    ; IR: PARAM src1
    mov rdi, [rbp-304]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov [rbp-320], rax
    ; IR: PARAM src1
    mov rdi, [rbp-320]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-336], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-336]
    mov [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov [rbp-344], rax
    ; IR: PARAM src1
    mov rdi, [rbp-344]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-352], rax
    ; IR: PARAM src1
    mov rsi, [rbp-352]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov [rbp-368], rax
    ; IR: PARAM src1
    mov rdi, [rbp-368]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-384], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-384]
    mov [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov [rbp-392], rax
    ; IR: PARAM src1
    mov rdi, [rbp-392]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-400], rax
    ; IR: PARAM src1
    mov rsi, [rbp-400]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov [rbp-416], rax
    ; IR: PARAM src1
    mov rdi, [rbp-416]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-432], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-432]
    mov [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov [rbp-440], rax
    ; IR: PARAM src1
    mov rdi, [rbp-440]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-448], rax
    ; IR: PARAM src1
    mov rsi, [rbp-448]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov [rbp-464], rax
    ; IR: PARAM src1
    mov rdi, [rbp-464]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov [rbp-480], rax
    ; IR: PARAM src1
    mov rdi, [rbp-480]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-496], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-496]
    mov [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov [rbp-504], rax
    ; IR: PARAM src1
    mov rdi, [rbp-504]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-56]
    mov [rbp-512], rax
    ; IR: PARAM src1
    mov rsi, [rbp-512]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov [rbp-528], rax
    ; IR: PARAM src1
    mov rdi, [rbp-528]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov [rbp-544], rax
    ; IR: PARAM src1
    mov rdi, [rbp-544]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-560], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-560]
    mov [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov [rbp-568], rax
    ; IR: PARAM src1
    mov rdi, [rbp-568]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-64]
    mov [rbp-576], rax
    ; IR: PARAM src1
    mov rsi, [rbp-576]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov [rbp-592], rax
    ; IR: PARAM src1
    mov rdi, [rbp-592]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov [rbp-608], rax
    ; IR: PARAM src1
    mov rdi, [rbp-608]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: CALL dest src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read
    mov [rbp-624], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-624]
    mov [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov [rbp-632], rax
    ; IR: PARAM src1
    mov rdi, [rbp-632]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-72]
    mov [rbp-648], rax
    ; IR: PARAM src1
    mov rdi, [rbp-648]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov [rbp-664], rax
    ; IR: PARAM src1
    mov rdi, [rbp-664]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov [rbp-680], rax
    ; IR: PARAM src1
    mov rdi, [rbp-680]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov [rbp-696], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-696]
    mov [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_0
    mov [rbp-704], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-704]
    mov [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 90
    mov [rbp-712], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-712]
    mov [rbp-96], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov [rbp-720], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-720]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov [rbp-728], rax
    ; IR: PARAM src1
    mov rdi, [rbp-728]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-736], rax
    ; IR: PARAM src1
    mov rsi, [rbp-736]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov [rbp-752], rax
    ; IR: PARAM src1
    mov rdi, [rbp-752]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-760], rax
    ; IR: PARAM src1
    mov rsi, [rbp-760]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_30
    mov [rbp-776], rax
    ; IR: PARAM src1
    mov rdi, [rbp-776]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-784], rax
    ; IR: PARAM src1
    mov rsi, [rbp-784]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_31
    mov [rbp-800], rax
    ; IR: PARAM src1
    mov rdi, [rbp-800]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-808], rax
    ; IR: PARAM src1
    mov rsi, [rbp-808]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_32
    mov [rbp-824], rax
    ; IR: PARAM src1
    mov rdi, [rbp-824]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-832], rax
    ; IR: PARAM src1
    mov rsi, [rbp-832]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_33
    mov [rbp-848], rax
    ; IR: PARAM src1
    mov rdi, [rbp-848]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-856], rax
    ; IR: PARAM src1
    mov rsi, [rbp-856]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_34
    mov [rbp-872], rax
    ; IR: PARAM src1
    mov rdi, [rbp-872]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-880], rax
    ; IR: PARAM src1
    mov rsi, [rbp-880]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_35
    mov [rbp-896], rax
    ; IR: PARAM src1
    mov rdi, [rbp-896]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-912], rax
    ; IR: PARAM src1
    mov rdi, [rbp-912]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov [rbp-928], rax
    ; IR: PARAM src1
    mov rdi, [rbp-928]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
