# Lab 4: Buffer Overflow

## Problem Statement

This lab teaches you to **understand and exploit a buffer overflow vulnerability** — one of the most common security issues in C programs.

## Learning Objectives

- Understand stack layout and buffer boundaries
- Recognize vulnerable code patterns
- Craft an exploit to control program flow
- Write and execute shellcode

## Vulnerability

The vulnerable C program:

```c
#include <stdio.h>
#include <string.h>

void vulnerable_function(char *input) {
    char buffer[64];
    strcpy(buffer, input);  // VULNERABLE: no bounds checking!
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input>\n", argv[0]);
        return 1;
    }
    vulnerable_function(argv[1]);
    printf("Program completed normally\n");
    return 0;
}
```

**Problem:** `strcpy()` copies without checking buffer size. If input > 64 bytes, it overwrites the stack.

## Challenge

1. **Understand the vulnerability** — why does it happen?
2. **Craft an exploit** — overflow the buffer to control RIP
3. **Execute shellcode** — make the program do something unexpected
4. **Capture the flag** — prove you controlled execution

## Stack Layout

```
Before overflow:
┌──────────────────────┐
│ Return address       │ ← We want to overwrite this
├──────────────────────┤
│ Old RBP              │
├──────────────────────┤
│ buffer[0-63]         │ ← 64-byte buffer
│ (empty space)        │
└──────────────────────┘

After overflow (input = "A"*72 + <address>):
┌──────────────────────┐
│ <address>            │ ← Overwritten return address
├──────────────────────┤
│ Old RBP (overwritten)│
├──────────────────────┤
│ "AAAA...AAAA"        │ ← Overflow data
└──────────────────────┘
```

## Exploit Steps

### Step 1: Find the Offset

How many bytes until we reach the return address?

```
64 bytes (buffer) + 8 bytes (RBP) = 72 bytes
```

### Step 2: Craft the Payload

```python
payload = b'A' * 72 + <target_address>
```

### Step 3: Identify Target Address

Where should RIP jump?
- Option 1: Jump to shellcode in buffer
- Option 2: Jump to existing code (ROP gadget)
- Option 3: Jump to system() call

### Step 4: Execute

```bash
./vulnerable $(python3 -c "print('A'*72 + ...)")
```

## Files in This Lab

| File | Purpose |
|------|---------|
| `vulnerable.c` | Vulnerable program |
| `exploit.py` | Python exploit script |
| `writeup.md` | Detailed explanation |
| `Makefile` | Build instructions |

## Building

```bash
make              # Compile vulnerable program
make test         # Run exploit
```

## Testing the Exploit

```bash
python3 exploit.py
# Should show how to overflow the buffer
```

## Writeup

See `writeup.md` for:
- Detailed vulnerability analysis
- Stack layout diagrams
- Exploit development process
- Shellcode explanation
- Defense mechanisms

## Key Concepts

### Why strcpy is Dangerous

```c
strcpy(dest, src);  // Copies until null terminator
// No check if src is larger than dest!
```

### Safe Alternative

```c
strncpy(dest, src, sizeof(dest) - 1);  // Limits copy
dest[sizeof(dest) - 1] = '\0';          // Ensure null termination
```

### Modern Protections

Modern systems have protections against buffer overflows:
- **ASLR** — randomize memory addresses
- **Stack canaries** — detect overflow
- **DEP/NX** — prevent code execution on stack
- **CFI** — control flow integrity

This lab disables these for learning purposes.

## Exercises

### Exercise 4.1: Find the Offset

Write a script to:
1. Send increasing amounts of data
2. Detect when the program crashes
3. Calculate exact offset to RIP

### Exercise 4.2: Overwrite RIP

Modify the exploit to:
1. Overflow the buffer
2. Overwrite RIP with a specific address
3. Make the program jump to a different function

### Exercise 4.3: Shellcode

Write assembly shellcode that:
1. Executes a syscall
2. Prints a message
3. Exits cleanly

---

## Resources

- **Buffer Overflow Basics** — `learning/05-binary-analysis/`
- **Shellcode Writing** — `resources/cheatsheets/`
- **OWASP CWE-120** — [Buffer Copy without Bounds Check](https://cwe.mitre.org/data/definitions/120.html)

---

## Security Note

This lab is for **educational purposes only**. Buffer overflows are serious security vulnerabilities. Understanding them helps you:
- Write secure code
- Find vulnerabilities in code review
- Defend against attacks
- Understand exploit techniques

**Never exploit systems without authorization.**
