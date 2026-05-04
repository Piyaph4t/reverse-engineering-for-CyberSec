# Binary Analysis: Reverse Engineering Compiled Code

## Overview

You now understand assembly, C interop, and syscalls. This module teaches you to **reverse engineer** compiled binaries — the core skill of a reverse engineer. You'll learn to use tools like `objdump`, `strings`, and `Ghidra` to understand what a program does without source code.

## What You'll Learn

- **Disassembly** — converting binary to assembly
- **Static analysis** — understanding code without running it
- **Dynamic analysis** — observing behavior while running
- **Tools:** objdump, strings, Ghidra, GDB
- **Recognizing patterns** — loops, conditionals, function calls

---

## 1. Disassembly Basics

### What is Disassembly?

**Disassembly** is the process of converting machine code (binary) back into assembly language.

```
Binary (0x55 0x48 0x89 0xe5 ...)
    ↓ disassembler
Assembly (push rbp; mov rbp, rsp; ...)
```

### Tools for Disassembly

| Tool | Purpose | Strength |
|------|---------|----------|
| **objdump** | Command-line disassembler | Fast, scriptable |
| **Ghidra** | GUI reverse engineering | Decompilation, analysis |
| **IDA Pro** | Professional RE tool | Industry standard (paid) |
| **radare2** | Advanced RE framework | Powerful, scriptable |
| **GDB** | Debugger with disassembly | Dynamic analysis |

---

## 2. Using objdump

### Basic Disassembly

```bash
objdump -d program > disassembly.txt
```

Output:
```
0000000000001000 <_start>:
    1000:	55                   	push   %rbp
    1001:	48 89 e5             	mov    %rsp,%rbp
    1004:	b8 01 00 00 00       	mov    $0x1,%eax
    1009:	0f 05                	syscall
```

### Useful objdump Options

```bash
objdump -d program              # Disassemble all sections
objdump -d -M intel program     # Intel syntax (easier to read)
objdump -t program              # Show symbol table
objdump -s program              # Show all sections
objdump -s -j .data program     # Show only .data section
objdump -R program              # Show relocations
```

### Reading objdump Output

```
Address  Opcode          Instruction
  ↓        ↓               ↓
1000:    55              push   %rbp
```

- **Address:** Memory location of instruction
- **Opcode:** Raw bytes (machine code)
- **Instruction:** Human-readable assembly

---

## 3. Using strings

### Extract Readable Strings

```bash
strings program
```

Output:
```
/lib64/ld-linux-x86-64.so.2
libc.so.6
printf
__libc_start_main
GLIBC_2.2.5
Hello, World!
Invalid input
```

### Useful strings Options

```bash
strings program                 # All strings
strings -n 10 program           # Strings of length ≥ 10
strings program | grep -i error # Search for specific strings
strings -a program              # Include all sections
```

### Why strings Matter

- **Find error messages** — reveals what program checks
- **Find function names** — reveals functionality
- **Find file paths** — reveals what files it accesses
- **Find URLs/IPs** — reveals network communication

---

## 4. Using Ghidra

### Installation

