; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "Result: ",0
msg_1 db "40-statement test complete",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; x1
    int_var_1: resd 1  ; x2
    int_var_2: resd 1  ; x3
    int_var_3: resd 1  ; x4
    int_var_4: resd 1  ; x5
    int_var_5: resd 1  ; x6
    int_var_6: resd 1  ; x7
    int_var_7: resd 1  ; x8
    int_var_8: resd 1  ; x9
    int_var_9: resd 1  ; x10
    int_var_10: resd 1  ; x11
    int_var_11: resd 1  ; x12
    int_var_12: resd 1  ; x13
    int_var_13: resd 1  ; x14
    int_var_14: resd 1  ; x15
    int_var_15: resd 1  ; x16
    int_var_16: resd 1  ; x17
    int_var_17: resd 1  ; x18
    int_var_18: resd 1  ; x19
    int_var_19: resd 1  ; x20
    int_var_20: resd 1  ; x21
    int_var_21: resd 1  ; x22
    int_var_22: resd 1  ; x23
    int_var_23: resd 1  ; x24
    int_var_24: resd 1  ; x25
    int_var_25: resd 1  ; x26
    int_var_26: resd 1  ; x27
    int_var_27: resd 1  ; x28
    int_var_28: resd 1  ; x29
    int_var_29: resd 1  ; x30
    int_var_30: resd 1  ; x31
    int_var_31: resd 1  ; x32
    int_var_32: resd 1  ; x33
    int_var_33: resd 1  ; x34
    int_var_34: resd 1  ; x35
    int_var_35: resd 1  ; x36
    int_var_36: resd 1  ; x37
    int_var_37: resd 1  ; x38
    int_var_38: resd 1  ; x39
    int_var_39: resd 1  ; x40
    int_var_40: resd 1  ; result

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
; Unhandled node type UNKNOWN
; let x1:i32 = 1
    mov eax, 1
    mov [int_var_0], eax  ; store x1
; let x2:i32 = 2
    mov eax, 2
    mov [int_var_1], eax  ; store x2
; let x3:i32 = 3
    mov eax, 3
    mov [int_var_2], eax  ; store x3
; let x4:i32 = 4
    mov eax, 4
    mov [int_var_3], eax  ; store x4
; let x5:i32 = 5
    mov eax, 5
    mov [int_var_4], eax  ; store x5
; let x6:i32 = 6
    mov eax, 6
    mov [int_var_5], eax  ; store x6
; let x7:i32 = 7
    mov eax, 7
    mov [int_var_6], eax  ; store x7
; let x8:i32 = 8
    mov eax, 8
    mov [int_var_7], eax  ; store x8
; let x9:i32 = 9
    mov eax, 9
    mov [int_var_8], eax  ; store x9
; let x10:i32 = 10
    mov eax, 10
    mov [int_var_9], eax  ; store x10
; let x11:i32 = 11
    mov eax, 11
    mov [int_var_10], eax  ; store x11
; let x12:i32 = 12
    mov eax, 12
    mov [int_var_11], eax  ; store x12
; let x13:i32 = 13
    mov eax, 13
    mov [int_var_12], eax  ; store x13
; let x14:i32 = 14
    mov eax, 14
    mov [int_var_13], eax  ; store x14
; let x15:i32 = 15
    mov eax, 15
    mov [int_var_14], eax  ; store x15
; let x16:i32 = 16
    mov eax, 16
    mov [int_var_15], eax  ; store x16
; let x17:i32 = 17
    mov eax, 17
    mov [int_var_16], eax  ; store x17
; let x18:i32 = 18
    mov eax, 18
    mov [int_var_17], eax  ; store x18
; let x19:i32 = 19
    mov eax, 19
    mov [int_var_18], eax  ; store x19
; let x20:i32 = 20
    mov eax, 20
    mov [int_var_19], eax  ; store x20
; let x21:i32 = 21
    mov eax, 21
    mov [int_var_20], eax  ; store x21
; let x22:i32 = 22
    mov eax, 22
    mov [int_var_21], eax  ; store x22
; let x23:i32 = 23
    mov eax, 23
    mov [int_var_22], eax  ; store x23
; let x24:i32 = 24
    mov eax, 24
    mov [int_var_23], eax  ; store x24
; let x25:i32 = 25
    mov eax, 25
    mov [int_var_24], eax  ; store x25
; let x26:i32 = 26
    mov eax, 26
    mov [int_var_25], eax  ; store x26
; let x27:i32 = 27
    mov eax, 27
    mov [int_var_26], eax  ; store x27
; let x28:i32 = 28
    mov eax, 28
    mov [int_var_27], eax  ; store x28
; let x29:i32 = 29
    mov eax, 29
    mov [int_var_28], eax  ; store x29
; let x30:i32 = 30
    mov eax, 30
    mov [int_var_29], eax  ; store x30
; let x31:i32 = 31
    mov eax, 31
    mov [int_var_30], eax  ; store x31
; let x32:i32 = 32
    mov eax, 32
    mov [int_var_31], eax  ; store x32
; let x33:i32 = 33
    mov eax, 33
    mov [int_var_32], eax  ; store x33
; let x34:i32 = 34
    mov eax, 34
    mov [int_var_33], eax  ; store x34
; let x35:i32 = 35
    mov eax, 35
    mov [int_var_34], eax  ; store x35
; let x36:i32 = 36
    mov eax, 36
    mov [int_var_35], eax  ; store x36
; let x37:i32 = 37
    mov eax, 37
    mov [int_var_36], eax  ; store x37
; let x38:i32 = 38
    mov eax, 38
    mov [int_var_37], eax  ; store x38
; let x39:i32 = 39
    mov eax, 39
    mov [int_var_38], eax  ; store x39
; let x40:i32 = 40
    mov eax, 40
    mov [int_var_39], eax  ; store x40
; let result:i32 = x1 + x40
    mov eax, [int_var_0]  ; load x1
    push eax
    mov eax, [int_var_39]  ; load x40
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_40], eax  ; store result
    push msg_0
    call print
    add esp, 4
    mov eax, [int_var_40]  ; load result
    push eax
    call print_int
    add esp, 4
    push msg_1
    call print
    add esp, 4
    pop ebp
    ret
