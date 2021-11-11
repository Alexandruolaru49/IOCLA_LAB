%include "../io.mac"

section .text
    global main
    extern printf

main:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx, 0
    mov ecx, 1
    mov edx, 0
    sub eax, 2

loop:
	mov edi, ecx
	add ecx, ebx
	mov edx, ecx
	mov ecx, edx
	mov ebx, edi
	mov ecx, edx
	sub eax, 1
	jnz loop
	PRINTF32 `%d\n\x0`, edx

    ret
