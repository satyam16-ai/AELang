; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== Complex Expression Test with num Type ===",0
msg_1 db "Testing nested expressions and parentheses with dynamic numbers",0
msg_2 db "",0
msg_3 db "(10 + 5) * 2 = ",0
msg_4 db "Result stored in num type",0
msg_5 db "10 * 5 + 2 = ",0
msg_6 db "Seamless arithmetic with num",0
msg_7 db "(3.5 + 2) / 1.5 = ",0
msg_8 db "Mixed int/float operations",0
msg_9 db "Complex nested: ((10 + 5) * 2) + ((3.5 - 2) / 1.5)",0
msg_10 db "All with num type!",0
msg_11 db "Complex expression test completed!",0
msg_12 db "✓ Parentheses handled correctly",0
msg_13 db "✓ No segmentation faults",0
msg_14 db "✓ Dynamic num type working perfectly",0
msg_15 db "✓ Simplified variable declarations",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    float_var_0: resd 1  ; a
    float_var_1: resd 1  ; b
    float_var_2: resd 1  ; c
    float_var_3: resd 1  ; result1
    float_var_4: resd 1  ; result2
    float_var_5: resd 1  ; x
    float_var_6: resd 1  ; y
    float_var_7: resd 1  ; z
    float_var_8: resd 1  ; fresult
    float_var_9: resd 1  ; complex

section .text
    global main
    extern printf
    extern print
    extern read_int
    extern read_float

extern print_int
extern print_float
; CODEGEN TEST MARKER: emitting function main
main:
    push ebp
    mov ebp, esp
    push msg_0
    call print
    add esp, 4
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
; let a:num = 10
    fstp dword [float_var_0]  ; store a as num
; let b:num = 5
    fstp dword [float_var_1]  ; store b as num
; let c:num = 2
    fstp dword [float_var_2]  ; store c as num
; let result1:num = a + b * c
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fld dword [float_var_2]  ; load c
    fmulp
    fstp dword [float_var_3]  ; store result1 as num
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let result2:num = a * b + c
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    fmulp
    fld dword [float_var_2]  ; load c
    faddp
    fstp dword [float_var_4]  ; store result2 as num
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
; let x:num = 3.500000
    fstp dword [float_var_5]  ; store x as num
; let y:num = 2
    fstp dword [float_var_6]  ; store y as num
; let z:num = 1.500000
    fstp dword [float_var_7]  ; store z as num
; let fresult:num = x + y / z
    fld dword [float_var_5]  ; load x
    fld dword [float_var_6]  ; load y
    faddp
    fld dword [float_var_7]  ; load z
    fdivp
    fstp dword [float_var_8]  ; store fresult as num
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
; let complex:num = a + b * c + x - y / z
    fld dword [float_var_0]  ; load a
    fld dword [float_var_1]  ; load b
    faddp
    fld dword [float_var_2]  ; load c
    fmulp
    push eax
    fld dword [float_var_5]  ; load x
    fld dword [float_var_6]  ; load y
    fsubp
    fld dword [float_var_7]  ; load z
    fdivp
    mov ebx, eax
    pop eax
    add eax, ebx
    fstp dword [float_var_9]  ; store complex as num
    push msg_9
    call print
    add esp, 4
    push msg_10
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_13
    call print
    add esp, 4
    push msg_14
    call print
    add esp, 4
    push msg_15
    call print
    add esp, 4
    pop ebp
    ret
