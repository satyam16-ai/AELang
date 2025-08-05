; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== ÆLang Comprehensive Data Type Test ===",10,0
msg_1 db "Enter an i8 value (-128 to 127): ",0
msg_2 db "You entered i8: %d",10,0
msg_3 db "Enter an i16 value (-32768 to 32767): ",0
msg_4 db "You entered i16: %d",10,0
msg_5 db "Enter an i32 value: ",0
msg_6 db "You entered i32: %d",10,0
msg_7 db "Enter an i64 value: ",0
msg_8 db "You entered i64: %d",10,0
msg_9 db "Enter a u8 value (0 to 255): ",0
msg_10 db "You entered u8: %d",10,0
msg_11 db "Enter a u16 value (0 to 65535): ",0
msg_12 db "You entered u16: %d",10,0
msg_13 db "Enter a u32 value: ",0
msg_14 db "You entered u32: %d",10,0
msg_15 db "Enter a u64 value: ",0
msg_16 db "You entered u64: %d",10,0
msg_17 db "Enter an f32 value: ",0
msg_18 db "You entered f32: %f",10,0
msg_19 db "Enter an f64 value: ",0
msg_20 db "You entered f64: %f",10,0
msg_21 db "Enter a num value: ",0
msg_22 db "You entered num: %f",10,0
msg_23 db "Enter a character: ",0
msg_24 db "You entered char: %c",10,0
msg_25 db "=== All data types tested successfully! ===",10,0

section .bss
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_with_type

main:
    push rbp
    mov rbp, rsp
    sub rsp, 704
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-104], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-104]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-120], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-120]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 0
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-136], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-136]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-144], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-152], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-144]
    mov rsi, [rbp-152]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-168], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-168]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-184], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-184]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-192], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-200], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-192]
    mov rsi, [rbp-200]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-216], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-216]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 2
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-232], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-232]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-240], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-248], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-240]
    mov rsi, [rbp-248]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-264], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-264]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 3
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-280], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-280]
    mov qword [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-288]
    mov rsi, [rbp-296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 4
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-328], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-328]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-336], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-344], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-336]
    mov rsi, [rbp-344]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-360], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-360]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 5
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-376], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-376]
    mov qword [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-384], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-384]
    mov rsi, [rbp-392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-408], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-408]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 6
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-424], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-424]
    mov qword [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-432], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-440], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-432]
    mov rsi, [rbp-440]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-456], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-456]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 7
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-472], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-472]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-480], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-480]
    mov rsi, [rbp-488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-504]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 10
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-520], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-520]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-528], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-528]
    mov rsi, [rbp-536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-552]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 11
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-568], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-568]
    mov qword [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-584], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-576]
    mov rsi, [rbp-584]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov qword [rbp-600], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 12
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-616], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-616]
    mov qword [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-624]
    mov rsi, [rbp-632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov qword [rbp-648], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-648]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 14
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-664], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-664]
    mov qword [rbp-96], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov qword [rbp-672], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-680], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-672]
    mov rsi, [rbp-680]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov qword [rbp-696], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-696]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
