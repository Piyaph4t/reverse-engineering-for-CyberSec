# C Interoperability: Bridging Assembly and C

## Overview

Assembly doesn't exist in isolation. In real-world reverse engineering, you'll encounter **compiled C code**. This module teaches you how assembly and C interact — essential for understanding how compilers work and how to reverse engineer C programs.

## What You'll Learn

- **Calling C functions from assembly**
- **Understanding C compilation**
- **Symbol resolution and linking**
- **Stack alignment and calling conventions**
- **Reading compiler-generated assembly**

---

## 1. Calling C Functions from Assembly

### Simple Example: Calling printf

```asm
bits 64

extern printf          ; Declare external C function

section .data
    fmt db "Hello, %s!", 0xa, 0  ; Format string
    name db "World", 0

section .text
    global _start

_start:
    ; Call printf(fmt, name)
    mov rdi, fmt       ; Argument 1: format string
    mov rsi, name      ; Argument 2: name string
    call printf        ; Call C library function
    
    ; Exit
    mov rax, 60        ; sys_exit
    mov rdi, 0
    syscall
```

### Build and Link

```bash
nasm -f elf64 program.asm -o program.o
gcc -no-pie program.o -o program
./program
```

**Key points:**
- `extern printf` — declare external function
- `call printf` — call the function
- Arguments in RDI, RSI, RDX, RCX, R8, R9
- GCC links the C library automatically

---

## 2. Stack Alignment

**Critical:** Before calling a C function, the stack must be **16-byte aligned**.

```
Before call:
RSP % 16 == 8  (8 bytes offset from 16-byte boundary)

The call instruction pushes 8 bytes (return address),
making RSP % 16 == 0 (aligned)
```

### Correct Alignment

```asm
_start:
    sub rsp, 8         ; Align stack (RSP was at 16n, now at 16n-8)
    mov rdi, msg
    call printf        ; Now RSP is 16-byte aligned
    add rsp, 8         ; Restore RSP
    
    mov rax, 60
    mov rdi, 0
    syscall
```

### Why It Matters

Some C functions (especially with SSE instructions) assume 16-byte alignment. Misalignment causes crashes or undefined behavior.

---

## 3. Calling Convention Recap

### System V AMD64 ABI (Linux/Unix)

```
Integer/Pointer Arguments:
  Arg 1 → RDI
  Arg 2 → RSI
  Arg 3 → RDX
  Arg 4 → RCX
  Arg 5 → R8
  Arg 6 → R9
  Arg 7+ → Stack (right-to-left)

Floating Point Arguments:
  Arg 1-8 → XMM0-XMM7

Return Value:
  Integer → RAX (or RDX:RAX for 128-bit)
  Float → XMM0 (or XMM0:XMM1 for 128-bit)

Caller-saved (must preserve if needed):
  RAX, RCX, RDX, RSI, RDI, R8-R11

Callee-saved (function must preserve):
  RBX, RBP, R12-R15
```

### Example: Multiple Arguments

```c
int add(int a, int b, int c, int d, int e, int f, int g);
```

```asm
mov rdi, 1       ; a
mov rsi, 2       ; b
mov rdx, 3       ; c
mov rcx, 4       ; d
mov r8, 5        ; e
mov r9, 6        ; f
mov rax, 7       ; g (7th arg goes on stack)
push rax
call add
add rsp, 8       ; Clean up stack
```

---

## 4. Understanding Compiler Output

### C Code

```c
int add(int a, int b) {
    return a + b;
}

int main() {
    int result = add(5, 3);
    return result;
}
```

### Compiled Assembly (gcc -S)

```asm
add:
    push rbp
    mov rbp, rsp
    mov eax, edi         ; eax = a (first arg)
    add eax, esi         ; eax += b (second arg)
    pop rbp
    ret

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16          ; Allocate local variables
    mov edi, 5           ; First arg to add
    mov esi, 3           ; Second arg to add
    call add
    mov dword [rbp-4], eax  ; result = eax
    mov eax, dword [rbp-4]  ; eax = result
    leave                ; mov rsp, rbp; pop rbp
    ret
```

