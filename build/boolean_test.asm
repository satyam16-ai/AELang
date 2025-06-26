; Generated NASM by ÆLang Compiler
section .rodata
    align 4
msg_0 db "╔══════════════════════════════════════════════════════════╗",0
msg_1 db "║              ÆLANG BOOLEAN TYPE DEMONSTRATION            ║",0
msg_2 db "║                Complete Boolean Operations               ║",0
msg_3 db "╚══════════════════════════════════════════════════════════╝",0
msg_4 db "",0
msg_5 db "🎯 Boolean Type Features:",0
msg_6 db "   • Boolean literals: true, false",0
msg_7 db "   • Boolean variables with bool type",0
msg_8 db "   • Boolean I/O operations",0
msg_9 db "   • Logical operations and comparisons",0
msg_10 db "   • Mixed boolean/numeric operations",0
msg_11 db "═══════════════════════════════════════════════════════════",0
msg_12 db "📊 SECTION 1: BOOLEAN LITERALS AND VARIABLES",0
msg_13 db "✅ Boolean Variables Declared:",0
msg_14 db "   is_active = ",0
msg_15 db "   is_finished = ",0
msg_16 db "   result = ",0
msg_17 db "🔢 Numeric Representation:",0
msg_18 db "   is_active (numeric) = ",0
msg_19 db "   is_finished (numeric) = ",0
msg_20 db "🧮 SECTION 2: BOOLEAN ARITHMETIC AND OPERATIONS",0
msg_21 db "🔢 Boolean Arithmetic (as 0/1):",0
msg_22 db "   true + false = ",0
msg_23 db " (",0
msg_24 db ")",0
msg_25 db "   true * true = ",0
msg_26 db "   true - false = ",0
msg_27 db "🌟 SECTION 3: PRACTICAL BOOLEAN APPLICATIONS",0
msg_28 db "🚦 Traffic Light System:",0
msg_29 db "   Green light: ",0
msg_30 db "   Red light: ",0
msg_31 db "   Can proceed: ",0
msg_32 db "💼 System Status Monitoring:",0
msg_33 db "   Server Online: ",0
msg_34 db "   Database Connected: ",0
msg_35 db "   Maintenance Mode: ",0
msg_36 db "   System Ready: ",0
msg_37 db "🔐 Access Control System:",0
msg_38 db "   Has Permission: ",0
msg_39 db "   Is Authenticated: ",0
msg_40 db "   Account Active: ",0
msg_41 db "   Access Granted: ",0
msg_42 db "🎯 SECTION 4: INTERACTIVE BOOLEAN INPUT",0
msg_43 db "📝 Interactive Boolean Demo:",0
msg_44 db "   (Accepts: true/false, 1/0, yes/no, y/n)",0
msg_45 db "Enter a boolean value (true/false): ",0
msg_46 db "✅ Input Processing Results:",0
msg_47 db "   You entered: ",0
msg_48 db "   Numeric value: ",0
msg_49 db "   Inverted value: ",0
msg_50 db "🎉 BOOLEAN TYPE SUMMARY",0
msg_51 db "✅ FEATURES DEMONSTRATED:",0
msg_52 db "   🔹 Boolean literal declarations (true/false)",0
msg_53 db "   🔹 Boolean variable storage and retrieval",0
msg_54 db "   🔹 Boolean arithmetic operations (as 0/1)",0
msg_55 db "   🔹 Multiple boolean output formats",0
msg_56 db "   🔹 Flexible boolean input parsing",0
msg_57 db "   🔹 Real-world boolean applications",0
msg_58 db "   🔹 System status and control logic",0
msg_59 db "🚀 TECHNICAL ACHIEVEMENTS:",0
msg_60 db "   📝 Native bool type support in ÆLang",0
msg_61 db "   🛡️ Robust boolean input validation",0
msg_62 db "   🎨 Multiple boolean display formats",0
msg_63 db "   🔧 Boolean arithmetic compatibility",0
msg_64 db "   💯 Production-ready boolean operations",0
msg_65 db "🏆 ÆLANG BOOLEAN TYPE: IMPLEMENTATION COMPLETE!",0
msg_66 db "   Perfect for system control, flags, and logical operations.",0
msg_67 db "Thank you for testing ÆLang Boolean Type!",0
fmt_float: db "%f", 10, 0

