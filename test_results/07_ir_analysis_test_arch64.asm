; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== IR Code Generation Analysis Test ===\\n",0
msg_1 db "This test is designed to analyze IR generation patterns\\n\\n",0
msg_2 db "=== Simple Operations for IR Analysis ===\\n",0
msg_3 db "Simple assignment: %d\\n",0
msg_4 db "Simple addition: %d + %d = %d\\n",0
msg_5 db "\\n=== Complex Expressions for IR Analysis ===\\n",0
msg_6 db "Complex: %d * %d + %d * (%d - %d) = %d\\n",0
msg_7 db "\\n=== Nested Expressions for IR Analysis ===\\n",0
msg_8 db "Nested: ((%d + %d) * (%d + 1)) - ((%d - %d) / %d) = %d\\n",0
msg_9 db "\\n=== Multiple Data Types for IR Analysis ===\\n",0
msg_10 db "Multi-type: int=%d, float=%.2f, char=%c, bool=%d\\n",0
msg_11 db "\\n=== Variable Reuse for IR Analysis ===\\n",0
msg_12 db "Initial value: %d\\n",0
msg_13 db "After addition: %d\\n",0
msg_14 db "After multiplication: %d\\n",0
msg_15 db "\\n=== Function Call Patterns for IR Analysis ===\\n",0
msg_16 db "Single param: %d\\n",0
msg_17 db "Multiple params: %d, %d, %d\\n",0
msg_18 db "Mixed params: %d, %.2f, %c\\n",0
msg_19 db "\\n=== Memory Access Patterns for IR Analysis ===\\n",0
msg_20 db "Sequential access patterns:\\n",0
msg_21 db "  Order 1: %d\\n",0
msg_22 db "  Order 2: %d\\n",0
msg_23 db "  Order 3: %d\\n",0
msg_24 db "\\n=== Optimization Test Cases ===\\n",0
msg_25 db "Constant folding: 5 + 3 * 2 = %d\\n",0
msg_26 db "Used variable: %d\\n",0
msg_27 db "Common subexpression: %d, %d\\n",0
msg_28 db "\\n=== IR Analysis Test Complete ===\\n",0
msg_29 db "Check generated assembly for IR patterns\\n",0
float_0: dd 0x4048f5c3  ; 3.1400001
float_1: dd 0x40fc7ae1  ; 7.88999987

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
    sub rsp, 1632
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov [rbp-208], rax
    ; IR: PARAM src1
    mov rdi, [rbp-208]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov [rbp-224], rax
    ; IR: PARAM src1
    mov rdi, [rbp-224]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov [rbp-240], rax
    ; IR: PARAM src1
    mov rdi, [rbp-240]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov [rbp-256], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-256]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov [rbp-264], rax
    ; IR: PARAM src1
    mov rdi, [rbp-264]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-272], rax
    ; IR: PARAM src1
    mov rsi, [rbp-272]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov [rbp-288], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-288]
    mov [rbp-16], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-296], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-304], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-296]
    mov rbx, [rbp-304]
    add rax, rbx
    mov [rbp-312], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-312]
    mov [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov [rbp-320], rax
    ; IR: PARAM src1
    mov rdi, [rbp-320]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-328], rax
    ; IR: PARAM src1
    mov rsi, [rbp-328]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-336], rax
    ; IR: PARAM src1
    mov rdx, [rbp-336]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-344], rax
    ; IR: PARAM src1
    mov rcx, [rbp-344]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov [rbp-360], rax
    ; IR: PARAM src1
    mov rdi, [rbp-360]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov [rbp-376], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-376]
    mov [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-384], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-384]
    mov [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-392], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-392]
    mov [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-400], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-408], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-400]
    mov rbx, [rbp-408]
    imul rax, rbx
    mov [rbp-416], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-424], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-416]
    mov rbx, [rbp-424]
    add rax, rbx
    mov [rbp-432], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-440], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-448], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-440]
    mov rbx, [rbp-448]
    sub rax, rbx
    mov [rbp-456], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-432]
    mov rbx, [rbp-456]
    imul rax, rbx
    mov [rbp-464], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-464]
    mov [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov [rbp-472], rax
    ; IR: PARAM src1
    mov rdi, [rbp-472]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-480], rax
    ; IR: PARAM src1
    mov rsi, [rbp-480]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-488], rax
    ; IR: PARAM src1
    mov rdx, [rbp-488]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-496], rax
    ; IR: PARAM src1
    mov rcx, [rbp-496]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-504], rax
    ; IR: PARAM src1
    mov r8, [rbp-504]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-512], rax
    ; IR: PARAM src1
    mov r9, [rbp-512]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-56]
    mov [rbp-520], rax
    ; IR: PARAM src1
    push [rbp-520]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov [rbp-536], rax
    ; IR: PARAM src1
    mov rdi, [rbp-536]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-552], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-560], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-552]
    mov rbx, [rbp-560]
    add rax, rbx
    mov [rbp-568], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-576], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov [rbp-584], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-576]
    mov rbx, [rbp-584]
    add rax, rbx
    mov [rbp-592], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-568]
    mov rbx, [rbp-592]
    imul rax, rbx
    mov [rbp-600], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-608], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-616], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-608]
    mov rbx, [rbp-616]
    sub rax, rbx
    mov [rbp-624], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-632], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-624]
    mov rbx, [rbp-632]
    cqo
    idiv rbx
    mov [rbp-640], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-600]
    mov rbx, [rbp-640]
    sub rax, rbx
    mov [rbp-648], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-648]
    mov [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov [rbp-656], rax
    ; IR: PARAM src1
    mov rdi, [rbp-656]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-664], rax
    ; IR: PARAM src1
    mov rsi, [rbp-664]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-672], rax
    ; IR: PARAM src1
    mov rdx, [rbp-672]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-680], rax
    ; IR: PARAM src1
    mov rcx, [rbp-680]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-688], rax
    ; IR: PARAM src1
    mov r8, [rbp-688]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-696], rax
    ; IR: PARAM src1
    mov r9, [rbp-696]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-704], rax
    ; IR: PARAM src1
    push [rbp-704]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-64]
    mov [rbp-712], rax
    ; IR: PARAM src1
    push [rbp-712]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov [rbp-728], rax
    ; IR: PARAM src1
    mov rdi, [rbp-728]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov [rbp-744], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-744]
    mov [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_0
    mov [rbp-752], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-752]
    mov [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 65
    mov [rbp-760], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-760]
    mov [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov [rbp-768], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-768]
    mov [rbp-96], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov [rbp-776], rax
    ; IR: PARAM src1
    mov rdi, [rbp-776]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-72]
    mov [rbp-784], rax
    ; IR: PARAM src1
    mov rsi, [rbp-784]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-792], rax
    ; IR: PARAM src1
    mov rdx, [rbp-792]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-800], rax
    ; IR: PARAM src1
    mov rcx, [rbp-800]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-808], rax
    ; IR: PARAM src1
    mov r8, [rbp-808]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov [rbp-824], rax
    ; IR: PARAM src1
    mov rdi, [rbp-824]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov [rbp-840], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-840]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov [rbp-848], rax
    ; IR: PARAM src1
    mov rdi, [rbp-848]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-856], rax
    ; IR: PARAM src1
    mov rsi, [rbp-856]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-872], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 50
    mov [rbp-880], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-872]
    mov rbx, [rbp-880]
    add rax, rbx
    mov [rbp-888], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-888]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov [rbp-896], rax
    ; IR: PARAM src1
    mov rdi, [rbp-896]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-904], rax
    ; IR: PARAM src1
    mov rsi, [rbp-904]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-920], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-928], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-920]
    mov rbx, [rbp-928]
    imul rax, rbx
    mov [rbp-936], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-936]
    mov [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov [rbp-944], rax
    ; IR: PARAM src1
    mov rdi, [rbp-944]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-952], rax
    ; IR: PARAM src1
    mov rsi, [rbp-952]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov [rbp-968], rax
    ; IR: PARAM src1
    mov rdi, [rbp-968]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov [rbp-984], rax
    ; IR: PARAM src1
    mov rdi, [rbp-984]
    ; IR: LOAD_CONST dest src1
    mov rax, 123
    mov [rbp-992], rax
    ; IR: PARAM src1
    mov rsi, [rbp-992]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov [rbp-1008], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1008]
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov [rbp-1016], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1016]
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-1024], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1024]
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-1032], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1032]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov [rbp-1048], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1048]
    ; IR: LOAD_CONST dest src1
    mov rax, 456
    mov [rbp-1056], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1056]
    ; IR: LOAD_CONST dest src1
    mov rax, float_1
    mov [rbp-1064], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1064]
    ; IR: LOAD_CONST dest src1
    mov rax, 90
    mov [rbp-1072], rax
    ; IR: PARAM src1
    mov rcx, [rbp-1072]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov [rbp-1088], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1088]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov [rbp-1104], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1104]
    mov [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov [rbp-1112], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1112]
    mov [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 30
    mov [rbp-1120], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1120]
    mov [rbp-128], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 40
    mov [rbp-1128], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1128]
    mov [rbp-136], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1136], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1144], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1136]
    mov rbx, [rbp-1144]
    add rax, rbx
    mov [rbp-1152], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-128]
    mov [rbp-1160], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1152]
    mov rbx, [rbp-1160]
    add rax, rbx
    mov [rbp-1168], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-136]
    mov [rbp-1176], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1168]
    mov rbx, [rbp-1176]
    add rax, rbx
    mov [rbp-1184], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1184]
    mov [rbp-144], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-136]
    mov [rbp-1192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-128]
    mov [rbp-1200], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1192]
    mov rbx, [rbp-1200]
    add rax, rbx
    mov [rbp-1208], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1216], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1208]
    mov rbx, [rbp-1216]
    add rax, rbx
    mov [rbp-1224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1232], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1224]
    mov rbx, [rbp-1232]
    add rax, rbx
    mov [rbp-1240], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1240]
    mov [rbp-152], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-1248], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-128]
    mov [rbp-1256], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1248]
    mov rbx, [rbp-1256]
    add rax, rbx
    mov [rbp-1264], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-1272], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1264]
    mov rbx, [rbp-1272]
    add rax, rbx
    mov [rbp-1280], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-136]
    mov [rbp-1288], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1280]
    mov rbx, [rbp-1288]
    add rax, rbx
    mov [rbp-1296], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1296]
    mov [rbp-160], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov [rbp-1304], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1304]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov [rbp-1320], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1320]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-144]
    mov [rbp-1328], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1328]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov [rbp-1344], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1344]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-152]
    mov [rbp-1352], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1352]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov [rbp-1368], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1368]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-160]
    mov [rbp-1376], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1376]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov [rbp-1392], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1392]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov [rbp-1408], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-1416], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1408]
    mov rbx, [rbp-1416]
    add rax, rbx
    mov [rbp-1424], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-1432], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-1424]
    mov rbx, [rbp-1432]
    imul rax, rbx
    mov [rbp-1440], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1440]
    mov [rbp-168], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov [rbp-1448], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1448]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-168]
    mov [rbp-1456], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1456]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 999
    mov [rbp-1472], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1472]
    mov [rbp-176], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 888
    mov [rbp-1480], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1480]
    mov [rbp-184], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov [rbp-1488], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1488]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-184]
    mov [rbp-1496], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1496]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-1512], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-1520], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1512]
    mov rbx, [rbp-1520]
    add rax, rbx
    mov [rbp-1528], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1528]
    mov [rbp-192], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-1536], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-1544], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1536]
    mov rbx, [rbp-1544]
    add rax, rbx
    mov [rbp-1552], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-1560], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-1552]
    mov rbx, [rbp-1560]
    imul rax, rbx
    mov [rbp-1568], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1568]
    mov [rbp-200], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov [rbp-1576], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1576]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-192]
    mov [rbp-1584], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1584]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-200]
    mov [rbp-1592], rax
    ; IR: PARAM src1
    mov rdx, [rbp-1592]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov [rbp-1608], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1608]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov [rbp-1624], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1624]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