### Key Observations

1. **Function prologue:** `push rbp; mov rbp, rsp`
2. **Local variables:** allocated with `sub rsp, N`
3. **Arguments:** passed in RDI, RSI, RDX, etc.
4. **Return value:** in RAX
5. **Function epilogue:** `pop rbp; ret` (or `leave; ret`)

---

## 5. Linking and Symbols

### What is Linking?

When you call `printf`, the assembler doesn't know where it is. The **linker** resolves this:

```
program.o (contains "call printf")
    ↓ (linker)
libc.so (contains printf implementation)
    ↓ (linker)
program (executable with printf address filled in)
```

### Symbol Resolution

```bash
# See symbols in object file
objdump -t program.o

# See external symbols
nm program.o | grep printf

# See resolved symbols in executable
nm program | grep printf
```

---

## 6. Practical Examples

### Example 1: Call strlen

```asm
bits 64
extern strlen

section .data
    str db "Hello", 0

section .text
    global _start

_start:
    mov rdi, str       ; Argument: string
    call strlen        ; RAX = length
    
    ; RAX now contains string length
    mov rax, 60
    mov rdi, 0
    syscall
```

### Example 2: Call malloc and free

```asm
bits 64
extern malloc, free

section .text
    global _start

_start:
    mov rdi, 256       ; Allocate 256 bytes
    call malloc        ; RAX = pointer
    
    ; Use memory at RAX
    
    mov rdi, rax       ; Free the memory
    call free
    
    mov rax, 60
    mov rdi, 0
    syscall
```

---

## 7. Debugging C Interop

### GDB Commands

```bash
gdb ./program
(gdb) break _start
(gdb) run
(gdb) stepi              # Step into call
(gdb) nexti              # Step over call
(gdb) disassemble printf # Disassemble C function
(gdb) info registers     # Check register values
(gdb) x/s $rdi           # Print string at RDI
```

### Common Issues

**Issue:** Program crashes when calling C function
- **Cause:** Stack not 16-byte aligned
- **Fix:** Add `sub rsp, 8` before call

**Issue:** Segfault in printf
- **Cause:** Invalid string pointer in RDI
- **Fix:** Check RDI points to valid memory

**Issue:** Wrong return value
- **Cause:** Not reading RAX after call
- **Fix:** Ensure RAX is used immediately after call

---

## 8. Files in This Module

| File | Purpose |
|------|---------|
| `calling-c-functions.asm` | Call printf and strlen |
| `c-reference/add.c` | Simple C function |
| `c-reference/printf.c` | Using printf |
| `libs.h` | Helper declarations |
| `printf.S` | Assembly with C preprocessor |

---

## 9. Exercises

### Exercise 1: Call strlen

Write assembly that:
1. Calls `strlen("Hello")`
2. Stores result in RAX
3. Exits with result as exit code

### Exercise 2: Call printf Multiple Times

Write assembly that:
1. Calls `printf("Number: %d\n", 42)`
2. Calls `printf("String: %s\n", "test")`
3. Exits

### Exercise 3: Allocate and Free Memory

Write assembly that:
1. Calls `malloc(100)`
2. Writes to allocated memory
3. Calls `free()`
4. Exits

---

## 10. Resources

- **System V AMD64 ABI** — [Specification](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI)
- **GCC Inline Assembly** — [Documentation](https://gcc.gnu.org/onlinedocs/gcc/Inline-Assembly.html)
- **Compiler Explorer** — [godbolt.org](https://godbolt.org/) — see C → assembly

---

## Next Steps

Now that you understand how assembly and C interact, move to **[System Calls](../04-syscalls/)** to interact directly with the kernel.
