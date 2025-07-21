; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Sum: %ld",10,"",0
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
; CODEGEN TEST MARKER: emitting function main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32  ; allocate space for 3 local variables
; let x:i64 = 5
    mov rax, 5
    mov qword [rbp-8], rax  ; store x (local int)
; let y:i64 = 7
    mov rax, 7
    mov qword [rbp-16], rax  ; store y (local int)
; let sum:i64 = x + y
    mov rax, qword [rbp-8]  ; load x (stack, 64-bit)
    push rax
    mov rax, qword [rbp-16]  ; load y (stack, 64-bit)
    mov rbx, rax
    pop rax
    add rax, rbx
    mov qword [rbp-24], rax  ; store sum (local int)
    mov al, 0  ; variadic function: 0 float regs used initially
    mov rdi, msg_0  ; string arg 0
    mov rax, qword [rbp-24]  ; load sum (stack, 64-bit)
    mov rsi, rax  ; int arg 1
    call print
    mov rsp, rbp  ; restore stack pointer
    pop rbp
    ret
