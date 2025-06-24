section .rodata
    align 4
LC2:
    dd 1080033280  ; 3.5 in IEEE-754 decimal format

section .text
    global main
    extern print_float

main:
    ; GCC-style function prologue
    lea ecx, [esp+4]
    and esp, -16
    push dword [ecx-4]
    push ebp
    mov ebp, esp
    push ecx
    sub esp, 20
    
    ; Load float and store to local variable
    fld dword [LC2]
    fstp dword [ebp-12]
    
    ; Push argument and call
    sub esp, 12
    push dword [ebp-12]
    call print_float
    add esp, 16
    
    ; Return 0
    mov eax, 0
    mov ecx, [ebp-4]
    leave
    lea esp, [ecx-4]
    ret
