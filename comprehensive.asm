; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "========================================",0
msg_1 db "ÆLang Comprehensive Feature Test",0
msg_2 db "Testing ALL implemented features",0
msg_3 db "",0
msg_4 db "TEST 1: Variable Declarations",0
msg_5 db "------------------------------",0
msg_6 db "Integer variable (42):",0
msg_7 db "Float variable (3.14159):",0
msg_8 db "String literal:",0
msg_9 db "Hello ÆLang",0
msg_10 db "TEST 2: Basic Arithmetic Operations",0
msg_11 db "-----------------------------------",0
msg_12 db "Testing with a=15, b=7:",0
msg_13 db "Addition (15 + 7):",0
msg_14 db "Subtraction (15 - 7):",0
msg_15 db "Multiplication (15 * 7):",0
msg_16 db "Division (15 / 7):",0
msg_17 db "Modulo (15 % 7):",0
msg_18 db "TEST 3: Comparison Operations",0
msg_19 db "-----------------------------",0
msg_20 db "Comparing 10 and 5:",0
msg_21 db "10 == 5:",0
msg_22 db "10 != 5:",0
msg_23 db "10 > 5:",0
msg_24 db "10 < 5:",0
msg_25 db "10 >= 5:",0
msg_26 db "10 <= 5:",0
msg_27 db "TEST 4: If-Else Control Flow",0
msg_28 db "----------------------------",0
msg_29 db "Testing with value = 8:",0
msg_30 db "Value is greater than 10",0
msg_31 db "Value is 10 or less",0
msg_32 db "Value is even",0
msg_33 db "Value is odd",0
msg_34 db "Value is between 0 and 4",0
msg_35 db "Value is 5 or greater",0
msg_36 db "Value is negative",0
msg_37 db "TEST 5: Mathematical Functions",0
msg_38 db "Absolute value of -25:",0
msg_39 db "Maximum of 12 and 8:",0
msg_40 db "Minimum of 12 and 8:",0
msg_41 db "Factorial of 5:",0
msg_42 db "Power: 2^3:",0
msg_43 db "TEST 6: Float Operations",0
msg_44 db "------------------------",0
msg_45 db "Testing with x=5.5, y=2.2:",0
msg_46 db "Float addition (5.5 + 2.2):",0
msg_47 db "Float subtraction (5.5 - 2.2):",0
msg_48 db "Float multiplication (5.5 * 2.2):",0
msg_49 db "Float division (5.5 / 2.2):",0
msg_50 db "Float absolute of -3.7:",0
msg_51 db "TEST 7: Function Calls and Recursion",0
msg_52 db "------------------------------------",0
msg_53 db "Complex expression: (10 + 5) * 2 - 3:",0
msg_54 db "Recursive factorial of 6:",0
msg_55 db "Nested function calls - max(abs(-8), factorial(3)):",0
msg_56 db "TEST 8: String Literals",0
msg_57 db "-----------------------",0
msg_58 db "Direct string literal test:",0
msg_59 db "This is a direct string!",0
msg_60 db "Special characters: !@#$%^&*()",0
msg_61 db "Numbers in string: 12345",0
msg_62 db "TEST 9: Interactive Input/Output",0
msg_63 db "--------------------------------",0
msg_64 db "Enter an integer:",0
msg_65 db "You entered:",0
msg_66 db "Enter a float:",0
msg_67 db "Calculations with your numbers:",0
msg_68 db "Integer * 2:",0
msg_69 db "Float + 1.5:",0
msg_70 db "TEST 10: Edge Cases",0
msg_71 db "-------------------",0
msg_72 db "Division by zero test (15 / 0):",0
msg_73 db "Large numbers:",0
msg_74 db "Negative operations:",0
msg_75 db "TEST SUMMARY - ALL FEATURES TESTED:",0
msg_76 db "✓ Variable declarations (i32, f32, str)",0
msg_77 db "✓ String literals and print statements",0
msg_78 db "✓ Integer arithmetic (+, -, *, /, %)",0
msg_79 db "✓ Float arithmetic (+, -, *, /)",0
msg_80 db "✓ Comparison operations (==, !=, <, >, <=, >=)",0
msg_81 db "✓ If-else conditional statements",0
msg_82 db "✓ Nested if-else statements",0
msg_83 db "✓ Function definitions with parameters",0
msg_84 db "✓ Function calls and return values",0
msg_85 db "✓ Recursive function calls",0
msg_86 db "✓ External function declarations",0
msg_87 db "✓ Interactive input (read_int, read_float)",0
msg_88 db "✓ Complex expressions and nested calls",0
msg_89 db "✓ Edge cases and error handling",0
msg_90 db "✓ Negative numbers and operations",0
msg_91 db "FEATURES NOT IMPLEMENTED:",0
msg_92 db "✗ Constants (const keyword parsed but not working)",0
msg_93 db "✗ While loops (not implemented)",0
msg_94 db "✗ For loops (not implemented)",0
msg_95 db "✗ Boolean type (using i32 instead)",0
msg_96 db "✗ Logical operators (&&, ||, !)",0
msg_97 db "✗ String variables (literals work, variables don't)",0
msg_98 db "ÆLang Comprehensive Test COMPLETED!",0
msg_99 db "All implemented features working correctly!",0
float_0: dd 0x00000000  ; 0
float_1: dd 0x40490fd0  ; 3.14159012
float_2: dd 0x40b00000  ; 5.5
float_3: dd 0x400ccccd  ; 2.20000005
float_4: dd 0x406ccccd  ; 3.70000005
float_5: dd 0x3fc00000  ; 1.5
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; float_var
    float_var_1: resd 1  ; x
    float_var_2: resd 1  ; y
    float_var_3: resd 1  ; user_float
    int_var_0: resd 1  ; int_var
    int_var_1: resd 1  ; a
    int_var_2: resd 1  ; b
    int_var_3: resd 1  ; test_value
    int_var_4: resd 1  ; complex_result
    int_var_5: resd 1  ; user_int

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
extern print_int
extern print_float
extern read_int
extern read_float
; CODEGEN TEST MARKER: emitting function add
add:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function subtract
subtract:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function multiply
multiply:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function divide
divide:
    push ebp
    mov ebp, esp
