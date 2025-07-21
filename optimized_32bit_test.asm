; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== 32-bit SIGNED INTEGER TESTS ===",10,"",0
msg_1 db "--- i8 Tests (8-bit signed) ---",10,"",0
msg_2 db "i8 min: %d",10,"",0
msg_3 db "i8 max: %d",10,"",0
msg_4 db "",10,"--- i16 Tests (16-bit signed) ---",10,"",0
msg_5 db "i16 min: %d",10,"",0
msg_6 db "i16 max: %d",10,"",0
msg_7 db "",10,"--- i32 Tests (32-bit signed, primary type) ---",10,"",0
msg_8 db "i32 min: %d",10,"",0
msg_9 db "i32 max: %d",10,"",0
msg_10 db "i32 large: %d",10,"",0
msg_11 db "i32 negative large: %d",10,"",0
msg_12 db "",10,"=== 32-bit UNSIGNED INTEGER TESTS ===",10,"",0
msg_13 db "--- u8 Tests (8-bit unsigned) ---",10,"",0
msg_14 db "u8 min: %u",10,"",0
msg_15 db "u8 max: %u",10,"",0
msg_16 db "",10,"--- u16 Tests (16-bit unsigned) ---",10,"",0
msg_17 db "u16 min: %u",10,"",0
msg_18 db "u16 max: %u",10,"",0
msg_19 db "",10,"--- u32 Tests (32-bit unsigned, primary type) ---",10,"",0
msg_20 db "u32 min: %u",10,"",0
msg_21 db "u32 max: %u",10,"",0
msg_22 db "u32 large: %u",10,"",0
msg_23 db "u32 mid-range: %u",10,"",0
msg_24 db "",10,"=== 32-bit FLOATING POINT TESTS ===",10,"",0
msg_25 db "--- f32 Tests (32-bit float, IEEE 754 - primary for 32-bit) ---",10,"",0
msg_26 db "f32 tiny: %f",10,"",0
msg_27 db "f32 huge: %f",10,"",0
msg_28 db "f32 pi: %f",10,"",0
msg_29 db "f32 negative e: %f",10,"",0
msg_30 db "f32 precision limit: %f",10,"",0
msg_31 db "",10,"--- Additional f32 Edge Cases ---",10,"",0
msg_32 db "f32 micro: %f",10,"",0
msg_33 db "f32 medium precision: %f",10,"",0
msg_34 db "f32 negative large: %f",10,"",0
msg_35 db "f32 scientific: %f",10,"",0
msg_36 db "",10,"--- f32 Precision Tests ---",10,"",0
msg_37 db "f32 small step: %f",10,"",0
msg_38 db "f32 clean decimal: %f",10,"",0
msg_39 db "f32 repeating decimal: %f",10,"",0
msg_40 db "",10,"=== 32-bit OTHER TYPE TESTS ===",10,"",0
msg_41 db "--- Boolean Tests ---",10,"",0
msg_42 db "Bool true: %t",10,"",0
msg_43 db "Bool false: %t",10,"",0
msg_44 db "",10,"--- Character Tests ---",10,"",0
msg_45 db "Char letter: %c",10,"",0
msg_46 db "Char digit: %c",10,"",0
msg_47 db "Char symbol: %c",10,"",0
msg_48 db "Char space: '%c'",10,"",0
msg_49 db "",10,"--- num Tests (32-bit optimized) ---",10,"",0
msg_50 db "num as int: %g",10,"",0
msg_51 db "num as float: %g",10,"",0
msg_52 db "num scientific: %g",10,"",0
msg_53 db "",10,"=== 32-bit EDGE CASE TESTS ===",10,"",0
msg_54 db "--- 32-bit Boundary Tests ---",10,"",0
msg_55 db "i32 near max: %d",10,"",0
msg_56 db "u32 near max: %u",10,"",0
msg_57 db "",10,"--- f32 Floating Point Edge Cases ---",10,"",0
msg_58 db "f32 edge precision: %f",10,"",0
msg_59 db "f32 very small: %f",10,"",0
msg_60 db "f32 large: %f",10,"",0
msg_61 db "",10,"--- f32 Precision Limits ---",10,"",0
msg_62 db "f32 clean fraction: %f",10,"",0
msg_63 db "f32 precision test: %f",10,"",0
msg_64 db "f32 precision limit+1: %f",10,"",0
msg_65 db "",10,"--- Type Conversion Edge Cases ---",10,"",0
msg_66 db "Mixed calculation: %d",10,"",0
msg_67 db "u16 at limit: %u",10,"",0
msg_68 db "",10,"=== 32-bit MIXED OPERATION TESTS ===",10,"",0
msg_69 db "--- Arithmetic Operations ---",10,"",0
msg_70 db "Addition result: %d",10,"",0
msg_71 db "Subtraction result: %d",10,"",0
msg_72 db "Multiplication result: %d",10,"",0
msg_73 db "",10,"--- f32 Float Arithmetic Operations ---",10,"",0
msg_74 db "f32 addition: %f",10,"",0
msg_75 db "f32 multiplication: %f",10,"",0
msg_76 db "f32 division: %f",10,"",0
msg_77 db "f32 complex calc: %f",10,"",0
msg_78 db "",10,"--- Type Mixing Tests ---",10,"",0
msg_79 db "Mixed i16: %d",10,"",0
msg_80 db "Mixed f32 #1: %f",10,"",0
msg_81 db "Mixed f32 #2: %f",10,"",0
msg_82 db "Mixed f32 #3: %f",10,"",0
msg_83 db "Mixed u32: %u",10,"",0
msg_84 db "",10,"--- Sequential Operations ---",10,"",0
msg_85 db "Sequential i8 values: %d, %d, %d, %d, %d",10,"",0
msg_86 db "",10,"--- f32 Precision Comparison ---",10,"",0
msg_87 db "f32 precision test: %f, %f, %f",10,"",0
msg_88 db "",10,"--- Boolean Logic Tests ---",10,"",0
msg_89 db "Logic tests: %t AND %t",10,"",0
msg_90 db "╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_91 db "║              ÆLang 32-bit Comprehensive Test Suite              ║",10,"",0
msg_92 db "║           Optimized for 32-bit Architecture & Types            ║",10,"",0
msg_93 db "╚══════════════════════════════════════════════════════════════════╝",10,"",10,"",0
msg_94 db "Architecture: 32-bit mode (optimized performance)",10,"",0
msg_95 db "Testing: f32 floats + all 32-bit compatible integer types",10,"",0
msg_96 db "Coverage: IEEE 754 single precision floats, 32-bit integers, edge cases",10,"",10,"",0
msg_97 db "",10,"╔══════════════════════════════════════════════════════════════════╗",10,"",0
msg_98 db "║                    32-bit Test Suite Complete                   ║",10,"",0
msg_99 db "║      All 32-bit types + f32 floats tested successfully           ║",10,"",0
msg_100 db "║       Perfect for embedded and resource-constrained systems     ║",10,"",0
msg_101 db "╚══════════════════════════════════════════════════════════════════╝",10,"",0
float_0: dd 0x322bcc77  ; 9.99999994e-09
float_1: dd 0x4e6e6b28  ; 1e+09
float_2: dd 0x40490fdb  ; 3.14159274
float_3: dd 0x402df84d  ; 2.71828008
float_4: dd 0x4b800000  ; 16777216
float_5: dd 0x3089705f  ; 9.99999972e-10
float_6: dd 0x42f6e9e0  ; 123.456787
float_7: dd 0x49742400  ; 1000000
float_8: dd 0x49962580  ; 1230000
float_9: dd 0x3e000000  ; 0.125
float_10: dd 0x3fc00000  ; 1.5
float_11: dd 0x3faaaaa8  ; 1.33333302
float_12: dd 0x402df84d  ; 2.71828008
float_13: dd 0x49962580  ; 1230000
float_14: dd 0x3d000000  ; 0.03125
float_15: dd 0x38000000  ; 3.05175781e-05
float_16: dd 0x3089705f  ; 9.99999972e-10
float_17: dd 0x4e6e6b28  ; 1e+09
float_18: dd 0x417e0000  ; 15.875
float_19: dd 0x45000000  ; 2048
float_20: dd 0x4b800000  ; 16777216
float_21: dd 0x40400000  ; 3
float_22: dd 0x3fc00000  ; 1.5
float_23: dd 0x41280000  ; 10.5
float_24: dd 0x40000000  ; 2
float_25: dd 0x42f6e979  ; 123.456001
float_26: dd 0x40000000  ; 2
float_27: dd 0x40490fd0  ; 3.14159012
float_28: dd 0x402df84d  ; 2.71828008
float_29: dd 0x40e80000  ; 7.25
float_30: dd 0x43e464fe  ; 456.789001
float_31: dd 0x42f6e9e0  ; 123.456787
float_32: dd 0x3f9df3b6  ; 1.23399997
float_33: dd 0x3f9e0419  ; 1.23450005
float_34: dd 0x3f9e0652  ; 1.23456788
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
; CODEGEN TEST MARKER: emitting function test_signed_integers_32bit
test_signed_integers_32bit:
    push ebp
    mov ebp, esp
    sub esp, 32  ; allocate space for 8 local variables
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let i8_min:i8 = <EXPR_UNHANDLED>
    mov eax, 128
    neg eax
    mov byte [ebp-4], al  ; store i8_min (local int)
    movsx eax, byte [ebp-4]  ; load i8_min (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_2
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let i8_max:i8 = 127
    mov eax, 127
    mov byte [ebp-8], al  ; store i8_max (local int)
    movsx eax, byte [ebp-8]  ; load i8_max (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_3
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_4
    call print
    add esp, 4
; let i16_min:i16 = <EXPR_UNHANDLED>
    mov eax, 32768
    neg eax
    mov word [ebp-12], ax  ; store i16_min (local int)
    movsx eax, word [ebp-12]  ; load i16_min (stack, 16-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_5
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let i16_max:i16 = 32767
    mov eax, 32767
    mov word [ebp-16], ax  ; store i16_max (local int)
    movsx eax, word [ebp-16]  ; load i16_max (stack, 16-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_6
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_7
    call print
    add esp, 4
; let i32_min:i32 = <EXPR_UNHANDLED>
    mov eax, -2147483648
    neg eax
    mov dword [ebp-20], eax  ; store i32_min (local int)
    mov eax, dword [ebp-20]  ; load i32_min (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_8
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let i32_max:i32 = 2147483647
    mov eax, 2147483647
    mov dword [ebp-24], eax  ; store i32_max (local int)
    mov eax, dword [ebp-24]  ; load i32_max (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_9
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let i32_large:i32 = 1000000000
    mov eax, 1000000000
    mov dword [ebp-28], eax  ; store i32_large (local int)
    mov eax, dword [ebp-28]  ; load i32_large (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_10
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let i32_neg_large:i32 = <EXPR_UNHANDLED>
    mov eax, 1000000000
    neg eax
    mov dword [ebp-32], eax  ; store i32_neg_large (local int)
    mov eax, dword [ebp-32]  ; load i32_neg_large (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_11
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_unsigned_integers_32bit
test_unsigned_integers_32bit:
    push ebp
    mov ebp, esp
    sub esp, 32  ; allocate space for 8 local variables
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
; let u8_min:u8 = 0
    mov eax, 0
    mov byte [ebp-4], al  ; store u8_min (local int)
    movzx eax, byte [ebp-4]  ; load u8_min (stack, 8-bit zero-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_14
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u8_max:u8 = 255
    mov eax, 255
    mov byte [ebp-8], al  ; store u8_max (local int)
    movzx eax, byte [ebp-8]  ; load u8_max (stack, 8-bit zero-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_15
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_16
    call print
    add esp, 4
; let u16_min:u16 = 0
    mov eax, 0
    mov word [ebp-12], ax  ; store u16_min (local int)
    movzx eax, word [ebp-12]  ; load u16_min (stack, 16-bit zero-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_17
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u16_max:u16 = 65535
    mov eax, 65535
    mov word [ebp-16], ax  ; store u16_max (local int)
    movzx eax, word [ebp-16]  ; load u16_max (stack, 16-bit zero-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_18
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_19
    call print
    add esp, 4
; let u32_min:u32 = 0
    mov eax, 0
    mov dword [ebp-20], eax  ; store u32_min (local int)
    mov eax, dword [ebp-20]  ; load u32_min (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_20
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u32_max:u32 = -1
    mov eax, -1
    mov dword [ebp-24], eax  ; store u32_max (local int)
    mov eax, dword [ebp-24]  ; load u32_max (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_21
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u32_large:u32 = -1294967296
    mov eax, -1294967296
    mov dword [ebp-28], eax  ; store u32_large (local int)
    mov eax, dword [ebp-28]  ; load u32_large (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_22
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u32_mid:u32 = -2147483648
    mov eax, -2147483648
    mov dword [ebp-32], eax  ; store u32_mid (local int)
    mov eax, dword [ebp-32]  ; load u32_mid (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_23
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_floating_point_32bit
test_floating_point_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 12 local variables
    push msg_24
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
; let f32_tiny:f32 = -814182836421710053376.000000
    fld dword [float_0]
    fstp dword [ebp-4]  ; store f32_tiny (local float)
    fld dword [ebp-4]  ; load f32_tiny (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_26
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_huge:f32 = -inf
    fld dword [float_1]
    fstp dword [ebp-8]  ; store f32_huge (local float)
    fld dword [ebp-8]  ; load f32_huge (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_27
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_pi:f32 = 1725132046336.000000
    fld dword [float_2]
    fstp dword [ebp-12]  ; store f32_pi (local float)
    fld dword [ebp-12]  ; load f32_pi (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_28
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_neg_e:f32 = <EXPR_UNHANDLED>
    fld dword [float_3]
    fchs
    fstp dword [ebp-16]  ; store f32_neg_e (local float)
    fld dword [ebp-16]  ; load f32_neg_e (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_29
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_precision:f32 = 0.000000
    fld dword [float_4]
    fstp dword [ebp-20]  ; store f32_precision (local float)
    fld dword [ebp-20]  ; load f32_precision (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_30
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    push msg_31
    call print
    add esp, 4
; let f32_micro:f32 = -3151484703878586403127296.000000
    fld dword [float_5]
    fstp dword [ebp-24]  ; store f32_micro (local float)
    fld dword [ebp-24]  ; load f32_micro (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_32
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_medium:f32 = 0.000000
    fld dword [float_6]
    fstp dword [ebp-28]  ; store f32_medium (local float)
    fld dword [ebp-28]  ; load f32_medium (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_33
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_negative:f32 = <EXPR_UNHANDLED>
    fld dword [float_7]
    fchs
    fstp dword [ebp-32]  ; store f32_negative (local float)
    fld dword [ebp-32]  ; load f32_negative (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_34
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_scientific:f32 = 0.000000
    fld dword [float_8]
    fstp dword [ebp-36]  ; store f32_scientific (local float)
    fld dword [ebp-36]  ; load f32_scientific (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_35
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    push msg_36
    call print
    add esp, 4
; let f32_small_step:f32 = 0.000000
    fld dword [float_9]
    fstp dword [ebp-40]  ; store f32_small_step (local float)
    fld dword [ebp-40]  ; load f32_small_step (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_37
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_decimal:f32 = 0.000000
    fld dword [float_10]
    fstp dword [ebp-44]  ; store f32_decimal (local float)
    fld dword [ebp-44]  ; load f32_decimal (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_38
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_repeating:f32 = -2272575859869407403672959058800803840.000000
    fld dword [float_11]
    fstp dword [ebp-48]  ; store f32_repeating (local float)
    fld dword [ebp-48]  ; load f32_repeating (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_39
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_other_types_32bit
test_other_types_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 9 local variables
    push msg_40
    call print
    add esp, 4
    push msg_41
    call print
    add esp, 4
; let bool_true:bool = 1
    mov eax, 1
    mov dword [ebp-4], eax  ; store bool_true (local int)
    mov eax, dword [ebp-4]  ; load bool_true (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_42
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let bool_false:bool = 0
    mov eax, 0
    mov dword [ebp-8], eax  ; store bool_false (local int)
    mov eax, dword [ebp-8]  ; load bool_false (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_43
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_44
    call print
    add esp, 4
; let char_letter:char = 'A'
    mov eax, 65  ; char 'A'
    mov byte [ebp-12], al  ; store char_letter (local int)
    movsx eax, byte [ebp-12]  ; load char_letter (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_45
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let char_digit:char = '5'
    mov eax, 53  ; char '5'
    mov byte [ebp-16], al  ; store char_digit (local int)
    movsx eax, byte [ebp-16]  ; load char_digit (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_46
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let char_symbol:char = '#'
    mov eax, 35  ; char '#'
    mov byte [ebp-20], al  ; store char_symbol (local int)
    movsx eax, byte [ebp-20]  ; load char_symbol (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_47
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let char_space:char = ' '
    mov eax, 32  ; char ' '
    mov byte [ebp-24], al  ; store char_space (local int)
    movsx eax, byte [ebp-24]  ; load char_space (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_48
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_49
    call print
    add esp, 4
; let num_int:num = 999999
    mov eax, 999999
    mov [temp_int], eax
    fild dword [temp_int]  ; convert int to float
    fstp qword [ebp-32]  ; store num_int (local float, converted)
    fld qword [ebp-32]  ; load num_int (stack, f64/double)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_50
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let num_float:num = 2.718280
    fld dword [float_3]
    fstp qword [ebp-40]  ; store num_float (local float)
    fld qword [ebp-40]  ; load num_float (stack, f64/double)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_51
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let num_scientific:num = 1230000.000000
    fld dword [float_8]
    fstp qword [ebp-48]  ; store num_scientific (local float)
    fld qword [ebp-48]  ; load num_scientific (stack, f64/double)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_52
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_edge_cases_32bit
test_edge_cases_32bit:
    push ebp
    mov ebp, esp
    sub esp, 48  ; allocate space for 11 local variables
    push msg_53
    call print
    add esp, 4
    push msg_54
    call print
    add esp, 4
; let i32_near_max:i32 = 2147483646
    mov eax, 2147483646
    mov dword [ebp-4], eax  ; store i32_near_max (local int)
    mov eax, dword [ebp-4]  ; load i32_near_max (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_55
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let u32_near_max:u32 = -2
    mov eax, -2
    mov dword [ebp-8], eax  ; store u32_near_max (local int)
    mov eax, dword [ebp-8]  ; load u32_near_max (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_56
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_57
    call print
    add esp, 4
; let f32_edge:f32 = 0.000000
    fld dword [float_14]
    fstp dword [ebp-12]  ; store f32_edge (local float)
    fld dword [ebp-12]  ; load f32_edge (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_58
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_very_small:f32 = 0.000000
    fld dword [float_15]
    fstp dword [ebp-16]  ; store f32_very_small (local float)
    fld dword [ebp-16]  ; load f32_very_small (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_59
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_micro:f32 = -3151484703878586403127296.000000
    fld dword [float_5]
    fstp dword [ebp-24]  ; store f32_micro (local float)
    fld dword [ebp-24]  ; load f32_micro (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_32
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_large:f32 = -inf
    fld dword [float_1]
    fstp dword [ebp-20]  ; store f32_large (local float)
    fld dword [ebp-20]  ; load f32_large (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_60
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    push msg_61
    call print
    add esp, 4
; let f32_limit:f32 = 0.000000
    fld dword [float_18]
    fstp dword [ebp-24]  ; store f32_limit (local float)
    fld dword [ebp-24]  ; load f32_limit (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_62
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_precision_test:f32 = 0.000000
    fld dword [float_19]
    fstp dword [ebp-28]  ; store f32_precision_test (local float)
    fld dword [ebp-28]  ; load f32_precision_test (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_63
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_limit_plus:f32 = 0.000000
    fld dword [float_4]
    fstp dword [ebp-32]  ; store f32_limit_plus (local float)
    fld dword [ebp-32]  ; load f32_limit_plus (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_64
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    push msg_65
    call print
    add esp, 4
; let mixed_calc:i32 = 1000 + 2000
    mov eax, 1000
    push eax
    mov eax, 2000
    mov ebx, eax
    pop eax
    add eax, ebx
    mov dword [ebp-36], eax  ; store mixed_calc (local int)
    mov eax, dword [ebp-36]  ; load mixed_calc (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_66
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let overflow_test:u16 = 65535
    mov eax, 65535
    mov word [ebp-40], ax  ; store overflow_test (local int)
    movzx eax, word [ebp-40]  ; load overflow_test (stack, 16-bit zero-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_67
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function test_mixed_operations_32bit
test_mixed_operations_32bit:
    push ebp
    mov ebp, esp
    sub esp, 96  ; allocate space for 22 local variables
    push msg_68
    call print
    add esp, 4
    push msg_69
    call print
    add esp, 4
; let add_result:i32 = 1000000 + 2000000
    mov eax, 1000000
    push eax
    mov eax, 2000000
    mov ebx, eax
    pop eax
    add eax, ebx
    mov dword [ebp-4], eax  ; store add_result (local int)
    mov eax, dword [ebp-4]  ; load add_result (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_70
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let sub_result:i32 = 5000000 - 2000000
    mov eax, 5000000
    push eax
    mov eax, 2000000
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov dword [ebp-8], eax  ; store sub_result (local int)
    mov eax, dword [ebp-8]  ; load sub_result (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_71
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let mul_result:i32 = 12345 * 678
    mov eax, 12345
    push eax
    mov eax, 678
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov dword [ebp-12], eax  ; store mul_result (local int)
    mov eax, dword [ebp-12]  ; load mul_result (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_72
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_73
    call print
    add esp, 4
; let f32_add:f32 = 0.000000 + 0.000000
    fld dword [float_21]
    fld dword [float_10]
    faddp
    fstp dword [ebp-16]  ; store f32_add (local float)
    fld dword [ebp-16]  ; load f32_add (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_74
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_mult:f32 = 0.000000 * 0.000000
    fld dword [float_23]
    fld dword [float_24]
    fmulp
    fstp dword [ebp-20]  ; store f32_mult (local float)
    fld dword [ebp-20]  ; load f32_mult (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_75
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_div:f32 = 0.000000 / 0.000000
    fld dword [float_25]
    fld dword [float_24]
    fdivp
    fstp dword [ebp-24]  ; store f32_div (local float)
    fld dword [ebp-24]  ; load f32_div (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_76
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let f32_complex:f32 = -192530768169799846490900791296.000000 * -0.000000
    fld dword [float_27]
    fld dword [float_3]
    fmulp
    fstp dword [ebp-28]  ; store f32_complex (local float)
    fld dword [ebp-28]  ; load f32_complex (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_77
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    push msg_78
    call print
    add esp, 4
; let mixed_i16:i16 = 30000
    mov eax, 30000
    mov word [ebp-32], ax  ; store mixed_i16 (local int)
    movsx eax, word [ebp-32]  ; load mixed_i16 (stack, 16-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_79
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
; let mixed_f32_1:f32 = 0.000000
    fld dword [float_29]
    fstp dword [ebp-36]  ; store mixed_f32_1 (local float)
    fld dword [ebp-36]  ; load mixed_f32_1 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_80
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let mixed_f32_2:f32 = -0.241000
    fld dword [float_30]
    fstp dword [ebp-40]  ; store mixed_f32_2 (local float)
    fld dword [ebp-40]  ; load mixed_f32_2 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_81
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let mixed_f32_3:f32 = 0.000000
    fld dword [float_6]
    fstp dword [ebp-44]  ; store mixed_f32_3 (local float)
    fld dword [ebp-44]  ; load mixed_f32_3 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_82
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
; let mixed_u32:u32 = -294967296
    mov eax, -294967296
    mov dword [ebp-48], eax  ; store mixed_u32 (local int)
    mov eax, dword [ebp-48]  ; load mixed_u32 (stack, zero-extended to 64-bit)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_83
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    push msg_84
    call print
    add esp, 4
; let seq1:i8 = 10
    mov eax, 10
    mov byte [ebp-52], al  ; store seq1 (local int)
; let seq2:i8 = 20
    mov eax, 20
    mov byte [ebp-56], al  ; store seq2 (local int)
; let seq3:i8 = 30
    mov eax, 30
    mov byte [ebp-60], al  ; store seq3 (local int)
; let seq4:i8 = 40
    mov eax, 40
    mov byte [ebp-64], al  ; store seq4 (local int)
; let seq5:i8 = 50
    mov eax, 50
    mov byte [ebp-68], al  ; store seq5 (local int)
    movsx eax, byte [ebp-68]  ; load seq5 (stack, 8-bit sign-extended)
    push eax  ; push argument 5 (32-bit)
    movsx eax, byte [ebp-64]  ; load seq4 (stack, 8-bit sign-extended)
    push eax  ; push argument 4 (32-bit)
    movsx eax, byte [ebp-60]  ; load seq3 (stack, 8-bit sign-extended)
    push eax  ; push argument 3 (32-bit)
    movsx eax, byte [ebp-56]  ; load seq2 (stack, 8-bit sign-extended)
    push eax  ; push argument 2 (32-bit)
    movsx eax, byte [ebp-52]  ; load seq1 (stack, 8-bit sign-extended)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_85
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 24  ; clean up 6 arguments (32-bit)
    push msg_86
    call print
    add esp, 4
; let precision_1:f32 = -369098.750000
    fld dword [float_32]
    fstp dword [ebp-72]  ; store precision_1 (local float)
; let precision_2:f32 = 0.000000
    fld dword [float_33]
    fstp dword [ebp-76]  ; store precision_2 (local float)
; let precision_3:f32 = 65.933800
    fld dword [float_34]
    fstp dword [ebp-80]  ; store precision_3 (local float)
    fld dword [ebp-80]  ; load precision_3 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 3 (promoted to double)
    fld dword [ebp-76]  ; load precision_2 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 2 (promoted to double)
    fld dword [ebp-72]  ; load precision_1 (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_87
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 28  ; clean up 4 arguments (32-bit)
    push msg_88
    call print
    add esp, 4
; let logic_true:bool = 1
    mov eax, 1
    mov dword [ebp-84], eax  ; store logic_true (local int)
; let logic_false:bool = 0
    mov eax, 0
    mov dword [ebp-88], eax  ; store logic_false (local int)
    mov eax, dword [ebp-88]  ; load logic_false (stack)
    push eax  ; push argument 2 (32-bit)
    mov eax, dword [ebp-84]  ; load logic_true (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_89
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 3 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_90
    call print
    add esp, 4
    push msg_91
    call print
    add esp, 4
    push msg_92
    call print
    add esp, 4
    push msg_93
    call print
    add esp, 4
    push msg_94
    call print
    add esp, 4
    push msg_95
    call print
    add esp, 4
    push msg_96
    call print
    add esp, 4
    call test_signed_integers_32bit
    call test_unsigned_integers_32bit
    call test_floating_point_32bit
    call test_other_types_32bit
    call test_edge_cases_32bit
    call test_mixed_operations_32bit
    push msg_97
    call print
    add esp, 4
    push msg_98
    call print
    add esp, 4
    push msg_99
    call print
    add esp, 4
    push msg_100
    call print
    add esp, 4
    push msg_101
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
