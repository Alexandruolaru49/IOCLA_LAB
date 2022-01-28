section .text
	global main
	extern helper

main:
	push esp
	push 'X'
	push 0x2a
	call helper
	pop esp