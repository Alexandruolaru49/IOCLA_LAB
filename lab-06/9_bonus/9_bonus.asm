%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, -19, 12, -3, 6, -200, 128, 19, 78, 102
    

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax            ; Use eax to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.


add_byte_array_element:
    mov dl, byte [byte_array + ecx - 1]
    cmp dl, 0
    jl negativ
    loop add_byte_array_element
    jmp exit

negativ:
    add eax, 1
    loop add_byte_array_element ; Decrement ecx, if not zero, add another element.

exit:
    PRINTF32 `%u\n\x0`, eax
    mov ecx, ARRAY_SIZE
    sub ecx, eax
    PRINTF32 `%u\n\x0`, ecx

    leave 
    ret


