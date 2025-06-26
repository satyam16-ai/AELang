; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Testing read_num() functionality",0
msg_1 db "Enter a number: ",0
msg_2 db "You entered: ",0
msg_3 db "Test completed!",0
float_0: dd 0x422a0000  ; 42.5
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; input_value

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float
    extern read_num

extern print
extern print_float
extern read_num
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
; let input_value:num = read_num()
    call read_num
    fstp dword [float_var_0]  ; store input_value as num (float)
    push msg_2
    call print
    add esp, 4
    fld dword [float_0]
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_3
    call print
    add esp, 4
    pop ebp
    ret
