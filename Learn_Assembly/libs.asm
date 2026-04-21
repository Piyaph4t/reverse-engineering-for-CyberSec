bits 64  ; X86_64

%define comment %if 0 
%define endcomment %endif 



print:
 mov rax, 1     ; --- sys_write ---
 mov rdi, 1     ; --- stdout    --- 
 syscall
 ret

exit_0:
 mov rax, 60  ; --- sys_exit ---
 mov rdi, 0   ; --- exit code 0 ---
 syscall
 ret

;section .data:
;x: db 'Hello, World' , 0xa ; '\n'
;len_x equ $-x 



