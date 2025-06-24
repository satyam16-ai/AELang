section .data
msg_0 db "Hello, World!\n",0
; Generated NASM by ÆLang Compiler
section .text
    global _start

_start:
    call main
    mov eax, 1
    int 0x80 ; exit

extern print
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    pop ebp
    ret
