; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== Complex Expression Test ===",0
msg_1 db "Simple: a + b =",0
msg_2 db "Complex: (a + b) * (c - 1) =",0
msg_3 db "Nested: ((a + b) * c) + ((a - b) / c) =",0
msg_4 db "Complex expression test completed!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; a
    int_var_1: resd 1  ; b
    int_var_2: resd 1  ; c
    int_var_3: resd 1  ; simple
    int_var_4: resd 1  ; complex
    int_var_5: resd 1  ; nested

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
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
; let b:i32 = 5
    mov eax, 5
    mov [int_var_1], eax  ; store b
; let c:i32 = 3
    mov eax, 3
    mov [int_var_2], eax  ; store c
; let simple:i32 = a + b
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_3], eax  ; store simple
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_3]  ; load simple
    push eax
    call print_int
    add esp, 4
; let complex:i32 = a + b * c - 1
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_2]  ; load c
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store complex
    push msg_2
    call print
    add esp, 4
    mov eax, [int_var_4]  ; load complex
    push eax
    call print_int
    add esp, 4
; let nested:i32 = a + b * c + a - b / c
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, [int_var_0]  ; load a
    push eax
    mov eax, [int_var_1]  ; load b
    mov ebx, eax
    pop eax
    sub eax, ebx
    push eax
    mov eax, [int_var_2]  ; load c
    mov ebx, eax
    pop eax
    xor edx, edx
    mov ecx, ebx
    div ecx
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_5], eax  ; store nested
    push msg_3
    call print
    add esp, 4
    mov eax, [int_var_5]  ; load nested
    push eax
    call print_int
    add esp, 4
    push msg_4
    call print
    add esp, 4
    pop ebp
    ret
