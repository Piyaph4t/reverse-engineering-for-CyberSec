# NASM Syntax Quick Reference

## Program Structure

```asm
bits 64                    ; Set to 64-bit mode
bits 32                    ; Set to 32-bit mode

section .text              ; Code section
section .data              ; Initialized data
section .bss               ; Uninitialized data
section .rodata            ; Read-only data

global _start              ; Export symbol
extern printf              ; Import symbol
```

## Data Definitions

```asm
db 0x55                    ; Define byte
dw 0x1234                  ; Define word (2 bytes)
dd 0x12345678              ; Define dword (4 bytes)
dq 0x123456789ABCDEF0      ; Define qword (8 bytes)

db 'Hello', 0              ; String with null terminator
db 'A', 'B', 'C'           ; Multiple bytes
db 10 dup(0)               ; Repeat 10 times

resb 256                   ; Reserve 256 bytes
resw 100                   ; Reserve 100 words
resd 50                    ; Reserve 50 dwords
resq 20                    ; Reserve 20 qwords
```

## Labels and Constants

```asm
label:                     ; Label (address)
.local_label:              ; Local label (scoped)

constant equ 0x1000        ; Define constant
len equ $ - start          ; Calculate length
```

## Instructions

### Data Movement

```asm
mov rax, 10                ; Move immediate
mov rax, rbx               ; Move register
mov rax, [rbx]             ; Move from memory
mov [rax], rbx             ; Move to memory
mov [rax + 8], rbx         ; With offset
mov [rax + rcx*8], rbx     ; With scaled index

lea rax, [rbx + 8]         ; Load effective address
xchg rax, rbx              ; Exchange
```

### Arithmetic

```asm
add rax, 10                ; Addition
sub rax, 10                ; Subtraction
imul rax, 10               ; Signed multiply
mul rbx                    ; Unsigned multiply
idiv rbx                   ; Signed divide
div rbx                    ; Unsigned divide
inc rax                    ; Increment
dec rax                    ; Decrement
neg rax                    ; Negate
```

### Bitwise

```asm
and rax, 0xFF              ; Bitwise AND
or rax, 0x01               ; Bitwise OR
xor rax, rax               ; Bitwise XOR
not rax                    ; Bitwise NOT
shl rax, 1                 ; Shift left
shr rax, 1                 ; Logical shift right
sar rax, 1                 ; Arithmetic shift right
rol rax, 1                 ; Rotate left
ror rax, 1                 ; Rotate right
```

### Comparison

```asm
cmp rax, rbx               ; Compare
test rax, rax              ; Test (AND without storing)
```

### Jumps

```asm
jmp label                  ; Unconditional jump
je label                   ; Jump if equal (ZF set)
jne label                  ; Jump if not equal (ZF clear)
jz label                   ; Jump if zero
jnz label                  ; Jump if not zero
jl label                   ; Jump if less (signed)
jg label                   ; Jump if greater (signed)
jle label                  ; Jump if less or equal
jge label                  ; Jump if greater or equal
jc label                   ; Jump if carry
jo label                   ; Jump if overflow
```

### Stack and Calls

```asm
push rax                   ; Push to stack
pop rax                    ; Pop from stack
call label                 ; Call function
ret                        ; Return
leave                      ; Restore stack frame
```

## Operand Sizes

```asm
mov byte [rax], 0x55       ; 8-bit
mov word [rax], 0x1234     ; 16-bit
mov dword [rax], 0x12345678 ; 32-bit
mov qword [rax], 0x123456789ABCDEF0 ; 64-bit
```

## Addressing Modes

```asm
[rax]                      ; Direct
[rax + 8]                  ; With offset
[rax + rbx]                ; With index
[rax + rbx*2]              ; With scaled index
[rax + rbx*8 + 16]         ; Complex
[rel rip + offset]         ; RIP-relative
```

## Directives

```asm
bits 64                    ; Set architecture
section .text              ; Change section
global symbol              ; Export symbol
extern symbol              ; Import symbol
align 16                   ; Align to 16 bytes
```

## Comments

```asm
; Single line comment
mov rax, 10                ; Inline comment
```

## Macros

```asm
%define MAX 100            ; Define macro
%macro name 1              ; Define macro with args
    ; macro body
%endmacro

name arg                   ; Use macro
```

## Common Patterns

### Clear Register

```asm
xor rax, rax               ; RAX = 0
```

### Set to -1

```asm
mov rax, -1
or rax, -1
```

### Loop

```asm
mov rcx, 10
.loop:
    ; code
    dec rcx
    jnz .loop
```

### Function

```asm
my_func:
    push rbp
    mov rbp, rsp
    ; code
    pop rbp
    ret
```

### Syscall (x86-64)

```asm
mov rax, 1                 ; sys_write
mov rdi, 1                 ; fd
lea rsi, [msg]             ; buf
mov rdx, len               ; count
syscall
```

## Useful Tips

✅ Use `$` to refer to current position

✅ Use `$$` to refer to section start

✅ Use `rel` for RIP-relative addressing

✅ Use `bits 64` for 64-bit code

✅ Use `bits 32` for 32-bit code

✅ Comments start with `;`

✅ Labels end with `:`

✅ Use `equ` for constants

---

For more details: `man nasm` or https://www.nasm.us/doc/
