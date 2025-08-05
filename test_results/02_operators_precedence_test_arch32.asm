; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
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
    sub esp, 600
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-80], eax
    ; IR: PARAM src1
    push [ebp-80]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 20
    mov [ebp-88], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-88]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 7
    mov [ebp-92], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-92]
    mov [ebp-8], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-96], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-100], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-96]
    mov ebx, [ebp-100]
    add eax, ebx
    mov [ebp-104], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-104]
    mov [ebp-12], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-108], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-112], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-108]
    mov ebx, [ebp-112]
    sub eax, ebx
    mov [ebp-116], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-116]
    mov [ebp-16], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-120], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-124], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-120]
    mov ebx, [ebp-124]
    imul eax, ebx
    mov [ebp-128], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-128]
    mov [ebp-20], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-132], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-136], eax
    ; IR: DIV dest src1 src2
    mov eax, [ebp-132]
    mov ebx, [ebp-136]
    cdq
    idiv ebx
    mov [ebp-140], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-140]
    mov [ebp-24], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-144], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-148], eax
    ; IR: MOD dest src1 src2
    mov eax, [ebp-144]
    mov ebx, [ebp-148]
    cdq
    idiv ebx
    mov eax, edx
    mov [ebp-152], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-152]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-156], eax
    ; IR: PARAM src1
    push [ebp-156]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-160], eax
    ; IR: PARAM src1
    push [ebp-160]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-164], eax
    ; IR: PARAM src1
    push [ebp-164]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-172], eax
    ; IR: PARAM src1
    push [ebp-172]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-176], eax
    ; IR: PARAM src1
    push [ebp-176]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-180], eax
    ; IR: PARAM src1
    push [ebp-180]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-184], eax
    ; IR: PARAM src1
    push [ebp-184]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-192], eax
    ; IR: PARAM src1
    push [ebp-192]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-196], eax
    ; IR: PARAM src1
    push [ebp-196]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-200], eax
    ; IR: PARAM src1
    push [ebp-200]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-204], eax
    ; IR: PARAM src1
    push [ebp-204]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-212], eax
    ; IR: PARAM src1
    push [ebp-212]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-216], eax
    ; IR: PARAM src1
    push [ebp-216]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-220], eax
    ; IR: PARAM src1
    push [ebp-220]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-224], eax
    ; IR: PARAM src1
    push [ebp-224]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-232], eax
    ; IR: PARAM src1
    push [ebp-232]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-236], eax
    ; IR: PARAM src1
    push [ebp-236]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-240], eax
    ; IR: PARAM src1
    push [ebp-240]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-244], eax
    ; IR: PARAM src1
    push [ebp-244]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-252], eax
    ; IR: PARAM src1
    push [ebp-252]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-256], eax
    ; IR: PARAM src1
    push [ebp-256]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-260], eax
    ; IR: PARAM src1
    push [ebp-260]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-264], eax
    ; IR: PARAM src1
    push [ebp-264]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-272], eax
    ; IR: PARAM src1
    push [ebp-272]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-280], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-284], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-280]
    mov ebx, [ebp-284]
    add eax, ebx
    mov [ebp-288], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 4
    mov [ebp-292], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-288]
    mov ebx, [ebp-292]
    imul eax, ebx
    mov [ebp-296], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-296]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-300], eax
    ; IR: PARAM src1
    push [ebp-300]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-304], eax
    ; IR: PARAM src1
    push [ebp-304]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 20
    mov [ebp-312], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 4
    mov [ebp-316], eax
    ; IR: DIV dest src1 src2
    mov eax, [ebp-312]
    mov ebx, [ebp-316]
    cdq
    idiv ebx
    mov [ebp-320], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-324], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-320]
    mov ebx, [ebp-324]
    add eax, ebx
    mov [ebp-328], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-328]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-332], eax
    ; IR: PARAM src1
    push [ebp-332]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-336], eax
    ; IR: PARAM src1
    push [ebp-336]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-344], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-348], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-344]
    mov ebx, [ebp-348]
    add eax, ebx
    mov [ebp-352], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 4
    mov [ebp-356], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-352]
    mov ebx, [ebp-356]
    imul eax, ebx
    mov [ebp-360], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-360]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
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
    mov eax, 15
    mov [ebp-376], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-380], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-376]
    mov ebx, [ebp-380]
    sub eax, ebx
    mov [ebp-384], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-388], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-384]
    mov ebx, [ebp-388]
    imul eax, ebx
    mov [ebp-392], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-392]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-396], eax
    ; IR: PARAM src1
    push [ebp-396]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-400], eax
    ; IR: PARAM src1
    push [ebp-400]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov [ebp-408], eax
    ; IR: PARAM src1
    push [ebp-408]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-416], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-416]
    mov [ebp-48], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-420], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-424]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov [ebp-428], eax
    ; IR: PARAM src1
    push [ebp-428]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-432], eax
    ; IR: PARAM src1
    push [ebp-432]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-436], eax
    ; IR: PARAM src1
    push [ebp-436]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov [ebp-444], eax
    ; IR: PARAM src1
    push [ebp-444]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-452], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-452]
    mov [ebp-56], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-456], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-456]
    mov [ebp-60], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-460], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-464], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-460]
    mov ebx, [ebp-464]
    add eax, ebx
    mov [ebp-468], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-468]
    mov [ebp-64], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-472], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-476], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-472]
    mov ebx, [ebp-476]
    sub eax, ebx
    mov [ebp-480], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-480]
    mov [ebp-68], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-484], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-488], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-484]
    mov ebx, [ebp-488]
    imul eax, ebx
    mov [ebp-492], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-492]
    mov [ebp-72], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-496], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-500], eax
    ; IR: DIV dest src1 src2
    mov eax, [ebp-496]
    mov ebx, [ebp-500]
    cdq
    idiv ebx
    mov [ebp-504], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-504]
    mov [ebp-76], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov [ebp-508], eax
    ; IR: PARAM src1
    push [ebp-508]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-512], eax
    ; IR: PARAM src1
    push [ebp-512]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-516], eax
    ; IR: PARAM src1
    push [ebp-516]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov [ebp-524], eax
    ; IR: PARAM src1
    push [ebp-524]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-528], eax
    ; IR: PARAM src1
    push [ebp-528]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-532], eax
    ; IR: PARAM src1
    push [ebp-532]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-536], eax
    ; IR: PARAM src1
    push [ebp-536]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov [ebp-544], eax
    ; IR: PARAM src1
    push [ebp-544]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-548], eax
    ; IR: PARAM src1
    push [ebp-548]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-552], eax
    ; IR: PARAM src1
    push [ebp-552]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-556], eax
    ; IR: PARAM src1
    push [ebp-556]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov [ebp-564], eax
    ; IR: PARAM src1
    push [ebp-564]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-568], eax
    ; IR: PARAM src1
    push [ebp-568]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-572], eax
    ; IR: PARAM src1
    push [ebp-572]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-72]
    mov [ebp-576], eax
    ; IR: PARAM src1
    push [ebp-576]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov [ebp-584], eax
    ; IR: PARAM src1
    push [ebp-584]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-588], eax
    ; IR: PARAM src1
    push [ebp-588]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-592], eax
    ; IR: PARAM src1
    push [ebp-592]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-76]
    mov [ebp-596], eax
    ; IR: PARAM src1
    push [ebp-596]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
