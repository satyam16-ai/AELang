; Generated NASM by ÆLang Compiler
section .text
    global main

extern print_int
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
; let x:i32 = 20
    mov eax, 20
; let y:i32 = 20
    mov eax, 20
; let res:i32 = x + y + 80
; Unhandled node type AST_IDENTIFIER
    push eax
; Unhandled node type AST_IDENTIFIER
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, 80
    mov ebx, eax
    pop eax
    add eax, ebx
; Unhandled node type AST_IDENTIFIER
    push eax
    call print_int
    add esp, 4
    mov eax, 1
    int 0x80 ; halt
    pop ebp
    ret
