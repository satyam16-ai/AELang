; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "═══════════════════════════════════",0
msg_1 db "    ÆLANG EVEN/ODD CHECKER",0
msg_2 db "      Modulo & Conditionals",0
msg_3 db "",0
msg_4 db "🔹 Testing even/odd detection:",0
msg_5 db "Test 1 - Number: ",0
msg_6 db "Remainder when divided by 2: ",0
msg_7 db "✅ EVEN number",0
msg_8 db "❌ ODD number",0
msg_9 db "Test 2 - Number: ",0
msg_10 db "❌ EVEN number",0
msg_11 db "✅ ODD number",0
msg_12 db "Test 3 - Number: ",0
msg_13 db "✅ EVEN number (zero is even)",0
msg_14 db "Test 4 - Number: ",0
msg_15 db "Test 5 - Number: ",0
msg_16 db "╔═══════════════════════════════════╗",0
msg_17 db "║        FEATURES DEMONSTRATED     ║",0
msg_18 db "╠═══════════════════════════════════╣",0
msg_19 db "║ ✅ Modulo operator (%)           ║",0
msg_20 db "║ ✅ If/else conditional logic     ║",0
msg_21 db "║ ✅ Comparison operators (==)     ║",0
msg_22 db "║ ✅ Even/odd number detection     ║",0
msg_23 db "║ ✅ Variable assignments          ║",0
msg_24 db "║ ✅ Integer arithmetic            ║",0
msg_25 db "╚═══════════════════════════════════╝",0
msg_26 db "🏆 ÆLang: Even/Odd checker working!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; num1
    int_var_1: resd 1  ; remainder1
    int_var_2: resd 1  ; num2
    int_var_3: resd 1  ; remainder2
    int_var_4: resd 1  ; num3
    int_var_5: resd 1  ; remainder3
    int_var_6: resd 1  ; num4
    int_var_7: resd 1  ; remainder4
    int_var_8: resd 1  ; num5
    int_var_9: resd 1  ; remainder5

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
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_0
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let num1:i32 = 4
    mov eax, 4
    mov [int_var_0], eax  ; store num1
; let remainder1:i32 = num1 % 2
    mov eax, [int_var_0]  ; load num1
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_1], eax  ; store remainder1
    push msg_5
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load num1
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_1]  ; load remainder1
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; if statement 0
    mov eax, [int_var_1]  ; load remainder1
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
    push msg_7
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_8
    call print
    add esp, 4
.end_if_0:
; end if statement 0
    push msg_3
    call print
    add esp, 4
; let num2:i32 = 7
    mov eax, 7
    mov [int_var_2], eax  ; store num2
; let remainder2:i32 = num2 % 2
    mov eax, [int_var_2]  ; load num2
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_3], eax  ; store remainder2
    push msg_9
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load num2
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load remainder2
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; if statement 1
    mov eax, [int_var_3]  ; load remainder2
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_10
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_11
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_3
    call print
    add esp, 4
; let num3:i32 = 0
    mov eax, 0
    mov [int_var_4], eax  ; store num3
; let remainder3:i32 = num3 % 2
    mov eax, [int_var_4]  ; load num3
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_5], eax  ; store remainder3
    push msg_12
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load num3
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load remainder3
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; if statement 2
    mov eax, [int_var_5]  ; load remainder3
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_2
.then_2:
    push msg_13
    call print
    add esp, 4
    jmp .end_if_2
.else_2:
    push msg_8
    call print
    add esp, 4
.end_if_2:
; end if statement 2
    push msg_3
    call print
    add esp, 4
; let num4:i32 = 20
    mov eax, 20
    mov [int_var_6], eax  ; store num4
; let remainder4:i32 = num4 % 2
    mov eax, [int_var_6]  ; load num4
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_7], eax  ; store remainder4
    push msg_14
    call print
    add esp, 4
    mov eax, [int_var_6]  ; load num4
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_7]  ; load remainder4
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; if statement 3
    mov eax, [int_var_7]  ; load remainder4
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_3
.then_3:
    push msg_7
    call print
    add esp, 4
    jmp .end_if_3
.else_3:
    push msg_8
    call print
    add esp, 4
.end_if_3:
; end if statement 3
    push msg_3
    call print
    add esp, 4
; let num5:i32 = 15
    mov eax, 15
    mov [int_var_8], eax  ; store num5
; let remainder5:i32 = num5 % 2
    mov eax, [int_var_8]  ; load num5
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov eax, edx
    mov [int_var_9], eax  ; store remainder5
    push msg_15
    call print
    add esp, 4
    mov eax, [int_var_8]  ; load num5
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    mov eax, [int_var_9]  ; load remainder5
    push eax
    call print_int
    add esp, 4
    push msg_3
    call print
    add esp, 4
; if statement 4
    mov eax, [int_var_9]  ; load remainder5
    push eax
    mov eax, 0
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_4
.then_4:
    push msg_10
    call print
    add esp, 4
    jmp .end_if_4
.else_4:
    push msg_11
    call print
    add esp, 4
.end_if_4:
; end if statement 4
    push msg_3
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
    push msg_21
    call print
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_26
    call print
    add esp, 4
    pop ebp
    ret
