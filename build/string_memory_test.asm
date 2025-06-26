; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "=== String Literal Memory Test ===",0
msg_1 db "Testing string allocation and cleanup",0
msg_2 db "This test pushes string literal limits",0
msg_3 db "Each string uses memory in the data section",0
msg_4 db "Checking for string literal leaks or corruption",0
msg_5 db "Testing with multiple identical strings",0
msg_6 db "Testing with unique strings for each call",0
msg_7 db "String deduplication and memory efficiency",0
msg_8 db "Unicode and special character handling",0
msg_9 db "Long string content to test buffer limits",0
msg_10 db "String literal garbage collection testing",0
msg_11 db "Memory fragmentation with many strings",0
msg_12 db "String interning and optimization checks",0
msg_13 db "Buffer overflow protection validation",0
msg_14 db "String memory alignment and padding",0
msg_15 db "Cross-platform string encoding tests",0
msg_16 db "Performance with high string volume",0
msg_17 db "Memory leak detection for strings",0
msg_18 db "String reference counting validation",0
msg_19 db "Dynamic string allocation patterns",0
msg_20 db "String memory pool management",0
msg_21 db "Test value: ",0
msg_22 db "String literal memory test completed!",0
msg_23 db "✓ All strings allocated successfully",0
msg_24 db "✓ No memory corruption detected",0
msg_25 db "✓ String cleanup functioning",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    int_var_0: resd 1  ; test_val

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
    push msg_1
    call print
    add esp, 4
    push msg_2
    call print
    add esp, 4
    push msg_3
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_5
    call print
    add esp, 4
    push msg_6
    call print
    add esp, 4
    push msg_7
    call print
    add esp, 4
    push msg_8
    call print
    add esp, 4
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
    push msg_16
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print
    add esp, 4
    push msg_19
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
; let test_val:i32 = 42
    mov eax, 42
    mov [int_var_0], eax  ; store test_val
    push msg_21
    call print
    add esp, 4
    mov eax, [int_var_0]  ; load test_val
    push eax
    call print_int
    add esp, 4
    push msg_22
    call print
    add esp, 4
    push msg_23
    call print
    add esp, 4
    push msg_24
    call print
    add esp, 4
    push msg_25
    call print
    add esp, 4
    pop ebp
    ret
