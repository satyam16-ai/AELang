; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 64-bit

section .rodata
    align 8
msg_0 db "=== ÆLang Comprehensive System Test ===",10,10,0
msg_1 db "1. TESTING I/O AND DATA TYPE STORAGE (ALL TYPES - 64-bit mode):",10,0
msg_2 db "Please enter the following values in order:",10,0
msg_3 db "i8 (byte): 100",10,0
msg_4 db "i16 (short): 25000",10,0
msg_5 db "i32 (int): 1000000",10,0
msg_6 db "i64 (long): 9223372036854775807",10,0
msg_7 db "u8 (unsigned byte): 200",10,0
msg_8 db "u16 (unsigned short): 50000",10,0
msg_9 db "u32 (unsigned int): 3000000",10,0
msg_10 db "u64 (unsigned long): 18446744073709551615",10,0
msg_11 db "f32 (float): 3.14159",10,0
msg_12 db "f64 (double): 2.718281828459045",10,0
msg_13 db "num (number): 42.195",10,0
msg_14 db "char: Z",10,10,0
msg_15 db "Enter i8 value: ",0
msg_16 db "Stored i8: %d",10,0
msg_17 db "Enter i16 value: ",0
msg_18 db "Stored i16: %d",10,0
msg_19 db "Enter i32 value: ",0
msg_20 db "Stored i32: %d",10,0
msg_21 db "Enter i64 value: ",0
msg_22 db "Stored i64: %ld",10,0
msg_23 db "Enter u8 value: ",0
msg_24 db "Stored u8: %u",10,0
msg_25 db "Enter u16 value: ",0
msg_26 db "Stored u16: %u",10,0
msg_27 db "Enter u32 value: ",0
msg_28 db "Stored u32: %u",10,0
msg_29 db "Enter u64 value: ",0
msg_30 db "Stored u64: %lu",10,0
msg_31 db "Enter f32 value: ",0
msg_32 db "Stored f32: %f",10,0
msg_33 db "Enter f64 value: ",0
msg_34 db "Stored f64: %lf",10,0
msg_35 db "Enter num value: ",0
msg_36 db "Stored num: %f",10,0
msg_37 db "Enter char value: ",0
msg_38 db "Stored char: %c",10,10,0
msg_39 db "2. TESTING ARITHMETIC OPERATORS WITH PRECEDENCE:",10,0
msg_40 db "Variables: a=%d, b=%d, c=%d, d=%d",10,0
msg_41 db "Addition: %d + %d = %d",10,0
msg_42 db "Subtraction: %d - %d = %d",10,0
msg_43 db "Multiplication: %d * %d = %d",10,0
msg_44 db "Division: %d / %d = %d",10,0
msg_45 db "Modulo: %d %% %d = %d",10,0
msg_46 db "Precedence test: %d + %d * %d - %d / %d = %d",10,0
msg_47 db "Complex expression: (%d + %d) * (%d - %d) = %d",10,0
msg_48 db 10,0
msg_49 db "3. TESTING COMPARISON OPERATORS:",10,0
msg_50 db "Variables: x=%d, y=%d, z=%d",10,0
msg_51 db "4. TESTING IF/ELSE CONTROL FLOW:",10,0
msg_52 db "Testing simple if (x == z):",10,0
msg_53 db "✓ PASS: x equals z",10,0
msg_54 db "Testing if-else (x < y):",10,0
msg_55 db "✓ PASS: x is less than y",10,0
msg_56 db "✗ FAIL: x should be less than y",10,0
msg_57 db "Testing if-else (x > y):",10,0
msg_58 db "✗ FAIL: x should not be greater than y",10,0
msg_59 db "✓ PASS: x is not greater than y",10,0
msg_60 db "Testing if-else if-else chain:",10,0
msg_61 db "test_val = %d",10,0
msg_62 db "test_val is less than 10",10,0
msg_63 db "✓ PASS: test_val is between 10 and 19",10,0
msg_64 db "test_val is 20 or greater",10,0
msg_65 db "Testing nested if statements:",10,0
msg_66 db "Outer condition passed (outer_val > 0)",10,0
msg_67 db "✓ PASS: Inner condition also passed (inner_val > 0)",10,0
msg_68 db "Inner condition failed",10,0
msg_69 db "Outer condition failed",10,0
msg_70 db "=== TEST SUMMARY ===",10,0
msg_71 db "✅ I/O Operations: All data types read and stored",10,0
msg_72 db "✅ Arithmetic Operators: +, -, *, /, %% working",10,0
msg_73 db "✅ Operator Precedence: Correct evaluation order",10,0
msg_74 db "✅ Comparison Operators: ==, <, > working",10,0
msg_75 db "✅ Control Flow: if, else, else-if working",10,0
msg_76 db "✅ Nested Structures: Nested if statements working",10,0
msg_77 db 10,"🎉 ALL COMPREHENSIVE TESTS COMPLETED! 🎉",10,0

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
    sub rsp, 2456
    ; IR: LOAD_CONST dest src1
    mov rax, msg_0
    mov qword [rbp-240], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-240]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_1
    mov qword [rbp-256], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-256]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_2
    mov qword [rbp-272], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-272]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_3
    mov qword [rbp-288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_4
    mov qword [rbp-304], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-304]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_5
    mov qword [rbp-320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_6
    mov qword [rbp-336], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-336]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_7
    mov qword [rbp-352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_8
    mov qword [rbp-368], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-368]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_9
    mov qword [rbp-384], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-384]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_10
    mov qword [rbp-400], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-400]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_11
    mov qword [rbp-416], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-416]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_12
    mov qword [rbp-432], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-432]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_13
    mov qword [rbp-448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_14
    mov qword [rbp-464], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-464]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_15
    mov qword [rbp-480], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-480]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 0
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-496], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-496]
    mov qword [rbp-8], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_16
    mov qword [rbp-504], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-8]
    mov qword [rbp-512], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-504]
    mov rsi, [rbp-512]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_17
    mov qword [rbp-528], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-528]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 1
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-544], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-544]
    mov qword [rbp-16], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_18
    mov qword [rbp-552], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-16]
    mov qword [rbp-560], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-552]
    mov rsi, [rbp-560]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_19
    mov qword [rbp-576], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-576]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 2
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-592], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-592]
    mov qword [rbp-24], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_20
    mov qword [rbp-600], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-24]
    mov qword [rbp-608], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-600]
    mov rsi, [rbp-608]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_21
    mov qword [rbp-624], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-624]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 3
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-640], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-640]
    mov qword [rbp-32], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_22
    mov qword [rbp-648], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-32]
    mov qword [rbp-656], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-648]
    mov rsi, [rbp-656]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_23
    mov qword [rbp-672], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-672]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 4
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-688], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-688]
    mov qword [rbp-40], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_24
    mov qword [rbp-696], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-40]
    mov qword [rbp-704], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-696]
    mov rsi, [rbp-704]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_25
    mov qword [rbp-720], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-720]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 5
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-736], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-736]
    mov qword [rbp-48], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_26
    mov qword [rbp-744], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-48]
    mov qword [rbp-752], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-744]
    mov rsi, [rbp-752]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_27
    mov qword [rbp-768], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-768]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 6
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-784], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-784]
    mov qword [rbp-56], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_28
    mov qword [rbp-792], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-56]
    mov qword [rbp-800], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-792]
    mov rsi, [rbp-800]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_29
    mov qword [rbp-816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 7
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-832], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-832]
    mov qword [rbp-64], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_30
    mov qword [rbp-840], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-64]
    mov qword [rbp-848], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-840]
    mov rsi, [rbp-848]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_31
    mov qword [rbp-864], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-864]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 10
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-880], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-880]
    mov qword [rbp-72], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_32
    mov qword [rbp-888], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-72]
    mov qword [rbp-896], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-888]
    mov rsi, [rbp-896]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_33
    mov qword [rbp-912], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-912]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 11
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-928], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-928]
    mov qword [rbp-80], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_34
    mov qword [rbp-936], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-80]
    mov qword [rbp-944], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-936]
    mov rsi, [rbp-944]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_35
    mov qword [rbp-960], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-960]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 12
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-976], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-976]
    mov qword [rbp-88], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_36
    mov qword [rbp-984], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-88]
    mov qword [rbp-992], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-984]
    mov rsi, [rbp-992]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_37
    mov qword [rbp-1008], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1008]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: PARAM src1
    ; IR: CALL dest src1
    mov rdi, 14
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call read_with_type
    mov qword [rbp-1024], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1024]
    mov qword [rbp-96], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_38
    mov qword [rbp-1032], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-96]
    mov qword [rbp-1040], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1032]
    mov rsi, [rbp-1040]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_39
    mov qword [rbp-1056], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1056]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1072], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1072]
    mov qword [rbp-104], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-1080], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1080]
    mov qword [rbp-112], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-1088], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1088]
    mov qword [rbp-120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 2
    mov qword [rbp-1096], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1096]
    mov qword [rbp-128], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_40
    mov qword [rbp-1104], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1112], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1120], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1128], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1136], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1104]
    mov rsi, [rbp-1112]
    mov rdx, [rbp-1120]
    mov rcx, [rbp-1128]
    mov r8, [rbp-1136]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1152], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1160], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-1152]
    mov rbx, qword [rbp-1160]
    add rax, rbx
    mov qword [rbp-1168], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1168]
    mov qword [rbp-136], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_41
    mov qword [rbp-1176], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1184], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1192], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-136]
    mov qword [rbp-1200], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1176]
    mov rsi, [rbp-1184]
    mov rdx, [rbp-1192]
    mov rcx, [rbp-1200]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1216], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1224], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-1216]
    mov rbx, qword [rbp-1224]
    sub rax, rbx
    mov qword [rbp-1232], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1232]
    mov qword [rbp-144], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_42
    mov qword [rbp-1240], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1248], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1256], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-144]
    mov qword [rbp-1264], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1240]
    mov rsi, [rbp-1248]
    mov rdx, [rbp-1256]
    mov rcx, [rbp-1264]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1280], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1288], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-1280]
    mov rbx, qword [rbp-1288]
    imul rax, rbx
    mov qword [rbp-1296], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1296]
    mov qword [rbp-152], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_43
    mov qword [rbp-1304], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1312], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1320], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-152]
    mov qword [rbp-1328], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1304]
    mov rsi, [rbp-1312]
    mov rdx, [rbp-1320]
    mov rcx, [rbp-1328]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1344], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1352], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-1344]
    mov rbx, qword [rbp-1352]
    cqo
    idiv rbx
    mov qword [rbp-1360], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1360]
    mov qword [rbp-160], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_44
    mov qword [rbp-1368], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1376], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1384], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-160]
    mov qword [rbp-1392], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1368]
    mov rsi, [rbp-1376]
    mov rdx, [rbp-1384]
    mov rcx, [rbp-1392]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1408], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1416], rax
    ; IR: MOD dest src1 src2
    mov rax, qword [rbp-1408]
    mov rbx, qword [rbp-1416]
    cqo
    idiv rbx
    mov rax, rdx
    mov qword [rbp-1424], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1424]
    mov qword [rbp-168], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_45
    mov qword [rbp-1432], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1440], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1448], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-168]
    mov qword [rbp-1456], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1432]
    mov rsi, [rbp-1440]
    mov rdx, [rbp-1448]
    mov rcx, [rbp-1456]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1472], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1480], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1488], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-1480]
    mov rbx, qword [rbp-1488]
    imul rax, rbx
    mov qword [rbp-1496], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-1472]
    mov rbx, qword [rbp-1496]
    add rax, rbx
    mov qword [rbp-1504], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1512], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1520], rax
    ; IR: DIV dest src1 src2
    mov rax, qword [rbp-1512]
    mov rbx, qword [rbp-1520]
    cqo
    idiv rbx
    mov qword [rbp-1528], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-1504]
    mov rbx, qword [rbp-1528]
    sub rax, rbx
    mov qword [rbp-1536], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1536]
    mov qword [rbp-176], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_46
    mov qword [rbp-1544], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1552], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1560], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1568], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1576], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1584], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-176]
    mov qword [rbp-1592], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1544]
    mov rsi, [rbp-1552]
    mov rdx, [rbp-1560]
    mov rcx, [rbp-1568]
    mov r8, [rbp-1576]
    mov r9, [rbp-1584]
    push qword [rbp-1592]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1608], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1616], rax
    ; IR: ADD dest src1 src2
    mov rax, qword [rbp-1608]
    mov rbx, qword [rbp-1616]
    add rax, rbx
    mov qword [rbp-1624], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1632], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1640], rax
    ; IR: SUB dest src1 src2
    mov rax, qword [rbp-1632]
    mov rbx, qword [rbp-1640]
    sub rax, rbx
    mov qword [rbp-1648], rax
    ; IR: MUL dest src1 src2
    mov rax, qword [rbp-1624]
    mov rbx, qword [rbp-1648]
    imul rax, rbx
    mov qword [rbp-1656], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1656]
    mov qword [rbp-184], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_47
    mov qword [rbp-1664], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-104]
    mov qword [rbp-1672], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-112]
    mov qword [rbp-1680], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-120]
    mov qword [rbp-1688], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-128]
    mov qword [rbp-1696], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-184]
    mov qword [rbp-1704], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1664]
    mov rsi, [rbp-1672]
    mov rdx, [rbp-1680]
    mov rcx, [rbp-1688]
    mov r8, [rbp-1696]
    mov r9, [rbp-1704]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_48
    mov qword [rbp-1720], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1720]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_49
    mov qword [rbp-1736], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1736]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1752], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1752]
    mov qword [rbp-192], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-1760], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1760]
    mov qword [rbp-200], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-1768], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-1768]
    mov qword [rbp-208], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_50
    mov qword [rbp-1776], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-1784], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-1792], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-1800], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1776]
    mov rsi, [rbp-1784]
    mov rdx, [rbp-1792]
    mov rcx, [rbp-1800]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_51
    mov qword [rbp-1816], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1816]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_52
    mov qword [rbp-1832], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1832]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-1848], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-208]
    mov qword [rbp-1856], rax
    ; IR: EQ dest src1 src2
    mov rax, qword [rbp-1848]
    mov rbx, qword [rbp-1856]
    cmp rax, rbx
    sete al
    movzx rax, al
    mov qword [rbp-1864], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_53
    mov qword [rbp-1872], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1872]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_0:
    ; IR: LABEL dest
