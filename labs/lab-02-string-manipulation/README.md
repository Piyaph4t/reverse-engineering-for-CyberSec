# Lab 2: String Manipulation

## Problem Statement

Write an x86-64 assembly program that:

1. Works with strings in memory
2. Calculates string length
3. Copies strings
4. Compares strings
5. Demonstrates memory addressing

## Learning Objectives

- Use LEA (Load Effective Address) for memory operations
- Understand memory addressing modes
- Work with loops and counters
- Manipulate data in memory

## Challenge

Write a program that:
1. Defines a string in the `.data` section
2. Calculates its length (without using a library function)
3. Copies it to a buffer
4. Exits with the length as exit code

**Hint:** Use a loop with RCX as counter, increment until null terminator.

## Testing

```bash
make
./lab2
echo $?  # Should print string length
```

## Resources

- **Memory Addressing** — `learning/02-assembly-basics/README.md`
- **Loops** — `learning/02-assembly-basics/README.md`
