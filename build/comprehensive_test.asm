; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Comprehensive Unified Read System Test ===\\n",0
msg_1 db "--- Signed Integer Types ---\\n",0
msg_2 db "Enter an i8 value (-128 to 127): ",0
msg_3 db "You entered i8: %d\\n",0
msg_4 db "Enter an i16 value (-32768 to 32767): ",0
msg_5 db "You entered i16: %d\\n",0
msg_6 db "Enter an i32 value: ",0
msg_7 db "You entered i32: %d\\n",0
msg_8 db "Enter an i64 value: ",0
msg_9 db "You entered i64: %ld\\n",0
msg_10 db "--- Unsigned Integer Types ---\\n",0
msg_11 db "Enter a u8 value (0 to 255): ",0
msg_12 db "You entered u8: %u\\n",0
msg_13 db "Enter a u16 value (0 to 65535): ",0
msg_14 db "You entered u16: %u\\n",0
msg_15 db "Enter a u32 value: ",0
msg_16 db "You entered u32: %u\\n",0
msg_17 db "Enter a u64 value: ",0
msg_18 db "You entered u64: %lu\\n",0
msg_19 db "--- Floating Point Types ---\\n",0
msg_20 db "Enter an f32 value (float): ",0
msg_21 db "You entered f32: %f\\n",0
msg_22 db "Enter an f64 value (double): ",0
msg_23 db "You entered f64: %f\\n",0
msg_24 db "--- Other Types ---\\n",0
msg_25 db "Enter a boolean (true/false or 1/0): ",0
msg_26 db "You entered bool: %t\\n",0
msg_27 db "Enter a single character: ",0
msg_28 db "You entered char: %c\\n",0
msg_29 db "Enter a numeric value (num type): ",0
msg_30 db "You entered num: %g\\n",0
msg_31 db "=== Simple Unified Read Demo ===\\n",0
msg_32 db "Enter your age: ",0
msg_33 db "Enter your height: ",0
msg_34 db "Are you a student? (true/false): ",0
msg_35 db "\\n--- Your Information ---\\n",0
msg_36 db "Age: %d\\n",0
msg_37 db "Height: %f\\n",0
msg_38 db "Student: %t\\n",0
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
; CODEGEN TEST MARKER: emitting function test_unified_read_system
test_unified_read_system:
    push rbp
    mov rbp, rsp
    sub rsp, 112  ; allocate space for 13 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_0  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_1  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_2  ; string arg 0
    call print
; let test_i8:i8 = read_i8()
    call read_i8
    mov byte [rbp-8], al  ; store test_i8 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_3  ; string arg 0
    movsx rax, byte [rbp-8]  ; load test_i8 (stack, 8-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_4  ; string arg 0
    call print
; let test_i16:i16 = read_i16()
    call read_i16
    mov word [rbp-16], ax  ; store test_i16 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_5  ; string arg 0
    movsx rax, word [rbp-16]  ; load test_i16 (stack, 16-bit sign-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_6  ; string arg 0
    call print
; let test_i32:i32 = read_i32()
    call read_i32
    mov dword [rbp-24], eax  ; store test_i32 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_7  ; string arg 0
    movsx rax, dword [rbp-24]  ; load test_i32 (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_8  ; string arg 0
    call print
; let test_i64:i64 = read_i64()
    call read_i64
    mov qword [rbp-32], rax  ; store test_i64 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_9  ; string arg 0
    mov rax, qword [rbp-32]  ; load test_i64 (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_10  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_11  ; string arg 0
    call print
; let test_u8:u8 = read_u8()
    call read_u8
    mov byte [rbp-40], al  ; store test_u8 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_12  ; string arg 0
    movzx rax, byte [rbp-40]  ; load test_u8 (stack, 8-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_13  ; string arg 0
    call print
; let test_u16:u16 = read_u16()
    call read_u16
    mov word [rbp-48], ax  ; store test_u16 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_14  ; string arg 0
    movzx rax, word [rbp-48]  ; load test_u16 (stack, 16-bit zero-extended)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_15  ; string arg 0
    call print
; let test_u32:u32 = read_u32()
    call read_u32
    mov dword [rbp-56], eax  ; store test_u32 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_16  ; string arg 0
    mov eax, dword [rbp-56]  ; load test_u32 (stack, zero-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_17  ; string arg 0
    call print
; let test_u64:u64 = read_u64()
    call read_u64
    mov qword [rbp-64], rax  ; store test_u64 (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_18  ; string arg 0
    mov rax, qword [rbp-64]  ; load test_u64 (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_19  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_20  ; string arg 0
    call print
; let test_f32:f32 = read_f32()
    call read_f32
    sub rsp, 4
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 4
    fstp dword [rbp-72]  ; store test_f32 (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_21  ; string arg 0
    fld dword [rbp-72]  ; load test_f32 (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_22  ; string arg 0
    call print
; let test_f64:f64 = read_f64()
    call read_f64
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-80]  ; store test_f64 (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_23  ; string arg 0
    fld qword [rbp-80]  ; load test_f64 (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_24  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_25  ; string arg 0
    call print
; let test_bool:bool = read_bool()
    call read_bool
    mov dword [rbp-88], eax  ; store test_bool (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_26  ; string arg 0
    movsx rax, dword [rbp-88]  ; load test_bool (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_27  ; string arg 0
    call print
; let test_char:char = read_char()
    call read_char
    mov dword [rbp-96], eax  ; store test_char (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_28  ; string arg 0
    movsx rax, dword [rbp-96]  ; load test_char (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_29  ; string arg 0
    call print
; let test_num:num = read_num()
    call read_num
    sub rsp, 8
    movsd qword [rsp], xmm0
    fld qword [rsp]
    add rsp, 8
    fstp qword [rbp-104]  ; store test_num (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_30  ; string arg 0
    fld qword [rbp-104]  ; load test_num (stack, f64/double)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function simple_demo
simple_demo:
    push rbp
    mov rbp, rsp
    sub rsp, 32  ; allocate space for 3 local variables
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_31  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_32  ; string arg 0
    call print
; let age:i32 = read_i32()
    call read_i32
    mov dword [rbp-8], eax  ; store age (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_33  ; string arg 0
    call print
; let height:f32 = read_f32()
    call read_f32
    sub rsp, 4
    movss dword [rsp], xmm0
    fld dword [rsp]
    add rsp, 4
    fstp dword [rbp-16]  ; store height (local float)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_34  ; string arg 0
    call print
; let is_student:bool = read_bool()
    call read_bool
    mov dword [rbp-24], eax  ; store is_student (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_35  ; string arg 0
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_36  ; string arg 0
    movsx rax, dword [rbp-8]  ; load age (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_37  ; string arg 0
    fld dword [rbp-16]  ; load height (stack, f32/float)
    sub rsp, 8
    fstp qword [rsp]  ; promote float to double
    movsd xmm0, [rsp]  ; double arg 1 (promoted)
    add rsp, 8
    mov al, 1  ; update float reg count
    call print
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_38  ; string arg 0
    movsx rax, dword [rbp-24]  ; load is_student (stack, sign-extended to 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push rbp
    mov rbp, rsp
    call test_unified_read_system
    call simple_demo
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
