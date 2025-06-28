; Generated NASM by ÆLang Compiler
section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; x

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
; let x:i32 = 5
    mov eax, 5
    mov [int_var_0], eax  ; store x
    mov eax, [int_var_0]  ; load x
    push eax
    call print_int
    add esp, 4
; if statement 0
    mov eax, [int_var_0]  ; load x
    push eax
    mov eax, 3
    mov ebx, eax
    pop eax
    cmp eax, ebx
    setg al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    mov eax, 1
    push eax
    call print_int
    add esp, 4
    jmp .end_if_0
.else_0:
    mov eax, 0
    push eax
    call print_int
    add esp, 4
.end_if_0:
; end if statement 0
    pop ebp
    ret
