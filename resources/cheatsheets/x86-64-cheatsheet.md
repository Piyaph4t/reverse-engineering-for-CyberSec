# x86-64 Instruction Reference Cheatsheet

## Quick Reference

### Data Movement

```asm
mov dst, src        ; Move data
movzx dst, src      ; Move with zero-extend
movsx dst, src      ; Move with sign-extend
lea dst, [addr]     ; Load effective address
xchg dst, src       ; Exchange
```

### Arithmetic

```asm
add dst, src        ; Addition
sub dst, src        ; Subtraction
imul dst, src       ; Signed multiply
mul src             ; Unsigned multiply (rax * src)
idiv src            ; Signed divide (rdx:rax / src)
div src             ; Unsigned divide (rdx:rax / src)
inc dst             ; Increment
dec dst             ; Decrement
neg dst             ; Negate
```

### Bitwise

```asm
and dst, src        ; Bitwise AND
or dst, src         ; Bitwise OR
xor dst, src        ; Bitwise XOR
not dst             ; Bitwise NOT
shl dst, count      ; Shift left
shr dst, count      ; Logical shift right
sar dst, count      ; Arithmetic shift right
rol dst, count      ; Rotate left
ror dst, count      ; Rotate right
```

### Comparison & Flags

```asm
cmp dst, src        ; Compare (sets flags)
test dst, src       ; Test (sets flags)
jz label            ; Jump if zero
jnz label           ; Jump if not zero
jl label            ; Jump if less (signed)
jg label            ; Jump if greater (signed)
jle label           ; Jump if less or equal
jge label           ; Jump if greater or equal
jc label            ; Jump if carry
jo label            ; Jump if overflow
```

### Stack & Calls

```asm
push src            ; Push to stack
pop dst             ; Pop from stack
call label          ; Call function
ret                 ; Return from function
leave               ; Restore stack frame
```

### Registers (64-bit)

```
RAX, RBX, RCX, RDX, RSI, RDI, RBP, RSP
R8, R9, R10, R11, R12, R13, R14, R15
```

### Operand Sizes

```asm
mov rax, 10         ; 64-bit (qword)
mov eax, 10         ; 32-bit (dword)
mov ax, 10          ; 16-bit (word)
mov al, 10          ; 8-bit (byte)
```

### Memory Addressing

```asm
mov rax, [rsi]              ; Direct dereference
mov rax, [rsi + 8]          ; With offset
mov rax, [rsi + rcx]        ; With index
mov rax, [rsi + rcx*8]      ; With scaled index
mov rax, [rsi + rcx*8 + 16] ; Complex addressing
```

### Syscalls (x86-64)

```asm
mov rax, <syscall_number>
mov rdi, <arg1>
mov rsi, <arg2>
mov rdx, <arg3>
mov rcx, <arg4>
mov r8, <arg5>
mov r9, <arg6>
syscall
```

### Common Syscalls

```
0   - read
1   - write
2   - open
3   - close
60  - exit
```

---

## Calling Convention (System V AMD64 ABI)

### Arguments
```
Arg 1 → RDI
Arg 2 → RSI
Arg 3 → RDX
Arg 4 → RCX
Arg 5 → R8
Arg 6 → R9
```

### Return Value
```
RAX (or RDX:RAX for 128-bit)
```

### Caller-Saved
```
RAX, RCX, RDX, RSI, RDI, R8-R11
```

### Callee-Saved
```
RBX, RBP, R12-R15
```

---

## Flags

```
ZF  - Zero Flag (result is zero)
CF  - Carry Flag (unsigned overflow)
SF  - Sign Flag (result is negative)
OF  - Overflow Flag (signed overflow)
PF  - Parity Flag (even number of 1 bits)
AF  - Auxiliary Flag (carry from bit 3)
```

---

## Useful Patterns

### Clear a Register
```asm
xor rax, rax        ; RAX = 0
```

### Set a Register to -1
```asm
mov rax, -1
or rax, -1
```

### Loop N Times
```asm
mov rcx, N
.loop:
    ; code
    dec rcx
    jnz .loop
```

### Function Prologue
```asm
push rbp
mov rbp, rsp
sub rsp, <local_size>
```

### Function Epilogue
```asm
add rsp, <local_size>
pop rbp
ret
```

---

## Size Directives

```asm
byte [addr]         ; 8-bit
word [addr]         ; 16-bit
dword [addr]        ; 32-bit
qword [addr]        ; 64-bit
```

---

For more details, see the learning modules or Intel x86-64 Manual.
