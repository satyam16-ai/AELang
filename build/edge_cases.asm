; Generated NASM by ÆLang Compiler
section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; zero
    int_var_1: resd 1  ; one
    int_var_2: resd 1  ; large
    int_var_3: resd 1  ; zero_add
    int_var_4: resd 1  ; zero_mul
    int_var_5: resd 1  ; one_mul
    int_var_6: resd 1  ; div_by_one

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
; let zero:i32 = 0
    mov eax, 0
    mov [int_var_0], eax  ; store zero
; let one:i32 = 1
    mov eax, 1
    mov [int_var_1], eax  ; store one
; let large:i32 = 1000
    mov eax, 1000
    mov [int_var_2], eax  ; store large
; let zero_add:i32 = zero + 5
    mov eax, [int_var_0]  ; load zero
    push eax
    mov eax, 5
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_3], eax  ; store zero_add
    mov eax, [int_var_3]  ; load zero_add
    push eax
    call print_int
    add esp, 4
; let zero_mul:i32 = zero * 42
    mov eax, [int_var_0]  ; load zero
    push eax
    mov eax, 42
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store zero_mul
    mov eax, [int_var_4]  ; load zero_mul
    push eax
    call print_int
    add esp, 4
; let one_mul:i32 = one * 99
    mov eax, [int_var_1]  ; load one
    push eax
    mov eax, 99
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_5], eax  ; store one_mul
    mov eax, [int_var_5]  ; load one_mul
    push eax
    call print_int
    add esp, 4
; let div_by_one:i32 = large / one
    mov eax, [int_var_2]  ; load large
    push eax
    mov eax, [int_var_1]  ; load one
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov [int_var_6], eax  ; store div_by_one
    mov eax, [int_var_6]  ; load div_by_one
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
