
%include "libs.h"
extern printf

; printf( rdi = format ,rdi ,rdx ,rcx, r8, r9, stack memory)

section .text
global _start 


_start:

  lea  rdi, [format] ;
  lea  rsi, [msg]    ;
  mov rdx, [number]    ;
  ; xor rax,rax
  call printf
	call exit_0


section .data 
  format: db 'Hello %s %d' , 0xa 
  msg:    db 'PRINT_F', 0
  number: dq 101


