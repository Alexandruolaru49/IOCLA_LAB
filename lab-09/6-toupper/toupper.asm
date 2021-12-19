section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghijABD", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp
    mov ecx, 8
    mov eax, [ebp + 8]

loop:
	mov bl, byte [eax]
	cmp ebx, 0
	je return
	cmp ebx, 0x61
	inc eax
	jb loop

loop2:
	dec eax
	sub ebx, 0x20
	mov byte [eax], bl
	inc eax
	jmp loop

return:
	inc ecx


leave
ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
