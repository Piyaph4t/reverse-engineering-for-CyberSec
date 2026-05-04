# Reverse Engineering Learning Repository

A **comprehensive, structured learning repository** for mastering reverse engineering, assembly language, and binary analysis.

## 🎯 What This Repository Is

This is a **self-paced learning journey** from complete beginner to intermediate reverse engineer. It's organized into three progressive sections:

1. **📚 Learning** — Theory and fundamentals
2. **🧪 Labs** — Hands-on exercises
3. **🚩 CTF Writeups** — Real challenges and solutions

## 🚀 Quick Start

### For Complete Beginners

Start here and follow in order:

```
1. learning/01-x86-architecture/     (2-3 hours)
2. learning/02-assembly-basics/      (4-6 hours)
3. learning/03-c-interop/            (2-3 hours)
4. learning/04-syscalls/             (2-3 hours)
5. learning/05-binary-analysis/      (3-4 hours)
```

**Total: ~13-19 hours** to build a solid foundation.

### For Experienced Programmers

Jump to the section that interests you:
- **Want to learn assembly?** → `learning/02-assembly-basics/`
- **Want to reverse engineer?** → `learning/05-binary-analysis/`
- **Want to practice?** → `labs/`
- **Want to solve CTFs?** → `ctf-writeups/`

## 📖 Repository Structure

```
reverse_engineering/
│
├── 📚 learning/                    # Theory & Fundamentals
│   ├── 01-x86-architecture/        # CPU registers, memory, calling conventions
│   ├── 02-assembly-basics/         # NASM syntax, instructions, building
│   ├── 03-c-interop/               # Calling C from assembly
│   ├── 04-syscalls/                # Linux syscalls (write, read, exit, etc.)
│   └── 05-binary-analysis/         # Disassembly, Ghidra, reverse engineering
│
├── 🧪 labs/                        # Hands-On Exercises
│   ├── lab-01-basic-arithmetic/    # MOV, ADD, SUB, MUL, DIV
│   ├── lab-02-string-manipulation/ # Memory, loops, strings
│   ├── lab-03-function-calls/      # CALL, RET, stack frames
│   ├── lab-04-buffer-overflow/     # Vulnerability & exploitation
│   └── lab-05-reverse-engineering/ # Binary analysis capstone
│
├── 🚩 ctf-writeups/                # External Challenges
│   ├── picoctf/                    # picoCTF challenges & solutions
│   ├── overthewire/                # OverTheWire wargames
│   └── other-ctfs/                 # Other competitions
│
├── 📋 resources/                   # Reference Materials
│   ├── cheatsheets/                # Quick reference cards
│   ├── tools-setup/                # Installation guides
│   └── useful-links.md             # External resources
│
├── README.md                       # This file
├── CLAUDE.md                       # Project instructions
└── .gitignore                      # Git ignore rules
```

## 🎓 Learning Path

### Beginner (0-20 hours)

**Goal:** Understand x86-64 architecture and write basic assembly.

```
learning/01-x86-architecture/
    ↓
learning/02-assembly-basics/
    ↓
labs/lab-01-basic-arithmetic/
    ↓
labs/lab-02-string-manipulation/
```

**Outcome:** Can read and write simple assembly programs.

### Intermediate (20-40 hours)

**Goal:** Understand how C and assembly interact, reverse engineer binaries.

```
learning/03-c-interop/
    ↓
learning/04-syscalls/
    ↓
learning/05-binary-analysis/
    ↓
labs/lab-03-function-calls/
    ↓
labs/lab-04-buffer-overflow/
```

**Outcome:** Can reverse engineer compiled C programs, understand vulnerabilities.

### Advanced (40+ hours)

**Goal:** Solve real CTF challenges, exploit vulnerabilities.

```
labs/lab-05-reverse-engineering/
    ↓
ctf-writeups/picoctf/
    ↓
ctf-writeups/overthewire/
    ↓
ctf-writeups/other-ctfs/
```

**Outcome:** Can solve real reverse engineering challenges, write exploits.

## 🛠️ Prerequisites

