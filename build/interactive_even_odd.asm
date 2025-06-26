; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔═════════════════════════════════════════╗",0
msg_1 db "║        INTERACTIVE EVEN/ODD CHECKER    ║",0
msg_2 db "║             ÆLang Input Demo            ║",0
msg_3 db "╚═════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 This program will check if your number is even or odd!",0
msg_6 db "Please enter a number: ",0
msg_7 db "You entered: ",0
msg_8 db "Analysis:",0
msg_9 db "Number divided by 2 gives remainder: ",0
msg_10 db "🎉 RESULT: Your number is EVEN!",0
msg_11 db "✅ Even numbers are divisible by 2 with no remainder",0
msg_12 db "🎉 RESULT: Your number is ODD!",0
msg_13 db "✅ Odd numbers leave a remainder of 1 when divided by 2",0
msg_14 db "║              FEATURES USED              ║",0
msg_15 db "╠═════════════════════════════════════════╣",0
msg_16 db "║ ✅ User input with read_int()          ║",0
msg_17 db "║ ✅ Modulo operator (%)                 ║",0
msg_18 db "║ ✅ If/else conditional logic           ║",0
msg_19 db "║ ✅ Comparison operators (==)           ║",0
msg_20 db "║ ✅ Interactive number analysis         ║",0
msg_21 db "🏆 Thank you for testing ÆLang's interactive features!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; user_number
    int_var_1: resd 1  ; remainder

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
extern read_int
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
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
; let user_number:i32 = read_int()
    call read_int
    mov [int_var_0], eax  ; store user_number
    push msg_4
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load user_number
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let remainder:i32 = user_number % 2
    mov eax, [int_var_0]  ; load user_number
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_1], eax  ; store remainder
    push msg_8
    call print
    add esp, 4
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load remainder
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_1]  ; load remainder
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_10
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_12
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
.end_if_0:
; end if statement 0
    push msg_4
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_21
    call print
    add esp, 4
    pop ebp
    ret
