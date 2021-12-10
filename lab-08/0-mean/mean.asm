%include "../utils/printf32.asm"

%define ARRAY_SIZE 13
%define DECIMAL_PLACES 5

section .data

    num_array dw 76, 12, 65, 19, 781, 671, 431, 761, 782, 12, 91, 25, 9
    decimal_point db ".",0


section .text

extern printf
global main
main:
    xor eax, eax
    xor edx, edx
    mov ecx, ARRAY_SIZE
    xor ebx, ebx


    ; TODO1 - compute the sum of the vector numbers - store it in eax

for:
    mov dx, word [num_array + ecx * 2 - 2]
    ;PRINTF32 `%d\n\x0`, eax
    add eax, edx
    loop for

    PRINTF32 `Sum of numbers: %d\n\x0`, eax
    xor edx, edx
    mov edx, eax
    mov ax, dx
     PRINTF32 `Print2: %d\x0`, eax

    ; TODO2 - compute the quotient of the mean

    mov bx, ARRAY_SIZE
    ;PRINTF32 ` %d\n\x0`, ebx
    mov edx, 0
    div bx

    PRINTF32 `Mean of numbers: %d\x0`, eax
    PRINTF32 `.\x0`

    mov ecx, DECIMAL_PLACES
compute_decimal_place:

    ; TODO3 - compute the current decimal place - store it in ax
    PRINTF32 `\n%d\x0`, edx
    mov ax, dx

    PRINTF32 `%d\x0`, eax
    dec ecx
    cmp ecx, 0
    jg compute_decimal_place

    PRINTF32 `\n\x0`
    xor eax, eax
    ret