end_if_1:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_54
    mov qword [rbp-1888], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1888]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-1904], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-1912], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-1904]
    mov rbx, qword [rbp-1912]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-1920], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_55
    mov qword [rbp-1928], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1928]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_2:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_56
    mov qword [rbp-1944], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1944]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_3:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_57
    mov qword [rbp-1960], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-1960]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-192]
    mov qword [rbp-1976], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-200]
    mov qword [rbp-1984], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-1976]
    mov rbx, qword [rbp-1984]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-1992], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_58
    mov qword [rbp-2000], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2000]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_4:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_59
    mov qword [rbp-2016], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2016]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_5:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_60
    mov qword [rbp-2032], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2032]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 15
    mov qword [rbp-2048], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2048]
    mov qword [rbp-216], rax
    ; IR: LOAD_CONST dest src1
    mov rax, msg_61
    mov qword [rbp-2056], rax
    ; IR: PARAM src1
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-2064], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2056]
    mov rsi, [rbp-2064]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-2080], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 10
    mov qword [rbp-2088], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2080]
    mov rbx, qword [rbp-2088]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2096], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_62
    mov qword [rbp-2104], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2104]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_6:
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-216]
    mov qword [rbp-2120], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 20
    mov qword [rbp-2128], rax
    ; IR: LT dest src1 src2
    mov rax, qword [rbp-2120]
    mov rbx, qword [rbp-2128]
    cmp rax, rbx
    setl al
    movzx rax, al
    mov qword [rbp-2136], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_63
    mov qword [rbp-2144], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2144]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_8:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_64
    mov qword [rbp-2160], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2160]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_9:
    ; IR: LABEL dest
