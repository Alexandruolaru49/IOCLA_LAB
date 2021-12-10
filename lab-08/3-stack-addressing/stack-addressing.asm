%include "../utils/printf32.asm"

%define NUM 5
   
section .data
    copie: dd 0

section .text
    

extern printf
global main
main:
    mov ebp, esp
    mov [copie], esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    xor edx, edx
    inc edx
for:
    mov ecx, edx
    sub esp, 4
    mov [esp], ecx
    inc edx
    cmp edx, NUM
    jle for

    xor ebx, ebx
    mov ebx, esp

;push_nums:
   ; push ecx
   ; loop push_nums

    ;push 0
    ;push "mere"
    ;push "are "
    ;push "Ana "

    xor ecx, ecx
    xor edx, edx

    sub esp, 4
    mov dword [esp], 0

    sub esp, 4
    mov dword [esp], "mere"

    sub esp, 4
    mov dword [esp], "are "

    sub esp, 4
    mov dword [esp], "Ana "

    xor edx, edx
    mov edx, esp


    ;lea esi, [esp]
    ;PRINTF32 `%s\n\x0`, esi



    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above

    
for2:
    xor eax, eax
    mov al, [edx]
    PRINTF32 `0x%x: %d\n\x0`, edx, eax
    inc edx
    cmp edx, ebp
    jl for2


    ; TODO 3: print the string

    xor edx, edx

for3:
    mov al, [esp]
    PRINTF32 `%c\x0`, eax
    inc esp
    inc edx
    cmp edx, 12
    jl for3




    ; TODO 4: print the array on the stack, element by element.
    xor eax, eax
    PRINTF32 `\n\x0`

for4:
    mov al, [ebx]
    PRINTF32 `%d\x0`, eax
    add ebx, 4
    cmp ebx, ebp
    jl for4

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
