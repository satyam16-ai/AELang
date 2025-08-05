; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== Comprehensive Function Test ===",10,0
msg_1 db "i8 test: %d + %d = %d",10,0
msg_2 db "i16 test: %d * %d = %d",10,0
msg_3 db "i32 test: %d - %d = %d",10,0
msg_4 db "i64 test: %ld / %ld = %ld",10,0
msg_5 db "u8 test: %u + %u = %u",10,0
msg_6 db "u16 test: %u * %u = %u",10,0
msg_7 db "u32 test: %u - %u = %u",10,0
msg_8 db "u64 test: %lu / %lu = %lu",10,0
msg_9 db "f32 test: %.2f + %.2f = %.2f",10,0
msg_10 db "f64 test: %.6f * %.6f = %.6f",10,0
msg_11 db "No params test: %d",10,0
msg_12 db "Many params: %d",10,0
msg_13 db "Factorial of 5: %d",10,0
msg_14 db "Factorial of 7: %d",10,0
msg_15 db "Complex calc (10, 20, 30): %d",10,0
msg_16 db "Counter: %d",10,0
msg_17 db "PI: %.5f",10,0
msg_18 db "=== All Function Tests Completed ===",10,0
msg_19 db "Inside void function with x = %d",10,0
float_0: dd 0x40490fd0  ; 3.14159012
float_1: dd 0x4048f5c3  ; 3.1400001
float_2: dd 0x40370a3d  ; 2.8599999
float_3: dd 0x3f9e064b  ; 1.23456705
float_4: dd 0x40161f97  ; 2.34567809

section .bss
    align 8
    temp_storage: resq 1  ; temporary storage

section .text
    global main
    extern printf
    extern read
    extern read_with_type

main:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_0]
    mov dword [rbp-680], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [rbp-680]
    mov dword [rbp-8], eax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-688], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-688]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-736], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-736]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-752], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-760], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-768], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-776], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-784], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-752]
    mov rsi, [rbp-760]
    mov rdx, [rbp-768]
    mov rcx, [rbp-776]
    mov r8, [rbp-784]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i8
    mov qword [rbp-792], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-792]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-808], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-816], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 200
    mov qword [rbp-824], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-832], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 200
    mov qword [rbp-840], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-808]
    mov rsi, [rbp-816]
    mov rdx, [rbp-824]
    mov rcx, [rbp-832]
    mov r8, [rbp-840]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i16
    mov qword [rbp-848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-864], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 1000
    mov qword [rbp-872], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 300
    mov qword [rbp-880], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 1000
    mov qword [rbp-888], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 300
    mov qword [rbp-896], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-864]
    mov rsi, [rbp-872]
    mov rdx, [rbp-880]
    mov rcx, [rbp-888]
    mov r8, [rbp-896]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i32
    mov qword [rbp-904], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-904]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-920], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10000
    mov qword [rbp-928], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 25
    mov qword [rbp-936], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10000
    mov qword [rbp-944], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 25
    mov qword [rbp-952], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-920]
    mov rsi, [rbp-928]
    mov rdx, [rbp-936]
    mov rcx, [rbp-944]
    mov r8, [rbp-952]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_i64
    mov qword [rbp-960], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-960]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-976], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-984], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 150
    mov qword [rbp-992], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-1000], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 150
    mov qword [rbp-1008], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-976]
    mov rsi, [rbp-984]
    mov rdx, [rbp-992]
    mov rcx, [rbp-1000]
    mov r8, [rbp-1008]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_u8
    mov qword [rbp-1016], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1016]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-1032], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 300
    mov qword [rbp-1040], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 400
    mov qword [rbp-1048], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 300
    mov qword [rbp-1056], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 400
    mov qword [rbp-1064], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1032]
    mov rsi, [rbp-1040]
    mov rdx, [rbp-1048]
    mov rcx, [rbp-1056]
    mov r8, [rbp-1064]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_u16
    mov qword [rbp-1072], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1072]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-1088], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 2000
    mov qword [rbp-1096], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 500
    mov qword [rbp-1104], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 2000
    mov qword [rbp-1112], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 500
    mov qword [rbp-1120], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1088]
    mov rsi, [rbp-1096]
    mov rdx, [rbp-1104]
    mov rcx, [rbp-1112]
    mov r8, [rbp-1120]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_u32
    mov qword [rbp-1128], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1128]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-1144], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 50000
    mov qword [rbp-1152], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-1160], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 50000
    mov qword [rbp-1168], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 100
    mov qword [rbp-1176], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1144]
    mov rsi, [rbp-1152]
    mov rdx, [rbp-1160]
    mov rcx, [rbp-1168]
    mov r8, [rbp-1176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_u64
    mov qword [rbp-1184], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1184]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-1200], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_1]
    mov dword [rbp-1208], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_2]
    mov dword [rbp-1216], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_1]
    mov dword [rbp-1224], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_2]
    mov dword [rbp-1232], eax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1200]
    mov rsi, [rbp-1208]
    mov rdx, [rbp-1216]
    mov rcx, [rbp-1224]
    mov r8, [rbp-1232]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_f32
    mov qword [rbp-1240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-1256], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_3]
    mov dword [rbp-1264], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_4]
    mov dword [rbp-1272], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_3]
    mov dword [rbp-1280], eax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov eax, dword [float_4]
    mov dword [rbp-1288], eax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1256]
    mov rsi, [rbp-1264]
    mov rdx, [rbp-1272]
    mov rcx, [rbp-1280]
    mov r8, [rbp-1288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_f64
    mov qword [rbp-1296], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1296]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 999
    mov qword [rbp-1312], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1312]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_void_func
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-1328], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_no_params
    mov qword [rbp-1336], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1336]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-1352], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-1360], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-1368], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-1376], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 4
    mov qword [rbp-1384], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-1392], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 6
    mov qword [rbp-1400], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 7
    mov qword [rbp-1408], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 8
    mov qword [rbp-1416], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1352]
    mov rsi, [rbp-1360]
    mov rdx, [rbp-1368]
    mov rcx, [rbp-1376]
    mov r8, [rbp-1384]
    mov r9, [rbp-1392]
    push qword [rbp-1400]
    push qword [rbp-1408]
    push qword [rbp-1416]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call test_many_params
    mov qword [rbp-1424], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1424]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-1440], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-1448], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1440]
    mov rsi, [rbp-1448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call factorial
    mov qword [rbp-1456], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1456]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-1472], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 7
    mov qword [rbp-1480], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1472]
    mov rsi, [rbp-1480]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call factorial
    mov qword [rbp-1488], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1488]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-1504], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1512], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-1520], rax
    ; IR: PARAM src1
    ; IR: LOAD_CONST dest src1
    mov rax, 30
    mov qword [rbp-1528], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1504]
    mov rsi, [rbp-1512]
    mov rdx, [rbp-1520]
    mov rcx, [rbp-1528]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call complex_calculation
    mov qword [rbp-1536], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1536]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1552], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1552]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call increment_counter
    mov qword [rbp-1560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1576], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call increment_counter
    mov qword [rbp-1584], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1584]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-1600], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1600]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call increment_counter
    mov qword [rbp-1608], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1608]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-1624], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-1624]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call get_pi
    mov qword [rbp-1632], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1632]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-1648], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1648]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret

get_pi:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; IR: LOAD_VAR dest src1
    mov eax, dword [rbp-8]
    mov dword [rbp-728], eax
    ; IR: RETURN src1
    mov rax, qword [rbp-728]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

increment_counter:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-696], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-704], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-696]
    mov rbx, qword [rbp-704]
    add rax, rbx
    mov qword [rbp-712], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-712]
    mov qword [rbp-16], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-720], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-720]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

complex_calculation:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; Store parameter c from rdx
    mov qword [rbp-48], rdx
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-600], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-608], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-600]
    mov rbx, qword [rbp-608]
    imul rax, rbx
    mov qword [rbp-616], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-616]
    mov qword [rbp-40], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-624], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-632], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-624]
    mov rbx, qword [rbp-632]
    add rax, rbx
    mov qword [rbp-640], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-640]
    mov qword [rbp-56], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-648], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-656], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-648]
    mov rbx, qword [rbp-656]
    cqo
    idiv rbx
    mov qword [rbp-664], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-664]
    mov qword [rbp-64], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-672], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-672]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