end_if_7:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_65
    mov qword [rbp-2176], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2176]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, 5
    mov qword [rbp-2192], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2192]
    mov qword [rbp-224], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 3
    mov qword [rbp-2200], rax
    ; IR: STORE_VAR src1 src2
    mov rax, qword [rbp-2200]
    mov qword [rbp-232], rax
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-224]
    mov qword [rbp-2208], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-2216], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2208]
    mov rbx, qword [rbp-2216]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2224], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_66
    mov qword [rbp-2232], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2232]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_VAR dest src1
    mov rax, qword [rbp-232]
    mov qword [rbp-2248], rax
    ; IR: LOAD_CONST dest src1
    mov rax, 0
    mov qword [rbp-2256], rax
    ; IR: GT dest src1 src2
    mov rax, qword [rbp-2248]
    mov rbx, qword [rbp-2256]
    cmp rax, rbx
    setg al
    movzx rax, al
    mov qword [rbp-2264], rax
    ; IR: IF_FALSE_GOTO src1 src2
    ; IR: LOAD_CONST dest src1
    mov rax, msg_67
    mov qword [rbp-2272], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2272]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: GOTO src1
    ; IR: LABEL dest
else_12:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_68
    mov qword [rbp-2288], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2288]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_13:
    ; IR: GOTO src1
    ; IR: LABEL dest
else_10:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_69
    mov qword [rbp-2304], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2304]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LABEL dest
end_if_11:
    ; IR: LOAD_CONST dest src1
    mov rax, msg_48
    mov qword [rbp-2320], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2320]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_70
    mov qword [rbp-2336], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2336]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_71
    mov qword [rbp-2352], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2352]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_72
    mov qword [rbp-2368], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2368]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_73
    mov qword [rbp-2384], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2384]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_74
    mov qword [rbp-2400], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2400]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_75
    mov qword [rbp-2416], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2416]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_76
    mov qword [rbp-2432], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2432]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    ; IR: LOAD_CONST dest src1
    mov rax, msg_77
    mov qword [rbp-2448], rax
    ; IR: PARAM src1
    ; IR: CALL src1
    mov rdi, [rbp-2448]
    mov rax, 0  ; no XMM registers used
    and rsp, -16  ; align stack
    call printf
    mov rax, 0
    mov rsp, rbp
    pop rbp
    ret


; End of generated code
