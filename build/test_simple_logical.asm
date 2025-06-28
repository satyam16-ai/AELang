; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== SIMPLE LOGICAL TEST ===",0
msg_1 db "Constants working!",0
msg_2 db "true && false = true (wrong!)",0
msg_3 db "true && false = false (correct!)",0
msg_4 db "true || false = true (correct!)",0
msg_5 db "true || false = false (wrong!)",0
msg_6 db "Basic logical operators work!",0
fmt_float: db "%f", 10, 0

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

extern print
extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    sub esp, 16  ; allocate space for 4 local variables
    push msg_0
    call print
    add esp, 4
; let FLAG:bool = 1
    mov eax, 1
    mov [ebp-4], eax  ; store FLAG (local int)
; let enabled:bool = FLAG
    mov eax, [ebp-4]  ; load FLAG (stack)
    mov [ebp-8], eax  ; store enabled (local int)
    push msg_1
    call print
    add esp, 4
; let a:bool = 1
    mov eax, 1
    mov [ebp-12], eax  ; store a (local int)
; let b:bool = 0
    mov eax, 0
    mov [ebp-16], eax  ; store b (local int)
; if statement 0
    mov eax, [ebp-12]  ; load a (stack)
    push eax
    mov eax, [ebp-16]  ; load b (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    and eax, ebx
    cmp eax, 0
    je .else_0
.then_0:
    push msg_2
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_3
    call print
    add esp, 4
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, [ebp-12]  ; load a (stack)
    push eax
    mov eax, [ebp-16]  ; load b (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    cmp eax, 0
    je .else_1
.then_1:
    push msg_4
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_5
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_6
    call print
    add esp, 4
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
