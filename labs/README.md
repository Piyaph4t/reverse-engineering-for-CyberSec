# 🧪 Labs: Hands-On Exercises

Welcome to the labs section! Here you'll **apply what you learned** through structured, progressively challenging exercises.

## Structure

Each lab has:
- **README.md** — Problem statement and learning objectives
- **solution.asm** or **solution.c** — Reference solution
- **Makefile** — Build instructions
- **writeup.md** (for complex labs) — Explanation of approach

## Labs Overview

### **Lab 1: Basic Arithmetic**
Learn to perform calculations in assembly.
- **Topics:** MOV, ADD, SUB, MUL, DIV
- **Time:** 1-2 hours
- **Difficulty:** ⭐ Beginner

### **Lab 2: String Manipulation**
Work with strings and memory.
- **Topics:** LEA, memory addressing, loops
- **Time:** 2-3 hours
- **Difficulty:** ⭐⭐ Beginner-Intermediate

### **Lab 3: Function Calls**
Write and call functions in assembly.
- **Topics:** CALL, RET, stack frames, arguments
- **Time:** 2-3 hours
- **Difficulty:** ⭐⭐ Intermediate

### **Lab 4: Buffer Overflow**
Understand and exploit a vulnerability.
- **Topics:** Stack overflow, RIP control, shellcode
- **Time:** 3-4 hours
- **Difficulty:** ⭐⭐⭐ Intermediate-Advanced

### **Lab 5: Reverse Engineering Binary**
Reverse a compiled program without source.
- **Topics:** Disassembly, pattern recognition, Ghidra
- **Time:** 3-4 hours
- **Difficulty:** ⭐⭐⭐ Advanced

---

## How to Use This Section

### For Each Lab:

1. **Read the README** — understand the problem
2. **Attempt the solution** — try without looking at solution.asm
3. **Build and test** — `make && make test`
4. **Compare with solution** — see how you did
5. **Read writeup.md** — understand the approach
6. **Experiment** — modify and extend

### Building

```bash
cd labs/lab-01-basic-arithmetic
make              # Build
make test         # Run tests (if available)
make clean        # Clean artifacts
```

---

## Progression

**Recommended order:**
1. Lab 1 (arithmetic) — warm up
2. Lab 2 (strings) — memory basics
3. Lab 3 (functions) — calling conventions
4. Lab 4 (buffer overflow) — exploitation
5. Lab 5 (reverse engineering) — capstone

---

## Tips for Success

✅ **Don't skip labs** — each builds on previous knowledge

✅ **Try before looking at solution** — struggle is learning

✅ **Understand, don't memorize** — know the WHY

✅ **Use GDB** — step through your code

✅ **Modify solutions** — change values, predict output

✅ **Write comments** — explain what each instruction does

---

## Next Steps

After completing all labs:
- Move to **ctf-writeups/** for real challenges
- Apply your skills to capture flags
- Document your approach in writeups

---

## Lab Checklist

- [ ] Lab 1: Basic Arithmetic
- [ ] Lab 2: String Manipulation
- [ ] Lab 3: Function Calls
- [ ] Lab 4: Buffer Overflow
- [ ] Lab 5: Reverse Engineering Binary

**Ready?** Start with [Lab 1: Basic Arithmetic](lab-01-basic-arithmetic/).