You need:
- **Linux system** (or WSL/VM)
- **NASM assembler:** `sudo apt install nasm`
- **GCC compiler:** `sudo apt install gcc`
- **Binutils:** `sudo apt install binutils`
- **GDB debugger:** `sudo apt install gdb`
- **Ghidra** (optional): [Download](https://ghidra-sre.org/)

### Quick Setup

```bash
# Install all tools
sudo apt update
sudo apt install nasm gcc binutils gdb

# Verify installation
nasm -version
gcc --version
objdump --version
gdb --version
```

## 📚 How to Use This Repository

### 1. Pick Your Starting Point

- **Complete beginner?** → Start with `learning/01-x86-architecture/`
- **Know some C?** → Start with `learning/02-assembly-basics/`
- **Know assembly?** → Start with `learning/05-binary-analysis/`
- **Want to practice?** → Start with `labs/`
- **Want challenges?** → Start with `ctf-writeups/`

### 2. Follow the README in Each Section

Each module has a comprehensive README explaining:
- What you'll learn
- Key concepts
- Examples
- Exercises
- Resources

### 3. Build and Run Code

```bash
cd learning/02-assembly-basics
make              # Build all examples
./hello           # Run hello world
make clean        # Clean build artifacts
```

### 4. Use GDB to Debug

```bash
gdb ./hello
(gdb) break _start
(gdb) run
(gdb) stepi
(gdb) info registers
(gdb) quit
```

### 5. Write Writeups

When solving CTF challenges:
1. Document your process
2. Explain what you found
3. Show your solution
4. Save the flag

See `ctf-writeups/README.md` for writeup format.

## 🎯 Learning Objectives

By completing this repository, you will:

✅ **Understand x86-64 architecture** — registers, memory, calling conventions

✅ **Read and write assembly** — NASM syntax, instructions, building

✅ **Reverse engineer binaries** — disassembly, pattern recognition, Ghidra

✅ **Understand vulnerabilities** — buffer overflow, exploitation

✅ **Solve CTF challenges** — apply knowledge to real problems

✅ **Think like an attacker** — understand exploit techniques

✅ **Write secure code** — defend against attacks

## 🔗 Quick Links

| Resource | Link |
|----------|------|
| **Learning Guide** | `learning/README.md` |
| **Labs Guide** | `labs/README.md` |
| **CTF Writeups** | `ctf-writeups/README.md` |
| **Cheatsheets** | `resources/cheatsheets/` |
| **Tool Setup** | `resources/tools-setup/` |
| **Useful Links** | `resources/useful-links.md` |

## 📖 Recommended Resources

### Books
- **"Practical Reverse Engineering"** by Dang, Gazet, Bachaalany
- **"The Art of Software Security Testing"** by Wysopal et al.
- **"Hacking: The Art of Exploitation"** by Erickson

### Online
- **picoCTF** — [picoctf.org](https://picoctf.org/)
- **OverTheWire** — [overthewire.org](https://overthewire.org/)
- **Ghidra Documentation** — [ghidra-sre.org](https://ghidra-sre.org/)
- **Intel x86-64 Manual** — [intel.com](https://www.intel.com/)

## 💡 Tips for Success

✅ **Type out the code** — don't copy-paste. Your fingers learn.

✅ **Predict before running** — what will this do? Then verify.

✅ **Use GDB** — step through code instruction by instruction.

✅ **Draw diagrams** — visualize memory, stack, registers.

✅ **Ask why** — why does this instruction exist? When would you use it?

✅ **Don't skip labs** — each builds on previous knowledge.

✅ **Write writeups** — explaining teaches you.

✅ **Experiment** — modify examples and see what breaks.

## 🚨 Security & Ethics

This repository is for **educational purposes only**.

- **Use knowledge defensively** — write secure code, find vulnerabilities in code review
- **Never exploit without authorization** — CTF challenges are authorized
- **Respect privacy** — don't reverse engineer others' code without permission
- **Follow laws** — understand the legal implications of your actions

## 📝 Contributing

Found an error? Have a better explanation? Want to add a challenge?

1. Create an issue or pull request
2. Follow the existing structure
3. Include clear explanations
4. Test your code

## 📅 Project Info

- **Started:** 2026-04-20
- **Author:** Piyaphat Jaiboon
- **Focus:** Reverse Engineering & Binary Analysis
- **Level:** Beginner to Intermediate

## 🎓 Learning Outcomes

### After Completing This Repository

You will be able to:

1. **Read assembly code fluently** — understand what compiled code does
2. **Write assembly programs** — from hello world to complex logic
3. **Reverse engineer binaries** — use tools like Ghidra and objdump
4. **Understand vulnerabilities** — recognize buffer overflows and exploits
5. **Solve CTF challenges** — apply knowledge to real problems
6. **Think like a security professional** — understand attacker and defender perspectives

## 🤝 Support

- **Questions?** Check the README in each section
- **Stuck?** Look at the solution and understand it
- **Want more?** Try the exercises and extensions
- **Need help?** See `resources/useful-links.md`

## 📄 License

This repository is for educational purposes. Use responsibly.

---

## Next Steps

**Ready to start?** Choose your path:

- 🔰 **Complete beginner?** → [Start with x86 Architecture](learning/01-x86-architecture/)
- 📖 **Know some C?** → [Start with Assembly Basics](learning/02-assembly-basics/)
- 🔍 **Want to reverse engineer?** → [Start with Binary Analysis](learning/05-binary-analysis/)
- 🧪 **Want to practice?** → [Start with Labs](labs/)
- 🚩 **Want challenges?** → [Start with CTF Writeups](ctf-writeups/)

**Happy learning!** 🎯
