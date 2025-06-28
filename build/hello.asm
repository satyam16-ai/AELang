; Generated NASM by ÆLang Compiler
section .rodata
    align 4
float_0: dd 0x40600000  ; 3.5
float_1: dd 0x40b9999a  ; 5.80000019
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

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32  ; allocate space for 4 local variables
; let pi:f32 = 3.500000
    fld dword [float_0]
    fstp dword [ebp-4]  ; store pi (local float)
; let x:i32 = 5
    mov rax, 5
    mov [ebp-8], eax  ; store x (local int)
; let radius:f32 = 5.800000
    fld dword [float_1]
    fstp dword [ebp-12]  ; store radius (local float)
; let res:f32 = pi + radius
    movss xmm0, [rbp-4]  ; load pi (stack)
    movss xmm0, [rbp-12]  ; load radius (stack)
    faddp
    fstp dword [ebp-16]  ; store res (local float)
    movss xmm0, [rbp-16]  ; load res (stack)
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    mov rax, [rbp-8]  ; load x (stack)
    push eax
    call print_int
    add esp, 4
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
