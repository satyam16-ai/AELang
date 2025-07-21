; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== 64-bit SIGNED INTEGER TESTS (AUTO DATA) ===",10,"",0
msg_1 db "--- i8 Tests (8-bit signed) ---",10,"",0
msg_2 db "i8 min: %d",10,"",0
msg_3 db "i8 max: %d",10,"",0
msg_4 db "",10,"--- i16 Tests (16-bit signed) ---",10,"",0
msg_5 db "i16 min: %d",10,"",0
msg_6 db "i16 max: %d",10,"",0
msg_7 db "",10,"--- i32 Tests (32-bit signed) ---",10,"",0
msg_8 db "i32 min: %d",10,"",0
msg_9 db "i32 max: %d",10,"",0
msg_10 db "",10,"--- i64 Tests (64-bit signed, full precision) ---",10,"",0
msg_11 db "i64 min: %ld",10,"",0
msg_12 db "i64 max: %ld",10,"",0
msg_13 db "i64 large: %ld",10,"",0
msg_14 db "i64 negative large: %ld",10,"",0
msg_15 db "",10,"=== 64-bit UNSIGNED INTEGER TESTS (AUTO DATA) ===",10,"",0
msg_16 db "--- u8 Tests (8-bit unsigned) ---",10,"",0
msg_17 db "u8 min: %u",10,"",0
msg_18 db "u8 max: %u",10,"",0
msg_19 db "",10,"--- u16 Tests (16-bit unsigned) ---",10,"",0
msg_20 db "u16 min: %u",10,"",0
msg_21 db "u16 max: %u",10,"",0
msg_22 db "",10,"--- u32 Tests (32-bit unsigned) ---",10,"",0
msg_23 db "u32 min: %u",10,"",0
msg_24 db "u32 max: %u",10,"",0
msg_25 db "",10,"--- u64 Tests (64-bit unsigned, full precision) ---",10,"",0
msg_26 db "u64 min: %lu",10,"",0
msg_27 db "u64 max: %lu",10,"",0
msg_28 db "u64 large: %lu",10,"",0
msg_29 db "u64 mid-range: %lu",10,"",0
msg_30 db "",10,"=== 64-bit FLOATING POINT TESTS (AUTO DATA) ===",10,"",0
msg_31 db "--- f32 Tests (32-bit float, IEEE 754) ---",10,"",0
msg_32 db "f32 tiny: %f",10,"",0
msg_33 db "f32 huge: %f",10,"",0
msg_34 db "f32 pi: %f",10,"",0
msg_35 db "f32 negative e: %f",10,"",0
msg_36 db "",10,"--- f64 Tests (64-bit double, IEEE 754) ---",10,"",0
msg_37 db "f64 tiny: %f",10,"",0
msg_38 db "f64 huge: %f",10,"",0
msg_39 db "f64 high precision pi: %f",10,"",0
msg_40 db "f64 scientific: %f",10,"",0
msg_41 db "",10,"--- num Tests (flexible numeric type, 64-bit) ---",10,"",0
msg_42 db "num big int: %g",10,"",0
msg_43 db "num precise: %g",10,"",0
msg_44 db "num Avogadro: %g",10,"",0
msg_45 db "",10,"=== 64-bit OTHER TYPE TESTS (AUTO DATA) ===",10,"",0
msg_46 db "--- Boolean Tests ---",10,"",0
msg_47 db "Bool true: %t",10,"",0
msg_48 db "Bool false: %t",10,"",0
msg_49 db "",10,"--- Character Tests ---",10,"",0
msg_50 db "Char letter: %c",10,"",0
msg_51 db "Char digit: %c",10,"",0
msg_52 db "Char symbol: %c",10,"",0
msg_53 db "",10,"=== 64-bit EXTREME EDGE CASE TESTS (AUTO DATA) ===",10,"",0
msg_54 db "--- Maximum Capacity Tests ---",10,"",0
msg_55 db "i64 near max: %ld",10,"",0
msg_56 db "u64 near max: %lu",10,"",0
msg_57 db "",10,"--- Floating Point Edge Cases ---",10,"",0
msg_58 db "f32 micro: %f",10,"",0
msg_59 db "f64 decimals: %f",10,"",0
msg_60 db "f64 negative large: %f",10,"",0
msg_61 db "",10,"--- Architecture Boundary Tests ---",10,"",0
msg_62 db "Boundary cross u64: %lu",10,"",0
msg_63 db "Signed boundary i64: %ld",10,"",0
msg_64 db "",10,"--- Precision Tests ---",10,"",0
msg_65 db "f32 precision: %f",10,"",0
msg_66 db "f64 significant: %f",10,"",0
msg_67 db "",10,"=== 64-bit ARITHMETIC OPERATIONS (AUTO DATA) ===",10,"",0
msg_68 db "--- Basic Arithmetic Tests ---",10,"",0
msg_69 db "i32 arithmetic: %d + %d = %d",10,"",0
msg_70 db "i64 arithmetic: %ld + %ld = %ld",10,"",0
msg_71 db "f32 arithmetic: %f + %f = %f",10,"",0
msg_72 db "f64 arithmetic: %f + %f = %f",10,"",0
msg_73 db "",10,"--- Mixed Type Operations ---",10,"",0
msg_74 db "Mixed i32: %d",10,"",0
msg_75 db "Mixed f64: %f",10,"",0
msg_76 db "Mixed u64: %lu",10,"",0
msg_77 db "╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_78 db "║       ÆLang 64-bit AUTO Comprehensive Test Suite               ║",10,"",0
msg_79 db "║        Testing All Data Types with Automatic Data              ║",10,"",0
msg_80 db "╚══════════════════════════════════════════════════════════════════╝",10,"",10,"",0
msg_81 db "Architecture: 64-bit mode (full precision)",10,"",0
msg_82 db "Testing: All primitive types with automatic extreme values",10,"",0
msg_83 db "Coverage: Maximum ranges, precision limits, boundary conditions",10,"",10,"",0
msg_84 db "",10,"╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_85 db "║                 64-bit AUTO Test Suite Complete                 ║",10,"",0
msg_86 db "║    All data types tested automatically with predefined values   ║",10,"",0
msg_87 db "║          Ready for production deployment verification           ║",10,"",0
msg_88 db "╚══════════════════════════════════════════════════════════════════╝",10,"",0
float_0: dd 0x2edbe6ff  ; 1.00000001e-10
float_1: dd 0x7f7ffffd  ; 3.40282306e+38
float_2: dd 0x40490fdb  ; 3.14159274
float_3: dd 0x402df84d  ; 2.71828008
float_4: dd 0x1fec1e4a  ; 9.99999968e-20
float_5: dd 0x7f800000  ; inf
float_6: dd 0x40490fdb  ; 3.14159274
float_7: dd 0x00000000  ; 0
float_8: dd 0x5368d4a5  ; 9.99999996e+11
float_9: dd 0x402df854  ; 2.71828175
float_10: dd 0x66ff0c2e  ; 6.02214064e+23
float_11: dd 0x3089705f  ; 9.99999972e-10
float_12: dd 0x3dfcd6ea  ; 0.123456791
float_13: dd 0x5368d4a5  ; 9.99999996e+11
float_14: dd 0x4b800000  ; 16777216
float_15: dd 0x56e0910c  ; 1.23456788e+14
float_16: dd 0x40490fd0  ; 3.14159012
float_17: dd 0x402df84d  ; 2.71828008
float_18: dd 0x3f9e0652  ; 1.23456788
float_19: dd 0x411e0652  ; 9.87654305
float_20: dd 0x40490fdb  ; 3.14159274
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
; let i8_min:i8 = <EXPR_UNHANDLED>
    mov rax, 128
    neg rax
    mov byte [rbp-8], al  ; store i8_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_2  ; string arg 0
    movsx rax, byte [rbp-8]  ; load i8_min (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
; let i8_max:i8 = 127
    mov rax, 127
    mov byte [rbp-16], al  ; store i8_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_3  ; string arg 0
    movsx rax, byte [rbp-16]  ; load i8_max (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_4  ; string arg 0
    call print
; let i16_min:i16 = <EXPR_UNHANDLED>
    mov rax, 32768
    neg rax
    mov word [rbp-24], ax  ; store i16_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_5  ; string arg 0
    movsx rax, word [rbp-24]  ; load i16_min (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
; let i16_max:i16 = 32767
    mov rax, 32767
    mov word [rbp-32], ax  ; store i16_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_6  ; string arg 0
    movsx rax, word [rbp-32]  ; load i16_max (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_7  ; string arg 0
    call print
; let i32_min:i32 = <EXPR_UNHANDLED>
    mov rax, -2147483648
    neg rax
    mov dword [rbp-40], eax  ; store i32_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_8  ; string arg 0
    movsx rax, dword [rbp-40]  ; load i32_min (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let i32_max:i32 = 2147483647
    mov rax, 2147483647
    mov dword [rbp-48], eax  ; store i32_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_9  ; string arg 0
    movsx rax, dword [rbp-48]  ; load i32_max (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_10  ; string arg 0
    call print
; let i64_min:i64 = <EXPR_UNHANDLED>
    mov rax, -1
    neg rax
    mov qword [rbp-56], rax  ; store i64_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_11  ; string arg 0
    mov rax, qword [rbp-56]  ; load i64_min (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let i64_max:i64 = -1
    mov rax, -1
    mov qword [rbp-64], rax  ; store i64_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_12  ; string arg 0
    mov rax, qword [rbp-64]  ; load i64_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let i64_large:i64 = -1486618624
    mov rax, -1486618624
    mov qword [rbp-72], rax  ; store i64_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_13  ; string arg 0
    mov rax, qword [rbp-72]  ; load i64_large (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let i64_neg_large:i64 = <EXPR_UNHANDLED>
    mov rax, -1486618624
    neg rax
    mov qword [rbp-80], rax  ; store i64_neg_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_14  ; string arg 0
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
    mov rdi, msg_15  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_16  ; string arg 0
    call print
; let u8_min:u8 = 0
    mov rax, 0
    mov byte [rbp-8], al  ; store u8_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_17  ; string arg 0
    movzx rax, byte [rbp-8]  ; load u8_min (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
; let u8_max:u8 = 255
    mov rax, 255
    mov byte [rbp-16], al  ; store u8_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_18  ; string arg 0
    movzx rax, byte [rbp-16]  ; load u8_max (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_19  ; string arg 0
    call print
; let u16_min:u16 = 0
    mov rax, 0
    mov word [rbp-24], ax  ; store u16_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_20  ; string arg 0
    movzx rax, word [rbp-24]  ; load u16_min (stack, 16-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
; let u16_max:u16 = 65535
    mov rax, 65535
    mov word [rbp-32], ax  ; store u16_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_21  ; string arg 0
    movzx rax, word [rbp-32]  ; load u16_max (stack, 16-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_22  ; string arg 0
    call print
; let u32_min:u32 = 0
    mov rax, 0
    mov dword [rbp-40], eax  ; store u32_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_23  ; string arg 0
    mov eax, dword [rbp-40]  ; load u32_min (stack, zero-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let u32_max:u32 = -1
    mov rax, -1
    mov dword [rbp-48], eax  ; store u32_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_24  ; string arg 0
    mov eax, dword [rbp-48]  ; load u32_max (stack, zero-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_25  ; string arg 0
    call print
; let u64_min:u64 = 0
    mov rax, 0
    mov qword [rbp-56], rax  ; store u64_min (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_26  ; string arg 0
    mov rax, qword [rbp-56]  ; load u64_min (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let u64_max:u64 = -1
    mov rax, -1
    mov qword [rbp-64], rax  ; store u64_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_27  ; string arg 0
    mov rax, qword [rbp-64]  ; load u64_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let u64_large:u64 = -1
    mov rax, -1
    mov qword [rbp-72], rax  ; store u64_large (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_28  ; string arg 0
    mov rax, qword [rbp-72]  ; load u64_large (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let u64_mid:u64 = -1
    mov rax, -1
    mov qword [rbp-80], rax  ; store u64_mid (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_29  ; string arg 0
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
    mov rdi, msg_30  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_31  ; string arg 0
    call print
; let f32_tiny:f32 = -7590716356165632.000000
    fld dword [float_0]
    fstp dword [rbp-8]  ; store f32_tiny (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_32  ; string arg 0
    fld dword [rbp-8]  ; load f32_tiny (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f32_huge:f32 = -0.000000
    fld dword [float_1]
    fstp dword [rbp-16]  ; store f32_huge (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_33  ; string arg 0
    fld dword [rbp-16]  ; load f32_huge (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f32_pi:f32 = 1725132046336.000000
    fld dword [float_2]
    fstp dword [rbp-24]  ; store f32_pi (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_34  ; string arg 0
    fld dword [rbp-24]  ; load f32_pi (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f32_neg_e:f32 = <EXPR_UNHANDLED>
    fld dword [float_3]
    fchs
    fstp dword [rbp-32]  ; store f32_neg_e (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_35  ; string arg 0
    fld dword [rbp-32]  ; load f32_neg_e (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_36  ; string arg 0
    call print
; let f64_tiny:f64 = 6134519808.000000
    fld dword [float_4]
    fstp qword [rbp-40]  ; store f64_tiny (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_37  ; string arg 0
    fld qword [rbp-40]  ; load f64_tiny (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_huge:f64 = -nan
    fld dword [float_5]
    fstp qword [rbp-48]  ; store f64_huge (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_38  ; string arg 0
    fld qword [rbp-48]  ; load f64_huge (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_pi:f64 = 3370280550400.000000
    fld dword [float_2]
    fstp qword [rbp-56]  ; store f64_pi (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_39  ; string arg 0
    fld qword [rbp-56]  ; load f64_pi (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_sci:f64 = 18330840459619643408878403416227840.000000
    fld dword [float_7]
    fstp qword [rbp-64]  ; store f64_sci (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_40  ; string arg 0
    fld qword [rbp-64]  ; load f64_sci (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_41  ; string arg 0
    call print
; let num_big_int:num = 999999999999.000000
    fld dword [float_8]
    fstp qword [rbp-72]  ; store num_big_int (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_42  ; string arg 0
    fld qword [rbp-72]  ; load num_big_int (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let num_precise:num = 2.718282
    fld dword [float_9]
    fstp qword [rbp-80]  ; store num_precise (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_43  ; string arg 0
    fld qword [rbp-80]  ; load num_precise (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let num_avogadro:num = 602214075999999987023872.000000
    fld dword [float_10]
    fstp qword [rbp-88]  ; store num_avogadro (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_44  ; string arg 0
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
    sub rsp, 48  ; allocate space for 5 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_45  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_46  ; string arg 0
    call print
; let bool_true:bool = 1
    mov rax, 1
    mov dword [rbp-8], eax  ; store bool_true (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_47  ; string arg 0
    movsx rax, dword [rbp-8]  ; load bool_true (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let bool_false:bool = 0
    mov rax, 0
    mov dword [rbp-16], eax  ; store bool_false (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_48  ; string arg 0
    movsx rax, dword [rbp-16]  ; load bool_false (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_49  ; string arg 0
    call print
; let char_letter:char = 'Z'
    mov rax, 90  ; char 'Z'
    mov byte [rbp-24], al  ; store char_letter (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_50  ; string arg 0
    movsx rax, byte [rbp-24]  ; load char_letter (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
; let char_digit:char = '9'
    mov rax, 57  ; char '9'
    mov byte [rbp-32], al  ; store char_digit (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_51  ; string arg 0
    movsx rax, byte [rbp-32]  ; load char_digit (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
; let char_symbol:char = '@'
    mov rax, 64  ; char '@'
    mov byte [rbp-40], al  ; store char_symbol (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_52  ; string arg 0
    movsx rax, byte [rbp-40]  ; load char_symbol (stack, 8-bit sign-extended)
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
    mov rdi, msg_53  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_54  ; string arg 0
    call print
; let i64_near_max:i64 = -2
    mov rax, -2
    mov qword [rbp-8], rax  ; store i64_near_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_55  ; string arg 0
    mov rax, qword [rbp-8]  ; load i64_near_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let u64_near_max:u64 = -1
    mov rax, -1
    mov qword [rbp-16], rax  ; store u64_near_max (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_56  ; string arg 0
    mov rax, qword [rbp-16]  ; load u64_near_max (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_57  ; string arg 0
    call print
; let f32_micro:f32 = -3151484703878586403127296.000000
    fld dword [float_11]
    fstp dword [rbp-24]  ; store f32_micro (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_58  ; string arg 0
    fld dword [rbp-24]  ; load f32_micro (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_decimals:f64 = 0.000012
    fld dword [float_12]
    fstp qword [rbp-32]  ; store f64_decimals (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_59  ; string arg 0
    fld qword [rbp-32]  ; load f64_decimals (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_neg_large:f64 = <EXPR_UNHANDLED>
    fld dword [float_8]
    fchs
    fstp qword [rbp-40]  ; store f64_neg_large (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_60  ; string arg 0
    fld qword [rbp-40]  ; load f64_neg_large (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_61  ; string arg 0
    call print
; let boundary_cross:u64 = 0
    mov rax, 0
    mov qword [rbp-48], rax  ; store boundary_cross (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_62  ; string arg 0
    mov rax, qword [rbp-48]  ; load boundary_cross (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
; let signed_boundary:i64 = <EXPR_UNHANDLED>
    mov rax, -2147483647
    neg rax
    mov qword [rbp-56], rax  ; store signed_boundary (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_63  ; string arg 0
    mov rax, qword [rbp-56]  ; load signed_boundary (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_64  ; string arg 0
    call print
; let f32_precision:f32 = 0.000000
    fld dword [float_14]
    fstp dword [rbp-64]  ; store f32_precision (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_65  ; string arg 0
    fld dword [rbp-64]  ; load f32_precision (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
; let f64_sig_digits:f64 = -0.000000
    fld dword [float_15]
    fstp qword [rbp-72]  ; store f64_sig_digits (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_66  ; string arg 0
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
; CODEGEN TEST MARKER: emitting function test_arithmetic_operations_64bit
test_arithmetic_operations_64bit:
    push rbp
    mov rbp, rsp
    sub rsp, 128  ; allocate space for 15 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_67  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_68  ; string arg 0
    call print
; let a:i32 = 1000
    mov rax, 1000
    mov dword [rbp-8], eax  ; store a (local int)
; let b:i32 = 2000
    mov rax, 2000
    mov dword [rbp-16], eax  ; store b (local int)
; let sum:i32 = a + b
    movsx rax, dword [rbp-8]  ; load a (stack, sign-extended to 64-bit)
    push rax
    movsx rax, dword [rbp-16]  ; load b (stack, sign-extended to 64-bit)
    mov rbx, rax
    pop rax
    add rax, rbx
    mov dword [rbp-24], eax  ; store sum (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_69  ; string arg 0
    movsx rax, dword [rbp-8]  ; load a (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    movsx rax, dword [rbp-16]  ; load b (stack, sign-extended to 64-bit)
    mov rdx, rax  ; int arg 2
    movsx rax, dword [rbp-24]  ; load sum (stack, sign-extended to 64-bit)
    mov rcx, rax  ; int arg 3
    call print
; let x:i64 = 705032704
    mov rax, 705032704
    mov qword [rbp-32], rax  ; store x (local int)
; let y:i64 = -1294967296
    mov rax, -1294967296
    mov qword [rbp-40], rax  ; store y (local int)
; let sum64:i64 = x + y
    mov rax, qword [rbp-32]  ; load x (stack, 64-bit)
    push rax
    mov rax, qword [rbp-40]  ; load y (stack, 64-bit)
    mov rbx, rax
    pop rax
    add rax, rbx
    mov qword [rbp-48], rax  ; store sum64 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_70  ; string arg 0
    mov rax, qword [rbp-32]  ; load x (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    mov rax, qword [rbp-40]  ; load y (stack, 64-bit)
    mov rdx, rax  ; int arg 2
    mov rax, qword [rbp-48]  ; load sum64 (stack, 64-bit)
    mov rcx, rax  ; int arg 3
    call print
; let p:f32 = -192530768169799846490900791296.000000
    fld dword [float_16]
    fstp dword [rbp-56]  ; store p (local float)
; let q:f32 = -0.000000
    fld dword [float_3]
    fstp dword [rbp-64]  ; store q (local float)
; let float_sum:f32 = p + q
    fld dword [rbp-56]  ; load p (stack, f32/float)
    fld dword [rbp-64]  ; load q (stack, f32/float)
    faddp
    fstp dword [rbp-72]  ; store float_sum (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_71  ; string arg 0
    fld dword [rbp-56]  ; load p (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    fld dword [rbp-64]  ; load q (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm1, [rsp]  ; double arg 2 (promoted)
    add rsp, 8
    mov al, 2  ; update float reg count
    fld dword [rbp-72]  ; load float_sum (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm2, [rsp]  ; double arg 3 (promoted)
    add rsp, 8
    mov al, 3  ; update float reg count
    call print
; let m:f64 = 70.175514
    fld dword [float_18]
    fstp qword [rbp-80]  ; store m (local float)
; let n:f64 = 4654.258301
    fld dword [float_19]
    fstp qword [rbp-88]  ; store n (local float)
; let double_sum:f64 = m + n
    fld qword [rbp-80]  ; load m (stack, f64/double)
    fld qword [rbp-88]  ; load n (stack, f64/double)
    faddp
    fstp qword [rbp-96]  ; store double_sum (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_72  ; string arg 0
    fld qword [rbp-80]  ; load m (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    fld qword [rbp-88]  ; load n (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm1, [rsp]  ; double arg 2 (promoted)
    add rsp, 8
    mov al, 2  ; update float reg count
    fld qword [rbp-96]  ; load double_sum (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm2, [rsp]  ; double arg 3 (promoted)
    add rsp, 8
    mov al, 3  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_73  ; string arg 0
    call print
; let mix_i32:i32 = 42
    mov rax, 42
    mov dword [rbp-104], eax  ; store mix_i32 (local int)
; let mix_f64:f64 = 3370402709504.000000
    fld dword [float_2]
    fstp qword [rbp-112]  ; store mix_f64 (local float)
; let mix_u64:u64 = -1
    mov rax, -1
    mov qword [rbp-120], rax  ; store mix_u64 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_74  ; string arg 0
    movsx rax, dword [rbp-104]  ; load mix_i32 (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_75  ; string arg 0
    fld qword [rbp-112]  ; load mix_f64 (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_76  ; string arg 0
    mov rax, qword [rbp-120]  ; load mix_u64 (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push rbp
    mov rbp, rsp
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_77  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_78  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_79  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_80  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_81  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_82  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_83  ; string arg 0
    call print
    call test_signed_integers_64bit
    call test_unsigned_integers_64bit
    call test_floating_point_64bit
    call test_other_types_64bit
    call test_extreme_edge_cases_64bit
    call test_arithmetic_operations_64bit
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_84  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_85  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_86  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_87  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_88  ; string arg 0
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