factorial:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter n from rdi
    mov qword [rbp-72], rdi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-520], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-528], rax
    ; IR: LEQ dest src1 src2
    mov rax, qword [rbp-520]
    mov rbx, qword [rbp-528]
    cmp rax, rbx
    setle al
    movzx rax, al
    mov qword [rbp-536], rax
    ; IR: IF_FALSE_GOTO dest src1
    mov rax, qword [rbp-536]
    test rax, rax
    jz else_0
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-544], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-544]
    mov rsp, rbp
    pop rbp
    ret
    ; IR: GOTO dest
    jmp end_if_1
    ; IR: LABEL dest
else_0:
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-552], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-560], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 1
    mov qword [rbp-568], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-560]
    mov rbx, qword [rbp-568]
    sub rax, rbx
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, [rbp-576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call factorial
    mov qword [rbp-584], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-552]
    mov rbx, qword [rbp-584]
    imul rax, rbx
    mov qword [rbp-592], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-592]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_many_params:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; Store parameter c from rdx
    mov qword [rbp-48], rdx
    ; Store parameter d from rcx
    mov qword [rbp-80], rcx
    ; Store parameter e from r8
    mov qword [rbp-88], r8
    ; Store parameter f from r9
    mov qword [rbp-96], r9
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-400], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-408], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-400]
    mov rbx, qword [rbp-408]
    add rax, rbx
    mov qword [rbp-416], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-424], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-416]
    mov rbx, qword [rbp-424]
    add rax, rbx
    mov qword [rbp-432], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-440], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-432]
    mov rbx, qword [rbp-440]
    add rax, rbx
    mov qword [rbp-448], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-456], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-448]
    mov rbx, qword [rbp-456]
    add rax, rbx
    mov qword [rbp-464], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-472], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-464]
    mov rbx, qword [rbp-472]
    add rax, rbx
    mov qword [rbp-480], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-488], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-480]
    mov rbx, qword [rbp-488]
    add rax, rbx
    mov qword [rbp-496], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-504], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-496]
    mov rbx, qword [rbp-504]
    add rax, rbx
    mov qword [rbp-512], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-512]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_no_params:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; IR: LOAD_CONST dest src1
    mov rax, 42
    mov qword [rbp-392], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-392]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_void_func:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter x from rdi
    mov qword [rbp-120], rdi
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-368], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-376], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-368]
    mov rsi, [rbp-376]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rsp, rbp
    pop rbp
    ret

test_f64:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov eax, dword [rbp-24]
    mov dword [rbp-344], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [rbp-32]
    mov dword [rbp-352], eax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-344]
    mov rbx, qword [rbp-352]
    imul rax, rbx
    mov qword [rbp-360], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-360]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_f32:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov eax, dword [rbp-24]
    mov dword [rbp-320], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [rbp-32]
    mov dword [rbp-328], eax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-320]
    mov rbx, qword [rbp-328]
    add rax, rbx
    mov qword [rbp-336], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-336]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_u64:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-296], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-304], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-296]
    mov rbx, qword [rbp-304]
    cqo
    idiv rbx
    mov qword [rbp-312], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-312]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_u32:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-272], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-280], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-272]
    mov rbx, qword [rbp-280]
    sub rax, rbx
    mov qword [rbp-288], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-288]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_u16:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-248], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-256], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-248]
    mov rbx, qword [rbp-256]
    imul rax, rbx
    mov qword [rbp-264], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-264]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_u8:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-224], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-232], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-224]
    mov rbx, qword [rbp-232]
    add rax, rbx
    mov qword [rbp-240], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-240]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_i64:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-200], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-208], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-200]
    mov rbx, qword [rbp-208]
    cqo
    idiv rbx
    mov qword [rbp-216], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-216]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_i32:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-176], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-184], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-176]
    mov rbx, qword [rbp-184]
    sub rax, rbx
    mov qword [rbp-192], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-192]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_i16:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-152], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-160], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-152]
    mov rbx, qword [rbp-160]
    imul rax, rbx
    mov qword [rbp-168], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-168]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret

test_i8:
    push rbp
    mov rbp, rsp
    sub rsp, 1656
    ; Store parameter a from rdi
    mov qword [rbp-24], rdi
    ; Store parameter b from rsi
    mov qword [rbp-32], rsi
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-128], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-136], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-128]
    mov rbx, qword [rbp-136]
    add rax, rbx
    mov qword [rbp-144], rax
    ; IR: RETURN src1
    mov rax, qword [rbp-144]
    mov rsp, rbp
    pop rbp
    ret
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
