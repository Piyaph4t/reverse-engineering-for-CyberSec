# 🚩 CTF Writeups: External Challenges & Solutions

Welcome to the CTF writeups section! Here you'll find **solutions and explanations** for challenges from external platforms like picoCTF and OverTheWire.

## Structure

Each challenge has:
- **README.md** — Challenge description and context
- **analysis/** — Disassembly, Ghidra notes, research
- **solution.c** or **solution.py** — Working solution
- **writeup.md** — **"How I solved this"** narrative
- **flag.txt** — The captured flag (if applicable)

## Platforms

### **picoCTF**
Beginner-friendly CTF with reverse engineering challenges.
- **Website:** [picoctf.org](https://picoctf.org/)
- **Difficulty:** ⭐ to ⭐⭐⭐
- **Focus:** Reverse engineering, binary analysis, exploitation

### **OverTheWire**
Wargames teaching security concepts through challenges.
- **Website:** [overthewire.org](https://overthewire.org/)
- **Games:** Bandit, Natas, Leviathan, Krypton, etc.
- **Difficulty:** ⭐ to ⭐⭐⭐⭐
- **Focus:** Linux, cryptography, web security

### **Other CTFs**
Various competitions and practice platforms.

---

## How to Use This Section

### For Each Challenge:

1. **Read README.md** — understand what you're solving
2. **Examine analysis/** — see what others discovered
3. **Read writeup.md** — understand the approach
4. **Study solution** — see how it was implemented
5. **Try it yourself** — solve without looking at solution
6. **Extend it** — modify and improve

### Structure of a Writeup

A good writeup has:

```markdown
# Challenge Name

## Challenge Description
What is the challenge asking?

## Initial Reconnaissance
What tools did you use? What did you find?

## Analysis
What did you discover? How does it work?

## Solution
Step-by-step how you solved it.

## Flag
The captured flag.

## Lessons Learned
What did you learn? What was tricky?
```

---

## Challenge Organization

```
ctf-writeups/
├── picoctf/
│   ├── README.md (picoCTF overview)
│   ├── crackme-100/
│   │   ├── README.md
│   │   ├── analysis/
│   │   │   ├── disassembly.txt
│   │   │   └── ghidra-notes.md
│   │   ├── solution.c
│   │   ├── solution.py
│   │   ├── writeup.md
│   │   └── flag.txt
│   └── [other-challenges]/
│
├── overthewire/
│   ├── README.md (OverTheWire overview)
│   ├── bandit/
│   │   ├── level-01/
│   │   │   ├── writeup.md
│   │   │   └── solution.sh
│   │   └── [other-levels]/
│   └── [other-games]/
│
└── other-ctfs/
    └── [challenge-name]/
```

---

## Tips for Writeups

### ✅ Good Writeup Practices

- **Show your process** — not just the answer
- **Include failures** — what didn't work and why
- **Use diagrams** — visualize complex concepts
- **Explain tools** — how you used objdump, Ghidra, etc.
- **Document commands** — make it reproducible
- **Explain the flag** — why is this the answer?

### ❌ Avoid

- Just posting the flag without explanation
- Assuming reader knows the challenge
- Skipping intermediate steps
- Not explaining why something works

---

## Example Writeup Structure

```markdown
# picoCTF: crackme-100

## Challenge
> Reverse engineer this binary to find the flag.
> [binary file provided]

## Reconnaissance
```bash
file crackme100
# ELF 64-bit LSB executable
strings crackme100 | grep -i flag
# Found: "flag{...}"
```

## Analysis
Used Ghidra to decompile main():
[show decompiled code]

The program:
1. Reads input from user
2. Performs XOR with key 0x42
3. Compares with hardcoded value
4. Prints flag if match

## Solution
The hardcoded value is: 0x12345678
XOR with 0x42 to get original input:
0x12345678 ^ 0x42 = 0x1234563A

## Flag
flag{1234563A}

## Lessons
- Always check for hardcoded values
- XOR is reversible: A ^ B ^ B = A
```

---

## Getting Started

### Find a Challenge

1. Visit [picoctf.org](https://picoctf.org/) or [overthewire.org](https://overthewire.org/)
2. Pick a beginner challenge
3. Download or access the challenge
4. Create a folder in `ctf-writeups/`

### Solve It

1. Use tools from `learning/` section
2. Document your process
3. Write a writeup
4. Save the flag

### Share Your Writeup

1. Create `writeup.md` in challenge folder
2. Include analysis artifacts
3. Add solution code
4. Commit to git

---

## Challenge Checklist

### picoCTF
- [ ] crackme-100
- [ ] [Add more as you solve them]

### OverTheWire
- [ ] Bandit Level 1
- [ ] [Add more as you solve them]

### Other CTFs
- [ ] [Add challenges you solve]

---

## Resources

- **picoCTF** — [https://picoctf.org/](https://picoctf.org/)
- **OverTheWire** — [https://overthewire.org/](https://overthewire.org/)
- **CTFtime** — [https://ctftime.org/](https://ctftime.org/) — Find CTF events
- **Writeup Examples** — Search GitHub for "ctf-writeups"

---

## Next Steps

1. **Solve a challenge** — start with picoCTF beginner challenges
2. **Document your process** — write a detailed writeup
3. **Share your knowledge** — help others learn
4. **Keep practicing** — each challenge teaches something new

**Ready?** Start with [picoCTF: crackme-100](picoctf/crackme-100/).
