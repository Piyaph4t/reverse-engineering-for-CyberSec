# Lab 3: Function Calls

## Problem Statement

Write an x86-64 assembly program that:

1. Defines and calls a function
2. Passes arguments via registers (RDI, RSI, RDX)
3. Returns a value in RAX
4. Properly manages the stack

## Learning Objectives

- Understand function prologue and epilogue
- Pass arguments correctly (calling convention)
- Return values from functions
- Manage stack frames

## Challenge

Write a program that:
1. Defines a function `add(a, b)` that returns a + b
2. Calls it with arguments 10 and 20
3. Calls it again with different arguments
4. Exits with the final result as exit code

**Hint:** Remember the stack must be 16-byte aligned before CALL.

## Testing

```bash
make
./lab3
echo $?  # Should print result
```

## Resources

- **Function Calls** — `learning/02-assembly-basics/README.md`
- **Calling Convention** — `learning/01-x86-architecture/README.md`
- **C Interop** — `learning/03-c-interop/README.md`
