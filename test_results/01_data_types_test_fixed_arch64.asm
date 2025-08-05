; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
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
    sub rsp, 568
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov [rbp-128], rax
    ; IR: PARAM src1
    mov rdi, [rbp-128]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 127
    mov [rbp-144], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-144]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 128
    mov [rbp-152], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-160]
    mov [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 255
    mov [rbp-168], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-168]
    mov [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov [rbp-176], rax
    ; IR: PARAM src1
    mov rdi, [rbp-176]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-184], rax
    ; IR: PARAM src1
    mov rsi, [rbp-184]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-192], rax
    ; IR: PARAM src1
    mov rdx, [rbp-192]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-200], rax
    ; IR: PARAM src1
    mov rcx, [rbp-200]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 32767
    mov [rbp-216], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-216]
    mov [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 32768
    mov [rbp-224], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-232]
    mov [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 65535
    mov [rbp-240], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-240]
    mov [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov [rbp-248], rax
    ; IR: PARAM src1
    mov rdi, [rbp-248]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-256], rax
    ; IR: PARAM src1
    mov rsi, [rbp-256]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-264], rax
    ; IR: PARAM src1
    mov rdx, [rbp-264]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-272], rax
    ; IR: PARAM src1
    mov rcx, [rbp-272]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 2147483647
    mov [rbp-288], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-288]
    mov [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -2147483648
    mov [rbp-296], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-304]
    mov [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -1
    mov [rbp-312], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-312]
    mov [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov [rbp-320], rax
    ; IR: PARAM src1
    mov rdi, [rbp-320]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-56]
    mov [rbp-328], rax
    ; IR: PARAM src1
    mov rsi, [rbp-328]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-64]
    mov [rbp-336], rax
    ; IR: PARAM src1
    mov rdx, [rbp-336]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-72]
    mov [rbp-344], rax
    ; IR: PARAM src1
    mov rcx, [rbp-344]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov [rbp-360], rax
    ; IR: PARAM src1
    mov rdi, [rbp-360]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, float_0
    mov [rbp-376], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-376]
    mov [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_1
    mov [rbp-384], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-392]
    mov [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov [rbp-400], rax
    ; IR: PARAM src1
    mov rdi, [rbp-400]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-408], rax
    ; IR: PARAM src1
    mov rsi, [rbp-408]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-416], rax
    ; IR: PARAM src1
    mov rdx, [rbp-416]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov [rbp-432], rax
    ; IR: PARAM src1
    mov rdi, [rbp-432]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 65
    mov [rbp-448], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-448]
    mov [rbp-96], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov [rbp-456], rax
    ; IR: PARAM src1
    mov rdi, [rbp-456]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-464], rax
    ; IR: PARAM src1
    mov rsi, [rbp-464]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov [rbp-480], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-480]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov [rbp-488], rax
    ; IR: PARAM src1
    mov rdi, [rbp-488]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-496], rax
    ; IR: PARAM src1
    mov rsi, [rbp-496]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov [rbp-512], rax
    ; IR: PARAM src1
    mov rdi, [rbp-512]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov [rbp-528], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-528]
    mov [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov [rbp-536], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-536]
    mov [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov [rbp-544], rax
    ; IR: PARAM src1
    mov rdi, [rbp-544]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-552], rax
    ; IR: PARAM src1
    mov rsi, [rbp-552]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-560], rax
    ; IR: PARAM src1
    mov rdx, [rbp-560]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
