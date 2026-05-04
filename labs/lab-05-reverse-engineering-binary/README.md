# Lab 5: Reverse Engineering Binary

## Problem Statement

You are given a **compiled binary without source code**. Your task is to:

1. Analyze the binary using tools (objdump, strings, Ghidra)
2. Understand what it does
3. Identify key functions and logic
4. Document your findings

## Learning Objectives

- Use disassembly tools effectively
- Recognize code patterns (loops, conditionals, function calls)
- Use Ghidra for decompilation
- Understand compiler-generated code
- Document reverse engineering process

## Challenge

Given a mystery binary:
1. Determine its purpose
2. Identify all functions
3. Understand the main logic
4. Write a detailed analysis
5. Recreate the functionality in C or assembly

## Analysis Steps

### Step 1: Basic Information

```bash
file binary
strings binary | head -20
objdump -t binary | grep -i main
```

### Step 2: Disassembly

```bash
objdump -d binary > disasm.txt
objdump -d binary | grep -A 30 "<main>:"
```

### Step 3: Ghidra Analysis

1. Open Ghidra
2. Import the binary
3. Analyze
4. View decompiled code
5. Identify functions and logic

### Step 4: Document Findings

Create a writeup explaining:
- What the program does
- Key functions
- Logic flow
- Any vulnerabilities

## Testing

```bash
make
./binary [arguments]
```

## Resources

- **Binary Analysis** — `learning/05-binary-analysis/README.md`
- **Ghidra Guide** — `learning/05-binary-analysis/README.md`
- **objdump** — `resources/cheatsheets/`
