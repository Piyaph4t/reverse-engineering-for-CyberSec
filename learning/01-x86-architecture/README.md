# x86-64 Architecture Fundamentals

## Overview

Before you write a single line of assembly, you need to understand the **hardware** you're programming. x86-64 is the dominant architecture on modern computers — understanding it is the foundation of reverse engineering.

## What You'll Learn

- **Registers** — CPU's fast memory (64-bit)
- **Memory Layout** — how programs are organized in RAM
- **Calling Conventions** — how functions pass arguments and return values
- **Flags** — how the CPU tracks conditions (zero, carry, sign, etc.)

---

## 1. Registers

### General Purpose Registers (64-bit)

```
┌─────────────────────────────────────────┐
│ 64-bit (rax) │ 32-bit (eax) │ 16-bit (ax) │
├──────────────┼──────────────┼─────────────┤
│     RAX      │     EAX      │     AX      │
│     RBX      │     EBX      │     BX      │
│     RCX      │     ECX      │     CX      │
│     RDX      │     EDX      │     DX      │
│     RSI      │     ESI      │     SI      │
│     RDI      │     EDI      │     DI      │
│     RBP      │     EBP      │     BP      │
│     RSP      │     ESP      │     SP      │
│ R8 - R15    │ R8D - R15D   │ R8W - R15W  │
└──────────────┴──────────────┴─────────────┘
```

### Special Purpose Registers

| Register | Purpose |
|----------|---------|
| **RAX** | Accumulator — return values, arithmetic |
| **RBX** | Base — general purpose |
| **RCX** | Counter — loop counters, shift counts |
| **RDX** | Data — arithmetic, I/O |
| **RSI** | Source Index — string operations, function arg #2 |
| **RDI** | Destination Index — string operations, function arg #1 |
| **RBP** | Base Pointer — stack frame base |
| **RSP** | Stack Pointer — top of stack |
| **RIP** | Instruction Pointer — next instruction (read-only) |

### Calling Convention (System V AMD64 ABI)

When calling a function, arguments are passed in this order:

```
Argument 1 → RDI
Argument 2 → RSI
Argument 3 → RDX
Argument 4 → RCX
Argument 5 → R8
Argument 6 → R9
Extra args → Stack (right-to-left)

Return value → RAX (or RDX:RAX for 128-bit)
```

**Example:**
```c
int add(int a, int b, int c);  // a in RDI, b in RSI, c in RDX
```

---

## 2. Memory Layout

A running process has this memory layout (from low to high addresses):

```
┌─────────────────────────────────────────┐
│  Text Segment (Code)                    │  Read-only
│  .text section                          │
├─────────────────────────────────────────┤
│  Initialized Data (.data)               │  Global variables with values
├─────────────────────────────────────────┤
│  Uninitialized Data (.bss)              │  Global variables (zero-init)
├─────────────────────────────────────────┤
│  Heap (grows upward →)                  │  malloc(), dynamic allocation
│                                         │
├─────────────────────────────────────────┤
│                                         │
│  (unused space)                         │
│                                         │
├─────────────────────────────────────────┤
│  Stack (grows downward ←)               │  Local variables, return addresses
│  RSP points here                        │
└─────────────────────────────────────────┘
```

### Stack Frame

When a function is called:

```
Before call:
┌─────────────────┐
│ Caller's data   │
├─────────────────┤
│ Return address  │ ← RSP (pushed by call instruction)
└─────────────────┘

After function prologue (push rbp; mov rbp, rsp):
┌─────────────────┐
│ Caller's data   │
├─────────────────┤
│ Return address  │
├─────────────────┤
│ Old RBP         │ ← RBP (saved base pointer)
├─────────────────┤
│ Local vars      │
│ ...             │ ← RSP (after sub rsp, N)
└─────────────────┘
```

---

## 3. Flags Register

The CPU maintains a **Flags Register (RFLAGS)** that tracks conditions:

| Flag | Name | Meaning |
|------|------|---------|
| **ZF** | Zero Flag | Set if result is zero |
| **CF** | Carry Flag | Set if arithmetic overflow/underflow |
| **SF** | Sign Flag | Set if result is negative |
| **OF** | Overflow Flag | Set if signed overflow |
| **PF** | Parity Flag | Set if result has even number of 1 bits |
| **AF** | Auxiliary Flag | Set if carry from bit 3 |

These flags are used by **conditional jumps**:

```asm
cmp rax, rbx      ; compare: sets flags
je label          ; jump if equal (ZF set)
jne label         ; jump if not equal (ZF clear)
jl label          ; jump if less (SF != OF)
jg label          ; jump if greater (SF == OF and ZF clear)
```

---

## 4. Key Concepts

### Endianness

x86-64 is **little-endian**: least significant byte first.

```
Value: 0x12345678
Memory (address 0x1000):
  0x1000: 0x78
  0x1001: 0x56
  0x1002: 0x34
  0x1003: 0x12
```

### Alignment

Data is typically aligned to its size:
- 1-byte data: any address
- 2-byte data: even addresses
- 4-byte data: addresses divisible by 4
- 8-byte data: addresses divisible by 8

### Sign Extension

When moving smaller values to larger registers:
- `movzx` — zero extend (pad with zeros)
- `movsx` — sign extend (pad with sign bit)

```asm
mov al, 0xFF        ; AL = 0xFF (255 unsigned, -1 signed)
movzx rax, al       ; RAX = 0x00000000000000FF (255)
movsx rax, al       ; RAX = 0xFFFFFFFFFFFFFFFF (-1)
```

---

## 5. Practical Exercise

### Predict the Output

```asm
mov rax, 10
mov rbx, 3
add rax, rbx
```

**What's in RAX now?** (Answer: 13)

### Another One

```asm
mov rax, 0x80000000  ; 32-bit: -2147483648 (signed)
mov rbx, 1
add eax, ebx         ; Add to 32-bit portion
```

**What's in RAX?** (Answer: 0x80000001, or -2147483647 in 32-bit signed)

---

## 6. Resources

- **Intel x86-64 Manual** — [Download](https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4.pdf)
- **System V AMD64 ABI** — [Calling conventions](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI)
- **x86-64 Cheatsheet** — See `resources/cheatsheets/x86-64-cheatsheet.md`

---

## Next Steps

Once you understand registers, memory, and calling conventions, you're ready for **[Assembly Basics](../02-assembly-basics/)**.

---

## Quick Reference

| Concept | Key Point |
|---------|-----------|
| **Registers** | RAX, RBX, RCX, RDX, RSI, RDI, RBP, RSP |
| **Function args** | RDI, RSI, RDX, RCX, R8, R9 |
| **Return value** | RAX |
| **Stack grows** | Downward (decreasing addresses) |
| **Flags** | ZF, CF, SF, OF (set by comparisons) |
| **Endianness** | Little-endian (LSB first) |
