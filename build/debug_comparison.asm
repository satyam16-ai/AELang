; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== COMPARISON DEBUG ===",0
msg_1 db "a == c result:",0
msg_2 db "a != c result:",0
msg_3 db "score >= 90:",0
msg_4 db "score >= 80:",0
msg_5 db "=== END DEBUG ===",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; c
    int_var_2: resd 1  ; result1
    int_var_3: resd 1  ; result2
    int_var_4: resd 1  ; score
    int_var_5: resd 1  ; check1
    int_var_6: resd 1  ; check2

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
extern print_bool_clean
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
; let a:i32 = 10
    mov eax, 10
    mov [int_var_0], eax  ; store a
; let c:i32 = 20
    mov eax, 20
    mov [int_var_1], eax  ; store c
; let result1:bool = a == c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    sete al
    movzx eax, al
    mov [int_var_2], eax  ; store result1 (bool)
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_2]  ; load result1
    push eax
    call print_bool_clean
    add esp, 4
; let result2:bool = a != c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load c
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setne al
    movzx eax, al
    mov [int_var_3], eax  ; store result2 (bool)
    push msg_2
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load result2
    push eax
    call print_bool_clean
    add esp, 4
; let score:i32 = 85
    mov eax, 85
    mov [int_var_4], eax  ; store score
; let check1:bool = score >= 90
    mov eax, [int_var_4]  ; load score
    push eax
    mov eax, 90
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_5], eax  ; store check1 (bool)
    push msg_3
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load check1
    push eax
    call print_bool_clean
    add esp, 4
; let check2:bool = score >= 80
    mov eax, [int_var_4]  ; load score
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setge al
    movzx eax, al
    mov [int_var_6], eax  ; store check2 (bool)
    push msg_4
    call print
    add esp, 4
    mov eax, [int_var_6]  ; load check2
    push eax
    call print_bool_clean
    add esp, 4
    push msg_5
    call print
    add esp, 4
    pop ebp
    ret
