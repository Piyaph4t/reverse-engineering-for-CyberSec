
bits 64  ; X86_64

section .text
global _start
_start:

call print
call exit

print:
 mov rax, 1     ; --- sys_write ---
 mov rdi, 1     ; --- stdout    --- 
 lea rsi, [x]   ; --- string    ---
 mov rdx, len_x ; --- count     ---
 syscall
 ret

exit:
 mov rax, 60  ; --- sys_exit ---
 mov rdi, 0   ; --- exit code 0 ---
 syscall
 ret

section .data:
x: db 'Hello, World' , 0xa ; '\n'
len_x equ $-x 



