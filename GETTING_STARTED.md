# Getting Started with the Refactored Repository

## Welcome! 👋

Your reverse engineering learning repository has been **successfully refactored** into a comprehensive, self-paced learning system. This guide will help you get started.

## Quick Start (5 minutes)

### 1. Understand the New Structure

```
reverse_engineering/
├── 📚 learning/          → Theory & Fundamentals (start here!)
├── 🧪 labs/              → Hands-On Exercises (practice)
├── 🚩 ctf-writeups/      → Real Challenges (apply knowledge)
└── 📋 resources/         → Quick Reference (lookup)
```

### 2. Choose Your Path

**Complete Beginner?**
```bash
cd learning
cat README.md
# Follow the 5 modules in order (13-19 hours)
```

**Know Some C?**
```bash
cd learning/02-assembly-basics
cat README.md
# Start with assembly basics
```

**Know Assembly?**
```bash
cd learning/05-binary-analysis
cat README.md
# Jump to binary analysis
```

**Want to Practice?**
```bash
cd labs
cat README.md
# Solve hands-on exercises
```

**Want Real Challenges?**
```bash
cd ctf-writeups
cat README.md
# Solve picoCTF and OverTheWire challenges
```

### 3. Build Your First Example

```bash
cd learning/02-assembly-basics
make                    # Build all examples
./hello                 # Run hello world
echo $?                 # Check exit code
make clean              # Clean build artifacts
```

## Learning Path (40-70 hours)

### Phase 1: Foundations (13-19 hours)

```
learning/01-x86-architecture/      (2-3h)  ← Start here
    ↓
learning/02-assembly-basics/       (4-6h)
    ↓
learning/03-c-interop/             (2-3h)
    ↓
learning/04-syscalls/              (2-3h)
    ↓
learning/05-binary-analysis/       (3-4h)
```

**What you'll learn:**
- CPU registers and memory layout
- Read and write x86-64 assembly
- Call C functions from assembly
- Make Linux system calls
- Reverse engineer compiled binaries

### Phase 2: Practice (10-15 hours)

```
labs/lab-01-basic-arithmetic/      (1-2h)
    ↓
labs/lab-02-string-manipulation/   (2-3h)
    ↓
labs/lab-03-function-calls/        (2-3h)
    ↓
labs/lab-04-buffer-overflow/       (3-4h)
    ↓
labs/lab-05-reverse-engineering/   (3-4h)
```

**What you'll practice:**
- Arithmetic operations in assembly
- String manipulation and memory
- Function calls and stack frames
- Buffer overflow vulnerabilities
- Real binary analysis

### Phase 3: Challenges (ongoing)

```
ctf-writeups/picoctf/              (ongoing)
    ↓
ctf-writeups/overthewire/          (ongoing)
    ↓
ctf-writeups/other-ctfs/           (ongoing)
```

**What you'll solve:**
- Real CTF challenges
- Document your approach
- Learn from others' writeups
- Build a portfolio

## Key Files to Read

### Main Documentation

| File | Purpose | Time |
|------|---------|------|
| `README.md` | Main project guide | 5 min |
| `learning/README.md` | Learning path overview | 5 min |
| `labs/README.md` | Labs overview | 5 min |
| `ctf-writeups/README.md` | CTF guide | 5 min |
| `resources/README.md` | Resources overview | 5 min |

### Quick Reference

| File | Purpose |
|------|---------|
| `resources/cheatsheets/x86-64-cheatsheet.md` | Instruction reference |
| `resources/cheatsheets/nasm-syntax.md` | NASM syntax |
| `resources/cheatsheets/syscalls-reference.md` | Linux syscalls |
| `resources/cheatsheets/gdb-commands.md` | GDB debugging |

### Tool Setup

| File | Purpose |
|------|---------|
| `resources/tools-setup/nasm-setup.md` | Install NASM |
| `resources/tools-setup/ghidra-setup.md` | Install Ghidra |
| `resources/tools-setup/gdb-setup.md` | Install GDB |

## Essential Tools

### Install Everything

```bash
# Linux (Ubuntu/Debian)
sudo apt update
sudo apt install nasm gcc binutils gdb openjdk-11-jdk

# Verify installation
nasm -version
gcc --version
gdb --version
java -version
```

### Download Ghidra

```bash
# Visit https://ghidra-sre.org/
# Download latest release
unzip ghidra_*.zip
cd ghidra_*/
./ghidraRun
```

## First Steps

### Step 1: Read the Main README

```bash
cat README.md
```

This gives you the big picture and learning objectives.

### Step 2: Start with Learning Module 1

```bash
cd learning/01-x86-architecture
cat README.md
```

Understand CPU architecture before writing code.

### Step 3: Build Your First Assembly Program

```bash
cd learning/02-assembly-basics
cat README.md
make
./hello
```

