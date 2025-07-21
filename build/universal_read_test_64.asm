; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Enter your age: ",0
msg_1 db "Enter your height: ",0
msg_2 db "Are you a student? (true/false): ",0
msg_3 db "Enter your name: ",0
msg_4 db "Results:",10,"",0
msg_5 db "Age: %d",10,"",0
msg_6 db "Height: %.2f",10,"",0
msg_7 db "Student: %t",10,"",0
msg_8 db "Name: %s",10,"",0
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
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    sub esp, 16  ; allocate space for 4 local variables
    push msg_0
    call print
    add esp, 4
; let age:i32 = read()
    ; Universal read() -> read_i32() for type i32 (32-bit)
    call read_i32
    mov dword [ebp-4], eax  ; store age (local int)
    push msg_1
    call print
    add esp, 4
; let height:f32 = read()
    ; Universal read() -> read_f32() for type f32 (32-bit)
    call read_f32
    ; read_f32() returns float on FPU stack ST(0) in 32-bit
    fstp dword [ebp-8]  ; store height (local float)
    push msg_2
    call print
    add esp, 4
; let is_student:bool = read()
    ; Universal read() -> read_bool() for type bool (32-bit)
    call read_bool
    mov dword [ebp-12], eax  ; store is_student (local int)
    push msg_3
    call print
    add esp, 4
; let name:str = read()
    ; Universal read() -> read_str() for type str (32-bit)
    call read_str
    mov dword [ebp-16], eax  ; store name (local int)
    push msg_4
    call print
    add esp, 4
    mov eax, dword [ebp-4]  ; load age (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_5
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    fld dword [ebp-8]  ; load height (stack, f32/float)
    sub esp, 8
    fstp qword [esp]  ; push float argument 1 (promoted to double)
    mov eax, msg_6
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 12  ; clean up 2 arguments (32-bit)
    mov eax, dword [ebp-12]  ; load is_student (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_7
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov eax, dword [ebp-16]  ; load name (stack)
    push eax  ; push argument 1 (32-bit)
    mov eax, msg_8
    push eax  ; push argument 0 (32-bit)
    call print
    add esp, 8  ; clean up 2 arguments (32-bit)
    mov esp, ebp  ; restore stack pointer
    pop ebp
    ret