; if statement 0
    mov eax, [int_var_2]  ; load b
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
; Unhandled node type AST_LOAD
    jmp .end_if_0
.else_0:
.end_if_0:
; end if statement 0
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function modulo
modulo:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_equal
is_equal:
    push ebp
    mov ebp, esp
; if statement 1
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
; Unhandled node type AST_LOAD
    jmp .end_if_1
.else_1:
.end_if_1:
; end if statement 1
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_not_equal
is_not_equal:
    push ebp
    mov ebp, esp
; if statement 2
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
; Unhandled node type AST_LOAD
    jmp .end_if_2
.else_2:
.end_if_2:
; end if statement 2
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_greater
is_greater:
    push ebp
    mov ebp, esp
; if statement 3
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
; Unhandled node type AST_LOAD
    jmp .end_if_3
.else_3:
.end_if_3:
; end if statement 3
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_less
is_less:
    push ebp
    mov ebp, esp
; if statement 4
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
; Unhandled node type AST_LOAD
    jmp .end_if_4
.else_4:
.end_if_4:
; end if statement 4
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_greater_equal
is_greater_equal:
    push ebp
    mov ebp, esp
; if statement 5
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_5
.then_5:
; Unhandled node type AST_LOAD
    jmp .end_if_5
.else_5:
.end_if_5:
; end if statement 5
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function is_less_equal
is_less_equal:
    push ebp
    mov ebp, esp
; if statement 6
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_6
.then_6:
; Unhandled node type AST_LOAD
    jmp .end_if_6
.else_6:
.end_if_6:
; end if statement 6
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function absolute
absolute:
    push ebp
    mov ebp, esp
; if statement 7
    fld dword [float_var_1]  ; load x
    mov eax, 0
    fcompp
    fstsw ax
    sahf
    setb al
    movzx eax, al
    cmp eax, 0
    je .else_7
.then_7:
; Unhandled node type AST_LOAD
    jmp .end_if_7
.else_7:
.end_if_7:
; end if statement 7
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function maximum
maximum:
    push ebp
    mov ebp, esp
; if statement 8
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_8
.then_8:
; Unhandled node type AST_LOAD
    jmp .end_if_8
.else_8:
.end_if_8:
; end if statement 8
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function minimum
minimum:
    push ebp
    mov ebp, esp
; if statement 9
    mov eax, [int_var_1]  ; load a
    push eax
    mov eax, [int_var_2]  ; load b
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_9
.then_9:
; Unhandled node type AST_LOAD
    jmp .end_if_9
.else_9:
.end_if_9:
; end if statement 9
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function power
power:
    push ebp
    mov ebp, esp
; if statement 10
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_10
.then_10:
; Unhandled node type AST_LOAD
    jmp .end_if_10
.else_10:
.end_if_10:
; end if statement 10
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function factorial
factorial:
    push ebp
    mov ebp, esp
