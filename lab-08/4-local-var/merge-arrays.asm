%include "../utils/printf32.asm"

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

section .data

array_1 db 27, 46, 55, 83, 84
array_2 db 1, 4, 21, 26, 59, 92, 105
array_output times 12 db 0


section .text

extern printf
global main
main:
    mov eax, 0 ; counter used for array_1
    mov ebx, 0 ; counter used for array_2
    mov ecx, 0 ; counter used for the output array

merge_arrays:
    mov dl, byte [array_1 + eax]
    mov dh, byte [array_2 + ebx]
    cmp dl, dh
    jg array_2_lower
array_1_lower:

	xor dh, dh
    push dx
    dec eax
    dec ecx
    jmp verify_array_end

array_2_lower:

     xor dl, dl
    mov dl, dh
    xor dh, dh
    push dx
    dec ecx
    dec ebx

verify_array_end:

    cmp eax, 0
    jbe copy_array_2
    cmp ebx, 0
    jbe copy_array_1
    jmp merge_arrays

copy_array_1:

    mov dl, byte [array_1 + eax - 1]
    xor dh, dh
    push dx
    
    dec ecx
    dec eax
    cmp eax, 0
    jg copy_array_1
    jmp print_array


copy_array_2:

    mov dh, byte [array_2 + ebx - 1]
    xor dl, dl
    mov dl, dh
    xor dh, dh
    push dx
    dec ecx
    dec ebx
    cmp ebx, 0
    jg copy_array_2

print_array:
	pop dx
    PRINTF32 `Array merged:\n\x0`
    mov ecx, 0
print:
	pop dx
    mov al, byte [array_output + ecx]
    PRINTF32 `%d \x0`, eax
    inc ecx
    cmp ecx, ARRAY_OUTPUT_LEN
    jb print
    mov esp, ebp

    PRINTF32 `\n\x0`
    xor eax, eax
    ret
    