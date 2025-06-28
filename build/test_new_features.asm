; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Testing boolean literals:",0
msg_1 db "Boolean true:",0
msg_2 db "Boolean false:",0
msg_3 db "Testing constants:",0
msg_4 db "PI should be 3.14159",0
msg_5 db "MAX_SIZE should be 100",0
float_0: dd 0x40490fd0  ; 3.14159012
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; PI
    int_var_0: resd 1  ; bool_var
    int_var_1: resd 1  ; bool_false
    int_var_2: resd 1  ; MAX_SIZE

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
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let bool_var:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store bool_var (bool)
    push msg_1
    call print
    add esp, 4
; let bool_false:bool = 0
    mov eax, 0
    mov [int_var_1], eax  ; store bool_false (bool)
    push msg_2
    call print
    add esp, 4
; let PI:f32 = 3.141590
    fld dword [float_0]
    fstp dword [float_var_0]  ; store PI
; let MAX_SIZE:i32 = 100
    mov eax, 100
    mov [int_var_2], eax  ; store MAX_SIZE
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    pop ebp
    ret
