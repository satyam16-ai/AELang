; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== 64-bit SIGNED INTEGER TESTS ===",10,"",0
msg_1 db "--- i8 Tests (8-bit signed) ---",10,"",0
msg_2 db "Enter i8 minimum (-128): ",0
msg_3 db "i8 min: %d",10,"",0
msg_4 db "Enter i8 maximum (127): ",0
msg_5 db "i8 max: %d",10,"",0
msg_6 db "",10,"--- i16 Tests (16-bit signed) ---",10,"",0
msg_7 db "Enter i16 minimum (-32768): ",0
msg_8 db "i16 min: %d",10,"",0
msg_9 db "Enter i16 maximum (32767): ",0
msg_10 db "i16 max: %d",10,"",0
msg_11 db "",10,"--- i32 Tests (32-bit signed) ---",10,"",0
msg_12 db "Enter i32 minimum (-2147483648): ",0
msg_13 db "i32 min: %d",10,"",0
msg_14 db "Enter i32 maximum (2147483647): ",0
msg_15 db "i32 max: %d",10,"",0
msg_16 db "",10,"--- i64 Tests (64-bit signed, full precision) ---",10,"",0
msg_17 db "Enter i64 minimum (-9223372036854775808): ",0
msg_18 db "i64 min: %ld",10,"",0
msg_19 db "Enter i64 maximum (9223372036854775807): ",0
msg_20 db "i64 max: %ld",10,"",0
msg_21 db "Enter large i64 (1000000000000000000): ",0
msg_22 db "i64 large: %ld",10,"",0
msg_23 db "Enter negative i64 (-1000000000000000000): ",0
msg_24 db "i64 negative large: %ld",10,"",0
msg_25 db "",10,"=== 64-bit UNSIGNED INTEGER TESTS ===",10,"",0
msg_26 db "--- u8 Tests (8-bit unsigned) ---",10,"",0
msg_27 db "Enter u8 minimum (0): ",0
msg_28 db "u8 min: %u",10,"",0
msg_29 db "Enter u8 maximum (255): ",0
msg_30 db "u8 max: %u",10,"",0
msg_31 db "",10,"--- u16 Tests (16-bit unsigned) ---",10,"",0
msg_32 db "Enter u16 minimum (0): ",0
msg_33 db "u16 min: %u",10,"",0
msg_34 db "Enter u16 maximum (65535): ",0
msg_35 db "u16 max: %u",10,"",0
msg_36 db "",10,"--- u32 Tests (32-bit unsigned) ---",10,"",0
msg_37 db "Enter u32 minimum (0): ",0
msg_38 db "u32 min: %u",10,"",0
msg_39 db "Enter u32 maximum (4294967295): ",0
msg_40 db "u32 max: %u",10,"",0
msg_41 db "",10,"--- u64 Tests (64-bit unsigned, full precision) ---",10,"",0
msg_42 db "Enter u64 minimum (0): ",0
msg_43 db "u64 min: %lu",10,"",0
msg_44 db "Enter u64 maximum (18446744073709551615): ",0
msg_45 db "u64 max: %lu",10,"",0
msg_46 db "Enter large u64 (10000000000000000000): ",0
msg_47 db "u64 large: %lu",10,"",0
msg_48 db "Enter mid-range u64 (9876543210123456789): ",0
msg_49 db "u64 mid-range: %lu",10,"",0
msg_50 db "",10,"=== 64-bit FLOATING POINT TESTS ===",10,"",0
msg_51 db "--- f32 Tests (32-bit float, IEEE 754) ---",10,"",0
msg_52 db "Enter f32 very small (1.175494e-38): ",0
msg_53 db "f32 tiny: %f",10,"",0
msg_54 db "Enter f32 very large (3.402823e+38): ",0
msg_55 db "f32 huge: %f",10,"",0
msg_56 db "Enter f32 precise (3.14159265): ",0
msg_57 db "f32 pi: %f",10,"",0
msg_58 db "Enter f32 negative (-2.71828): ",0
msg_59 db "f32 negative e: %f",10,"",0
msg_60 db "",10,"--- f64 Tests (64-bit double, IEEE 754) ---",10,"",0
msg_61 db "Enter f64 very small (2.2250738585072014e-308): ",0
msg_62 db "f64 tiny: %f",10,"",0
msg_63 db "Enter f64 very large (1.7976931348623157e+308): ",0
msg_64 db "f64 huge: %f",10,"",0
msg_65 db "Enter f64 high precision (3.141592653589793238): ",0
msg_66 db "f64 high precision pi: %f",10,"",0
msg_67 db "Enter f64 scientific notation (1.23456789e-100): ",0
msg_68 db "f64 scientific: %f",10,"",0
msg_69 db "",10,"--- num Tests (flexible numeric type, 64-bit) ---",10,"",0
msg_70 db "Enter num as large integer (999999999999): ",0
msg_71 db "num big int: %g",10,"",0
msg_72 db "Enter num as precise float (2.718281828459045): ",0
msg_73 db "num precise: %g",10,"",0
msg_74 db "Enter num in scientific notation (6.02214076e+23): ",0
msg_75 db "num Avogadro: %g",10,"",0
msg_76 db "",10,"=== 64-bit OTHER TYPE TESTS ===",10,"",0
msg_77 db "--- Boolean Tests ---",10,"",0
msg_78 db "Enter true: ",0
msg_79 db "Bool true: %t",10,"",0
msg_80 db "Enter false: ",0
msg_81 db "Bool false: %t",10,"",0
msg_82 db "Enter TRUE (uppercase): ",0
msg_83 db "Bool uppercase: %t",10,"",0
msg_84 db "Enter False (mixed case): ",0
msg_85 db "Bool mixed case: %t",10,"",0
msg_86 db "",10,"--- Character Tests ---",10,"",0
msg_87 db "Enter ASCII letter (Z): ",0
msg_88 db "Char letter: %c",10,"",0
msg_89 db "Enter ASCII digit (9): ",0
msg_90 db "Char digit: %c",10,"",0
msg_91 db "Enter ASCII symbol (@): ",0
msg_92 db "Char symbol: %c",10,"",0
msg_93 db "Enter ASCII control char (tab): ",0
msg_94 db "Char tab: '%c'",10,"",0
msg_95 db "",10,"=== 64-bit EXTREME EDGE CASE TESTS ===",10,"",0
msg_96 db "--- Maximum Capacity Tests ---",10,"",0
msg_97 db "Enter i64 near max (9223372036854775806): ",0
msg_98 db "i64 near max: %ld",10,"",0
msg_99 db "Enter u64 near max (18446744073709551614): ",0
msg_100 db "u64 near max: %lu",10,"",0
msg_101 db "",10,"--- Floating Point Edge Cases ---",10,"",0
msg_102 db "Enter very small f32 (0.000000001): ",0
msg_103 db "f32 micro: %f",10,"",0
msg_104 db "Enter f64 with many decimals (0.123456789012345): ",0
msg_105 db "f64 decimals: %f",10,"",0
msg_106 db "Enter negative f64 (-999999999999.999999): ",0
msg_107 db "f64 negative large: %f",10,"",0
msg_108 db "",10,"--- Architecture Boundary Tests ---",10,"",0
msg_109 db "Enter value crossing 32-bit boundary (4294967296): ",0
msg_110 db "Boundary cross u64: %lu",10,"",0
msg_111 db "Enter signed boundary cross (-2147483649): ",0
msg_112 db "Signed boundary i64: %ld",10,"",0
msg_113 db "",10,"--- Precision Tests ---",10,"",0
msg_114 db "Enter f32 precision limit (16777216.0): ",0
msg_115 db "f32 precision: %f",10,"",0
msg_116 db "Enter f64 with 15 significant digits: ",0
msg_117 db "f64 significant: %f",10,"",0
msg_118 db "",10,"=== 64-bit MIXED OPERATION TESTS ===",10,"",0
msg_119 db "--- Type Mixing Tests ---",10,"",0
msg_120 db "Enter i32 for mixing test: ",0
msg_121 db "Mixed i32: %d",10,"",0
msg_122 db "Enter f64 for mixing test: ",0
msg_123 db "Mixed f64: %f",10,"",0
msg_124 db "Enter u64 for mixing test: ",0
msg_125 db "Mixed u64: %lu",10,"",0
msg_126 db "",10,"--- Sequential Read Tests ---",10,"",0
msg_127 db "Enter 5 consecutive i16 values:",10,"",0
msg_128 db "Sequential i16 values: %d, %d, %d, %d, %d",10,"",0
msg_129 db "",10,"--- Alternating Type Read Tests ---",10,"",0
msg_130 db "Enter alternating types (u8, f32, bool):",10,"",0
msg_131 db "Alternating: u8=%u, f32=%f, bool=%t",10,"",0
msg_132 db "╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_133 db "║              ÆLang 64-bit Comprehensive Test Suite              ║",10,"",0
msg_134 db "║        Testing All Data Types with Full Precision              ║",10,"",0
msg_135 db "╚══════════════════════════════════════════════════════════════════╝",10,"",10,"",0
msg_136 db "Architecture: 64-bit mode (full precision)",10,"",0
msg_137 db "Testing: All primitive types with extreme and edge case values",10,"",0
msg_138 db "Coverage: Maximum ranges, precision limits, boundary conditions",10,"",10,"",0
msg_139 db "",10,"╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_140 db "║                    64-bit Test Suite Complete                   ║",10,"",0
msg_141 db "║     All data types tested with full precision and edge cases    ║",10,"",0
msg_142 db "║          Ready for production deployment verification           ║",10,"",0
msg_143 db "╚══════════════════════════════════════════════════════════════════╝",10,"",0
fmt_float: db "%f", 10, 0