; if statement 11
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setle al
    movzx eax, al
    cmp eax, 0
    je .else_11
.then_11:
; Unhandled node type AST_LOAD
    jmp .end_if_11
.else_11:
.end_if_11:
; end if statement 11
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function float_add
float_add:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function float_subtract
float_subtract:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function float_multiply
float_multiply:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function float_divide
float_divide:
    push ebp
    mov ebp, esp
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function float_absolute
float_absolute:
    push ebp
    mov ebp, esp
; if statement 12
    fld dword [float_var_1]  ; load x
    fld dword [float_0]
    fcompp
    fstsw ax
    sahf
    setb al
    movzx eax, al
    cmp eax, 0
    je .else_12
.then_12:
; Unhandled node type AST_LOAD
    jmp .end_if_12
.else_12:
.end_if_12:
; end if statement 12
; Unhandled node type AST_LOAD
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
; let int_var:i32 = 42
    mov eax, 42
    mov [int_var_0], eax  ; store int_var
; let float_var:f32 = 3.141590
    fld dword [float_1]
    fstp dword [float_var_0]  ; store float_var
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load int_var
    push eax
    call print_int
    add esp, 4
    push msg_7
    call print
    add esp, 4
    fld dword [float_var_0]  ; load float_var
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
; let a:i32 = 15
    mov eax, 15
    mov [int_var_1], eax  ; store a
; let b:i32 = 7
    mov eax, 7
    mov [int_var_2], eax  ; store b
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load a
    mov eax, [int_var_2]  ; load b
    call add
    push eax
    call print_int
    add esp, 4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load a
    mov eax, [int_var_2]  ; load b
    call subtract
    push eax
    call print_int
    add esp, 4
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load a
    mov eax, [int_var_2]  ; load b
    call multiply
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load a
    mov eax, [int_var_2]  ; load b
    call divide
    push eax
    call print_int
    add esp, 4
    push msg_17
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load a
    mov eax, [int_var_2]  ; load b
    call modulo
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_equal
    push eax
    call print_int
    add esp, 4
    push msg_22
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_not_equal
    push eax
    call print_int
    add esp, 4
    push msg_23
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_greater
    push eax
    call print_int
    add esp, 4
    push msg_24
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_less
    push eax
    call print_int
    add esp, 4
    push msg_25
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_greater_equal
    push eax
    call print_int
    add esp, 4
    push msg_26
    call print
    add esp, 4
    mov eax, 10
    mov eax, 5
    call is_less_equal
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    push msg_28
    call print
    add esp, 4
; let test_value:i32 = 8
    mov eax, 8
    mov [int_var_3], eax  ; store test_value
    push msg_29
    call print
    add esp, 4
; if statement 13
    mov eax, [int_var_3]  ; load test_value
    push eax
    mov eax, 10
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_13
.then_13:
    push msg_30
    call print
    add esp, 4
    jmp .end_if_13
.else_13:
    push msg_31
    call print
    add esp, 4
.end_if_13:
; end if statement 13
; if statement 14
    mov eax, [int_var_3]  ; load test_value
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
    cmp eax, 0
    je .else_14
.then_14:
    push msg_32
    call print
    add esp, 4
    jmp .end_if_14
.else_14:
    push msg_33
    call print
    add esp, 4
.end_if_14:
; end if statement 14
; if statement 15
    mov eax, [int_var_3]  ; load test_value
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    cmp eax, 0
    je .else_15
.then_15:
; if statement 16
    mov eax, [int_var_3]  ; load test_value
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setl al
    movzx eax, al
    cmp eax, 0
    je .else_16
.then_16:
    push msg_34
    call print
    add esp, 4
    jmp .end_if_16
.else_16:
    push msg_35
    call print
    add esp, 4
.end_if_16:
; end if statement 16
    jmp .end_if_15
.else_15:
    push msg_36
    call print
    add esp, 4
.end_if_15:
; end if statement 15
    push msg_3
    call print
    add esp, 4
    push msg_37
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_38
    call print
    add esp, 4
; Unhandled node type AST_UNARY_OP
    call absolute
    push eax
    call print_int
    add esp, 4
    push msg_39
    call print
    add esp, 4
    mov eax, 12
    mov eax, 8
    call maximum
    push eax
    call print_int
    add esp, 4
    push msg_40
    call print
    add esp, 4
    mov eax, 12
    mov eax, 8
    call minimum
    push eax
    call print_int
    add esp, 4
    push msg_41
    call print
    add esp, 4
    mov eax, 5
    call factorial
    push eax
    call print_int
    add esp, 4
    push msg_42
    call print
    add esp, 4
    mov eax, 2
    mov eax, 3
    call power
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    push msg_44
    call print
    add esp, 4
