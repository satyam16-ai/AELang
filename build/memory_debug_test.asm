; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== ÆLang Memory Issue Test ===",0
msg_1 db "Statement test completed",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; a1
    int_var_1: resd 1  ; a2
    int_var_2: resd 1  ; a3
    int_var_3: resd 1  ; a4
    int_var_4: resd 1  ; a5
    int_var_5: resd 1  ; a6
    int_var_6: resd 1  ; a7
    int_var_7: resd 1  ; a8
    int_var_8: resd 1  ; a9
    int_var_9: resd 1  ; a10
    int_var_10: resd 1  ; a11
    int_var_11: resd 1  ; a12
    int_var_12: resd 1  ; a13
    int_var_13: resd 1  ; a14
    int_var_14: resd 1  ; a15
    int_var_15: resd 1  ; a16
    int_var_16: resd 1  ; a17
    int_var_17: resd 1  ; a18
    int_var_18: resd 1  ; a19
    int_var_19: resd 1  ; a20
    int_var_20: resd 1  ; a21
    int_var_21: resd 1  ; a22
    int_var_22: resd 1  ; a23
    int_var_23: resd 1  ; a24
    int_var_24: resd 1  ; a25
    int_var_25: resd 1  ; a26
    int_var_26: resd 1  ; a27
    int_var_27: resd 1  ; a28
    int_var_28: resd 1  ; a29
    int_var_29: resd 1  ; a30
    int_var_30: resd 1  ; a31
    int_var_31: resd 1  ; a32
    int_var_32: resd 1  ; a33
    int_var_33: resd 1  ; a34
    int_var_34: resd 1  ; a35
    int_var_35: resd 1  ; a36
    int_var_36: resd 1  ; a37
    int_var_37: resd 1  ; a38
    int_var_38: resd 1  ; a39
    int_var_39: resd 1  ; a40
    int_var_40: resd 1  ; a41
    int_var_41: resd 1  ; a42
    int_var_42: resd 1  ; a43
    int_var_43: resd 1  ; a44
    int_var_44: resd 1  ; a45
    int_var_45: resd 1  ; a46
    int_var_46: resd 1  ; a47
    int_var_47: resd 1  ; a48
    int_var_48: resd 1  ; a49
    int_var_49: resd 1  ; a50

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
; let a1:i32 = 1
    mov eax, 1
    mov [int_var_0], eax  ; store a1
; let a2:i32 = 2
    mov eax, 2
    mov [int_var_1], eax  ; store a2
; let a3:i32 = 3
    mov eax, 3
    mov [int_var_2], eax  ; store a3
; let a4:i32 = 4
    mov eax, 4
    mov [int_var_3], eax  ; store a4
; let a5:i32 = 5
    mov eax, 5
    mov [int_var_4], eax  ; store a5
; let a6:i32 = 6
    mov eax, 6
    mov [int_var_5], eax  ; store a6
; let a7:i32 = 7
    mov eax, 7
    mov [int_var_6], eax  ; store a7
; let a8:i32 = 8
    mov eax, 8
    mov [int_var_7], eax  ; store a8
; let a9:i32 = 9
    mov eax, 9
    mov [int_var_8], eax  ; store a9
; let a10:i32 = 10
    mov eax, 10
    mov [int_var_9], eax  ; store a10
; let a11:i32 = 11
    mov eax, 11
    mov [int_var_10], eax  ; store a11
; let a12:i32 = 12
    mov eax, 12
    mov [int_var_11], eax  ; store a12
; let a13:i32 = 13
    mov eax, 13
    mov [int_var_12], eax  ; store a13
; let a14:i32 = 14
    mov eax, 14
    mov [int_var_13], eax  ; store a14
; let a15:i32 = 15
    mov eax, 15
    mov [int_var_14], eax  ; store a15
; let a16:i32 = 16
    mov eax, 16
    mov [int_var_15], eax  ; store a16
; let a17:i32 = 17
    mov eax, 17
    mov [int_var_16], eax  ; store a17
; let a18:i32 = 18
    mov eax, 18
    mov [int_var_17], eax  ; store a18
; let a19:i32 = 19
    mov eax, 19
    mov [int_var_18], eax  ; store a19
; let a20:i32 = 20
    mov eax, 20
    mov [int_var_19], eax  ; store a20
; let a21:i32 = 21
    mov eax, 21
    mov [int_var_20], eax  ; store a21
; let a22:i32 = 22
    mov eax, 22
    mov [int_var_21], eax  ; store a22
; let a23:i32 = 23
    mov eax, 23
    mov [int_var_22], eax  ; store a23
; let a24:i32 = 24
    mov eax, 24
    mov [int_var_23], eax  ; store a24
; let a25:i32 = 25
    mov eax, 25
    mov [int_var_24], eax  ; store a25
; let a26:i32 = 26
    mov eax, 26
    mov [int_var_25], eax  ; store a26
; let a27:i32 = 27
    mov eax, 27
    mov [int_var_26], eax  ; store a27
; let a28:i32 = 28
    mov eax, 28
    mov [int_var_27], eax  ; store a28
; let a29:i32 = 29
    mov eax, 29
    mov [int_var_28], eax  ; store a29
; let a30:i32 = 30
    mov eax, 30
    mov [int_var_29], eax  ; store a30
; let a31:i32 = 31
    mov eax, 31
    mov [int_var_30], eax  ; store a31
; let a32:i32 = 32
    mov eax, 32
    mov [int_var_31], eax  ; store a32
; let a33:i32 = 33
    mov eax, 33
    mov [int_var_32], eax  ; store a33
; let a34:i32 = 34
    mov eax, 34
    mov [int_var_33], eax  ; store a34
; let a35:i32 = 35
    mov eax, 35
    mov [int_var_34], eax  ; store a35
; let a36:i32 = 36
    mov eax, 36
    mov [int_var_35], eax  ; store a36
; let a37:i32 = 37
    mov eax, 37
    mov [int_var_36], eax  ; store a37
; let a38:i32 = 38
    mov eax, 38
    mov [int_var_37], eax  ; store a38
; let a39:i32 = 39
    mov eax, 39
    mov [int_var_38], eax  ; store a39
; let a40:i32 = 40
    mov eax, 40
    mov [int_var_39], eax  ; store a40
; let a41:i32 = 41
    mov eax, 41
    mov [int_var_40], eax  ; store a41
; let a42:i32 = 42
    mov eax, 42
    mov [int_var_41], eax  ; store a42
; let a43:i32 = 43
    mov eax, 43
    mov [int_var_42], eax  ; store a43
; let a44:i32 = 44
    mov eax, 44
    mov [int_var_43], eax  ; store a44
; let a45:i32 = 45
    mov eax, 45
    mov [int_var_44], eax  ; store a45
; let a46:i32 = 46
    mov eax, 46
    mov [int_var_45], eax  ; store a46
; let a47:i32 = 47
    mov eax, 47
    mov [int_var_46], eax  ; store a47
; let a48:i32 = 48
    mov eax, 48
    mov [int_var_47], eax  ; store a48
; let a49:i32 = 49
    mov eax, 49
    mov [int_var_48], eax  ; store a49
; let a50:i32 = 50
    mov eax, 50
    mov [int_var_49], eax  ; store a50
    push msg_1
    call print
    add esp, 4
    mov eax, [int_var_49]  ; load a50
    push eax
    call print_int
    add esp, 4
    pop ebp
    ret
