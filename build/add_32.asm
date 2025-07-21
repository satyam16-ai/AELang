; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Sum: %d",10,"",0
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
    extern read_bool
    extern read_char
    extern read_str

extern print
extern read
; CODEGEN TEST MARKER: emitting function add
add:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]  ; load parameter a
    push eax
    mov eax, [ebp+12]  ; load parameter b
    mov ebx, eax
    pop eax
    add eax, ebx
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    sub esp, 16  ; allocate space for 3 local variables
; let x:i32 = 5
    mov eax, 5
    mov dword [ebp-4], eax  ; store x (local int)
; let y:i32 = 7
    mov eax, 7
    mov dword [ebp-8], eax  ; store y (local int)
; let sum:i32 = add(x, y)
    mov eax, dword [ebp-8]  ; load y (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, dword [ebp-4]  ; load x (stack)
    push eax  ; push argument 0 (32-bit)
    call add
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov dword [ebp-12], eax  ; store sum (local int)
    mov eax, dword [ebp-12]  ; load sum (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_0
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