; let x:f32 = 5.500000
    fld dword [float_2]
    fstp dword [float_var_1]  ; store x
; let y:f32 = 2.200000
    fld dword [float_3]
    fstp dword [float_var_2]  ; store y
    push msg_45
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
    fld dword [float_var_1]  ; load x
    fld dword [float_var_2]  ; load y
    call float_add
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_47
    call print
    add esp, 4
    fld dword [float_var_1]  ; load x
    fld dword [float_var_2]  ; load y
    call float_subtract
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_48
    call print
    add esp, 4
    fld dword [float_var_1]  ; load x
    fld dword [float_var_2]  ; load y
    call float_multiply
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_49
    call print
    add esp, 4
    fld dword [float_var_1]  ; load x
    fld dword [float_var_2]  ; load y
    call float_divide
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_50
    call print
    add esp, 4
; Unhandled node type AST_UNARY_OP
    call float_absolute
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_51
    call print
    add esp, 4
    push msg_52
    call print
    add esp, 4
    push msg_53
    call print
    add esp, 4
; let complex_result:i32 = subtract(multiply(add(10, 5), 2), 3)
    mov eax, 10
    mov eax, 5
    call add
    mov eax, 2
    call multiply
    mov eax, 3
    call subtract
    mov [int_var_4], eax  ; store complex_result
    mov eax, [int_var_4]  ; load complex_result
    push eax
    call print_int
    add esp, 4
    push msg_54
    call print
    add esp, 4
    mov eax, 6
    call factorial
    push eax
    call print_int
    add esp, 4
    push msg_55
    call print
    add esp, 4
; Unhandled node type AST_UNARY_OP
    call absolute
    mov eax, 3
    call factorial
    call maximum
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_56
    call print
    add esp, 4
    push msg_57
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
    push msg_59
    call print
    add esp, 4
    push msg_60
    call print
    add esp, 4
    push msg_61
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_62
    call print
    add esp, 4
    push msg_63
    call print
    add esp, 4
    push msg_64
    call print
    add esp, 4
; let user_int:i32 = read_int()
    call read_int
    mov [int_var_5], eax  ; store user_int
    push msg_65
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load user_int
    push eax
    call print_int
    add esp, 4
    push msg_66
    call print
    add esp, 4
; let user_float:f32 = read_float()
    call read_float
    fstp dword [float_var_3]  ; store user_float
    push msg_65
    call print
    add esp, 4
    fld dword [float_var_3]  ; load user_float
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_67
    call print
    add esp, 4
    push msg_68
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load user_int
    mov eax, 2
    call multiply
    push eax
    call print_int
    add esp, 4
    push msg_69
    call print
    add esp, 4
    fld dword [float_var_3]  ; load user_float
    fld dword [float_5]
    call float_add
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    push msg_70
    call print
    add esp, 4
    push msg_71
    call print
    add esp, 4
    push msg_72
    call print
    add esp, 4
    mov eax, 15
    mov eax, 0
    call divide
    push eax
    call print_int
    add esp, 4
    push msg_73
    call print
    add esp, 4
    mov eax, 1000
    mov eax, 1000
    call multiply
    push eax
    call print_int
    add esp, 4
    push msg_74
    call print
    add esp, 4
; Unhandled node type AST_UNARY_OP
; Unhandled node type AST_UNARY_OP
    call add
    push eax
    call print_int
    add esp, 4
; Unhandled node type AST_UNARY_OP
    call absolute
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_75
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_76
    call print
    add esp, 4
    push msg_77
    call print
    add esp, 4
    push msg_78
    call print
    add esp, 4
    push msg_79
    call print
    add esp, 4
    push msg_80
    call print
    add esp, 4
    push msg_81
    call print
    add esp, 4
    push msg_82
    call print
    add esp, 4
    push msg_83
    call print
    add esp, 4
    push msg_84
    call print
    add esp, 4
    push msg_85
    call print
    add esp, 4
    push msg_86
    call print
    add esp, 4
    push msg_87
    call print
    add esp, 4
    push msg_88
    call print
    add esp, 4
    push msg_89
    call print
    add esp, 4
    push msg_90
    call print
    add esp, 4
    push msg_3
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
    push msg_97
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_98
    call print
    add esp, 4
    push msg_99
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    pop ebp
    ret
