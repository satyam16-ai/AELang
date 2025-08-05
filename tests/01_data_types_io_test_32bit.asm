; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "=== ÆLang Data Types and I/O Test (32-bit) ===\\n",0
msg_1 db "\\n--- Testing Signed Integer Types ---\\n",0
msg_2 db "Testing i8 (-128 to 127):\\n",0
msg_3 db "i8 min: %d, max: %d, zero: %d\\n",0
msg_4 db "Enter an i8 value: ",0
msg_5 db "You entered i8: %d\\n",0
msg_6 db "\\nTesting i16:\\n",0
msg_7 db "i16 min: %d, max: %d, zero: %d\\n",0
msg_8 db "Enter an i16 value: ",0
msg_9 db "You entered i16: %d\\n",0
msg_10 db "\\nTesting i32:\\n",0
msg_11 db "i32 min: %d, max: %d, zero: %d\\n",0
msg_12 db "Enter an i32 value: ",0
msg_13 db "You entered i32: %d\\n",0
msg_14 db "\\n--- Testing Unsigned Integer Types ---\\n",0
msg_15 db "Testing u8:\\n",0
msg_16 db "u8 min: %u, max: %u, mid: %u\\n",0
msg_17 db "Enter a u8 value: ",0
msg_18 db "You entered u8: %u\\n",0
msg_19 db "\\nTesting u16:\\n",0
msg_20 db "u16 min: %u, max: %u, mid: %u\\n",0
msg_21 db "Enter a u16 value: ",0
msg_22 db "You entered u16: %u\\n",0
msg_23 db "\\nTesting u32:\\n",0
msg_24 db "u32 min: %u, max: %u, mid: %u\\n",0
msg_25 db "Enter a u32 value: ",0
msg_26 db "You entered u32: %u\\n",0
msg_27 db "\\n--- Testing Floating-Point Types ---\\n",0
msg_28 db "Testing f8:\\n",0
msg_29 db "f8 small: %f, zero: %f\\n",0
msg_30 db "Enter an f8 value: ",0
msg_31 db "You entered f8: %f\\n",0
msg_32 db "\\nTesting f16:\\n",0
msg_33 db "f16 pi: %.5f, zero: %.1f\\n",0
msg_34 db "Enter an f16 value: ",0
msg_35 db "You entered f16: %.3f\\n",0
msg_36 db "\\nTesting f32:\\n",0
msg_37 db "f32 precise: %.6f, scientific: %e, large: %.2f\\n",0
msg_38 db "Enter a f32 value: ",0
msg_39 db "You entered f32: %.3f\\n",0
msg_40 db "\\n--- Testing Special Types ---\\n",0
msg_41 db "Testing num:\\n",0
msg_42 db "num as int: %d, as float: %.5f, zero: %d\\n",0
msg_43 db "Enter a num value: ",0
msg_44 db "You entered num: %d\\n",0
msg_45 db "\\nTesting bool:\\n",0
msg_46 db "true: %t, false: %t\\n",0
msg_47 db "Enter a boolean value: ",0
msg_48 db "You entered bool: %t\\n",0
msg_49 db "\\nTesting char:\\n",0
msg_50 db "letter: %c, digit: %c, symbol: %c, space: '%c'\\n",0
msg_51 db "Enter a character: ",0
msg_52 db "You entered char: %c\\n",0
msg_53 db "\\nTesting str:\\n",0
msg_54 db "Hello, AELang!",0
msg_55 db "",0
msg_56 db "simple: %s\\n",0
msg_57 db "empty: '%s'\\n",0
msg_58 db "\\n--- Testing Edge Cases ---\\n",0
msg_59 db "Zero values:\\n",0
msg_60 db "zero i32: %d, zero f32: %.1f, zero bool: %t\\n",0
msg_61 db "Large values:\\n",0
msg_62 db "large u32: %u, large f32: %e\\n",0
msg_63 db "Small precision:\\n",0
msg_64 db "tiny f32: %e, tiny f32 2: %e\\n",0
msg_65 db "\\n--- Interactive Input Testing ---\\n",0
msg_66 db "Testing unified read() function:\\n",0
msg_67 db "Enter any integer: ",0
msg_68 db "Read as i32: %d\\n",0
msg_69 db "Enter any float: ",0
msg_70 db "Read as f32: %.3f\\n",0
msg_71 db "Enter true or false: ",0
msg_72 db "Read as bool: %t\\n",0
msg_73 db "Enter single character: ",0
msg_74 db "Read as char: %c\\n",0
msg_75 db "\\n=== Data Types and I/O Test Complete (32-bit) ===\\n",0
msg_76 db "12 data types tested successfully (32-bit mode)!\\n",0
msg_77 db "Types tested: i8, i16, i32, u8, u16, u32, f8, f16, f32, num, bool, char, str\\n",0
msg_78 db "Unified read() function validated!\\n",0
float_0: dd 0x3fc00000  ; 1.5
float_1: dd 0x00000000  ; 0
float_2: dd 0x40490fd0  ; 3.14159012
float_3: dd 0x42f6e9e0  ; 123.456787
float_4: dd 0x3900f990  ; 0.000123000005
float_5: dd 0x4996b43f  ; 1234567.88
float_6: dd 0x56e0910c  ; 1.23456788e+14
float_7: dd 0x374f1ff3  ; 1.23456002e-05
float_8: dd 0x2f07bdff  ; 1.23456786e-10

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_int
    extern read_float
    extern read_num

