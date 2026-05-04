
; Header Library provided for basic fucntions

bits 64 ; X86_64 architecture 


global toInteger10


; @param %rsi = buf
; @param %rdx = count 
; example : 
; lea rsi, [buf] 
; mov rdx , len
; call read;
read: ; 
 mov rax, 0 	; --- sys_read ---
 mov rdi, 0	; --- stdin    ---
 syscall
 ret

; @param %rsi = buf
; @param %rdx = count 
; example : 
; lea rsi, [buf] 
; mov rdx , len
; call print;
print:
 mov rax, 1     ; --- sys_write ---
 mov rdi, 1     ; --- stdout    --- 
 syscall
 ret

; @param %rdi = error_code
; example :
; mov %rdi, 1 ; (exit with code '1')
exit_program:
 mov rax, 60	; --- sys_exit ---
 syscall 
 ret

exit_0:
 mov rax, 60  ; --- sys_exit ---
 mov rdi, 0   ; --- exit code 0 ---
 syscall
 ret

; long toInteger10(long len, const char *str)
; @param  %rdi  = len
; @param  %rsi  = str
; @return %rax  return number value 
toInteger10:
 xor rax, rax  ; initailized rax to 0
 xor rcx, rcx  ; initailized counter to 0

 .loop:
 	cmp rcx, rdi
	jge .done
	movzx  rdx, byte [rsi + rcx] 	; load digit '0'(48) - '9'(57)
 	sub    rdx, '0'			; calculate digit value

	imul rax, rax ,10		; shift existing value
	add  rax, rdx 			; add new digit
	inc  rcx 		; step to the next digit

	jmp .loop
 .done:
 	ret


