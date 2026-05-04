# picoCTF Challenges

Welcome to the picoCTF section! These are beginner-friendly reverse engineering challenges from the picoCTF competition.

## About picoCTF

**picoCTF** is a free, beginner-friendly CTF competition run by Carnegie Mellon University. It's perfect for learning reverse engineering, cryptography, and exploitation.

- **Website:** [picoctf.org](https://picoctf.org/)
- **Difficulty:** ⭐ to ⭐⭐⭐
- **Focus:** Reverse engineering, binary analysis, cryptography
- **Format:** Jeopardy-style (solve challenges in any order)

## Challenges in This Section

### crackme-100
A reverse engineering challenge where you must find the flag by analyzing a compiled binary.
- **Difficulty:** ⭐ Beginner
- **Topics:** Disassembly, pattern recognition, string analysis
- **Time:** 1-2 hours

See [crackme-100/README.md](crackme-100/) for details.

## How to Approach picoCTF Challenges

### Step 1: Understand the Challenge
- Read the problem statement
- Download the provided files
- Note any hints

### Step 2: Reconnaissance
```bash
file <binary>
strings <binary>
objdump -d <binary> | head -50
```

### Step 3: Analysis
- Use Ghidra to decompile
- Look for patterns (loops, conditionals, function calls)
- Identify key functions

### Step 4: Solve
- Understand the vulnerability or logic
- Craft the solution
- Capture the flag

### Step 5: Document
- Write a detailed writeup
- Save the flag
- Explain your approach

## Tips for picoCTF

✅ **Start with beginner challenges** — build confidence

✅ **Use multiple tools** — objdump, strings, Ghidra, GDB

✅ **Read error messages** — they often hint at the solution

✅ **Look for hardcoded values** — flags are often embedded

✅ **Check all sections** — .data, .rodata, .text

✅ **Use GDB** — step through suspicious code

---

## Challenge Progress

- [x] crackme-100 — [See writeup](crackme-100/writeup.md)
- [ ] [Add more challenges as you solve them]

---

## Resources

- **picoCTF Official** — [https://picoctf.org/](https://picoctf.org/)
- **picoCTF Discord** — Community help and discussion
- **Ghidra Guide** — `learning/05-binary-analysis/`
- **Reverse Engineering Guide** — `learning/`

---

## Next Steps

1. Visit [picoctf.org](https://picoctf.org/) and create an account
2. Start with beginner challenges
3. Solve [crackme-100](crackme-100/)
4. Document your writeup
5. Move to harder challenges

Good luck! 🚩