Download from [ghidra-sre.org](https://ghidra-sre.org/)

```bash
unzip ghidra_*.zip
cd ghidra_*/
./ghidraRun
```

### Basic Workflow

1. **Create Project** — File → New Project
2. **Import Binary** — File → Import File
3. **Analyze** — Click "Analyze" button
4. **Explore** — Navigate code in Listing window
5. **Decompile** — View C-like code in Decompiler window

### Key Windows

| Window | Purpose |
|--------|---------|
| **Listing** | Disassembly view |
| **Decompiler** | Pseudo-C code |
| **Symbol Tree** | Functions and variables |
| **Data Type Manager** | Structures and types |
| **References** | Where symbols are used |

### Decompilation Example

**Assembly:**
```asm
push rbp
mov rbp, rsp
mov eax, edi
add eax, esi
pop rbp
ret
```

**Ghidra Decompilation:**
```c
int add(int a, int b) {
    return a + b;
}
```

---

## 5. Pattern Recognition

### Function Prologue

```asm
push rbp
mov rbp, rsp
sub rsp, 0x20        ; Allocate local variables
```

**Meaning:** Start of a function with local variables.

### Function Epilogue

```asm
add rsp, 0x20        ; Deallocate locals
pop rbp
ret
```

**Meaning:** End of function, return to caller.

### Loop Pattern

```asm
mov rcx, 10          ; Counter
.loop:
    ; Loop body
    dec rcx
    jnz .loop        ; Jump if not zero
```

**Meaning:** Loop that runs 10 times.

### Conditional Jump

```asm
cmp rax, rbx
je .equal            ; Jump if equal
; Not equal code
jmp .end
.equal:
; Equal code
.end:
```

**Meaning:** If-else statement.

### Function Call

```asm
mov rdi, arg1
mov rsi, arg2
call function_name
mov result, rax
```

**Meaning:** Call function with arguments, store result.

---

## 6. Static Analysis Workflow

### Step 1: Get Basic Info

```bash
file program
objdump -f program
strings program | head -20
```

### Step 2: Identify Entry Point

```bash
objdump -d program | grep -A 5 "_start"
```

### Step 3: Find Main Function

```bash
objdump -t program | grep main
```

### Step 4: Disassemble Key Functions

```bash
objdump -d program | grep -A 50 "<main>:"
```

### Step 5: Look for Interesting Patterns

```bash
strings program | grep -i "password\|flag\|error\|debug"
objdump -d program | grep "call"  # Find all function calls
```

---

## 7. Dynamic Analysis with GDB

### Run Under Debugger

```bash
gdb ./program
(gdb) break main
(gdb) run
(gdb) disassemble main
(gdb) info registers
(gdb) stepi
(gdb) x/10x $rsp        # Examine stack
(gdb) x/s $rdi          # Print string at RDI
```

### Set Breakpoints

```bash
(gdb) break main        # Break at function
(gdb) break *0x1000     # Break at address
(gdb) break main:10     # Break at line 10 (if debug symbols)
```

### Inspect Memory

```bash
(gdb) x/10x $rsp        # 10 hex values at RSP
(gdb) x/10i $rip        # 10 instructions at RIP
(gdb) x/s $rdi          # String at RDI
(gdb) x/20c $rsi        # 20 characters at RSI
```

---

## 8. Complete Example: Reverse a Simple Program

### Target Program (compiled, no source)

```bash
./mystery_program
```

### Step 1: Get Info

```bash
file mystery_program
# Output: ELF 64-bit LSB executable, x86-64, ...

strings mystery_program | head -20
# Output: /lib64/ld-linux-x86-64.so.2
#         libc.so.6
#         printf
#         Enter password: 
#         Access granted!
#         Access denied!
```

**Finding:** Program asks for password.

### Step 2: Disassemble

```bash
objdump -d mystery_program | grep -A 30 "<main>:"
```

Output:
```asm
0000000000001000 <main>:
    1000:	55                   	push   %rbp
    1001:	48 89 e5             	mov    %rsp,%rbp
    1003:	48 83 ec 20          	sub    $0x20,%rsp
    1007:	48 8d 3d 53 0f 00 00 	lea    0xf53(%rip),%rdi
    100e:	e8 2d ff ff ff       	call   1040 <printf@plt>
    1013:	48 8d 75 f0          	lea    -0x10(%rbp),%rsi
    1017:	48 8d 3d 5c 0f 00 00 	lea    0xf5c(%rip),%rdi
    101e:	e8 1d ff ff ff       	call   1040 <scanf@plt>
    1023:	48 8d 3d 65 0f 00 00 	lea    0xf65(%rip),%rdi
    102a:	48 89 c6             	mov    %rax,%rsi
    102d:	e8 0e ff ff ff       	call   1040 <strcmp@plt>
    1032:	85 c0                	test   %eax,%eax
    1034:	75 0a                	jne    1040 <main+0x40>
    1036:	48 8d 3d 6d 0f 00 00 	lea    0xf6d(%rip),%rdi
    103d:	e8 fe fe ff ff       	call   1040 <printf@plt>
    1042:	eb 08                	jmp    104c <main+0x4c>
    1044:	48 8d 3d 75 0f 00 00 	lea    0xf75(%rip),%rdi
    104b:	e8 f0 fe ff ff       	call   1040 <printf@plt>
    1050:	b8 00 00 00 00       	mov    $0x0,%eax
    1055:	c9                   	leaveq
    1056:	c3                   	retq
```

**Analysis:**
- Calls `printf` (print prompt)
- Calls `scanf` (read input)
- Calls `strcmp` (compare strings)
- Jumps based on comparison result
- Prints "Access granted!" or "Access denied!"

### Step 3: Find the Password

The password is compared with a string. Use Ghidra or strings to find it:

```bash
objdump -s -j .rodata mystery_program | grep -A 5 "password"
```

Or in Ghidra: Look at the string references in main.

---

## 9. Exercises

### Exercise 1: Disassemble a Simple Program

1. Write a C program with a function
2. Compile it: `gcc -o program program.c`
3. Disassemble: `objdump -d program > disasm.txt`
4. Identify: function prologue, epilogue, calls

### Exercise 2: Find Strings

1. Use `strings` on a binary
2. Identify error messages
3. Identify function names
4. Identify hardcoded values

### Exercise 3: Reverse a Mystery Binary

1. Use `file` to identify type
2. Use `strings` to find clues
3. Use `objdump` to disassemble main
4. Use Ghidra to decompile
5. Understand what it does

---

## 10. Resources

- **Ghidra User Guide** — [Download](https://ghidra-sre.org/)
- **objdump Manual** — `man objdump`
- **GDB Manual** — `man gdb`
- **Reverse Engineering 101** — See `resources/`

---

## Next Steps

You've completed the **learning** section! Now:
- Move to **labs/** for hands-on exercises
- Then tackle **ctf-writeups/** for real challenges
- Use **resources/** for quick reference

**Congratulations!** You now have the foundation to reverse engineer binaries.
