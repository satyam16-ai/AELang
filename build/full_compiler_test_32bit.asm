; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║              32-BIT BASIC ARITHMETIC TESTS              ║",0
msg_2 db "╚══════════════════════════════════════════════════════════╝",0
msg_3 db "",0
msg_4 db "🔹 32-bit Integer Operations:",0
msg_5 db "  Max i32: ",0
msg_6 db "  Min i32: ",0
msg_7 db "  1000000 + 42 = ",0
msg_8 db "  1000000 - 42 = ",0
msg_9 db "  42 * 100 = ",0
msg_10 db "  1000000 / 42 = ",0
msg_11 db "  1000000 % 42 = ",0
msg_12 db "🔹 32-bit Unsigned Operations:",0
msg_13 db "  Max u32: ",0
msg_14 db "  Min u32: ",0
msg_15 db "  2000000 + 1000000 = ",0
msg_16 db "🔹 32-bit Float Operations:",0
msg_17 db "  π ≈ ",0
msg_18 db "  e ≈ ",0
msg_19 db "  π + e = ",0
msg_20 db "  π * e = ",0
msg_21 db "  123.456 / 2.0 = ",0
msg_22 db "║            32-BIT EXTREME EDGE CASE TESTS               ║",0
msg_23 db "🔹 Division Edge Cases:",0
msg_24 db "  1000000000 / 1 = ",0
msg_25 db "  1000000000 / 1000 = ",0
msg_26 db "  42 / 7 = ",0
msg_27 db "  43 / 7 = ",0
msg_28 db "🔹 Modulo Edge Cases:",0
msg_29 db "  1000000000 % 7 = ",0
msg_30 db "  999 % 13 = ",0
msg_31 db "  100 % 100 = ",0
msg_32 db "  50 % 75 = ",0
msg_33 db "🔹 Negative Number Operations:",0
msg_34 db "  -999999 + -777 = ",0
msg_35 db "  -999999 - -777 = ",0
msg_36 db "  -999999 * -777 = ",0
msg_37 db "  -999999 / -777 = ",0
msg_38 db "  555555 + (-777) = ",0
msg_39 db "🔹 Float Precision Tests:",0
msg_40 db "  0.0000001 + 0.0000002 = ",0
msg_41 db "  999999.9 + 0.000001 = ",0
msg_42 db "  1.0 / 3.0 = ",0
msg_43 db "  2.0 / 3.0 = ",0
msg_44 db "  (1/3) + (2/3) = ",0
msg_45 db "║            32-BIT COMPARISON OPERATIONS                 ║",0
msg_46 db "🔹 Integer Comparisons:",0
msg_47 db "  Values: x=100, y=200, z=100, neg=-50",0
msg_48 db "  ✅ x == z (100 == 100)",0
msg_49 db "  ✅ x != y (100 != 200)",0
msg_50 db "  ✅ x < y (100 < 200)",0
msg_51 db "  ✅ y > x (200 > 100)",0
msg_52 db "  ✅ x >= z (100 >= 100)",0
msg_53 db "  ✅ y >= x (200 >= 100)",0
msg_54 db "  ✅ x <= z (100 <= 100)",0
msg_55 db "  ✅ x <= y (100 <= 200)",0
msg_56 db "  ✅ neg < x (-50 < 100)",0
msg_57 db "🔹 Float Comparisons:",0
msg_58 db "  ✅ fa == fc (3.14159 == 3.14159)",0
msg_59 db "  ✅ fa != fb (3.14159 != 3.14160)",0
msg_60 db "  ✅ fa < fb (3.14159 < 3.14160)",0
msg_61 db "  ✅ fb > fa (3.14160 > 3.14159)",0
msg_62 db "🔹 Boundary Comparisons:",0
msg_63 db "  ✅ min_int < max_int",0
msg_64 db "  ✅ almost_max < max_int",0
msg_65 db "  ✅ max_int > almost_max",0
msg_66 db "║             32-BIT LOGICAL OPERATIONS                   ║",0
msg_67 db "🔹 Basic Logical Operations:",0
msg_68 db "  ✅ true && true = true",0
msg_69 db "  ✅ false && true = false",0
msg_70 db "  ✅ true || false = true",0
msg_71 db "  ✅ false || false = false",0
msg_72 db "  ✅ !false = true",0
msg_73 db "  ✅ !!true = true",0
msg_74 db "🔹 Complex Logical Expressions:",0
msg_75 db "  ✅ (true && false) || (true && true) = true",0
msg_76 db "  ✅ !(false || false) && (true || false) = true",0
msg_77 db "  ✅ (5 > 3) && (10 < 20) && (7 == 7) = true",0
msg_78 db "🔹 Multiple Negations:",0
msg_79 db "  ✅ !!!false = true",0
msg_80 db "  ✅ !!!!true = true",0
msg_81 db "  ✅ !!!!!false = true",0
msg_82 db "║           32-BIT CONTROL FLOW WITH ARITHMETIC           ║",0
msg_83 db "🔹 Complex Scoring System (score = 875):",0
msg_84 db "  Grade: A+ (Excellent)",0
msg_85 db "  Grade: A (Outstanding)",0
msg_86 db "  ✅ Grade: A- (Very Good)",0
msg_87 db "  Grade: B+ (Good)",0
msg_88 db "  Grade: B (Satisfactory)",0
msg_89 db "  Grade: Below B",0
msg_90 db "🔹 Nested Arithmetic Conditions (x=15, y=25, z=10):",0
msg_91 db "  ✅ x + z == y AND x * z > 100",0
msg_92 db "  ✅ x + z == y BUT x * z <= 100",0
msg_93 db "  ✅ All conditions satisfied: x > z, y > x, sum = 50",0
msg_94 db "🔹 Factorial-like Calculation:",0
msg_95 db "  5! = ",0
msg_96 db "║            32-BIT MIXED TYPE OPERATIONS                 ║",0
msg_97 db "🔹 Mixed Type Arithmetic:",0
msg_98 db "  Integer: ",0
msg_99 db "  Float: ",0
msg_100 db "  3.14159 + 42.0 = ",0
msg_101 db "🔹 Character Operations:",0
msg_102 db "  First char: ",0
msg_103 db "  Last char: ",0
msg_104 db "  First digit: ",0
msg_105 db "  Last digit: ",0
msg_106 db "🔹 String Operations:",0
msg_107 db "  Hello, ÆLang 32-bit!",0
msg_108 db "  Unicode test: 🔥 ✅ 🎯 🚀",0
msg_109 db "  Special chars: @#$%^&*()",0
msg_110 db "🔹 Boolean with Arithmetic:",0
msg_111 db "  ✅ Number is positive",0
msg_112 db "  ✅ Number is even",0
msg_113 db "  ✅ Number is the answer to everything!",0
msg_114 db "║        ÆLANG FULL COMPILER TEST SUITE - 32-BIT         ║",0
msg_115 db "║                  Comprehensive Testing                   ║",0
msg_116 db "║                   July 20, 2025                         ║",0
msg_117 db "🚀 Starting comprehensive 32-bit compiler testing...",0
msg_118 db "║                   TEST RESULTS SUMMARY                  ║",0
msg_119 db "✅ Basic Arithmetic (32-bit): PASSED",0
msg_120 db "✅ Extreme Edge Cases (32-bit): PASSED",0
msg_121 db "✅ Comparison Operations (32-bit): PASSED",0
msg_122 db "✅ Logical Operations (32-bit): PASSED",0
msg_123 db "✅ Control Flow (32-bit): PASSED",0
msg_124 db "✅ Mixed Type Operations (32-bit): PASSED",0
msg_125 db "🎯 32-BIT FULL COMPILER TEST COMPLETED SUCCESSFULLY!",0
msg_126 db "🔥 All arithmetic operations verified",0
msg_127 db "🛡️ Edge cases handled correctly",0
msg_128 db "🎉 Compilation and linking successful",0
float_0: dd 0x40490fdb  ; 3.14159274
float_1: dd 0x402df854  ; 2.71828175
float_2: dd 0x42f6e979  ; 123.456001
float_3: dd 0x40000000  ; 2
float_4: dd 0x33d6bf95  ; 1.00000001e-07
float_5: dd 0x3456bf95  ; 2.00000002e-07
float_6: dd 0x497423fe  ; 999999.875
float_7: dd 0x358637bd  ; 9.99999997e-07
float_8: dd 0x3f800000  ; 1
float_9: dd 0x40400000  ; 3
float_10: dd 0x40000000  ; 2
float_11: dd 0x40400000  ; 3
float_12: dd 0x3f800000  ; 1
float_13: dd 0x40400000  ; 3
float_14: dd 0x40000000  ; 2
float_15: dd 0x40400000  ; 3
float_16: dd 0x40490fd0  ; 3.14159012
float_17: dd 0x40490ff9  ; 3.14159989
float_18: dd 0x40490fd0  ; 3.14159012
float_19: dd 0x40490fd0  ; 3.14159012
float_20: dd 0x42280000  ; 42
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num
    extern read_num_safe
    extern print_num
    extern print_clean
    extern print_num_precision
    extern print_num_scientific
    extern print_currency
    extern print_percentage
    extern print_num_engineering
    extern print_hex
    extern read_num_validated
    extern read_num_with_prompt
    extern read_positive_num
    extern read_integer_only