### Step 4: Debug with GDB

```bash
gdb ./hello
(gdb) break _start
(gdb) run
(gdb) stepi
(gdb) info registers
(gdb) quit
```

### Step 5: Complete First Lab

```bash
cd labs/lab-01-basic-arithmetic
cat README.md
# Try to solve without looking at solution
make
./lab1
echo $?
```

## Tips for Success

✅ **Type out the code** — don't copy-paste. Your fingers learn.

✅ **Predict before running** — what will this do? Then verify.

✅ **Use GDB** — step through code instruction by instruction.

✅ **Draw diagrams** — visualize memory, stack, registers.

✅ **Ask why** — why does this instruction exist? When would you use it?

✅ **Don't skip modules** — each builds on previous knowledge.

✅ **Write comments** — explain what each instruction does.

✅ **Experiment** — modify examples and see what breaks.

## Common Questions

### Q: Where do I start?

**A:** Read `README.md`, then follow `learning/README.md` in order.

### Q: How long will this take?

**A:** 40-70 hours total (13-19h learning + 10-15h labs + ongoing challenges).

### Q: Can I skip modules?

**A:** Not recommended. Each module builds on previous knowledge. If you know some C, you can start at module 2.

### Q: What if I get stuck?

**A:** 
1. Re-read the module README
2. Look at the solution code
3. Use GDB to debug
4. Check the cheatsheets
5. Search external resources

### Q: How do I practice?

**A:** Complete the labs in order, then solve CTF challenges.

### Q: Can I add my own challenges?

**A:** Yes! Create a folder in `ctf-writeups/` and write a writeup.

## File Organization

### Old Paths → New Paths

If you were using the old structure:

```
Learn_Assembly/              → learning/02-assembly-basics/
Learn_Assembly/Clang_ref/    → learning/03-c-interop/c-reference/
binary-pwn/                  → labs/lab-04-buffer-overflow/
practice/picoCTF/            → ctf-writeups/picoctf/crackme-100/
```

**Old files are still there** for backward compatibility. You can delete them when ready:

```bash
rm -rf Learn_Assembly binary-pwn practice
```

## Next Actions

### Right Now (5 minutes)

- [ ] Read `README.md`
- [ ] Read `learning/README.md`
- [ ] Choose your starting point

### Today (30 minutes)

- [ ] Install tools (NASM, GCC, GDB, Ghidra)
- [ ] Build your first assembly program
- [ ] Run it in GDB

### This Week (2-3 hours)

- [ ] Complete `learning/01-x86-architecture/`
- [ ] Complete `learning/02-assembly-basics/`
- [ ] Solve `labs/lab-01-basic-arithmetic/`

### This Month (20-40 hours)

- [ ] Complete all learning modules
- [ ] Solve all labs
- [ ] Start CTF challenges

## Resources

### Internal

- **Main guide** — `README.md`
- **Learning path** — `learning/README.md`
- **Cheatsheets** — `resources/cheatsheets/`
- **Tool setup** — `resources/tools-setup/`
- **External links** — `resources/useful-links.md`

### External

- **picoCTF** — https://picoctf.org/
- **OverTheWire** — https://overthewire.org/
- **Ghidra** — https://ghidra-sre.org/
- **GDB Manual** — https://sourceware.org/gdb/

## Getting Help

### When You're Stuck

1. **Re-read the module README** — most answers are there
2. **Check the cheatsheets** — quick reference
3. **Look at solution code** — see how it's done
4. **Use GDB** — debug step-by-step
5. **Search online** — Stack Overflow, documentation

### How to Ask for Help

- **Be specific** — describe what you tried
- **Show your work** — include code/output
- **Provide context** — what are you trying to do?
- **Be respectful** — people help for free

## Celebrating Progress

### Milestones

- ✅ Completed learning/01-x86-architecture/ — You understand CPU architecture!
- ✅ Completed learning/02-assembly-basics/ — You can write assembly!
- ✅ Completed learning/03-c-interop/ — You understand C/assembly interaction!
- ✅ Completed learning/04-syscalls/ — You can make system calls!
- ✅ Completed learning/05-binary-analysis/ — You can reverse engineer!
- ✅ Completed all labs — You can solve problems!
- ✅ Solved first CTF challenge — You're a reverse engineer!

## Final Thoughts

This repository is designed to take you from **complete beginner to solving real reverse engineering challenges** in 40-70 hours.

The key is:
1. **Follow the learning path** — don't skip modules
2. **Practice with labs** — hands-on learning
3. **Solve real challenges** — apply your knowledge
4. **Document your journey** — write writeups

**You've got this!** 🎯

---

## Next Step

Ready to start? Open your terminal and run:

```bash
cd learning/01-x86-architecture
cat README.md
```

Happy learning! 🚀