main:
    push ebp
    mov ebp, esp
    sub esp, 1324
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov [ebp-240], eax
    ; IR: PARAM src1
    push dword [ebp-240]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov [ebp-248], eax
    ; IR: PARAM src1
    push dword [ebp-248]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov [ebp-256], eax
    ; IR: PARAM src1
    push dword [ebp-256]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-264], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-264]
    mov [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 127
    mov [ebp-268], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-268]
    mov [ebp-8], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-272], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-272]
    mov [ebp-12], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov [ebp-276], eax
    ; IR: PARAM src1
    push dword [ebp-276]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-4]
    mov [ebp-280], eax
    ; IR: PARAM src1
    push dword [ebp-280]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-8]
    mov [ebp-284], eax
    ; IR: PARAM src1
    push dword [ebp-284]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-12]
    mov [ebp-288], eax
    ; IR: PARAM src1
    push dword [ebp-288]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov [ebp-296], eax
    ; IR: PARAM src1
    push dword [ebp-296]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-304], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-304]
    mov [ebp-16], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov [ebp-308], eax
    ; IR: PARAM src1
    push dword [ebp-308]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-16]
    mov [ebp-312], eax
    ; IR: PARAM src1
    push dword [ebp-312]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov [ebp-320], eax
    ; IR: PARAM src1
    push dword [ebp-320]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-328], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-328]
    mov [ebp-20], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 32767
    mov [ebp-332], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-332]
    mov [ebp-24], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-336], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-336]
    mov [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_7
    mov [ebp-340], eax
    ; IR: PARAM src1
    push dword [ebp-340]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-20]
    mov [ebp-344], eax
    ; IR: PARAM src1
    push dword [ebp-344]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-24]
    mov [ebp-348], eax
    ; IR: PARAM src1
    push dword [ebp-348]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-28]
    mov [ebp-352], eax
    ; IR: PARAM src1
    push dword [ebp-352]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_8
    mov [ebp-360], eax
    ; IR: PARAM src1
    push dword [ebp-360]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-368], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-368]
    mov [ebp-32], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_9
    mov [ebp-372], eax
    ; IR: PARAM src1
    push dword [ebp-372]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-32]
    mov [ebp-376], eax
    ; IR: PARAM src1
    push dword [ebp-376]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_10
    mov [ebp-384], eax
    ; IR: PARAM src1
    push dword [ebp-384]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-392], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-392]
    mov [ebp-36], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 2147483647
    mov [ebp-396], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-396]
    mov [ebp-40], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-400], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-400]
    mov [ebp-44], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_11
    mov [ebp-404], eax
    ; IR: PARAM src1
    push dword [ebp-404]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-36]
    mov [ebp-408], eax
    ; IR: PARAM src1
    push dword [ebp-408]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-40]
    mov [ebp-412], eax
    ; IR: PARAM src1
    push dword [ebp-412]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-44]
    mov [ebp-416], eax
    ; IR: PARAM src1
    push dword [ebp-416]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_12
    mov [ebp-424], eax
    ; IR: PARAM src1
    push dword [ebp-424]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-432], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-432]
    mov [ebp-48], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_13
    mov [ebp-436], eax
    ; IR: PARAM src1
    push dword [ebp-436]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-48]
    mov [ebp-440], eax
    ; IR: PARAM src1
    push dword [ebp-440]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_14
    mov [ebp-448], eax
    ; IR: PARAM src1
    push dword [ebp-448]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_15
    mov [ebp-456], eax
    ; IR: PARAM src1
    push dword [ebp-456]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-464], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-464]
    mov [ebp-52], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 255
    mov [ebp-468], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-468]
    mov [ebp-56], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 128
    mov [ebp-472], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-472]
    mov [ebp-60], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_16
    mov [ebp-476], eax
    ; IR: PARAM src1
    push dword [ebp-476]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-52]
    mov [ebp-480], eax
    ; IR: PARAM src1
    push dword [ebp-480]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-56]
    mov [ebp-484], eax
    ; IR: PARAM src1
    push dword [ebp-484]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-60]
    mov [ebp-488], eax
    ; IR: PARAM src1
    push dword [ebp-488]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_17
    mov [ebp-496], eax
    ; IR: PARAM src1
    push dword [ebp-496]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-504], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-504]
    mov [ebp-64], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_18
    mov [ebp-508], eax
    ; IR: PARAM src1
    push dword [ebp-508]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-64]
    mov [ebp-512], eax
    ; IR: PARAM src1
    push dword [ebp-512]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_19
    mov [ebp-520], eax
    ; IR: PARAM src1
    push dword [ebp-520]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-528], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-528]
    mov [ebp-68], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 65535
    mov [ebp-532], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-532]
    mov [ebp-72], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 32768
    mov [ebp-536], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-536]
    mov [ebp-76], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_20
    mov [ebp-540], eax
    ; IR: PARAM src1
    push dword [ebp-540]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-68]
    mov [ebp-544], eax
    ; IR: PARAM src1
    push dword [ebp-544]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-72]
    mov [ebp-548], eax
    ; IR: PARAM src1
    push dword [ebp-548]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-76]
    mov [ebp-552], eax
    ; IR: PARAM src1
    push dword [ebp-552]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_21
    mov [ebp-560], eax
    ; IR: PARAM src1
    push dword [ebp-560]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-568], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-568]
    mov [ebp-80], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_22
    mov [ebp-572], eax
    ; IR: PARAM src1
    push dword [ebp-572]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-80]
    mov [ebp-576], eax
    ; IR: PARAM src1
    push dword [ebp-576]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_23
    mov [ebp-584], eax
    ; IR: PARAM src1
    push dword [ebp-584]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-592], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-592]
    mov [ebp-84], eax
    ; IR: LOAD_CONST dest src1
    mov eax, -1
    mov [ebp-596], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-596]
    mov [ebp-88], eax
    ; IR: LOAD_CONST dest src1
    mov eax, -2147483648
    mov [ebp-600], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-600]
    mov [ebp-92], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_24
    mov [ebp-604], eax
    ; IR: PARAM src1
    push dword [ebp-604]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-84]
    mov [ebp-608], eax
    ; IR: PARAM src1
    push dword [ebp-608]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-88]
    mov [ebp-612], eax
    ; IR: PARAM src1
    push dword [ebp-612]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-92]
    mov [ebp-616], eax
    ; IR: PARAM src1
    push dword [ebp-616]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_25
    mov [ebp-624], eax
    ; IR: PARAM src1
    push dword [ebp-624]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-632], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-632]
    mov [ebp-96], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_26
    mov [ebp-636], eax
    ; IR: PARAM src1
    push dword [ebp-636]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-96]
    mov [ebp-640], eax
    ; IR: PARAM src1
    push dword [ebp-640]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_27
    mov [ebp-648], eax
    ; IR: PARAM src1
    push dword [ebp-648]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_28
    mov [ebp-656], eax
    ; IR: PARAM src1
    push dword [ebp-656]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_0
    mov [ebp-664], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-664]
    mov [ebp-100], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-668], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-668]
    mov [ebp-104], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_29
    mov [ebp-672], eax
    ; IR: PARAM src1
    push dword [ebp-672]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-100]
    mov [ebp-676], eax
    ; IR: PARAM src1
    push dword [ebp-676]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-104]
    mov [ebp-680], eax
    ; IR: PARAM src1
    push dword [ebp-680]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_30
    mov [ebp-688], eax
    ; IR: PARAM src1
    push dword [ebp-688]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-696], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-696]
    mov [ebp-108], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_31
    mov [ebp-700], eax
    ; IR: PARAM src1
    push dword [ebp-700]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-108]
    mov [ebp-704], eax
    ; IR: PARAM src1
    push dword [ebp-704]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_32
    mov [ebp-712], eax
    ; IR: PARAM src1
    push dword [ebp-712]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_2
    mov [ebp-720], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-720]
    mov [ebp-112], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-724], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-724]
    mov [ebp-116], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_33
    mov [ebp-728], eax
    ; IR: PARAM src1
    push dword [ebp-728]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-112]
    mov [ebp-732], eax
    ; IR: PARAM src1
    push dword [ebp-732]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-116]
    mov [ebp-736], eax
    ; IR: PARAM src1
    push dword [ebp-736]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_34
    mov [ebp-744], eax
    ; IR: PARAM src1
    push dword [ebp-744]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-752], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-752]
    mov [ebp-120], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_35
    mov [ebp-756], eax
    ; IR: PARAM src1
    push dword [ebp-756]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-120]
    mov [ebp-760], eax
    ; IR: PARAM src1
    push dword [ebp-760]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_36
    mov [ebp-768], eax
    ; IR: PARAM src1
    push dword [ebp-768]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_3
    mov [ebp-776], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-776]
    mov [ebp-124], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_4
    mov [ebp-780], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-780]
    mov [ebp-128], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_5
    mov [ebp-784], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-784]
    mov [ebp-132], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_37
    mov [ebp-788], eax
    ; IR: PARAM src1
    push dword [ebp-788]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-124]
    mov [ebp-792], eax
    ; IR: PARAM src1
    push dword [ebp-792]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-128]
    mov [ebp-796], eax
    ; IR: PARAM src1
    push dword [ebp-796]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-132]
    mov [ebp-800], eax
    ; IR: PARAM src1
    push dword [ebp-800]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_38
    mov [ebp-808], eax
    ; IR: PARAM src1
    push dword [ebp-808]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-816], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-816]
    mov [ebp-136], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_39
    mov [ebp-820], eax
    ; IR: PARAM src1
    push dword [ebp-820]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-136]
    mov [ebp-824], eax
    ; IR: PARAM src1
    push dword [ebp-824]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_40
    mov [ebp-832], eax
    ; IR: PARAM src1
    push dword [ebp-832]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_41
    mov [ebp-840], eax
    ; IR: PARAM src1
    push dword [ebp-840]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 42
    mov [ebp-848], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-848]
    mov [ebp-140], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_2
    mov [ebp-852], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-852]
    mov [ebp-144], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-856], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-856]
    mov [ebp-148], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_42
    mov [ebp-860], eax
    ; IR: PARAM src1
    push dword [ebp-860]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-140]
    mov [ebp-864], eax
    ; IR: PARAM src1
    push dword [ebp-864]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-144]
    mov [ebp-868], eax
    ; IR: PARAM src1
    push dword [ebp-868]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-148]
    mov [ebp-872], eax
    ; IR: PARAM src1
    push dword [ebp-872]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_43
    mov [ebp-880], eax
    ; IR: PARAM src1
    push dword [ebp-880]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-888], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-888]
    mov [ebp-152], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_44
    mov [ebp-892], eax
    ; IR: PARAM src1
    push dword [ebp-892]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-152]
    mov [ebp-896], eax
    ; IR: PARAM src1
    push dword [ebp-896]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_45
    mov [ebp-904], eax
    ; IR: PARAM src1
    push dword [ebp-904]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 1
    mov [ebp-912], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-912]
    mov [ebp-156], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-916], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-916]
    mov [ebp-160], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_46
    mov [ebp-920], eax
    ; IR: PARAM src1
    push dword [ebp-920]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-156]
    mov [ebp-924], eax
    ; IR: PARAM src1
    push dword [ebp-924]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-160]
    mov [ebp-928], eax
    ; IR: PARAM src1
    push dword [ebp-928]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_47
    mov [ebp-936], eax
    ; IR: PARAM src1
    push dword [ebp-936]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-944], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-944]
    mov [ebp-164], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_48
    mov [ebp-948], eax
    ; IR: PARAM src1
    push dword [ebp-948]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-164]
    mov [ebp-952], eax
    ; IR: PARAM src1
    push dword [ebp-952]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_49
    mov [ebp-960], eax
    ; IR: PARAM src1
    push dword [ebp-960]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 65
    mov [ebp-968], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-968]
    mov [ebp-168], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 57
    mov [ebp-972], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-972]
    mov [ebp-172], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 64
    mov [ebp-976], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-976]
    mov [ebp-176], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 32
    mov [ebp-980], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-980]
    mov [ebp-180], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_50
    mov [ebp-984], eax
    ; IR: PARAM src1
    push dword [ebp-984]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-168]
    mov [ebp-988], eax
    ; IR: PARAM src1
    push dword [ebp-988]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-172]
    mov [ebp-992], eax
    ; IR: PARAM src1
    push dword [ebp-992]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-176]
    mov [ebp-996], eax
    ; IR: PARAM src1
    push dword [ebp-996]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-180]
    mov [ebp-1000], eax
    ; IR: PARAM src1
    push dword [ebp-1000]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_51
    mov [ebp-1008], eax
    ; IR: PARAM src1
    push dword [ebp-1008]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-1016], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1016]
    mov [ebp-184], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_52
    mov [ebp-1020], eax
    ; IR: PARAM src1
    push dword [ebp-1020]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-184]
    mov [ebp-1024], eax
    ; IR: PARAM src1
    push dword [ebp-1024]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_53
    mov [ebp-1032], eax
    ; IR: PARAM src1
    push dword [ebp-1032]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_54
    mov [ebp-1040], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1040]
    mov [ebp-188], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_55
    mov [ebp-1044], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1044]
    mov [ebp-192], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_56
    mov [ebp-1048], eax
    ; IR: PARAM src1
    push dword [ebp-1048]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-188]
    mov [ebp-1052], eax
    ; IR: PARAM src1
    push dword [ebp-1052]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_57
    mov [ebp-1060], eax
    ; IR: PARAM src1
    push dword [ebp-1060]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-192]
    mov [ebp-1064], eax
    ; IR: PARAM src1
    push dword [ebp-1064]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_58
    mov [ebp-1072], eax
    ; IR: PARAM src1
    push dword [ebp-1072]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_59
    mov [ebp-1080], eax
    ; IR: PARAM src1
    push dword [ebp-1080]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-1088], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1088]
    mov [ebp-196], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_1
    mov [ebp-1092], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1092]
    mov [ebp-200], eax
    ; IR: LOAD_CONST dest src1
    mov eax, 0
    mov [ebp-1096], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1096]
    mov [ebp-204], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_60
    mov [ebp-1100], eax
    ; IR: PARAM src1
    push dword [ebp-1100]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-196]
    mov [ebp-1104], eax
    ; IR: PARAM src1
    push dword [ebp-1104]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-200]
    mov [ebp-1108], eax
    ; IR: PARAM src1
    push dword [ebp-1108]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-204]
    mov [ebp-1112], eax
    ; IR: PARAM src1
    push dword [ebp-1112]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_61
    mov [ebp-1120], eax
    ; IR: PARAM src1
    push dword [ebp-1120]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, -294967296
    mov [ebp-1128], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1128]
    mov [ebp-208], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_6
    mov [ebp-1132], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1132]
    mov [ebp-212], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_62
    mov [ebp-1136], eax
    ; IR: PARAM src1
    push dword [ebp-1136]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-208]
    mov [ebp-1140], eax
    ; IR: PARAM src1
    push dword [ebp-1140]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-212]
    mov [ebp-1144], eax
    ; IR: PARAM src1
    push dword [ebp-1144]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_63
    mov [ebp-1152], eax
    ; IR: PARAM src1
    push dword [ebp-1152]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, float_7
    mov [ebp-1160], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1160]
    mov [ebp-216], eax
    ; IR: LOAD_CONST dest src1
    mov eax, float_8
    mov [ebp-1164], eax
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1164]
    mov [ebp-220], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_64
    mov [ebp-1168], eax
    ; IR: PARAM src1
    push dword [ebp-1168]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-216]
    mov [ebp-1172], eax
    ; IR: PARAM src1
    push dword [ebp-1172]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-220]
    mov [ebp-1176], eax
    ; IR: PARAM src1
    push dword [ebp-1176]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_65
    mov [ebp-1184], eax
    ; IR: PARAM src1
    push dword [ebp-1184]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_66
    mov [ebp-1192], eax
    ; IR: PARAM src1
    push dword [ebp-1192]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_67
    mov [ebp-1200], eax
    ; IR: PARAM src1
    push dword [ebp-1200]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-1208], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1208]
    mov [ebp-224], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_68
    mov [ebp-1212], eax
    ; IR: PARAM src1
    push dword [ebp-1212]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-224]
    mov [ebp-1216], eax
    ; IR: PARAM src1
    push dword [ebp-1216]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_69
    mov [ebp-1224], eax
    ; IR: PARAM src1
    push dword [ebp-1224]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-1232], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1232]
    mov [ebp-228], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_70
    mov [ebp-1236], eax
    ; IR: PARAM src1
    push dword [ebp-1236]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-228]
    mov [ebp-1240], eax
    ; IR: PARAM src1
    push dword [ebp-1240]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_71
    mov [ebp-1248], eax
    ; IR: PARAM src1
    push dword [ebp-1248]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-1256], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1256]
    mov [ebp-232], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_72
    mov [ebp-1260], eax
    ; IR: PARAM src1
    push dword [ebp-1260]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-232]
    mov [ebp-1264], eax
    ; IR: PARAM src1
    push dword [ebp-1264]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_73
    mov [ebp-1272], eax
    ; IR: PARAM src1
    push dword [ebp-1272]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read
    movq eax, xmm0  ; copy double from xmm0 to rax
    mov [ebp-1280], eax     ; store to memory
    ; IR: STORE_VAR src1 src2
    mov eax, [ebp-1280]
    mov [ebp-236], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_74
    mov [ebp-1284], eax
    ; IR: PARAM src1
    push dword [ebp-1284]
    ; IR: LOAD_VAR dest src1
    mov eax, [ebp-236]
    mov [ebp-1288], eax
    ; IR: PARAM src1
    push dword [ebp-1288]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_75
    mov [ebp-1296], eax
    ; IR: PARAM src1
    push dword [ebp-1296]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_76
    mov [ebp-1304], eax
    ; IR: PARAM src1
    push dword [ebp-1304]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_77
    mov [ebp-1312], eax
    ; IR: PARAM src1
    push dword [ebp-1312]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_78
    mov [ebp-1320], eax
    ; IR: PARAM src1
    push dword [ebp-1320]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
