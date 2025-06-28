; Generated NASM by ÆLang Compiler
section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; c
    int_var_3: resd 1  ; d
    int_var_4: resd 1  ; unused
    int_var_5: resd 1  ; x
    int_var_6: resd 1  ; y

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
; let a:i32 = 10
    mov eax, 10
    mov [int_var_0], eax  ; store a
; let b:i32 = 20
    mov eax, 20
    mov [int_var_1], eax  ; store b
; let c:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_2], eax  ; store c
; let d:i32 = c * 2
    mov eax, [int_var_2]  ; load c
    push eax
    mov eax, 2
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_3], eax  ; store d
; let unused:i32 = 999
    mov eax, 999
    mov [int_var_4], eax  ; store unused
    mov eax, [int_var_3]  ; load d
    push eax
    call print_int
    add esp, 4
; let x:i32 = 5
    mov eax, 5
    mov [int_var_5], eax  ; store x
; let y:i32 = x + x
    mov eax, [int_var_5]  ; load x
    push eax
    mov eax, [int_var_5]  ; load x
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_6], eax  ; store y
    mov eax, [int_var_6]  ; load y
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
