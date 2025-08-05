; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
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
    sub esp, 816
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-104], eax
    ; IR: PARAM src1
    push [ebp-104]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-112], eax
    ; IR: PARAM src1
    push [ebp-112]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-120], eax
    ; IR: PARAM src1
    push [ebp-120]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 10
    mov [ebp-128], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-128]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-132], eax
    ; IR: PARAM src1
    push [ebp-132]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-136], eax
    ; IR: PARAM src1
    push [ebp-136]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 20
    mov [ebp-144], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-144]
    mov [ebp-8], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-148], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-152], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-148]
    mov ebx, [ebp-152]
    add eax, ebx
    mov [ebp-156], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-156]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-160], eax
    ; IR: PARAM src1
    push [ebp-160]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-164], eax
    ; IR: PARAM src1
    push [ebp-164]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-168], eax
    ; IR: PARAM src1
    push [ebp-168]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-172], eax
    ; IR: PARAM src1
    push [ebp-172]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-180], eax
    ; IR: PARAM src1
    push [ebp-180]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 5
    mov [ebp-188], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-188]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-192], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-192]
    mov [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-196], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-196]
    mov [ebp-24], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-200], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-204], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-200]
    mov ebx, [ebp-204]
    imul eax, ebx
    mov [ebp-208], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-212], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-208]
    mov ebx, [ebp-212]
    add eax, ebx
    mov [ebp-216], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-220], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-224], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-220]
    mov ebx, [ebp-224]
    sub eax, ebx
    mov [ebp-228], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-216]
    mov ebx, [ebp-228]
    imul eax, ebx
    mov [ebp-232], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-232]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-236], eax
    ; IR: PARAM src1
    push [ebp-236]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-240], eax
    ; IR: PARAM src1
    push [ebp-240]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-244], eax
    ; IR: PARAM src1
    push [ebp-244]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-248], eax
    ; IR: PARAM src1
    push [ebp-248]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-252], eax
    ; IR: PARAM src1
    push [ebp-252]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-256], eax
    ; IR: PARAM src1
    push [ebp-256]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-260], eax
    ; IR: PARAM src1
    push [ebp-260]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-268], eax
    ; IR: PARAM src1
    push [ebp-268]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-276], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-280], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-276]
    mov ebx, [ebp-280]
    add eax, ebx
    mov [ebp-284], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-288], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-292], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-288]
    mov ebx, [ebp-292]
    add eax, ebx
    mov [ebp-296], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-284]
    mov ebx, [ebp-296]
    imul eax, ebx
    mov [ebp-300], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-304], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-308], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-304]
    mov ebx, [ebp-308]
    sub eax, ebx
    mov [ebp-312], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-316], eax
    ; IR: DIV dest src1 src2
    mov eax, [ebp-312]
    mov ebx, [ebp-316]
    cdq
    idiv ebx
    mov [ebp-320], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-300]
    mov ebx, [ebp-320]
    sub eax, ebx
    mov [ebp-324], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-324]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-328], eax
    ; IR: PARAM src1
    push [ebp-328]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-332], eax
    ; IR: PARAM src1
    push [ebp-332]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-336], eax
    ; IR: PARAM src1
    push [ebp-336]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-340], eax
    ; IR: PARAM src1
    push [ebp-340]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-344], eax
    ; IR: PARAM src1
    push [ebp-344]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-348], eax
    ; IR: PARAM src1
    push [ebp-348]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-352], eax
    ; IR: PARAM src1
    push [ebp-352]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-356], eax
    ; IR: PARAM src1
    push [ebp-356]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-364], eax
    ; IR: PARAM src1
    push [ebp-364]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-372], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-372]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-376], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-376]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 65
    mov [ebp-380], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-380]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-384], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-384]
    mov [ebp-48], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov [ebp-388], eax
    ; IR: PARAM src1
    push [ebp-388]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-392], eax
    ; IR: PARAM src1
    push [ebp-392]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-396], eax
    ; IR: PARAM src1
    push [ebp-396]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-400], eax
    ; IR: PARAM src1
    push [ebp-400]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-404], eax
    ; IR: PARAM src1
    push [ebp-404]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-412], eax
    ; IR: PARAM src1
    push [ebp-412]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 100
    mov [ebp-420], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-420]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov [ebp-424], eax
    ; IR: PARAM src1
    push [ebp-424]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-428], eax
    ; IR: PARAM src1
    push [ebp-428]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-436], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 50
    mov [ebp-440], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-436]
    mov ebx, [ebp-440]
    add eax, ebx
    mov [ebp-444], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-444]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov [ebp-448], eax
    ; IR: PARAM src1
    push [ebp-448]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-452], eax
    ; IR: PARAM src1
    push [ebp-452]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-460], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-464], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-460]
    mov ebx, [ebp-464]
    imul eax, ebx
    mov [ebp-468], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-468]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov [ebp-472], eax
    ; IR: PARAM src1
    push [ebp-472]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-476], eax
    ; IR: PARAM src1
    push [ebp-476]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov [ebp-484], eax
    ; IR: PARAM src1
    push [ebp-484]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov [ebp-492], eax
    ; IR: PARAM src1
    push [ebp-492]
    ; IR: LOAD_CONST dest src1
    mov eax, 123
    mov [ebp-496], eax
    ; IR: PARAM src1
    push [ebp-496]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov [ebp-504], eax
    ; IR: PARAM src1
    push [ebp-504]
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-508], eax
    ; IR: PARAM src1
    push [ebp-508]
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-512], eax
    ; IR: PARAM src1
    push [ebp-512]
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-516], eax
    ; IR: PARAM src1
    push [ebp-516]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov [ebp-524], eax
    ; IR: PARAM src1
    push [ebp-524]
    ; IR: LOAD_CONST dest src1
    mov eax, 456
    mov [ebp-528], eax
    ; IR: PARAM src1
    push [ebp-528]
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-532], eax
    ; IR: PARAM src1
    push [ebp-532]
    ; IR: LOAD_CONST dest src1
    mov eax, 90
    mov [ebp-536], eax
    ; IR: PARAM src1
    push [ebp-536]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov [ebp-544], eax
    ; IR: PARAM src1
    push [ebp-544]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 10
    mov [ebp-552], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-552]
    mov [ebp-56], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 20
    mov [ebp-556], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-556]
    mov [ebp-60], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 30
    mov [ebp-560], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-560]
    mov [ebp-64], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 40
    mov [ebp-564], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-564]
    mov [ebp-68], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-568], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-572], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-568]
    mov ebx, [ebp-572]
    add eax, ebx
    mov [ebp-576], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-580], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-576]
    mov ebx, [ebp-580]
    add eax, ebx
    mov [ebp-584], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-588], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-584]
    mov ebx, [ebp-588]
    add eax, ebx
    mov [ebp-592], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-592]
    mov [ebp-72], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-596], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-600], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-596]
    mov ebx, [ebp-600]
    add eax, ebx
    mov [ebp-604], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-608], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-604]
    mov ebx, [ebp-608]
    add eax, ebx
    mov [ebp-612], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-616], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-612]
    mov ebx, [ebp-616]
    add eax, ebx
    mov [ebp-620], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-620]
    mov [ebp-76], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-624], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-628], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-624]
    mov ebx, [ebp-628]
    add eax, ebx
    mov [ebp-632], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-636], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-632]
    mov ebx, [ebp-636]
    add eax, ebx
    mov [ebp-640], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-644], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-640]
    mov ebx, [ebp-644]
    add eax, ebx
    mov [ebp-648], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-648]
    mov [ebp-80], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_20
    mov [ebp-652], eax
    ; IR: PARAM src1
    push [ebp-652]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_21
    mov [ebp-660], eax
    ; IR: PARAM src1
    push [ebp-660]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-72]
    mov [ebp-664], eax
    ; IR: PARAM src1
    push [ebp-664]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_22
    mov [ebp-672], eax
    ; IR: PARAM src1
    push [ebp-672]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-76]
    mov [ebp-676], eax
    ; IR: PARAM src1
    push [ebp-676]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_23
    mov [ebp-684], eax
    ; IR: PARAM src1
    push [ebp-684]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-80]
    mov [ebp-688], eax
    ; IR: PARAM src1
    push [ebp-688]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_24
    mov [ebp-696], eax
    ; IR: PARAM src1
    push [ebp-696]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 5
    mov [ebp-704], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-708], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-704]
    mov ebx, [ebp-708]
    add eax, ebx
    mov [ebp-712], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-716], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-712]
    mov ebx, [ebp-716]
    imul eax, ebx
    mov [ebp-720], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-720]
    mov [ebp-84], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_25
    mov [ebp-724], eax
    ; IR: PARAM src1
    push [ebp-724]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-84]
    mov [ebp-728], eax
    ; IR: PARAM src1
    push [ebp-728]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 999
    mov [ebp-736], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-736]
    mov [ebp-88], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 888
    mov [ebp-740], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-740]
    mov [ebp-92], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_26
    mov [ebp-744], eax
    ; IR: PARAM src1
    push [ebp-744]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-92]
    mov [ebp-748], eax
    ; IR: PARAM src1
    push [ebp-748]
    ; IR: CALL src1
    call print
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-756], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-760], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-756]
    mov ebx, [ebp-760]
    add eax, ebx
    mov [ebp-764], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-764]
    mov [ebp-96], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-768], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-772], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-768]
    mov ebx, [ebp-772]
    add eax, ebx
    mov [ebp-776], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-780], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-776]
    mov ebx, [ebp-780]
    imul eax, ebx
    mov [ebp-784], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-784]
    mov [ebp-100], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_27
    mov [ebp-788], eax
    ; IR: PARAM src1
    push [ebp-788]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-96]
    mov [ebp-792], eax
    ; IR: PARAM src1
    push [ebp-792]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-100]
    mov [ebp-796], eax
    ; IR: PARAM src1
    push [ebp-796]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_28
    mov [ebp-804], eax
    ; IR: PARAM src1
    push [ebp-804]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_29
    mov [ebp-812], eax
    ; IR: PARAM src1
    push [ebp-812]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
