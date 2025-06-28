; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== COMPREHENSIVE UNARY NOT TEST ===",0
msg_1 db "Test 1: Basic unary NOT",0
msg_2 db "Test 2: Double negation",0
msg_3 db "Test 3: Unary NOT with variables",0
msg_4 db "Test 4: Complex boolean expressions",0
msg_5 db "Test 5: Unary NOT in if conditions",0
msg_6 db "!false is true - PASS",0
msg_7 db "!false is false - FAIL",0
msg_8 db "!true is true - FAIL",0
msg_9 db "!true is false - PASS",0
msg_10 db "Test 6: Nested expressions",0
msg_11 db "=== ALL TESTS COMPLETED ===",0
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
extern print_bool
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    sub esp, 64  ; allocate space for 14 local variables
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
; let a:bool = <EXPR_UNHANDLED>
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-4], eax  ; store a (local int)
; let b:bool = <EXPR_UNHANDLED>
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-8], eax  ; store b (local int)
    mov eax, [ebp-4]  ; load a (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-8]  ; load b (stack)
    push eax
    call print_bool
    add esp, 4
    push msg_2
    call print
    add esp, 4
; let c:bool = <EXPR_UNHANDLED>
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-12], eax  ; store c (local int)
; let d:bool = <EXPR_UNHANDLED>
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-16], eax  ; store d (local int)
    mov eax, [ebp-12]  ; load c (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-16]  ; load d (stack)
    push eax
    call print_bool
    add esp, 4
    push msg_3
    call print
    add esp, 4
; let x:bool = 1
    mov eax, 1
    mov [ebp-20], eax  ; store x (local int)
; let y:bool = 0
    mov eax, 0
    mov [ebp-24], eax  ; store y (local int)
; let nx:bool = <EXPR_UNHANDLED>
    mov eax, [ebp-20]  ; load x (stack)
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-28], eax  ; store nx (local int)
; let ny:bool = <EXPR_UNHANDLED>
    mov eax, [ebp-24]  ; load y (stack)
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-32], eax  ; store ny (local int)
    mov eax, [ebp-28]  ; load nx (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-32]  ; load ny (stack)
    push eax
    call print_bool
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let expr1:bool = <EXPR_UNHANDLED>
    mov eax, 1
    push eax
    mov eax, 0
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
    mov [ebp-36], eax  ; store expr1 (local int)
; let expr2:bool = <EXPR_UNHANDLED>
    mov eax, 0
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-40], eax  ; store expr2 (local int)
; let expr3:bool = <EXPR_UNHANDLED> && <EXPR_UNHANDLED>
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
    mov [ebp-44], eax  ; store expr3 (local int)
; let expr4:bool = <EXPR_UNHANDLED> || <EXPR_UNHANDLED>
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    push eax
    mov eax, 1
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
    or eax, ebx
    mov [ebp-48], eax  ; store expr4 (local int)
    mov eax, [ebp-36]  ; load expr1 (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-40]  ; load expr2 (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-44]  ; load expr3 (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-48]  ; load expr4 (stack)
    push eax
    call print_bool
    add esp, 4
    push msg_5
    call print
    add esp, 4
; if statement 0
    mov eax, 0
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_0
.then_0:
    push msg_6
    call print
    add esp, 4
    jmp .end_if_0
.else_0:
    push msg_7
    call print
    add esp, 4
.end_if_0:
; end if statement 0
; if statement 1
    mov eax, 1
    test eax, eax
    sete al
    movzx eax, al
    cmp eax, 0
    je .else_1
.then_1:
    push msg_8
    call print
    add esp, 4
    jmp .end_if_1
.else_1:
    push msg_9
    call print
    add esp, 4
.end_if_1:
; end if statement 1
    push msg_10
    call print
    add esp, 4
; let nested1:bool = <EXPR_UNHANDLED>
    mov eax, [ebp-20]  ; load x (stack)
    push eax
    mov eax, [ebp-24]  ; load y (stack)
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
    mov [ebp-52], eax  ; store nested1 (local int)
; let nested2:bool = <EXPR_UNHANDLED>
    mov eax, [ebp-20]  ; load x (stack)
    test eax, eax
    sete al
    movzx eax, al
    push eax
    mov eax, [ebp-24]  ; load y (stack)
    mov ebx, eax
    pop eax
    test eax, eax
    setne al
    movzx eax, al
    test ebx, ebx
    setne bl
    movzx ebx, bl
    or eax, ebx
    test eax, eax
    sete al
    movzx eax, al
    mov [ebp-56], eax  ; store nested2 (local int)
    mov eax, [ebp-52]  ; load nested1 (stack)
    push eax
    call print_bool
    add esp, 4
    mov eax, [ebp-56]  ; load nested2 (stack)
    push eax
    call print_bool
    add esp, 4
    push msg_11
    call print
    add esp, 4
    mov eax, 0
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