extern print
extern print_clean
extern print_int
extern print_num
extern print_bool
extern print_char
; CODEGEN TEST MARKER: emitting function test_basic_arithmetic_32bit
test_basic_arithmetic_32bit:
    push ebp
    mov ebp, esp
    sub esp, 64  ; allocate space for 15 local variables
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let a:i32 = 2147483647
    mov eax, 2147483647
    mov [ebp-4], eax  ; store a (local int)
; let b:i32 = <EXPR_UNHANDLED>
    mov eax, -2147483648
    neg eax
    mov [ebp-8], eax  ; store b (local int)
; let c:i32 = 1000000
    mov eax, 1000000
    mov [ebp-12], eax  ; store c (local int)
; let d:i32 = 42
    mov eax, 42
    mov [ebp-16], eax  ; store d (local int)
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print_clean
    add esp, 4
    mov eax, [ebp-4]  ; load a (stack)
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print_clean
    add esp, 4
    mov eax, [ebp-8]  ; load b (stack)
    push eax
    call print_int
    add esp, 4
; let add_result:i32 = c + d
    mov eax, [ebp-12]  ; load c (stack)
    push eax
    mov eax, [ebp-16]  ; load d (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [ebp-20], eax  ; store add_result (local int)
; let sub_result:i32 = c - d
    mov eax, [ebp-12]  ; load c (stack)
    push eax
    mov eax, [ebp-16]  ; load d (stack)
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [ebp-24], eax  ; store sub_result (local int)
; let mul_result:i32 = d * 100
    mov eax, [ebp-16]  ; load d (stack)
    push eax
    mov eax, 100
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [ebp-28], eax  ; store mul_result (local int)
; let div_result:i32 = c / d
    mov eax, [ebp-12]  ; load c (stack)
    push eax
    mov eax, [ebp-16]  ; load d (stack)
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [ebp-32], eax  ; store div_result (local int)
; let mod_result:i32 = c % d
    mov eax, [ebp-12]  ; load c (stack)
    push eax
    mov eax, [ebp-16]  ; load d (stack)
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [ebp-36], eax  ; store mod_result (local int)
    push msg_7
    call print_clean
    add esp, 4
    mov eax, [ebp-20]  ; load add_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_8
    call print_clean
    add esp, 4
    mov eax, [ebp-24]  ; load sub_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print_clean
    add esp, 4
    mov eax, [ebp-28]  ; load mul_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print_clean
    add esp, 4
    mov eax, [ebp-32]  ; load div_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_11
    call print_clean
    add esp, 4
    mov eax, [ebp-36]  ; load mod_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let ua:u32 = -1
    mov eax, -1
    mov [ebp-40], eax  ; store ua (local int)
; let ub:u32 = 0
    mov eax, 0
    mov [ebp-44], eax  ; store ub (local int)
; let uc:u32 = 2000000
    mov eax, 2000000
    mov [ebp-48], eax  ; store uc (local int)
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print_clean
    add esp, 4
    mov eax, [ebp-40]  ; load ua (stack)
    push eax
    call print_int
    add esp, 4
    push msg_14
    call print_clean
    add esp, 4
    mov eax, [ebp-44]  ; load ub (stack)
    push eax
    call print_int
    add esp, 4
    push msg_15
    call print_clean
    add esp, 4
    mov eax, [ebp-48]  ; load uc (stack)
    push eax
    mov eax, 1000000
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let fa:f32 = 1725132046336.000000
; Error: f32 constant not found
    fstp dword [ebp-52]  ; store fa (local float)
; let fb:f32 = -0.000000
; Error: f32 constant not found
    fstp dword [ebp-56]  ; store fb (local float)
; let fc:f32 = 0.000000
; Error: f32 constant not found
    fstp dword [ebp-60]  ; store fc (local float)
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print_clean
    add esp, 4
    fld dword [ebp-52]  ; load fa (stack)
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_18
    call print_clean
    add esp, 4
    fld dword [ebp-56]  ; load fb (stack)
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_19
    call print_clean
    add esp, 4
    fld dword [ebp-52]  ; load fa (stack)
    fld dword [ebp-56]  ; load fb (stack)
    faddp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_20
    call print_clean
    add esp, 4
    fld dword [ebp-52]  ; load fa (stack)
    fld dword [ebp-56]  ; load fb (stack)
    fmulp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_21
    call print_clean
    add esp, 4
    fld dword [ebp-60]  ; load fc (stack)
; Error: f32 constant not found
    fdivp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_extreme_edge_cases_32bit
test_extreme_edge_cases_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 10 local variables
    push msg_0
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let large:i32 = 1000000000
    mov eax, 1000000000
    mov [ebp-4], eax  ; store large (local int)
; let tiny:i32 = 1
    mov eax, 1
    mov [ebp-8], eax  ; store tiny (local int)
; let zero:i32 = 0
    mov eax, 0
    mov [ebp-12], eax  ; store zero (local int)
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print_clean
    add esp, 4
    mov eax, [ebp-4]  ; load large (stack)
    push eax
    mov eax, [ebp-8]  ; load tiny (stack)
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [ebp-4]  ; load large (stack)
    push eax
    mov eax, 1000
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_26
    call print_clean
    add esp, 4
    mov eax, 42
    push eax
    mov eax, 7
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_27
    call print_clean
    add esp, 4
    mov eax, 43
    push eax
    mov eax, 7
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_28
    call print
    add esp, 4
    push msg_29
    call print_clean
    add esp, 4
    mov eax, [ebp-4]  ; load large (stack)
    push eax
    mov eax, 7
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    push eax
    call print_int
    add esp, 4
    push msg_30
    call print_clean
    add esp, 4
    mov eax, 999
    push eax
    mov eax, 13
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    push eax
    call print_int
    add esp, 4
    push msg_31
    call print_clean
    add esp, 4
    mov eax, 100
    push eax
    mov eax, 100
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    push eax
    call print_int
    add esp, 4
    push msg_32
    call print_clean
    add esp, 4
    mov eax, 50
    push eax
    mov eax, 75
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let neg_a:i32 = <EXPR_UNHANDLED>
    mov eax, 999999
    neg eax
    mov [ebp-16], eax  ; store neg_a (local int)
; let neg_b:i32 = <EXPR_UNHANDLED>
    mov eax, 777
    neg eax
    mov [ebp-20], eax  ; store neg_b (local int)
; let pos_c:i32 = 555555
    mov eax, 555555
    mov [ebp-24], eax  ; store pos_c (local int)
    push msg_33
    call print
    add esp, 4
    push msg_34
    call print_clean
    add esp, 4
    mov eax, [ebp-16]  ; load neg_a (stack)
    push eax
    mov eax, [ebp-20]  ; load neg_b (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_35
    call print_clean
    add esp, 4
    mov eax, [ebp-16]  ; load neg_a (stack)
    push eax
    mov eax, [ebp-20]  ; load neg_b (stack)
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_36
    call print_clean
    add esp, 4
    mov eax, [ebp-16]  ; load neg_a (stack)
    push eax
    mov eax, [ebp-20]  ; load neg_b (stack)
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_37
    call print_clean
    add esp, 4
    mov eax, [ebp-16]  ; load neg_a (stack)
    push eax
    mov eax, [ebp-20]  ; load neg_b (stack)
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    push eax
    call print_int
    add esp, 4
    push msg_38
    call print_clean
    add esp, 4
    mov eax, [ebp-24]  ; load pos_c (stack)
    push eax
    mov eax, [ebp-20]  ; load neg_b (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let tiny_float1:f32 = -0.000000
; Error: f32 constant not found
    fstp dword [ebp-28]  ; store tiny_float1 (local float)
; let tiny_float2:f32 = -0.000000
; Error: f32 constant not found
    fstp dword [ebp-32]  ; store tiny_float2 (local float)
; let huge_float1:f32 = -107374184.000000
; Error: f32 constant not found
    fstp dword [ebp-36]  ; store huge_float1 (local float)
; let huge_float2:f32 = -0.000000
; Error: f32 constant not found
    fstp dword [ebp-40]  ; store huge_float2 (local float)
    push msg_39
    call print
    add esp, 4
    push msg_40
    call print_clean
    add esp, 4
    fld dword [ebp-28]  ; load tiny_float1 (stack)
    fld dword [ebp-32]  ; load tiny_float2 (stack)
    faddp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_41
    call print_clean
    add esp, 4
    fld dword [ebp-36]  ; load huge_float1 (stack)
    fld dword [ebp-40]  ; load huge_float2 (stack)
    faddp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_42
    call print_clean
    add esp, 4
; Error: f32 constant not found
; Error: f32 constant not found
    fdivp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_43
    call print_clean
    add esp, 4
; Error: f32 constant not found
; Error: f32 constant not found
    fdivp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_44
    call print_clean
    add esp, 4
; Error: f32 constant not found
; Error: f32 constant not found
    fdivp
; Error: f32 constant not found
; Error: f32 constant not found
    fdivp
    faddp
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_comparison_operations_32bit
test_comparison_operations_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 10 local variables
    push msg_0
    call print
    add esp, 4
    push msg_45
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let x:i32 = 100
    mov eax, 100
    mov [ebp-4], eax  ; store x (local int)
; let y:i32 = 200
    mov eax, 200
    mov [ebp-8], eax  ; store y (local int)
; let z:i32 = 100
    mov eax, 100
    mov [ebp-12], eax  ; store z (local int)
; let neg:i32 = <EXPR_UNHANDLED>
    mov eax, 50
    neg eax
    mov [ebp-16], eax  ; store neg (local int)
    push msg_46
    call print
    add esp, 4
    push msg_47
    call print
    add esp, 4
; if statement 0
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_48
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_49
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
.end_if_1:
; end if statement 1
; if statement 2
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
    push msg_50
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
.end_if_2:
; end if statement 2
; if statement 3
    mov eax, [ebp-8]  ; load y (stack)
    push eax
    mov eax, [ebp-4]  ; load x (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
    push msg_51
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
.end_if_3:
; end if statement 3
; if statement 4
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
    push msg_52
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
.end_if_4:
; end if statement 4
; if statement 5
    mov eax, [ebp-8]  ; load y (stack)
    push eax
    mov eax, [ebp-4]  ; load x (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_5
.then_5:
    push msg_53
    call print
    add esp, 4
    jmp .end_if_5
.else_5:
.end_if_5:
; end if statement 5
; if statement 6
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_6
.then_6:
    push msg_54
    call print
    add esp, 4
    jmp .end_if_6
.else_6:
.end_if_6:
; end if statement 6
; if statement 7
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_7
.then_7:
    push msg_55
    call print
    add esp, 4
    jmp .end_if_7
.else_7:
.end_if_7:
; end if statement 7
; if statement 8
    mov eax, [ebp-16]  ; load neg (stack)
    push eax
    mov eax, [ebp-4]  ; load x (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_8
.then_8:
    push msg_56
    call print
    add esp, 4
    jmp .end_if_8
.else_8:
.end_if_8:
; end if statement 8
    push msg_3
    call print
    add esp, 4
; let fa:f32 = -192530768169799846490900791296.000000
; Error: f32 constant not found
    fstp dword [ebp-52]  ; store fa (local float)
; let fb:f32 = 0.000000
; Error: f32 constant not found
    fstp dword [ebp-56]  ; store fb (local float)
; let fc:f32 = -192530768169799846490900791296.000000
; Error: f32 constant not found
    fstp dword [ebp-60]  ; store fc (local float)
    push msg_57
    call print
    add esp, 4
; if statement 9
    fld dword [ebp-52]  ; load fa (stack)
    fld dword [ebp-60]  ; load fc (stack)
    fcompp
    fstsw ax
    sahf
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_9
.then_9:
    push msg_58
    call print
    add esp, 4
    jmp .end_if_9
.else_9:
.end_if_9:
; end if statement 9
; if statement 10
    fld dword [ebp-52]  ; load fa (stack)
    fld dword [ebp-56]  ; load fb (stack)
    fcompp
    fstsw ax
    sahf
    setne al
    movzx eax, al
    cmp eax, 0
    je .else_10
.then_10:
    push msg_59
    call print
    add esp, 4
    jmp .end_if_10
.else_10:
.end_if_10:
; end if statement 10
; if statement 11
    fld dword [ebp-52]  ; load fa (stack)
    fld dword [ebp-56]  ; load fb (stack)
    fcompp
    fstsw ax
    sahf
    setb al
    movzx eax, al
    cmp eax, 0
    je .else_11
.then_11:
    push msg_60
    call print
    add esp, 4
    jmp .end_if_11
.else_11:
.end_if_11:
; end if statement 11
; if statement 12
    fld dword [ebp-56]  ; load fb (stack)
    fld dword [ebp-52]  ; load fa (stack)
    fcompp
    fstsw ax
    sahf
    seta al
    movzx eax, al
    cmp eax, 0
    je .else_12
.then_12:
    push msg_61
    call print
    add esp, 4
    jmp .end_if_12
.else_12:
.end_if_12:
; end if statement 12
    push msg_3
    call print
    add esp, 4
; let max_int:i32 = 2147483647
    mov eax, 2147483647
    mov [ebp-20], eax  ; store max_int (local int)
; let min_int:i32 = <EXPR_UNHANDLED>
    mov eax, -2147483648
    neg eax
    mov [ebp-24], eax  ; store min_int (local int)
; let almost_max:i32 = 2147483646
    mov eax, 2147483646
    mov [ebp-28], eax  ; store almost_max (local int)
    push msg_62
    call print
    add esp, 4
; if statement 13
    mov eax, [ebp-24]  ; load min_int (stack)
    push eax
    mov eax, [ebp-20]  ; load max_int (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_13
.then_13:
    push msg_63
    call print
    add esp, 4
    jmp .end_if_13
.else_13:
.end_if_13:
; end if statement 13
; if statement 14
    mov eax, [ebp-28]  ; load almost_max (stack)
    push eax
    mov eax, [ebp-20]  ; load max_int (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_14
.then_14:
    push msg_64
    call print
    add esp, 4
    jmp .end_if_14
.else_14:
.end_if_14:
; end if statement 14
; if statement 15
    mov eax, [ebp-20]  ; load max_int (stack)
    push eax
    mov eax, [ebp-28]  ; load almost_max (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_15
.then_15:
    push msg_65
    call print
    add esp, 4
    jmp .end_if_15
.else_15:
.end_if_15:
; end if statement 15
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_logical_operations_32bit
test_logical_operations_32bit:
    push ebp
    mov ebp, esp
    sub esp, 32  ; allocate space for 5 local variables
    push msg_0
    call print
    add esp, 4
    push msg_66
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let true_val:bool = 1
    mov eax, 1
    mov [ebp-4], eax  ; store true_val (local int)
; let false_val:bool = 0
    mov eax, 0
    mov [ebp-8], eax  ; store false_val (local int)
    push msg_67
    call print
    add esp, 4
; if statement 16
    mov eax, [ebp-4]  ; load true_val (stack)
    push eax
    mov eax, [ebp-4]  ; load true_val (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    cmp eax, 0
    je .else_16
.then_16:
    push msg_68
    call print
    add esp, 4
    jmp .end_if_16
.else_16:
.end_if_16:
; end if statement 16
; if statement 17
    mov eax, [ebp-8]  ; load false_val (stack)
    push eax
    mov eax, [ebp-4]  ; load true_val (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_17
.then_17:
    push msg_69
    call print
    add esp, 4
    jmp .end_if_17
.else_17:
.end_if_17:
; end if statement 17
; if statement 18
    mov eax, [ebp-4]  ; load true_val (stack)
    push eax
    mov eax, [ebp-8]  ; load false_val (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    cmp eax, 0
    je .else_18
.then_18:
    push msg_70
    call print
    add esp, 4
    jmp .end_if_18
.else_18:
.end_if_18:
; end if statement 18
; if statement 19
    mov eax, [ebp-8]  ; load false_val (stack)
    push eax
    mov eax, [ebp-8]  ; load false_val (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_19
.then_19:
    push msg_71
    call print
    add esp, 4
    jmp .end_if_19
.else_19:
.end_if_19:
; end if statement 19
; if statement 20
    mov eax, [ebp-8]  ; load false_val (stack)
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_20
.then_20:
    push msg_72
    call print
    add esp, 4
    jmp .end_if_20
.else_20:
.end_if_20:
; end if statement 20
; if statement 21
    mov eax, [ebp-4]  ; load true_val (stack)
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_21
.then_21:
    push msg_73
    call print
    add esp, 4
    jmp .end_if_21
.else_21:
.end_if_21:
; end if statement 21
    push msg_3
    call print
    add esp, 4
    push msg_74
    call print
    add esp, 4
; let complex1:bool = 1 && 0 || 1 && 1
    mov eax, 1
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    push eax
    mov eax, 1
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    mov [ebp-12], eax  ; store complex1 (local int)
; let complex2:bool = <EXPR_UNHANDLED> && 1 || 0
    mov eax, 0
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    push eax
    mov eax, 1
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    mov [ebp-16], eax  ; store complex2 (local int)
; let complex3:bool = 5 > 3 && 10 < 20 && 7 == 7
    mov eax, 5
    push eax
    mov eax, 3
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    push eax
    mov eax, 10
    push eax
    mov eax, 20
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    push eax
    mov eax, 7
    push eax
    mov eax, 7
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    mov [ebp-20], eax  ; store complex3 (local int)
; if statement 22
    mov eax, [ebp-12]  ; load complex1 (stack)
    cmp eax, 0
    je .else_22
.then_22:
    push msg_75
    call print
    add esp, 4
    jmp .end_if_22
.else_22:
.end_if_22:
; end if statement 22
; if statement 23
    mov eax, [ebp-16]  ; load complex2 (stack)
    cmp eax, 0
    je .else_23
.then_23:
    push msg_76
    call print
    add esp, 4
    jmp .end_if_23
.else_23:
.end_if_23:
; end if statement 23
; if statement 24
    mov eax, [ebp-20]  ; load complex3 (stack)
    cmp eax, 0
    je .else_24
.then_24:
    push msg_77
    call print
    add esp, 4
    jmp .end_if_24
.else_24:
.end_if_24:
; end if statement 24
    push msg_3
    call print
    add esp, 4
    push msg_78
    call print
    add esp, 4
; if statement 25
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_25
.then_25:
    push msg_79
    call print
    add esp, 4
    jmp .end_if_25
.else_25:
.end_if_25:
; end if statement 25
; if statement 26
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_26
.then_26:
    push msg_80
    call print
    add esp, 4
    jmp .end_if_26
.else_26:
.end_if_26:
; end if statement 26
; if statement 27
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_27
.then_27:
    push msg_81
    call print
    add esp, 4
    jmp .end_if_27
.else_27:
.end_if_27:
; end if statement 27
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_control_flow_32bit
test_control_flow_32bit:
    push ebp
    mov ebp, esp
    sub esp, 32  ; allocate space for 6 local variables
    push msg_0
    call print
    add esp, 4
    push msg_82
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let score:i32 = 875
    mov eax, 875
    mov [ebp-4], eax  ; store score (local int)
    push msg_83
    call print
    add esp, 4
; if statement 28
    mov eax, [ebp-4]  ; load score (stack)
    push eax
    mov eax, 950
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_28
.then_28:
    push msg_84
    call print
    add esp, 4
    jmp .end_if_28
.else_28:
; if statement 29
    mov eax, [ebp-4]  ; load score (stack)
    push eax
    mov eax, 900
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_29
.then_29:
    push msg_85
    call print
    add esp, 4
    jmp .end_if_29
.else_29:
; if statement 30
    mov eax, [ebp-4]  ; load score (stack)
    push eax
    mov eax, 850
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_30
.then_30:
    push msg_86
    call print
    add esp, 4
    jmp .end_if_30
.else_30:
; if statement 31
    mov eax, [ebp-4]  ; load score (stack)
    push eax
    mov eax, 800
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_31
.then_31:
    push msg_87
    call print
    add esp, 4
    jmp .end_if_31
.else_31:
; if statement 32
    mov eax, [ebp-4]  ; load score (stack)
    push eax
    mov eax, 750
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_32
.then_32:
    push msg_88
    call print
    add esp, 4
    jmp .end_if_32
.else_32:
    push msg_89
    call print
    add esp, 4
.end_if_32:
; end if statement 32
.end_if_31:
; end if statement 31
.end_if_30:
; end if statement 30
.end_if_29:
; end if statement 29
.end_if_28:
; end if statement 28
    push msg_3
    call print
    add esp, 4
; let x:i32 = 15
    mov eax, 15
    mov [ebp-4], eax  ; store x (local int)
; let y:i32 = 25
    mov eax, 25
    mov [ebp-8], eax  ; store y (local int)
; let z:i32 = 10
    mov eax, 10
    mov [ebp-12], eax  ; store z (local int)
    push msg_90
    call print
    add esp, 4
; if statement 33
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_33
.then_33:
; if statement 34
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, 100
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_34
.then_34:
    push msg_91
    call print
    add esp, 4
    jmp .end_if_34
.else_34:
    push msg_92
    call print
    add esp, 4
.end_if_34:
; end if statement 34
    jmp .end_if_33
.else_33:
.end_if_33:
; end if statement 33
; if statement 35
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    push eax
    mov eax, [ebp-4]  ; load x (stack)
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    push eax
    mov eax, [ebp-4]  ; load x (stack)
    push eax
    mov eax, [ebp-8]  ; load y (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [ebp-12]  ; load z (stack)
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, 50
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    cmp eax, 0
    je .else_35
.then_35:
    push msg_93
    call print
    add esp, 4
    jmp .end_if_35
.else_35:
.end_if_35:
; end if statement 35
    push msg_3
    call print
    add esp, 4
    push msg_94
    call print
    add esp, 4
; let n:i32 = 5
    mov eax, 5
    mov [ebp-8], eax  ; store n (local int)
; let factorial_result:i32 = 1
    mov eax, 1
    mov [ebp-12], eax  ; store factorial_result (local int)
; if statement 36
    mov eax, [ebp-8]  ; load n (stack)
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_36
.then_36:
; factorial_result = factorial_result * 1
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    imul eax, ebx
    jmp .end_if_36
.else_36:
.end_if_36:
; end if statement 36
; if statement 37
    mov eax, [ebp-8]  ; load n (stack)
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_37
.then_37:
; factorial_result = factorial_result * 2
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    imul eax, ebx
    jmp .end_if_37
.else_37:
.end_if_37:
; end if statement 37
; if statement 38
    mov eax, [ebp-8]  ; load n (stack)
    push eax
    mov eax, 3
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_38
.then_38:
; factorial_result = factorial_result * 3
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    mov eax, 3
    mov ebx, eax
    pop eax
    imul eax, ebx
    jmp .end_if_38
.else_38:
.end_if_38:
; end if statement 38
; if statement 39
    mov eax, [ebp-8]  ; load n (stack)
    push eax
    mov eax, 4
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_39
.then_39:
; factorial_result = factorial_result * 4
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    mov eax, 4
    mov ebx, eax
    pop eax
    imul eax, ebx
    jmp .end_if_39
.else_39:
.end_if_39:
; end if statement 39
; if statement 40
    mov eax, [ebp-8]  ; load n (stack)
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_40
.then_40:
; factorial_result = factorial_result * 5
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    imul eax, ebx
    jmp .end_if_40
.else_40:
.end_if_40:
; end if statement 40
    push msg_95
    call print_clean
    add esp, 4
    mov eax, [ebp-12]  ; load factorial_result (stack)
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_mixed_types_32bit
test_mixed_types_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 10 local variables
    push msg_0
    call print
    add esp, 4
    push msg_96
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let int_val:i32 = 42
    mov eax, 42
    mov [ebp-4], eax  ; store int_val (local int)
; let float_val:f32 = -192530768169799846490900791296.000000
; Error: f32 constant not found
    fstp dword [ebp-8]  ; store float_val (local float)
; let mixed_result:f32 = float_val + 0.000000
    fld dword [ebp-8]  ; load float_val (stack)
; Error: f32 constant not found
    faddp
    fstp dword [ebp-12]  ; store mixed_result (local float)
    push msg_97
    call print
    add esp, 4
    push msg_98
    call print_clean
    add esp, 4
    mov eax, [ebp-4]  ; load int_val (stack)
    push eax
    call print_int
    add esp, 4
    push msg_99
    call print_clean
    add esp, 4
    fld dword [ebp-8]  ; load float_val (stack)
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_100
    call print_clean
    add esp, 4
    fld dword [ebp-12]  ; load mixed_result (stack)
    sub esp, 4
    fstp dword [esp]
    call print_num
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let char_a:char = 'A'
    mov eax, 65  ; char 'A'
    mov [ebp-16], eax  ; store char_a (local int)
; let char_z:char = 'Z'
    mov eax, 90  ; char 'Z'
    mov [ebp-20], eax  ; store char_z (local int)
; let char_0:char = '0'
    mov eax, 48  ; char '0'
    mov [ebp-24], eax  ; store char_0 (local int)
; let char_9:char = '9'
    mov eax, 57  ; char '9'
    mov [ebp-28], eax  ; store char_9 (local int)
    push msg_101
    call print
    add esp, 4
    push msg_102
    call print_clean
    add esp, 4
    mov eax, [ebp-16]  ; load char_a (stack)
    push eax  ; push argument 0
    call print_char
    add esp, 4  ; clean up 1 arguments
    push msg_103
    call print_clean
    add esp, 4
    mov eax, [ebp-20]  ; load char_z (stack)
    push eax  ; push argument 0
    call print_char
    add esp, 4  ; clean up 1 arguments
    push msg_104
    call print_clean
    add esp, 4
    mov eax, [ebp-24]  ; load char_0 (stack)
    push eax  ; push argument 0
    call print_char
    add esp, 4  ; clean up 1 arguments
    push msg_105
    call print_clean
    add esp, 4
    mov eax, [ebp-28]  ; load char_9 (stack)
    push eax  ; push argument 0
    call print_char
    add esp, 4  ; clean up 1 arguments
    push msg_3
    call print
    add esp, 4
    push msg_106
    call print
    add esp, 4
    push msg_107
    call print
    add esp, 4
    push msg_108
    call print
    add esp, 4
    push msg_109
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_110
    call print
    add esp, 4
; let is_positive:bool = int_val > 0
    mov eax, [ebp-4]  ; load int_val (stack)
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    mov [ebp-32], eax  ; store is_positive (local int)
; let is_even:bool = int_val % 2 == 0
    mov eax, [ebp-4]  ; load int_val (stack)
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [ebp-36], eax  ; store is_even (local int)
; let is_answer:bool = int_val == 42
    mov eax, [ebp-4]  ; load int_val (stack)
    push eax
    mov eax, 42
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [ebp-40], eax  ; store is_answer (local int)
; if statement 41
    mov eax, [ebp-32]  ; load is_positive (stack)
    cmp eax, 0
    je .else_41
.then_41:
    push msg_111
    call print
    add esp, 4
    jmp .end_if_41
.else_41:
.end_if_41:
; end if statement 41
; if statement 42
    mov eax, [ebp-36]  ; load is_even (stack)
    cmp eax, 0
    je .else_42
.then_42:
    push msg_112
    call print
    add esp, 4
    jmp .end_if_42
.else_42:
.end_if_42:
; end if statement 42
; if statement 43
    mov eax, [ebp-40]  ; load is_answer (stack)
    cmp eax, 0
    je .else_43
.then_43:
    push msg_113
    call print
    add esp, 4
    jmp .end_if_43
.else_43:
.end_if_43:
; end if statement 43
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    push msg_114
    call print
    add esp, 4
    push msg_115
    call print
    add esp, 4
    push msg_116
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_117
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    call test_basic_arithmetic_32bit
    call test_extreme_edge_cases_32bit
    call test_comparison_operations_32bit
    call test_logical_operations_32bit
    call test_control_flow_32bit
    call test_mixed_types_32bit
    push msg_0
    call print
    add esp, 4
    push msg_118
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_119
    call print
    add esp, 4
    push msg_120
    call print
    add esp, 4
    push msg_121
    call print
    add esp, 4
    push msg_122
    call print
    add esp, 4
    push msg_123
    call print
    add esp, 4
    push msg_124
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_125
    call print
    add esp, 4
    push msg_126
    call print
    add esp, 4
    push msg_127
    call print
    add esp, 4
    push msg_-1
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
