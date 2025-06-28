; Generated NASM by ÆLang Compiler
section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion

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

extern print_bool
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    sub esp, 16  ; allocate space for 3 local variables
; let simple:bool = <EXPR_UNHANDLED>
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-4], eax  ; store simple (local int)
; let complex:bool = <EXPR_UNHANDLED> && <EXPR_UNHANDLED>
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    push eax
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    mov [ebp-8], eax  ; store complex (local int)
; let nested:bool = <EXPR_UNHANDLED>
    mov eax, 1
    push eax
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-12], eax  ; store nested (local int)
    mov eax, [ebp-4]  ; load simple (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-8]  ; load complex (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-12]  ; load nested (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, 0
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
