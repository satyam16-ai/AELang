; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Hello",0
fmt_float: db "%f", 10, 0

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
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let message:str = "Hello"
    call print
    pop ebp
    ret
