; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Arithmetic Operators Test ===\\n",0
msg_1 db "a = %d, b = %d\\n",0
msg_2 db "Addition: %d + %d = %d\\n",0
msg_3 db "Subtraction: %d - %d = %d\\n",0
msg_4 db "Multiplication: %d * %d = %d\\n",0
msg_5 db "Division: %d / %d = %d\\n",0
msg_6 db "Modulo: %d %% %d = %d\\n",0
msg_7 db "\\n=== Operator Precedence Test ===\\n",0
msg_8 db "2 + 3 * 4 = %d (should be 14)\\n",0
msg_9 db "20 / 4 + 2 = %d (should be 7)\\n",0
msg_10 db "(2 + 3) * 4 = %d (should be 20)\\n",0
msg_11 db "15 - 3 * 2 = %d (should be 9)\\n",0
msg_12 db "\\n=== Unary Operators Test ===\\n",0
msg_13 db "Positive: %d, Negative: %d\\n",0
msg_14 db "\\n=== Floating Point Arithmetic ===\\n",0
msg_15 db "Float a = %.2f, b = %.2f\\n",0
msg_16 db "Float add: %.2f + %.2f = %.2f\\n",0
msg_17 db "Float sub: %.2f - %.2f = %.2f\\n",0
msg_18 db "Float mul: %.2f * %.2f = %.2f\\n",0
msg_19 db "Float div: %.2f / %.2f = %.2f\\n",0
float_0: dd 0x41280000  ; 10.5
float_1: dd 0x404ccccd  ; 3.20000005

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
    sub rsp, 1200
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov [rbp-160], rax
    ; IR: PARAM src1
    mov rdi, [rbp-160]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov [rbp-176], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-176]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 7
    mov [rbp-184], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-184]
    mov [rbp-16], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-200], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-192]
    mov rbx, [rbp-200]
    add rax, rbx
    mov [rbp-208], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-208]
    mov [rbp-24], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-216], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-224], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-216]
    mov rbx, [rbp-224]
    sub rax, rbx
    mov [rbp-232], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-232]
    mov [rbp-32], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-240], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-248], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-240]
    mov rbx, [rbp-248]
    imul rax, rbx
    mov [rbp-256], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-256]
    mov [rbp-40], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-264], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-272], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-264]
    mov rbx, [rbp-272]
    cqo
    idiv rbx
    mov [rbp-280], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-280]
    mov [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-288], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-296], rax
    ; IR: MOD dest src1 src2
    mov rax, [rbp-288]
    mov rbx, [rbp-296]
    cqo
    idiv rbx
    mov rax, rdx
    mov [rbp-304], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-304]
    mov [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov [rbp-312], rax
    ; IR: PARAM src1
    mov rdi, [rbp-312]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-320], rax
    ; IR: PARAM src1
    mov rsi, [rbp-320]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-328], rax
    ; IR: PARAM src1
    mov rdx, [rbp-328]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov [rbp-344], rax
    ; IR: PARAM src1
    mov rdi, [rbp-344]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-352], rax
    ; IR: PARAM src1
    mov rsi, [rbp-352]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-360], rax
    ; IR: PARAM src1
    mov rdx, [rbp-360]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-368], rax
    ; IR: PARAM src1
    mov rcx, [rbp-368]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov [rbp-384], rax
    ; IR: PARAM src1
    mov rdi, [rbp-384]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-392], rax
    ; IR: PARAM src1
    mov rsi, [rbp-392]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-400], rax
    ; IR: PARAM src1
    mov rdx, [rbp-400]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-408], rax
    ; IR: PARAM src1
    mov rcx, [rbp-408]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov [rbp-424], rax
    ; IR: PARAM src1
    mov rdi, [rbp-424]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-432], rax
    ; IR: PARAM src1
    mov rsi, [rbp-432]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-440], rax
    ; IR: PARAM src1
    mov rdx, [rbp-440]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-448], rax
    ; IR: PARAM src1
    mov rcx, [rbp-448]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov [rbp-464], rax
    ; IR: PARAM src1
    mov rdi, [rbp-464]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-472], rax
    ; IR: PARAM src1
    mov rsi, [rbp-472]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-480], rax
    ; IR: PARAM src1
    mov rdx, [rbp-480]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-488], rax
    ; IR: PARAM src1
    mov rcx, [rbp-488]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov [rbp-504], rax
    ; IR: PARAM src1
    mov rdi, [rbp-504]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-512], rax
    ; IR: PARAM src1
    mov rsi, [rbp-512]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-520], rax
    ; IR: PARAM src1
    mov rdx, [rbp-520]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-56]
    mov [rbp-528], rax
    ; IR: PARAM src1
    mov rcx, [rbp-528]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov [rbp-544], rax
    ; IR: PARAM src1
    mov rdi, [rbp-544]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-560], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-568], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-560]
    mov rbx, [rbp-568]
    add rax, rbx
    mov [rbp-576], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 4
    mov [rbp-584], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-576]
    mov rbx, [rbp-584]
    imul rax, rbx
    mov [rbp-592], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-592]
    mov [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov [rbp-600], rax
    ; IR: PARAM src1
    mov rdi, [rbp-600]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-64]
    mov [rbp-608], rax
    ; IR: PARAM src1
    mov rsi, [rbp-608]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov [rbp-624], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 4
    mov [rbp-632], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-624]
    mov rbx, [rbp-632]
    cqo
    idiv rbx
    mov [rbp-640], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-648], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-640]
    mov rbx, [rbp-648]
    add rax, rbx
    mov [rbp-656], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-656]
    mov [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov [rbp-664], rax
    ; IR: PARAM src1
    mov rdi, [rbp-664]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-72]
    mov [rbp-672], rax
    ; IR: PARAM src1
    mov rsi, [rbp-672]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-688], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-696], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-688]
    mov rbx, [rbp-696]
    add rax, rbx
    mov [rbp-704], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 4
    mov [rbp-712], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-704]
    mov rbx, [rbp-712]
    imul rax, rbx
    mov [rbp-720], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-720]
    mov [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
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
    mov rax, 15
    mov [rbp-752], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-760], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-752]
    mov rbx, [rbp-760]
    sub rax, rbx
    mov [rbp-768], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-776], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-768]
    mov rbx, [rbp-776]
    imul rax, rbx
    mov [rbp-784], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-784]
    mov [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov [rbp-792], rax
    ; IR: PARAM src1
    mov rdi, [rbp-792]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-800], rax
    ; IR: PARAM src1
    mov rsi, [rbp-800]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov [rbp-816], rax
    ; IR: PARAM src1
    mov rdi, [rbp-816]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov [rbp-832], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-832]
    mov [rbp-96], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-840], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-848]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov [rbp-856], rax
    ; IR: PARAM src1
    mov rdi, [rbp-856]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-864], rax
    ; IR: PARAM src1
    mov rsi, [rbp-864]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-872], rax
    ; IR: PARAM src1
    mov rdx, [rbp-872]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov [rbp-888], rax
    ; IR: PARAM src1
    mov rdi, [rbp-888]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, float_0
    mov [rbp-904], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-904]
    mov [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_1
    mov [rbp-912], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-912]
    mov [rbp-120], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-920], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-928], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-920]
    mov rbx, [rbp-928]
    add rax, rbx
    mov [rbp-936], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-936]
    mov [rbp-128], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-944], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-952], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-944]
    mov rbx, [rbp-952]
    sub rax, rbx
    mov [rbp-960], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-960]
    mov [rbp-136], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-968], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-976], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-968]
    mov rbx, [rbp-976]
    imul rax, rbx
    mov [rbp-984], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-984]
    mov [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-992], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1000], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-992]
    mov rbx, [rbp-1000]
    cqo
    idiv rbx
    mov [rbp-1008], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1008]
    mov [rbp-152], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov [rbp-1016], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1016]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1024], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1024]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1032], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1032]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov [rbp-1048], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1048]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1056], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1056]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1064], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1064]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-128]
    mov [rbp-1072], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1072]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov [rbp-1088], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1088]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1096], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1096]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1104], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1104]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-136]
    mov [rbp-1112], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1112]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov [rbp-1128], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1128]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1136], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1136]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1144], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1144]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-144]
    mov [rbp-1152], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1152]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov [rbp-1168], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1168]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1176], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1176]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1184], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1184]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-152]
    mov [rbp-1192], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1192]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