section .bss
    align 8
    temp_int: resq 1  ; temporary for int to float conversion

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
    extern read_i8
    extern read_i16
    extern read_i32
    extern read_i64
    extern read_u8
    extern read_u16
    extern read_u32
    extern read_u64
    extern read_f32
    extern read_f64
    extern read_bool
    extern read_char
    extern read_str

extern print
extern read
; CODEGEN TEST MARKER: emitting function test_signed_integers_64bit
test_signed_integers_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 80  ; allocate space for 10 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_0  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_1  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_2  ; string arg 0
    call print
; let i8_min:i8 = read()
    ; Universal read() -> read_i8() for type i8 (64-bit)
    call read_i8
    mov byte [rbp-8], al  ; store i8_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_3  ; string arg 0
    movsx rax, byte [rbp-8]  ; load i8_min (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_4  ; string arg 0
    call print
; let i8_max:i8 = read()
    ; Universal read() -> read_i8() for type i8 (64-bit)
    call read_i8
    mov byte [rbp-16], al  ; store i8_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_5  ; string arg 0
    movsx rax, byte [rbp-16]  ; load i8_max (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_6  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_7  ; string arg 0
    call print
; let i16_min:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-24], ax  ; store i16_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_8  ; string arg 0
    movsx rax, word [rbp-24]  ; load i16_min (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_9  ; string arg 0
    call print
; let i16_max:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-32], ax  ; store i16_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_10  ; string arg 0
    movsx rax, word [rbp-32]  ; load i16_max (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_11  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_12  ; string arg 0
    call print
; let i32_min:i32 = read()
    ; Universal read() -> read_i32() for type i32 (64-bit)
    call read_i32
    mov dword [rbp-40], eax  ; store i32_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_13  ; string arg 0
    movsx rax, dword [rbp-40]  ; load i32_min (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_14  ; string arg 0
    call print
; let i32_max:i32 = read()
    ; Universal read() -> read_i32() for type i32 (64-bit)
    call read_i32
    mov dword [rbp-48], eax  ; store i32_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_15  ; string arg 0
    movsx rax, dword [rbp-48]  ; load i32_max (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_16  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_17  ; string arg 0
    call print
; let i64_min:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-56], rax  ; store i64_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_18  ; string arg 0
    mov rax, qword [rbp-56]  ; load i64_min (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_19  ; string arg 0
    call print
; let i64_max:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-64], rax  ; store i64_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_20  ; string arg 0
    mov rax, qword [rbp-64]  ; load i64_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_21  ; string arg 0
    call print
; let i64_large:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-72], rax  ; store i64_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_22  ; string arg 0
    mov rax, qword [rbp-72]  ; load i64_large (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_23  ; string arg 0
    call print
; let i64_neg_large:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-80], rax  ; store i64_neg_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_24  ; string arg 0
    mov rax, qword [rbp-80]  ; load i64_neg_large (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function test_unsigned_integers_64bit
test_unsigned_integers_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 80  ; allocate space for 10 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_25  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_26  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_27  ; string arg 0
    call print
; let u8_min:u8 = read()
    ; Universal read() -> read_u8() for type u8 (64-bit)
    call read_u8
    mov byte [rbp-8], al  ; store u8_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_28  ; string arg 0
    movzx rax, byte [rbp-8]  ; load u8_min (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_29  ; string arg 0
    call print
; let u8_max:u8 = read()
    ; Universal read() -> read_u8() for type u8 (64-bit)
    call read_u8
    mov byte [rbp-16], al  ; store u8_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_30  ; string arg 0
    movzx rax, byte [rbp-16]  ; load u8_max (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_31  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_32  ; string arg 0
    call print
; let u16_min:u16 = read()
    ; Universal read() -> read_u16() for type u16 (64-bit)
    call read_u16
    mov word [rbp-24], ax  ; store u16_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_33  ; string arg 0
    movzx rax, word [rbp-24]  ; load u16_min (stack, 16-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_34  ; string arg 0
    call print
; let u16_max:u16 = read()
    ; Universal read() -> read_u16() for type u16 (64-bit)
    call read_u16
    mov word [rbp-32], ax  ; store u16_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_35  ; string arg 0
    movzx rax, word [rbp-32]  ; load u16_max (stack, 16-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_36  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_37  ; string arg 0
    call print
; let u32_min:u32 = read()
    ; Universal read() -> read_u32() for type u32 (64-bit)
    call read_u32
    mov dword [rbp-40], eax  ; store u32_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_38  ; string arg 0
    mov eax, dword [rbp-40]  ; load u32_min (stack, zero-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_39  ; string arg 0
    call print
; let u32_max:u32 = read()
    ; Universal read() -> read_u32() for type u32 (64-bit)
    call read_u32
    mov dword [rbp-48], eax  ; store u32_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_40  ; string arg 0
    mov eax, dword [rbp-48]  ; load u32_max (stack, zero-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_41  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_42  ; string arg 0
    call print
; let u64_min:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-56], rax  ; store u64_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_43  ; string arg 0
    mov rax, qword [rbp-56]  ; load u64_min (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_44  ; string arg 0
    call print
; let u64_max:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-64], rax  ; store u64_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_45  ; string arg 0
    mov rax, qword [rbp-64]  ; load u64_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_46  ; string arg 0
    call print
; let u64_large:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-72], rax  ; store u64_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_47  ; string arg 0
    mov rax, qword [rbp-72]  ; load u64_large (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_48  ; string arg 0
    call print
; let u64_mid:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-80], rax  ; store u64_mid (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_49  ; string arg 0
    mov rax, qword [rbp-80]  ; load u64_mid (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function test_floating_point_64bit
test_floating_point_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 96  ; allocate space for 11 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_50  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_51  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_52  ; string arg 0
    call print
; let f32_tiny:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-8]  ; store f32_tiny (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_53  ; string arg 0
    fld dword [rbp-8]  ; load f32_tiny (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_54  ; string arg 0
    call print
; let f32_huge:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-16]  ; store f32_huge (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_55  ; string arg 0
    fld dword [rbp-16]  ; load f32_huge (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_56  ; string arg 0
    call print
; let f32_pi:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-24]  ; store f32_pi (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_57  ; string arg 0
    fld dword [rbp-24]  ; load f32_pi (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_58  ; string arg 0
    call print
; let f32_neg_e:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-32]  ; store f32_neg_e (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_59  ; string arg 0
    fld dword [rbp-32]  ; load f32_neg_e (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_60  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_61  ; string arg 0
    call print
; let f64_tiny:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-40]  ; store f64_tiny (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_62  ; string arg 0
    fld qword [rbp-40]  ; load f64_tiny (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_63  ; string arg 0
    call print
; let f64_huge:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-48]  ; store f64_huge (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_64  ; string arg 0
    fld qword [rbp-48]  ; load f64_huge (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_65  ; string arg 0
    call print
; let f64_pi:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-56]  ; store f64_pi (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_66  ; string arg 0
    fld qword [rbp-56]  ; load f64_pi (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_67  ; string arg 0
    call print
; let f64_sci:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-64]  ; store f64_sci (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_68  ; string arg 0
    fld qword [rbp-64]  ; load f64_sci (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_69  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_70  ; string arg 0
    call print
; let num_big_int:num = read()
    ; Universal read() -> read_num() for type num (64-bit)
    call read_num
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-72]  ; store num_big_int (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_71  ; string arg 0
    fld qword [rbp-72]  ; load num_big_int (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_72  ; string arg 0
    call print
; let num_precise:num = read()
    ; Universal read() -> read_num() for type num (64-bit)
    call read_num
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-80]  ; store num_precise (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_73  ; string arg 0
    fld qword [rbp-80]  ; load num_precise (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_74  ; string arg 0
    call print
; let num_avogadro:num = read()
    ; Universal read() -> read_num() for type num (64-bit)
    call read_num
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-88]  ; store num_avogadro (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_75  ; string arg 0
    fld qword [rbp-88]  ; load num_avogadro (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function test_other_types_64bit
test_other_types_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 64  ; allocate space for 8 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_76  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_77  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_78  ; string arg 0
    call print
; let bool_true:bool = read()
    ; Universal read() -> read_bool() for type bool (64-bit)
    call read_bool
    mov dword [rbp-8], eax  ; store bool_true (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_79  ; string arg 0
    movsx rax, dword [rbp-8]  ; load bool_true (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_80  ; string arg 0
    call print
; let bool_false:bool = read()
    ; Universal read() -> read_bool() for type bool (64-bit)
    call read_bool
    mov dword [rbp-16], eax  ; store bool_false (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_81  ; string arg 0
    movsx rax, dword [rbp-16]  ; load bool_false (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_82  ; string arg 0
    call print
; let bool_upper:bool = read()
    ; Universal read() -> read_bool() for type bool (64-bit)
    call read_bool
    mov dword [rbp-24], eax  ; store bool_upper (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_83  ; string arg 0
    movsx rax, dword [rbp-24]  ; load bool_upper (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_84  ; string arg 0
    call print
; let bool_mixed:bool = read()
    ; Universal read() -> read_bool() for type bool (64-bit)
    call read_bool
    mov dword [rbp-32], eax  ; store bool_mixed (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_85  ; string arg 0
    movsx rax, dword [rbp-32]  ; load bool_mixed (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_86  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_87  ; string arg 0
    call print
; let char_letter:char = read()
    ; Universal read() -> read_char() for type char (64-bit)
    call read_char
    mov byte [rbp-40], al  ; store char_letter (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_88  ; string arg 0
    movsx rax, byte [rbp-40]  ; load char_letter (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_89  ; string arg 0
    call print
; let char_digit:char = read()
    ; Universal read() -> read_char() for type char (64-bit)
    call read_char
    mov byte [rbp-48], al  ; store char_digit (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_90  ; string arg 0
    movsx rax, byte [rbp-48]  ; load char_digit (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_91  ; string arg 0
    call print
; let char_symbol:char = read()
    ; Universal read() -> read_char() for type char (64-bit)
    call read_char
    mov byte [rbp-56], al  ; store char_symbol (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_92  ; string arg 0
    movsx rax, byte [rbp-56]  ; load char_symbol (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_93  ; string arg 0
    call print
; let char_tab:char = read()
    ; Universal read() -> read_char() for type char (64-bit)
    call read_char
    mov byte [rbp-64], al  ; store char_tab (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_94  ; string arg 0
    movsx rax, byte [rbp-64]  ; load char_tab (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function test_extreme_edge_cases_64bit
test_extreme_edge_cases_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 80  ; allocate space for 9 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_95  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_96  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_97  ; string arg 0
    call print
; let i64_near_max:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-8], rax  ; store i64_near_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_98  ; string arg 0
    mov rax, qword [rbp-8]  ; load i64_near_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_99  ; string arg 0
    call print
; let u64_near_max:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-16], rax  ; store u64_near_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_100  ; string arg 0
    mov rax, qword [rbp-16]  ; load u64_near_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_101  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_102  ; string arg 0
    call print
; let f32_micro:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-24]  ; store f32_micro (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_103  ; string arg 0
    fld dword [rbp-24]  ; load f32_micro (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_104  ; string arg 0
    call print
; let f64_decimals:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-32]  ; store f64_decimals (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_105  ; string arg 0
    fld qword [rbp-32]  ; load f64_decimals (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_106  ; string arg 0
    call print
; let f64_neg_large:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-40]  ; store f64_neg_large (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_107  ; string arg 0
    fld qword [rbp-40]  ; load f64_neg_large (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_108  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_109  ; string arg 0
    call print
; let boundary_cross:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-48], rax  ; store boundary_cross (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_110  ; string arg 0
    mov rax, qword [rbp-48]  ; load boundary_cross (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_111  ; string arg 0
    call print
; let signed_boundary:i64 = read()
    ; Universal read() -> read_i64() for type i64 (64-bit)
    call read_i64
    mov qword [rbp-56], rax  ; store signed_boundary (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_112  ; string arg 0
    mov rax, qword [rbp-56]  ; load signed_boundary (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_113  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_114  ; string arg 0
    call print
; let f32_precision:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-64]  ; store f32_precision (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_115  ; string arg 0
    fld dword [rbp-64]  ; load f32_precision (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_116  ; string arg 0
    call print
; let f64_sig_digits:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-72]  ; store f64_sig_digits (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_117  ; string arg 0
    fld qword [rbp-72]  ; load f64_sig_digits (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function test_mixed_operations_64bit
test_mixed_operations_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 96  ; allocate space for 11 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_118  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_119  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_120  ; string arg 0
    call print
; let mix_i32:i32 = read()
    ; Universal read() -> read_i32() for type i32 (64-bit)
    call read_i32
    mov dword [rbp-8], eax  ; store mix_i32 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_121  ; string arg 0
    movsx rax, dword [rbp-8]  ; load mix_i32 (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_122  ; string arg 0
    call print
; let mix_f64:f64 = read()
    ; Universal read() -> read_f64() for type f64 (64-bit)
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-16]  ; store mix_f64 (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_123  ; string arg 0
    fld qword [rbp-16]  ; load mix_f64 (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_124  ; string arg 0
    call print
; let mix_u64:u64 = read()
    ; Universal read() -> read_u64() for type u64 (64-bit)
    call read_u64
    mov qword [rbp-24], rax  ; store mix_u64 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_125  ; string arg 0
    mov rax, qword [rbp-24]  ; load mix_u64 (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_126  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_127  ; string arg 0
    call print
; let seq1:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-32], ax  ; store seq1 (local int)
; let seq2:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-40], ax  ; store seq2 (local int)
; let seq3:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-48], ax  ; store seq3 (local int)
; let seq4:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-56], ax  ; store seq4 (local int)
; let seq5:i16 = read()
    ; Universal read() -> read_i16() for type i16 (64-bit)
    call read_i16
    mov word [rbp-64], ax  ; store seq5 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_128  ; string arg 0
    movsx rax, word [rbp-32]  ; load seq1 (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    movsx rax, word [rbp-40]  ; load seq2 (stack, 16-bit sign-extended)
    mov rdx, rax  ; int arg 2
    movsx rax, word [rbp-48]  ; load seq3 (stack, 16-bit sign-extended)
    mov rcx, rax  ; int arg 3
    movsx rax, word [rbp-56]  ; load seq4 (stack, 16-bit sign-extended)
    mov r8, rax  ; int arg 4
    movsx rax, word [rbp-64]  ; load seq5 (stack, 16-bit sign-extended)
    mov r9, rax  ; int arg 5
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_129  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_130  ; string arg 0
    call print
; let alt_u8:u8 = read()
    ; Universal read() -> read_u8() for type u8 (64-bit)
    call read_u8
    mov byte [rbp-72], al  ; store alt_u8 (local int)
; let alt_f32:f32 = read()
    ; Universal read() -> read_f32() for type f32 (64-bit)
    call read_f32
    sub rsp, 8
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 8
    fstp dword [rbp-80]  ; store alt_f32 (local float)
; let alt_bool:bool = read()
    ; Universal read() -> read_bool() for type bool (64-bit)
    call read_bool
    mov dword [rbp-88], eax  ; store alt_bool (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_131  ; string arg 0
    movzx rax, byte [rbp-72]  ; load alt_u8 (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    fld dword [rbp-80]  ; load alt_f32 (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 2 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    movsx rax, dword [rbp-88]  ; load alt_bool (stack, sign-extended to 64-bit)
    mov rdx, rax  ; int arg 3
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push rbp
    mov rbp, rsp
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_132  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_133  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_134  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_135  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_136  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_137  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_138  ; string arg 0
    call print
    call test_signed_integers_64bit
    call test_unsigned_integers_64bit
    call test_floating_point_64bit
    call test_other_types_64bit
    call test_extreme_edge_cases_64bit
    call test_mixed_operations_64bit
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_139  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_140  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_141  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_142  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_143  ; string arg 0
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
