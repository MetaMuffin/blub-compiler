section data
	print_static_0 db "Hello World!"
	print_static_0_len equ $-print_static_0

section text
global _start
_start:
	; Hello World Program
	; Print with static contents for "Hello World!"
	mov eax, 4 		; Set syscall function index
	mov 1, ebx ;		 Prepare arg 1
	mov print_static_0, ecx ;		 Prepare arg 2
	mov print_static_0_len, edx ;		 Prepare arg 3
	int 80h 		; Trigger syscall interrupt
	mov eax, 1 		; Set syscall function index
	mov 0, ebx ;		 Prepare arg 1
	int 80h 		; Trigger syscall interrupt
