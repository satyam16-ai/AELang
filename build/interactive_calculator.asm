; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "This calculator will ask for your input!",0
msg_1 db "",0
msg_2 db "Please enter the first number and press Enter:",0
msg_3 db "Great! Now enter the second number and press Enter:",0
msg_4 db "You entered:",0
msg_5 db "  First number: ",0
msg_6 db "  Second number: ",0
msg_7 db "Computing all arithmetic operations...",0
msg_8 db "✓ Addition result: ",0
msg_9 db " + ",0
msg_10 db " = ",0
msg_11 db "✓ Subtraction result: ",0
msg_12 db " - ",0
msg_13 db "✓ Multiplication result: ",0
msg_14 db " × ",0
msg_15 db "✓ Division result: ",0
msg_16 db " ÷ ",0
msg_17 db "=== All calculations completed successfully! ===",0
msg_18 db "Thank you for using ÆLang Calculator!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; sum
    int_var_3: resd 1  ; diff
    int_var_4: resd 1  ; product
    int_var_5: resd 1  ; quotient

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
extern read_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; Unhandled node type UNKNOWN
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
; let a:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store a
    push msg_3
    call print
    add esp, 4
; let b:i32 = read_int()
    call read_int
    mov [int_var_1], eax  ; store b
    push msg_1
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let sum:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store sum
    push msg_8
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load sum
    push eax
    call print_int
    add esp, 4
; let diff:i32 = a - b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_3], eax  ; store diff
    push msg_11
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load diff
    push eax
    call print_int
    add esp, 4
; let product:i32 = a * b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store product
    push msg_13
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load product
    push eax
    call print_int
    add esp, 4
; let quotient:i32 = a / b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_5], eax  ; store quotient
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load a
    push eax
    call print_int
    add esp, 4
    push msg_16
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load b
    push eax
    call print_int
    add esp, 4
    push msg_10
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load quotient
    push eax
    call print_int
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    pop ebp
    ret
