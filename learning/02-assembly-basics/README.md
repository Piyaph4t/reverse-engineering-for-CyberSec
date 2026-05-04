# Assembly Basics: x86-64 Programming

## Overview

Now that you understand the **hardware**, it's time to write code for it. This module teaches you to read and write x86-64 assembly fluently.

## What You'll Learn

- **NASM syntax** — how to write assembly
- **Instructions** — arithmetic, logic, memory, control flow
- **Building and running** — compile and execute assembly programs
- **Debugging** — use GDB to step through code

---

## 1. NASM Syntax Basics

### Program Structure

```asm
bits 64                    ; 64-bit mode

section .data              ; Initialized data (global variables)
    msg db 'Hello', 0xa    ; Define byte: string + newline
    len equ $ - msg        ; Calculate length

section .bss               ; Uninitialized data
    buffer resb 256        ; Reserve 256 bytes

section .text              ; Code
    global _start          ; Entry point

_start:
    ; Your code here
    mov rax, 60            ; sys_exit
    mov rdi, 0
    syscall
```

### Comments

```asm
; This is a comment
mov rax, 1  ; Inline comment
```

---

## 2. Basic Instructions

### Data Movement

```asm
mov rax, 10          ; rax = 10
mov rbx, rax         ; rbx = rax
mov rcx, [rax]       ; rcx = memory at address in rax
mov [rax], rbx       ; memory at rax = rbx
lea rax, [rax + 8]   ; rax = address of (rax + 8), no dereference
```

**Key difference:**
- `mov rax, [rbx]` — load from memory (dereference)
- `lea rax, [rbx]` — load address (no dereference)

### Arithmetic

```asm
add rax, rbx         ; rax += rbx
sub rax, rbx         ; rax -= rbx
imul rax, rbx        ; rax *= rbx (signed)
mul rbx              ; rax *= rbx (unsigned, result in rdx:rax)
div rbx              ; rax /= rbx, rdx = remainder (unsigned)
idiv rbx             ; Signed division
inc rax               ; rax++
dec rax               ; rax--
neg rax               ; rax = -rax
```

### Bitwise Operations

```asm
and rax, rbx         ; rax &= rbx (bitwise AND)
or rax, rbx          ; rax |= rbx (bitwise OR)
xor rax, rbx         ; rax ^= rbx (bitwise XOR)
not rax              ; rax = ~rax (bitwise NOT)
shl rax, 1           ; rax <<= 1 (shift left)
shr rax, 1           ; rax >>= 1 (logical shift right)
sar rax, 1           ; rax >>= 1 (arithmetic shift right, sign-extend)
```

### Comparison and Flags

```asm
cmp rax, rbx         ; Compare: sets flags based on (rax - rbx)
test rax, rax        ; Test: sets flags based on (rax & rax)
jz label             ; Jump if zero (ZF set)
jnz label            ; Jump if not zero (ZF clear)
jl label             ; Jump if less (signed)
jg label             ; Jump if greater (signed)
jle label            ; Jump if less or equal
jge label            ; Jump if greater or equal
jc label             ; Jump if carry
jo label             ; Jump if overflow
```

---

## 3. Control Flow

### Unconditional Jump

```asm
jmp label            ; Jump to label
```

### Conditional Jumps

```asm
cmp rax, 10
je equal_label       ; Jump if equal
jne not_equal_label  ; Jump if not equal
```

### Loops

```asm
mov rcx, 5           ; Counter
loop_start:
    ; Code here
    dec rcx
    jnz loop_start    ; Jump if not zero
```

Or use the `loop` instruction:

```asm
mov rcx, 5
loop_start:
    ; Code here
    loop loop_start   ; Decrements RCX, jumps if RCX != 0
```

---

## 4. Stack Operations

```asm
push rax             ; RSP -= 8; memory[RSP] = rax
pop rax              ; rax = memory[RSP]; RSP += 8
call label           ; Push return address, jump to label
ret                  ; Pop return address, jump to it
```

### Function Prologue and Epilogue

