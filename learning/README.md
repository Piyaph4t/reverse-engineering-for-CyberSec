# 📚 Learning: Reverse Engineering Fundamentals

Welcome to the learning section! This is where you'll build a **solid foundation** in reverse engineering, starting from computer architecture and progressing to binary analysis.

## Structure

Follow this progression for best results:

### **1. [x86 Architecture](01-x86-architecture/)**
Understand the hardware you're analyzing.
- CPU registers and their purposes
- Memory layout (stack, heap, data, code)
- Calling conventions (how functions pass arguments)
- **Time: 2-3 hours**

### **2. [Assembly Basics](02-assembly-basics/)**
Learn to read and write x86-64 assembly.
- Hello world in assembly
- Arithmetic operations
- Loops and conditionals
- Function calls
- **Time: 4-6 hours**

### **3. [C Interoperability](03-c-interop/)**
Bridge assembly and C — understand how they interact.
- Calling C functions from assembly
- Understanding C compilation
- Linking and symbol resolution
- **Time: 2-3 hours**

### **4. [System Calls](04-syscalls/)**
Interact directly with the Linux kernel.
- What are syscalls?
- Common syscalls (write, exit, read, open)
- Syscall conventions (x86-64 vs i386)
- **Time: 2-3 hours**

### **5. [Binary Analysis](05-binary-analysis/)**
Tools and techniques to reverse engineer compiled binaries.
- Using `objdump` to disassemble
- Using `strings` to find data
- Using `Ghidra` for decompilation
- Reading compiler-generated code
- **Time: 3-4 hours**

---

## How to Use This Section

### For Each Module:
1. **Read the README** — understand the concepts
2. **Study the examples** — see code in action
3. **Build and run** — compile and execute
4. **Experiment** — modify and predict output
5. **Move to next module** — build on your knowledge

### Building Code

Each module has a `Makefile`. To build:
```bash
cd learning/02-assembly-basics
make
./hello
```

To clean build artifacts:
```bash
make clean
```

---

## Prerequisites

You should have:
- Linux system (or WSL/VM)
- NASM assembler: `sudo apt install nasm`
- GCC compiler: `sudo apt install gcc`
- Binutils (objdump, strings): `sudo apt install binutils`
- GDB debugger: `sudo apt install gdb`
- Ghidra (optional but recommended): [Download](https://ghidra-sre.org/)

---

## Learning Tips

✅ **Type out the code** — don't copy-paste. Your fingers learn.

✅ **Predict before running** — what will this do? Then verify.

✅ **Use GDB** — step through code instruction by instruction.

✅ **Draw diagrams** — visualize memory, stack, registers.

✅ **Ask why** — why does this instruction exist? When would you use it?

---

## Next Steps

Once you've completed the learning section:
- Move to **labs/** for hands-on exercises
- Then tackle **ctf-writeups/** for real challenges
- Reference **resources/** for quick lookups

---

## Quick Reference

| Tool | Purpose |
|------|---------|
| `nasm` | Assemble .asm files → .o object files |
| `gcc` | Link and compile |
| `objdump` | Disassemble binaries |
| `strings` | Extract readable strings from binaries |
| `gdb` | Debug and step through code |
| `Ghidra` | Decompile and analyze binaries |

---

**Total estimated time: 13-19 hours**

Ready? Start with [01-x86-architecture](01-x86-architecture/).
