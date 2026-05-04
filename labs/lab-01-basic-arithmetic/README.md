# Lab 1: Basic Arithmetic

## Problem Statement

Write an x86-64 assembly program that:

1. Loads two numbers into registers
2. Performs arithmetic operations (add, subtract, multiply, divide)
3. Stores results
4. Exits with the final result as the exit code

## Learning Objectives

- Use MOV to load values
- Perform arithmetic with ADD, SUB, MUL, DIV
- Understand register sizes and overflow
- Exit with a result code

## Challenge

Write a program that:
1. Loads 15 into RAX
2. Loads 3 into RBX
3. Adds them: RAX += RBX (result: 18)
4. Divides by 2: RAX /= 2 (result: 9)
5. Exits with RAX as exit code

**Hint:** Use `div` instruction. Remember to clear RDX before division.

## Testing

```bash
make
./lab1
echo $?  # Should print 9
```

## Solution

See `solution.asm` for reference.

## Writeup

### Key Concepts

**MOV Instruction:**
```asm
mov rax, 15    ; Load 15 into RAX
mov rbx, 3     ; Load 3 into RBX
```

**ADD Instruction:**
```asm
add rax, rbx   ; RAX += RBX (15 + 3 = 18)
```

**DIV Instruction:**
```asm
xor rdx, rdx   ; Clear RDX (required for div)
mov rcx, 2     ; Divisor
div rcx        ; RAX /= RCX, RDX = remainder
```

**Exit:**
```asm
mov rax, 60    ; sys_exit
mov rdi, rax   ; Exit code (result)
syscall
```

### Common Mistakes

❌ **Forgetting to clear RDX before DIV**
- DIV uses RDX:RAX as dividend
- Must clear RDX first: `xor rdx, rdx`

❌ **Using wrong register sizes**
- `div rbx` divides 128-bit RDX:RAX by RBX
- Result in RAX, remainder in RDX

❌ **Dividing by zero**
- Will cause segfault
- Always validate divisor

---

## Exercises

### Exercise 1.1: Different Numbers

Modify the program to:
- Load 100 into RAX
- Load 7 into RBX
- Add them
- Exit with result

### Exercise 1.2: Multiple Operations

Modify to:
1. Load 10 into RAX
2. Add 5: RAX += 5 (15)
3. Multiply by 2: RAX *= 2 (30)
4. Subtract 6: RAX -= 6 (24)
5. Exit with result

### Exercise 1.3: Overflow Detection

Explore what happens when you:
1. Add two large numbers
2. Multiply causing overflow
3. Check the carry flag (CF)

---

## Resources

- **Arithmetic Instructions** — `resources/cheatsheets/x86-64-cheatsheet.md`
- **DIV Instruction Details** — Intel Manual Vol. 2A