section .bss
    align 4
    temp_int: resd 1  ; temporary for int to float conversion
    int_var_0: resd 1  ; is_active
    int_var_1: resd 1  ; is_finished
    int_var_2: resd 1  ; result
    int_var_3: resd 1  ; sum_bool
    int_var_4: resd 1  ; mult_bool
    int_var_5: resd 1  ; diff_bool
    int_var_6: resd 1  ; is_green
    int_var_7: resd 1  ; is_red
    int_var_8: resd 1  ; can_go
    int_var_9: resd 1  ; server_online
    int_var_10: resd 1  ; database_connected
    int_var_11: resd 1  ; maintenance_mode
    int_var_12: resd 1  ; system_ready
    int_var_13: resd 1  ; has_permission
    int_var_14: resd 1  ; is_authenticated
    int_var_15: resd 1  ; account_active
    int_var_16: resd 1  ; access_granted
    int_var_17: resd 1  ; user_input
    int_var_18: resd 1  ; inverted

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

extern print
extern print_clean
extern print_bool
extern print_bool_clean
extern print_bool_numeric
extern read_bool_safe
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
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_12
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let is_active:bool = 1
    mov eax, 1
    mov [int_var_0], eax  ; store is_active (bool)
; let is_finished:bool = 0
    mov eax, 0
    mov [int_var_1], eax  ; store is_finished (bool)
; let result:bool = 1
    mov eax, 1
    mov [int_var_2], eax  ; store result (bool)
    push msg_13
    call print
    add esp, 4
    push msg_14
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load is_active
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_15
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load is_finished
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_16
    call print_clean
    add esp, 4
    mov eax, [int_var_2]  ; load result
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_17
    call print
    add esp, 4
    push msg_18
    call print_clean
    add esp, 4
    mov eax, [int_var_0]  ; load is_active
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_19
    call print_clean
    add esp, 4
    mov eax, [int_var_1]  ; load is_finished
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_20
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
; let sum_bool:bool = is_active + is_finished
    mov eax, [int_var_0]  ; load is_active
    push eax
    mov eax, [int_var_1]  ; load is_finished
    mov ebx, eax
    pop eax
    add eax, ebx
    mov [int_var_3], eax  ; store sum_bool (bool)
; let mult_bool:bool = is_active * result
    mov eax, [int_var_0]  ; load is_active
    push eax
    mov eax, [int_var_2]  ; load result
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_4], eax  ; store mult_bool (bool)
; let diff_bool:bool = is_active - is_finished
    mov eax, [int_var_0]  ; load is_active
    push eax
    mov eax, [int_var_1]  ; load is_finished
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_5], eax  ; store diff_bool (bool)
    push msg_21
    call print
    add esp, 4
    push msg_22
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load sum_bool
    push eax
    call print_bool_clean
    add esp, 4
    push msg_23
    call print_clean
    add esp, 4
    mov eax, [int_var_3]  ; load sum_bool
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_24
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_25
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load mult_bool
    push eax
    call print_bool_clean
    add esp, 4
    push msg_23
    call print_clean
    add esp, 4
    mov eax, [int_var_4]  ; load mult_bool
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_24
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_26
    call print_clean
    add esp, 4
    mov eax, [int_var_5]  ; load diff_bool
    push eax
    call print_bool_clean
    add esp, 4
    push msg_23
    call print_clean
    add esp, 4
    mov eax, [int_var_5]  ; load diff_bool
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_24
    call print_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_27
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_28
    call print
    add esp, 4
; let is_green:bool = 1
    mov eax, 1
    mov [int_var_6], eax  ; store is_green (bool)
; let is_red:bool = 0
    mov eax, 0
    mov [int_var_7], eax  ; store is_red (bool)
; let can_go:bool = is_green
    mov eax, [int_var_6]  ; load is_green
    mov [int_var_8], eax  ; store can_go (bool)
    push msg_29
    call print_clean
    add esp, 4
    mov eax, [int_var_6]  ; load is_green
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_30
    call print_clean
    add esp, 4
    mov eax, [int_var_7]  ; load is_red
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_31
    call print_clean
    add esp, 4
    mov eax, [int_var_8]  ; load can_go
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_32
    call print
    add esp, 4
