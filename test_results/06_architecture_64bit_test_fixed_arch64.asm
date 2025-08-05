; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Architecture-Specific Test (64-bit) ===\\n",0
msg_1 db "=== 64-bit Specific Types ===\\n",0
msg_2 db "i64 max: %ld\\n",0
msg_3 db "i64 min: %ld\\n",0
msg_4 db "u64 max: %lu\\n",0
msg_5 db "f64 precision: %.12f\\n",0
msg_6 db "=== 64-bit Arithmetic ===\\n",0
msg_7 db "Large number arithmetic:\\n",0
msg_8 db "  %ld + %ld = %ld\\n",0
msg_9 db "  %ld - %ld = %ld\\n",0
msg_10 db "  %ld * 3 = %ld\\n",0
msg_11 db "  %ld / 2 = %ld\\n",0
msg_12 db "=== Double Precision Test ===\\n",0
msg_13 db "High precision constants:\\n",0
msg_14 db "  PI = %.15f\\n",0
msg_15 db "  E = %.15f\\n",0
msg_16 db "  PI + E = %.15f\\n",0
msg_17 db "  PI * E = %.15f\\n",0
msg_18 db "=== Mixed Architecture Types ===\\n",0
msg_19 db "Mixed types:\\n",0
msg_20 db "  i32: %d, i64: %ld\\n",0
msg_21 db "  f32: %.6f, f64: %.15f\\n",0
msg_22 db "=== Memory Intensive Test ===\\n",0
msg_23 db "Sum of 8 large numbers: %ld\\n",0
msg_24 db "=== 64-bit Register Usage Test ===\\n",0
msg_25 db "Complex 64-bit expression result: %ld\\n",0
msg_26 db "=== 64-bit Architecture Test Complete ===\\n",0
float_0: dd 0x42f6e9e0  ; 123.456787
float_1: dd 0x40490fdb  ; 3.14159274
float_2: dd 0x402df854  ; 2.71828175
float_3: dd 0x4048f5c3  ; 3.1400001

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
    sub rsp, 1384
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov [rbp-232], rax
    ; IR: PARAM src1
    mov rdi, [rbp-232]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov [rbp-248], rax
    ; IR: PARAM src1
    mov rdi, [rbp-248]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, -1
    mov [rbp-264], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-264]
    mov [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -1
    mov [rbp-272], rax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-280]
    mov [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -1
    mov [rbp-288], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-288]
    mov [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_0
    mov [rbp-296], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-296]
    mov [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov [rbp-304], rax
    ; IR: PARAM src1
    mov rdi, [rbp-304]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-8]
    mov [rbp-312], rax
    ; IR: PARAM src1
    mov rsi, [rbp-312]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov [rbp-328], rax
    ; IR: PARAM src1
    mov rdi, [rbp-328]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-16]
    mov [rbp-336], rax
    ; IR: PARAM src1
    mov rsi, [rbp-336]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov [rbp-352], rax
    ; IR: PARAM src1
    mov rdi, [rbp-352]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-24]
    mov [rbp-360], rax
    ; IR: PARAM src1
    mov rsi, [rbp-360]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov [rbp-376], rax
    ; IR: PARAM src1
    mov rdi, [rbp-376]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-32]
    mov [rbp-384], rax
    ; IR: PARAM src1
    mov rsi, [rbp-384]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov [rbp-400], rax
    ; IR: PARAM src1
    mov rdi, [rbp-400]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, -727379968
    mov [rbp-416], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-416]
    mov [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -1454759936
    mov [rbp-424], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-424]
    mov [rbp-48], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-432], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-440], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-432]
    mov rbx, [rbp-440]
    add rax, rbx
    mov [rbp-448], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-448]
    mov [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-456], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-464], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-456]
    mov rbx, [rbp-464]
    sub rax, rbx
    mov [rbp-472], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-472]
    mov [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-480], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov [rbp-488], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-480]
    mov rbx, [rbp-488]
    imul rax, rbx
    mov [rbp-496], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-496]
    mov [rbp-72], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-504], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-512], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-504]
    mov rbx, [rbp-512]
    cqo
    idiv rbx
    mov [rbp-520], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-520]
    mov [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov [rbp-528], rax
    ; IR: PARAM src1
    mov rdi, [rbp-528]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov [rbp-544], rax
    ; IR: PARAM src1
    mov rdi, [rbp-544]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-552], rax
    ; IR: PARAM src1
    mov rsi, [rbp-552]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-560], rax
    ; IR: PARAM src1
    mov rdx, [rbp-560]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-56]
    mov [rbp-568], rax
    ; IR: PARAM src1
    mov rcx, [rbp-568]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov [rbp-584], rax
    ; IR: PARAM src1
    mov rdi, [rbp-584]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-592], rax
    ; IR: PARAM src1
    mov rsi, [rbp-592]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-600], rax
    ; IR: PARAM src1
    mov rdx, [rbp-600]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-64]
    mov [rbp-608], rax
    ; IR: PARAM src1
    mov rcx, [rbp-608]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov [rbp-624], rax
    ; IR: PARAM src1
    mov rdi, [rbp-624]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-40]
    mov [rbp-632], rax
    ; IR: PARAM src1
    mov rsi, [rbp-632]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-72]
    mov [rbp-640], rax
    ; IR: PARAM src1
    mov rdx, [rbp-640]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov [rbp-656], rax
    ; IR: PARAM src1
    mov rdi, [rbp-656]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-48]
    mov [rbp-664], rax
    ; IR: PARAM src1
    mov rsi, [rbp-664]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-80]
    mov [rbp-672], rax
    ; IR: PARAM src1
    mov rdx, [rbp-672]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov [rbp-688], rax
    ; IR: PARAM src1
    mov rdi, [rbp-688]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, float_1
    mov [rbp-704], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-704]
    mov [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_2
    mov [rbp-712], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-712]
    mov [rbp-96], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-720], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-728], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-720]
    mov rbx, [rbp-728]
    add rax, rbx
    mov [rbp-736], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-736]
    mov [rbp-104], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-744], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-752], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-744]
    mov rbx, [rbp-752]
    imul rax, rbx
    mov [rbp-760], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-760]
    mov [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov [rbp-768], rax
    ; IR: PARAM src1
    mov rdi, [rbp-768]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov [rbp-784], rax
    ; IR: PARAM src1
    mov rdi, [rbp-784]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-88]
    mov [rbp-792], rax
    ; IR: PARAM src1
    mov rsi, [rbp-792]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov [rbp-808], rax
    ; IR: PARAM src1
    mov rdi, [rbp-808]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-96]
    mov [rbp-816], rax
    ; IR: PARAM src1
    mov rsi, [rbp-816]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov [rbp-832], rax
    ; IR: PARAM src1
    mov rdi, [rbp-832]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-104]
    mov [rbp-840], rax
    ; IR: PARAM src1
    mov rsi, [rbp-840]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov [rbp-856], rax
    ; IR: PARAM src1
    mov rdi, [rbp-856]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-112]
    mov [rbp-864], rax
    ; IR: PARAM src1
    mov rsi, [rbp-864]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov [rbp-880], rax
    ; IR: PARAM src1
    mov rdi, [rbp-880]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov [rbp-896], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-896]
    mov [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379968
    mov [rbp-904], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-904]
    mov [rbp-128], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_3
    mov [rbp-912], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-912]
    mov [rbp-136], rax
    ; IR: LOAD_CONST dest src1
    mov rax, float_1
    mov [rbp-920], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-920]
    mov [rbp-144], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov [rbp-928], rax
    ; IR: PARAM src1
    mov rdi, [rbp-928]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov [rbp-944], rax
    ; IR: PARAM src1
    mov rdi, [rbp-944]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-120]
    mov [rbp-952], rax
    ; IR: PARAM src1
    mov rsi, [rbp-952]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-128]
    mov [rbp-960], rax
    ; IR: PARAM src1
    mov rdx, [rbp-960]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov [rbp-976], rax
    ; IR: PARAM src1
    mov rdi, [rbp-976]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-136]
    mov [rbp-984], rax
    ; IR: PARAM src1
    mov rsi, [rbp-984]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-144]
    mov [rbp-992], rax
    ; IR: PARAM src1
    mov rdx, [rbp-992]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov [rbp-1008], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1008]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, -727379967
    mov [rbp-1024], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1024]
    mov [rbp-152], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379966
    mov [rbp-1032], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1032]
    mov [rbp-160], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379965
    mov [rbp-1040], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1040]
    mov [rbp-168], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379964
    mov [rbp-1048], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1048]
    mov [rbp-176], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379963
    mov [rbp-1056], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1056]
    mov [rbp-184], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379962
    mov [rbp-1064], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1064]
    mov [rbp-192], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379961
    mov [rbp-1072], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1072]
    mov [rbp-200], rax
    ; IR: LOAD_CONST dest src1
    mov rax, -727379960
    mov [rbp-1080], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1080]
    mov [rbp-208], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-152]
    mov [rbp-1088], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-160]
    mov [rbp-1096], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1088]
    mov rbx, [rbp-1096]
    add rax, rbx
    mov [rbp-1104], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-168]
    mov [rbp-1112], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1104]
    mov rbx, [rbp-1112]
    add rax, rbx
    mov [rbp-1120], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-176]
    mov [rbp-1128], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1120]
    mov rbx, [rbp-1128]
    add rax, rbx
    mov [rbp-1136], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-184]
    mov [rbp-1144], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1136]
    mov rbx, [rbp-1144]
    add rax, rbx
    mov [rbp-1152], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-192]
    mov [rbp-1160], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1152]
    mov rbx, [rbp-1160]
    add rax, rbx
    mov [rbp-1168], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-200]
    mov [rbp-1176], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1168]
    mov rbx, [rbp-1176]
    add rax, rbx
    mov [rbp-1184], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-208]
    mov [rbp-1192], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1184]
    mov rbx, [rbp-1192]
    add rax, rbx
    mov [rbp-1200], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1200]
    mov [rbp-216], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov [rbp-1208], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1208]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-216]
    mov [rbp-1216], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1216]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov [rbp-1232], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1232]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-152]
    mov [rbp-1248], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-1256], rax
    ; IR: MUL dest src1 src2
    mov rax, [rbp-1248]
    mov rbx, [rbp-1256]
    imul rax, rbx
    mov [rbp-1264], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-160]
    mov [rbp-1272], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov [rbp-1280], rax
    ; IR: DIV dest src1 src2
    mov rax, [rbp-1272]
    mov rbx, [rbp-1280]
    cqo
    idiv rbx
    mov [rbp-1288], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1264]
    mov rbx, [rbp-1288]
    add rax, rbx
    mov [rbp-1296], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-168]
    mov [rbp-1304], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1000
    mov [rbp-1312], rax
    ; IR: MOD dest src1 src2
    mov rax, [rbp-1304]
    mov rbx, [rbp-1312]
    cqo
    idiv rbx
    mov rax, rdx
    mov [rbp-1320], rax
    ; IR: SUB dest src1 src2
    mov rax, [rbp-1296]
    mov rbx, [rbp-1320]
    sub rax, rbx
    mov [rbp-1328], rax
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-176]
    mov [rbp-1336], rax
    ; IR: ADD dest src1 src2
    mov rax, [rbp-1328]
    mov rbx, [rbp-1336]
    add rax, rbx
    mov [rbp-1344], rax
    ; IR: STORE_VAR src1 src2
    mov rax, [rbp-1344]
    mov [rbp-224], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov [rbp-1352], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1352]
    ; IR: LOAD_VAR dest src1
    mov rax, [rbp-224]
    mov [rbp-1360], rax
    ; IR: PARAM src1
    mov rsi, [rbp-1360]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov [rbp-1376], rax
    ; IR: PARAM src1
    mov rdi, [rbp-1376]
    ; IR: CALL src1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call print
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
