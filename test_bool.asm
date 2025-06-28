; Generated NASM by ÆLang Compiler
section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; flag

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
    push ebp
    mov ebp, esp
; let flag:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store flag (bool)
    mov eax, 1
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