; let server_online:bool = 1
    mov eax, 1
    mov [int_var_9], eax  ; store server_online (bool)
; let database_connected:bool = 1
    mov eax, 1
    mov [int_var_10], eax  ; store database_connected (bool)
; let maintenance_mode:bool = 0
    mov eax, 0
    mov [int_var_11], eax  ; store maintenance_mode (bool)
; let system_ready:bool = server_online * database_connected * maintenance_mode + 1 - 1
    mov eax, [int_var_9]  ; load server_online
    push eax
    mov eax, [int_var_10]  ; load database_connected
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, [int_var_11]  ; load maintenance_mode
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    add eax, ebx
    push eax
    mov eax, 1
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_12], eax  ; store system_ready (bool)
    push msg_33
    call print_clean
    add esp, 4
    mov eax, [int_var_9]  ; load server_online
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_34
    call print_clean
    add esp, 4
    mov eax, [int_var_10]  ; load database_connected
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_35
    call print_clean
    add esp, 4
    mov eax, [int_var_11]  ; load maintenance_mode
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_36
    call print_clean
    add esp, 4
    mov eax, [int_var_12]  ; load system_ready
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_37
    call print
    add esp, 4
; let has_permission:bool = 1
    mov eax, 1
    mov [int_var_13], eax  ; store has_permission (bool)
; let is_authenticated:bool = 1
    mov eax, 1
    mov [int_var_14], eax  ; store is_authenticated (bool)
; let account_active:bool = 1
    mov eax, 1
    mov [int_var_15], eax  ; store account_active (bool)
; let access_granted:bool = has_permission * is_authenticated * account_active
    mov eax, [int_var_13]  ; load has_permission
    push eax
    mov eax, [int_var_14]  ; load is_authenticated
    mov ebx, eax
    pop eax
    imul eax, ebx
    push eax
    mov eax, [int_var_15]  ; load account_active
    mov ebx, eax
    pop eax
    imul eax, ebx
    mov [int_var_16], eax  ; store access_granted (bool)
    push msg_38
    call print_clean
    add esp, 4
    mov eax, [int_var_13]  ; load has_permission
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_39
    call print_clean
    add esp, 4
    mov eax, [int_var_14]  ; load is_authenticated
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_40
    call print_clean
    add esp, 4
    mov eax, [int_var_15]  ; load account_active
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_41
    call print_clean
    add esp, 4
    mov eax, [int_var_16]  ; load access_granted
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_42
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_43
    call print
    add esp, 4
    push msg_44
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_45
    call print
    add esp, 4
; let user_input:bool = read_bool_safe()
    call read_bool_safe
    mov [int_var_17], eax  ; store user_input (bool)
    push msg_4
    call print
    add esp, 4
    push msg_46
    call print
    add esp, 4
    push msg_47
    call print_clean
    add esp, 4
    mov eax, [int_var_17]  ; load user_input
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_48
    call print_clean
    add esp, 4
    mov eax, [int_var_17]  ; load user_input
    push eax
    call print_bool_numeric
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_49
    call print_clean
    add esp, 4
; let inverted:bool = 1 - user_input
    mov eax, 1
    push eax
    mov eax, [int_var_17]  ; load user_input
    mov ebx, eax
    pop eax
    sub eax, ebx
    mov [int_var_18], eax  ; store inverted (bool)
    mov eax, [int_var_18]  ; load inverted
    push eax
    call print_bool_clean
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_50
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_51
    call print
    add esp, 4
    push msg_52
    call print
    add esp, 4
    push msg_53
    call print
    add esp, 4
    push msg_54
    call print
    add esp, 4
    push msg_55
    call print
    add esp, 4
    push msg_56
    call print
    add esp, 4
    push msg_57
    call print
    add esp, 4
    push msg_58
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_59
    call print
    add esp, 4
    push msg_60
    call print
    add esp, 4
    push msg_61
    call print
    add esp, 4
    push msg_62
    call print
    add esp, 4
    push msg_63
    call print
    add esp, 4
    push msg_64
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_65
    call print
    add esp, 4
    push msg_66
    call print
    add esp, 4
    push msg_4
    call print
    add esp, 4
    push msg_67
    call print
    add esp, 4
    push msg_11
    call print
    add esp, 4
    pop ebp
    ret