```asm
my_function:
    push rbp         ; Save old base pointer
    mov rbp, rsp     ; Set up new base pointer
    sub rsp, 32      ; Allocate local variables
    
    ; Function body
    
    add rsp, 32      ; Deallocate locals
    pop rbp          ; Restore old base pointer
    ret              ; Return to caller
```

---

## 5. Building and Running

### Makefile

Create a `Makefile` in your assembly directory:

```makefile
NASM = nasm
GCC = gcc
CFLAGS = -m64 -fno-pie -nostdlib

SOURCES = hello.asm
OBJECTS = $(SOURCES:.asm=.o)
TARGETS = $(SOURCES:.asm=)

all: $(TARGETS)

%: %.o
	$(GCC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(NASM) -f elf64 $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGETS)

.PHONY: all clean
```

### Build and Run

```bash
make              # Build all
make clean        # Clean build artifacts
./hello           # Run
```

---

## 6. Examples in This Module

| File | Concept |
|------|---------|
| `hello.asm` | Hello world with syscalls |
| `add.asm` | Arithmetic operations |
| `loop.asm` | Loops and counters |
| `function.asm` | Function calls and stack |
| `fibo.asm` | Fibonacci sequence |
| `input.asm` | Reading input |

### Study Each One

For each example:
1. **Read the code** — understand each instruction
2. **Build it** — `make`
3. **Run it** — `./program`
4. **Debug it** — `gdb ./program`
5. **Modify it** — change values and predict output

---

## 7. Debugging with GDB

```bash
gdb ./hello
(gdb) break _start           # Set breakpoint at _start
(gdb) run                    # Run until breakpoint
(gdb) disassemble            # Show disassembly
(gdb) info registers         # Show register values
(gdb) stepi                  # Step one instruction
(gdb) nexti                  # Step over calls
(gdb) x/10x $rsp             # Examine memory at RSP
(gdb) print $rax             # Print RAX value
(gdb) continue               # Continue execution
(gdb) quit                   # Exit GDB
```

---

## 8. Common Mistakes

### ❌ Forgetting Size Specifiers

```asm
mov rax, 10      ; OK: 64-bit
mov eax, 10      ; OK: 32-bit (zero-extends to 64-bit)
mov ax, 10       ; OK: 16-bit
mov al, 10       ; OK: 8-bit

mov [rax], 10    ; ERROR: Size ambiguous! Use:
mov qword [rax], 10  ; 64-bit
mov dword [rax], 10  ; 32-bit
mov byte [rax], 10   ; 8-bit
```

### ❌ Forgetting to Align Stack

Before calling a function, RSP must be 16-byte aligned (minus 8 for the return address):

```asm
sub rsp, 8       ; Align stack before call
call printf
add rsp, 8
```

### ❌ Using 32-bit Registers Incorrectly

Writing to a 32-bit register **zero-extends** to 64-bit:

```asm
mov rax, -1      ; RAX = 0xFFFFFFFFFFFFFFFF
mov eax, -1      ; RAX = 0x00000000FFFFFFFF (zero-extended!)
```

---

## 9. Practice Exercises

### Exercise 1: Add Two Numbers

Write a program that:
1. Loads 5 into RAX
2. Loads 3 into RBX
3. Adds them
4. Exits with result as exit code

**Hint:** Use `sys_exit` with the result in RDI.

### Exercise 2: Loop and Sum

Write a program that:
1. Sums numbers 1 to 10
2. Prints the result
3. Exits

**Hint:** Use a loop with RCX as counter.

### Exercise 3: Conditional

Write a program that:
1. Compares two numbers
2. Jumps to different code based on comparison
3. Prints different messages

---

## 10. Resources

- **NASM Manual** — [Download](https://www.nasm.us/doc/)
- **x86-64 Instruction Reference** — `resources/cheatsheets/x86-64-cheatsheet.md`
- **GDB Quick Reference** — `resources/cheatsheets/gdb-commands.md`

---

## Next Steps

Once you can read and write assembly, move to **[C Interoperability](../03-c-interop/)** to understand how assembly and C interact.
