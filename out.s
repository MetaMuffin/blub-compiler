section data
	print_static_0 db "Hello World!",0x0a
	print_static_0_len equ $-print_static_0

section text
global _start
_start:
	; Hello World Program
	mov eax, 4
	mov ebx, 1 ; Prepare arg 1
	mov ecx, print_static_0 ; Prepare arg 2
	mov edc, print_static_0_len ; Prepare arg 3
	int 80h
	mov eax, 1
	mov ebx, 0 ; Prepare arg 1
	int 80h
