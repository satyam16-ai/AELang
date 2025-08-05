; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== Architecture-Specific Test (32-bit) ===\\n",0
msg_1 db "=== 32-bit Compatible Types ===\\n",0
msg_2 db "i8: %d, u8: %u\\n",0
msg_3 db "i16: %d, u16: %u\\n",0
msg_4 db "i32: %d, u32: %u\\n",0
msg_5 db "f32: %.3f\\n",0
msg_6 db "char: %c, bool: %d\\n",0
msg_7 db "=== Memory Layout Test ===\\n",0
msg_8 db "Sequential variables: %d, %d, %d, %d\\n",0
msg_9 db "=== Arithmetic Stress Test ===\\n",0
msg_10 db "Stress test results:\\n",0
msg_11 db "  %d + %d = %d\\n",0
msg_12 db "  %d - %d = %d\\n",0
msg_13 db "  %d * 2 = %d\\n",0
msg_14 db "  %d / 10 = %d\\n",0
msg_15 db "  %d %% 7 = %d\\n",0
msg_16 db "=== Register Usage Test ===\\n",0
msg_17 db "Sum of 8 variables: %d (should be 36)\\n",0
msg_18 db "=== Function Call Stress Test ===\\n",0
msg_19 db "Call 1: %d\\n",0
msg_20 db "Call 2: %d, %d\\n",0
msg_21 db "Call 3: %d, %d, %d\\n",0
msg_22 db "Call 4: %s\\n",0
msg_23 db "String parameter",0
msg_24 db "Call 5: %c\\n",0
msg_25 db "Call 6: %.2f\\n",0
msg_26 db "=== Architecture Test Complete ===\\n",0
float_0: dd 0x42f6e979  ; 123.456001
float_1: dd 0x42f6e666  ; 123.449997

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
    sub esp, 688
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-120], eax
    ; IR: PARAM src1
    push [ebp-120]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-128], eax
    ; IR: PARAM src1
    push [ebp-128]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 100
    mov [ebp-136], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-140]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 200
    mov [ebp-144], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-144]
    mov [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 30000
    mov [ebp-148], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-152]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 60000
    mov [ebp-156], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-156]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2000000000
    mov [ebp-160], eax
    ; IR: UNKNOWN dest src1
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-164]
    mov [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, -294967296
    mov [ebp-168], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-168]
    mov [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-172], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-172]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 88
    mov [ebp-176], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-176]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-180], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-180]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-184], eax
    ; IR: PARAM src1
    push [ebp-184]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-188], eax
    ; IR: PARAM src1
    push [ebp-188]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-192], eax
    ; IR: PARAM src1
    push [ebp-192]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-200], eax
    ; IR: PARAM src1
    push [ebp-200]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-204], eax
    ; IR: PARAM src1
    push [ebp-204]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-208], eax
    ; IR: PARAM src1
    push [ebp-208]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-216], eax
    ; IR: PARAM src1
    push [ebp-216]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
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
    mov eax, msg_5
    mov [ebp-232], eax
    ; IR: PARAM src1
    push [ebp-232]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-236], eax
    ; IR: PARAM src1
    push [ebp-236]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-244], eax
    ; IR: PARAM src1
    push [ebp-244]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-248], eax
    ; IR: PARAM src1
    push [ebp-248]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-252], eax
    ; IR: PARAM src1
    push [ebp-252]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-260], eax
    ; IR: PARAM src1
    push [ebp-260]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 10
    mov [ebp-268], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-268]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 20
    mov [ebp-272], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-272]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 30
    mov [ebp-276], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-276]
    mov [ebp-48], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 40
    mov [ebp-280], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-280]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-284], eax
    ; IR: PARAM src1
    push [ebp-284]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-288], eax
    ; IR: PARAM src1
    push [ebp-288]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-292], eax
    ; IR: PARAM src1
    push [ebp-292]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-296], eax
    ; IR: PARAM src1
    push [ebp-296]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-300], eax
    ; IR: PARAM src1
    push [ebp-300]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-308], eax
    ; IR: PARAM src1
    push [ebp-308]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 1000
    mov [ebp-316], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-316]
    mov [ebp-56], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 999
    mov [ebp-320], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-320]
    mov [ebp-60], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-324], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-328], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-324]
    mov ebx, [ebp-328]
    add eax, ebx
    mov [ebp-332], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-332]
    mov [ebp-64], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-336], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-340], eax
    ; IR: SUB dest src1 src2
    mov eax, [ebp-336]
    mov ebx, [ebp-340]
    sub eax, ebx
    mov [ebp-344], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-344]
    mov [ebp-68], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-348], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-352], eax
    ; IR: MUL dest src1 src2
    mov eax, [ebp-348]
    mov ebx, [ebp-352]
    imul eax, ebx
    mov [ebp-356], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-356]
    mov [ebp-72], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-360], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 10
    mov [ebp-364], eax
    ; IR: DIV dest src1 src2
    mov eax, [ebp-360]
    mov ebx, [ebp-364]
    cdq
    idiv ebx
    mov [ebp-368], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-368]
    mov [ebp-76], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-372], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 7
    mov [ebp-376], eax
    ; IR: MOD dest src1 src2
    mov eax, [ebp-372]
    mov ebx, [ebp-376]
    cdq
    idiv ebx
    mov eax, edx
    mov [ebp-380], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-380]
    mov [ebp-80], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov [ebp-384], eax
    ; IR: PARAM src1
    push [ebp-384]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-392], eax
    ; IR: PARAM src1
    push [ebp-392]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-396], eax
    ; IR: PARAM src1
    push [ebp-396]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-400], eax
    ; IR: PARAM src1
    push [ebp-400]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-404], eax
    ; IR: PARAM src1
    push [ebp-404]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov [ebp-412], eax
    ; IR: PARAM src1
    push [ebp-412]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-416], eax
    ; IR: PARAM src1
    push [ebp-416]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-420], eax
    ; IR: PARAM src1
    push [ebp-420]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-424], eax
    ; IR: PARAM src1
    push [ebp-424]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov [ebp-432], eax
    ; IR: PARAM src1
    push [ebp-432]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-436], eax
    ; IR: PARAM src1
    push [ebp-436]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-72]
    mov [ebp-440], eax
    ; IR: PARAM src1
    push [ebp-440]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov [ebp-448], eax
    ; IR: PARAM src1
    push [ebp-448]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-452], eax
    ; IR: PARAM src1
    push [ebp-452]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-76]
    mov [ebp-456], eax
    ; IR: PARAM src1
    push [ebp-456]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov [ebp-464], eax
    ; IR: PARAM src1
    push [ebp-464]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-468], eax
    ; IR: PARAM src1
    push [ebp-468]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-80]
    mov [ebp-472], eax
    ; IR: PARAM src1
    push [ebp-472]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov [ebp-480], eax
    ; IR: PARAM src1
    push [ebp-480]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-488], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-488]
    mov [ebp-84], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2
    mov [ebp-492], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-492]
    mov [ebp-88], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 3
    mov [ebp-496], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-496]
    mov [ebp-92], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 4
    mov [ebp-500], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-500]
    mov [ebp-96], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 5
    mov [ebp-504], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-504]
    mov [ebp-100], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 6
    mov [ebp-508], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-508]
    mov [ebp-104], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 7
    mov [ebp-512], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-512]
    mov [ebp-108], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 8
    mov [ebp-516], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-516]
    mov [ebp-112], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-84]
    mov [ebp-520], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-88]
    mov [ebp-524], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-520]
    mov ebx, [ebp-524]
    add eax, ebx
    mov [ebp-528], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-92]
    mov [ebp-532], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-528]
    mov ebx, [ebp-532]
    add eax, ebx
    mov [ebp-536], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-96]
    mov [ebp-540], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-536]
    mov ebx, [ebp-540]
    add eax, ebx
    mov [ebp-544], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-100]
    mov [ebp-548], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-544]
    mov ebx, [ebp-548]
    add eax, ebx
    mov [ebp-552], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-104]
    mov [ebp-556], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-552]
    mov ebx, [ebp-556]
    add eax, ebx
    mov [ebp-560], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-108]
    mov [ebp-564], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-560]
    mov ebx, [ebp-564]
    add eax, ebx
    mov [ebp-568], eax
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-112]
    mov [ebp-572], eax
    ; IR: ADD dest src1 src2
    mov eax, [ebp-568]
    mov ebx, [ebp-572]
    add eax, ebx
    mov [ebp-576], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-576]
    mov [ebp-116], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov [ebp-580], eax
    ; IR: PARAM src1
    push [ebp-580]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-116]
    mov [ebp-584], eax
    ; IR: PARAM src1
    push [ebp-584]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov [ebp-592], eax
    ; IR: PARAM src1
    push [ebp-592]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov [ebp-600], eax
    ; IR: PARAM src1
    push [ebp-600]
    ; IR: LOAD_CONST dest src1
    mov eax, 100
    mov [ebp-604], eax
    ; IR: PARAM src1
    push [ebp-604]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_20
    mov [ebp-612], eax
    ; IR: PARAM src1
    push [ebp-612]
    ; IR: LOAD_CONST dest src1
    mov eax, 200
    mov [ebp-616], eax
    ; IR: PARAM src1
    push [ebp-616]
    ; IR: LOAD_CONST dest src1
    mov eax, 201
    mov [ebp-620], eax
    ; IR: PARAM src1
    push [ebp-620]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_21
    mov [ebp-628], eax
    ; IR: PARAM src1
    push [ebp-628]
    ; IR: LOAD_CONST dest src1
    mov eax, 300
    mov [ebp-632], eax
    ; IR: PARAM src1
    push [ebp-632]
    ; IR: LOAD_CONST dest src1
    mov eax, 301
    mov [ebp-636], eax
    ; IR: PARAM src1
    push [ebp-636]
    ; IR: LOAD_CONST dest src1
    mov eax, 302
    mov [ebp-640], eax
    ; IR: PARAM src1
    push [ebp-640]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_22
    mov [ebp-648], eax
    ; IR: PARAM src1
    push [ebp-648]
    ; IR: LOAD_CONST dest src1
    mov eax, msg_23
    mov [ebp-652], eax
    ; IR: PARAM src1
    push [ebp-652]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_24
    mov [ebp-660], eax
    ; IR: PARAM src1
    push [ebp-660]
    ; IR: LOAD_CONST dest src1
    mov eax, 67
    mov [ebp-664], eax
    ; IR: PARAM src1
    push [ebp-664]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_25
    mov [ebp-672], eax
    ; IR: PARAM src1
    push [ebp-672]
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-676], eax
    ; IR: PARAM src1
    push [ebp-676]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_26
    mov [ebp-684], eax
    ; IR: PARAM src1
    push [ebp-684]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
