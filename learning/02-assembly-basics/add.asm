
%include "libs.asm"

section .text
	global _start

_start:
	
	lea rsi, [msg1]
	mov rdx, len1
	call print
	
	lea rsi,
	call read;


	call exit_0


section .bss 
	number1 resq 1
	number2 resq 1

section .data
	msg1 db 'number1: '
	len1 equ $-msg1
	msg2 db 'number2: '
	len2 equ $-msg2
