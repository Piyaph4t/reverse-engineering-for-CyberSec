# NASM Setup Guide

## Installation

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install nasm
```

### Linux (Fedora/RHEL)

```bash
sudo dnf install nasm
```

### Linux (Arch)

```bash
sudo pacman -S nasm
```

### macOS

```bash
brew install nasm
```

### Windows

Download from [nasm.us](https://www.nasm.us/download.html) or use:

```bash
choco install nasm
```

## Verification

```bash
nasm -version
# Output: NASM version 2.15.05 (or newer)
```

## Basic Usage

### Assemble a File

```bash
nasm -f elf64 program.asm -o program.o
```

### Link with GCC

```bash
gcc -no-pie program.o -o program
```

### Run

```bash
./program
echo $?  # Check exit code
```

## Common Flags

```bash
-f elf64        # Output format (64-bit ELF)
-f elf32        # Output format (32-bit ELF)
-f win64        # Output format (Windows 64-bit)
-o output.o     # Output file
-l listing.lst  # Generate listing file
-g              # Include debug symbols
-O0             # No optimization
-O1             # Basic optimization
```

## Example Makefile

```makefile
NASM = nasm
GCC = gcc
CFLAGS = -m64 -fno-pie -nostdlib

SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:.asm=.o)
TARGETS = $(SOURCES:.asm=)

all: $(TARGETS)

%: %.o
	$(GCC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(NASM) -f elf64 $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGETS)

.PHONY: all clean
```

## Troubleshooting

### "nasm: command not found"
- Install NASM: `sudo apt install nasm`
- Check PATH: `echo $PATH`

### "Error: invalid output format"
- Use correct format: `-f elf64` for 64-bit Linux
- Use `-f elf32` for 32-bit Linux

### "Linking errors"
- Ensure GCC is installed: `sudo apt install gcc`
- Use correct GCC flags: `-m64 -fno-pie -nostdlib`

### "Segmentation fault"
- Check syscall numbers (different for 32-bit vs 64-bit)
- Verify memory addresses
- Use GDB to debug: `gdb ./program`

## Next Steps

- Learn NASM syntax: `resources/cheatsheets/nasm-syntax.md`
- Start with assembly basics: `learning/02-assembly-basics/`
- Use Makefile for easy building

---

For more help: `man nasm` or https://www.nasm.us/doc/
