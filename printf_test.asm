section .rodata
    fmt db "%.6f", 10, 0  ; Format string with newline
    align 4
    float_val dd 0x40600000  ; 3.5 in IEEE-754

section .text
    global main
    extern printf

main:
    push ebp
    mov ebp, esp
    
    ; Convert float to double for printf
    fld dword [float_val]   ; Load 32-bit float
    sub esp, 8              ; Make space for double
    fstp qword [esp]        ; Store as 64-bit double
    
    ; Call printf
    push fmt
    call printf
    add esp, 12             ; Clean up (4 for fmt + 8 for double)
    
    mov eax, 0
    pop ebp
    ret
