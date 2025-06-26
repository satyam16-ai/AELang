; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Enter a number: ",0
msg_1 db "You entered: ",0
msg_2 db "Test complete!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    float_var_0: resd 1  ; input

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
; let input:num = read_num()
    call read_num
    fstp dword [float_var_0]  ; store input as num (float)
    push msg_1
    call print
    add esp, 4
    fld dword [float_var_0]  ; load input
    sub esp, 8
    fstp qword [esp]
    push fmt_float
    call printf
    add esp, 12
    push msg_2
    call print
    add esp, 4
    pop ebp
    ret
