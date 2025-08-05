; Generated NASM by ÆLang IR-to-Assembly Compiler
; Target Architecture: 32-bit

section .rodata
    align 4
msg_0 db "Enter first number: ",0
msg_1 db "Enter second number: ",0
msg_2 db "Sum: %d + %d = %d\\n",0
msg_3 db "Difference: %d - %d = %d\\n",0
msg_4 db "Product: %d * %d = %d\\n",0
msg_5 db "Quotient: %d / %d = %d\\n",0
msg_6 db "Modulo: %d %% %d = %d\\n",0

section .bss
    align 4
    temp_storage: resd 1  ; temporary storage

section .text
    global main
    extern printf
    extern print
    extern read
    extern read_i8
    extern read_i16
    extern read_i32
    extern read_i64
    extern read_u8
    extern read_u16
    extern read_u32
    extern read_u64
    extern read_f32
    extern read_f64
    extern read_num
    extern read_char

main:
    push ebp
    mov ebp, esp
    sub esp, 212
    ; IR: LOAD_CONST dest src1
    mov eax, msg_0
    mov dword [ebp-32], eax
    ; IR: PARAM src1
    push dword [ebp-32]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read_i32
    mov dword [ebp-40], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-40]
    mov dword [ebp-4], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_1
    mov dword [ebp-44], eax
    ; IR: PARAM src1
    push dword [ebp-44]
    ; IR: CALL src1
    call print
    ; IR: CALL dest src1
    call read_i32
    mov dword [ebp-52], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-52]
    mov dword [ebp-8], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-56], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-60], eax
    ; IR: ADD dest src1 src2
    mov eax, dword [ebp-56]
    mov ebx, dword [ebp-60]
    add eax, ebx
    mov dword [ebp-64], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-64]
    mov dword [ebp-12], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-68], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-72], eax
    ; IR: SUB dest src1 src2
    mov eax, dword [ebp-68]
    mov ebx, dword [ebp-72]
    sub eax, ebx
    mov dword [ebp-76], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-76]
    mov dword [ebp-16], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-80], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-84], eax
    ; IR: MUL dest src1 src2
    mov eax, dword [ebp-80]
    mov ebx, dword [ebp-84]
    imul eax, ebx
    mov dword [ebp-88], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-88]
    mov dword [ebp-20], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-92], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-96], eax
    ; IR: DIV dest src1 src2
    mov eax, dword [ebp-92]
    mov ebx, dword [ebp-96]
    cdq
    idiv ebx
    mov dword [ebp-100], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-100]
    mov dword [ebp-24], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-104], eax
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-108], eax
    ; IR: MOD dest src1 src2
    mov eax, dword [ebp-104]
    mov ebx, dword [ebp-108]
    cdq
    idiv ebx
    mov eax, edx
    mov dword [ebp-112], eax
    ; IR: STORE_VAR src1 src2
    mov eax, dword [ebp-112]
    mov dword [ebp-28], eax
    ; IR: LOAD_CONST dest src1
    mov eax, msg_2
    mov dword [ebp-116], eax
    ; IR: PARAM src1
    push dword [ebp-116]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-120], eax
    ; IR: PARAM src1
    push dword [ebp-120]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-124], eax
    ; IR: PARAM src1
    push dword [ebp-124]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-12]
    mov dword [ebp-128], eax
    ; IR: PARAM src1
    push dword [ebp-128]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_3
    mov dword [ebp-136], eax
    ; IR: PARAM src1
    push dword [ebp-136]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-140], eax
    ; IR: PARAM src1
    push dword [ebp-140]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-144], eax
    ; IR: PARAM src1
    push dword [ebp-144]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-16]
    mov dword [ebp-148], eax
    ; IR: PARAM src1
    push dword [ebp-148]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_4
    mov dword [ebp-156], eax
    ; IR: PARAM src1
    push dword [ebp-156]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-160], eax
    ; IR: PARAM src1
    push dword [ebp-160]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-164], eax
    ; IR: PARAM src1
    push dword [ebp-164]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-20]
    mov dword [ebp-168], eax
    ; IR: PARAM src1
    push dword [ebp-168]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_5
    mov dword [ebp-176], eax
    ; IR: PARAM src1
    push dword [ebp-176]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-180], eax
    ; IR: PARAM src1
    push dword [ebp-180]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-184], eax
    ; IR: PARAM src1
    push dword [ebp-184]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-24]
    mov dword [ebp-188], eax
    ; IR: PARAM src1
    push dword [ebp-188]
    ; IR: CALL src1
    call print
    ; IR: LOAD_CONST dest src1
    mov eax, msg_6
    mov dword [ebp-196], eax
    ; IR: PARAM src1
    push dword [ebp-196]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-4]
    mov dword [ebp-200], eax
    ; IR: PARAM src1
    push dword [ebp-200]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-8]
    mov dword [ebp-204], eax
    ; IR: PARAM src1
    push dword [ebp-204]
    ; IR: LOAD_VAR dest src1
    mov eax, dword [ebp-28]
    mov dword [ebp-208], eax
    ; IR: PARAM src1
    push dword [ebp-208]
    ; IR: CALL src1
    call print
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret


; End of generated code
