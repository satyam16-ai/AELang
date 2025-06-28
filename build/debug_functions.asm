; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Testing function calls:",0
msg_1 db "10 + 5 should be 15:",0
msg_2 db "Direct call test_add(3, 7):",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; result

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
; CODEGEN TEST MARKER: emitting function test_add
test_add:
    push ebp
    mov ebp, esp
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
; let result:i32 = test_add(10, 5)
    mov eax, 10
    mov eax, 5
    call test_add
    mov [int_var_0], eax  ; store result
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load result
    push eax
    call print_int
    add esp, 4
    push msg_2
    call print
    add esp, 4
    mov eax, 3
    mov eax, 7
    call test_add
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
