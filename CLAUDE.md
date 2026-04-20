# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run Assembly (NASM)

### 32-bit Assembly (i386)
```bash
nasm -f elf32 <file>.asm -o <file>.o
gcc -m32 -fno-pie -nostdlib <file>.o -o <file>
./<file>
```

### 64-bit Assembly (x86_64)
```bash
nasm -f elf64 <file>.asm -o <file>.o
gcc -m64 -fno-pie -nostdlib <file>.o -o <file>
./<file>
```

## Key Systems Calls (x86_64)
- `rax=1` → `sys_write` (rdi=fd, rsi=buf, rdx=len)
- `rax=60` → `sys_exit` (rdi=status)
- Use `syscall` instruction

## Key System Calls (i386)
- `eax=4` → `sys_write` (edi=fd, esi=buf, edx=len)
- `eax=1` → `sys_exit` (ebx=status)
- Use `int 0x80` instruction

## Architecture
This is a learning repository for reverse engineering with:
- **x86/x86_64 assembly** examples using NASM
- Binary analysis with objdump, strings, Ghidra
- System call exploration (Linux syscalls via int 0x80 and syscall)
