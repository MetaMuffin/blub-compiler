section data
	print_static_0 db "Hello World!"
	print_static_0_len equ $-print_static_0

section text
global _start
_start:
	; Hello World Program
	; Print with static contents for "Hello World!"
	mov eax, 4 ;		 Set syscall function index
	mov ebx, 1 ;		 Prepare arg 1
	mov ecx, print_static_0 ;		 Prepare arg 2
	mov edx, print_static_0_len ;		 Prepare arg 3
	int 128 ;		 Trigger syscall interrupt
	mov eax, 1 ;		 Set syscall function index
	mov ebx, 0 ;		 Prepare arg 1
	int 128 ;		 Trigger syscall interrupt
