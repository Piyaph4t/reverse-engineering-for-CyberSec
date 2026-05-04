
bits 64 ; tell nasm to use 64-bit mode


; store the code section
section .text
    global _start  ; enter point 


_start :
    ; ---- Print userPrompt to strout by ----
    ; Calling sys_write(rdi : unsigned int fd , 
    ;                   rsi : const char *buf, 
    ;                   rdx : size_t count)

    mov rax, 1              ; sys_write 
    mov rdi, 1              ; stdout
    lea rsi, [userPrompt]  ; load string into rsi
    mov rdx, strLen1         ; length of string
    syscall                 ; call the system
    

    ; ---- Read user's input from stdin by ----
    ; Calling sys_read(rdx : unsigned int fd
    ;                  rdi : char *buf
    ;                  rdx : size_t count)
    mov rax, 0              ; sys_read
    mov rdi, 0              ; stdin
    lea rsi, [readBuffer]   ; buffer for storing
    mov rdx, bufferLen      ; number of byte to be read
    syscall

    ; ---- sys_read return the number of byte read in rax ----
    mov rbx, rax            ; save value to another register

    ; ---- print read number ----
    mov rax, 1              ; sys_write 
    mov rdi, 1              ; stdout
    lea rsi, [showToUser]
    mov rdx, strLen2
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [readBuffer]   ; load string into rsi
    mov rdx, rbx            ; length of string
    syscall

    
    ; ---- exit program ----
    mov rax, 60  ; sys_exit
    mov rdi, 0   ; return 0
    syscall

section .data
    userPrompt db 'Enter number :'    ; ask user to enter a number     
    strLen1    equ $-userPrompt       ; get userPrompt's length
    showToUser db 'Your  number  :'
    strLen2    equ $-showToUser
    bufferLen  equ 20                 ;
    readBuffer times bufferLen db 0   ; prepare buffer for stdin



; HIGH COLTISOL 
