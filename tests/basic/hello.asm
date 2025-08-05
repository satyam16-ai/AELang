section .rodata
align 4
msg_0 db "Hello, ÆLang!",10,0

section .bss
align 4
temp_storage: resd 1 ; temporary storage

section .text
global main
extern printf
extern read
extern read_with_type

main:
push ebp
mov ebp, esp
sub esp, 8
mov eax, msg_0
mov dword [ebp-4], eax
push dword [ebp-4]
call printf
add esp, 4 ; clean up stack
mov eax, 0
mov esp, ebp
pop ebp
ret
