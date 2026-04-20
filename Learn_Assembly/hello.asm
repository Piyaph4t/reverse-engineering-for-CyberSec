

bits 64 ; set mode to 64-bit

section .text
  global _start
_start:
        
        ; sys_write instuction
        mov rax, 1
        mov rdi, 1
        lea rsi, [msg] ; load address to rsi register
        mov rdx, len 

        syscall

        ; sys_exit instuction
        mov rax, 60
        mov rdi, 0 ; return 0
        syscall

    
section .data 
msg db 'Hello, world!',0xa ; string to be printed 
len equ $ - msg

