%include "libs.asm"



;# SIGNED
;je  a, b if ( a == b )
;jl  a, b if ( a <  b )
;jle a, b if ( a <= b )
;jg  a, b if ( a > b )
;jgl a, b if ( a >= b )





section .text
  global _start

_start :
;int i=0 
;while(i<10) {
;  printf("Balls");
;  i++;
;}

  mov rcx , 0

  loop_start:
    cmp rcx , 10  
    push rcx 
    jge loop_end ; if ( i >= 10 ) jump out the loop  
    ;# -- BODY ---  

    lea rsi, [msg]
    mov rdx, len  
    call print     
    pop rcx 
    
    inc rcx        ; i++; 
    jmp loop_start ;
    ;# -- BODY ---
  loop_end:
  

  call exit_0


section .data
msg: db 'Balls',0xa 
len equ $-msg
