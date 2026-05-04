# GDB Setup Guide

## Installation

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install gdb
```

### Linux (Fedora/RHEL)

```bash
sudo dnf install gdb
```

### Linux (Arch)

```bash
sudo pacman -S gdb
```

### macOS

```bash
brew install gdb
```

### Windows

Download from [sourceware.org](https://sourceware.org/gdb/) or use:

```bash
choco install gdb
```

## Verification

```bash
gdb --version
# Output: GNU gdb (GDB) 12.1 (or newer)
```

## Basic Usage

### Start GDB

```bash
gdb ./program
```

### Common Commands

```bash
(gdb) break main              # Set breakpoint
(gdb) run                     # Run program
(gdb) stepi                   # Step one instruction
(gdb) info registers          # Show registers
(gdb) x/10x $rsp              # Examine memory
(gdb) disassemble main        # Disassemble function
(gdb) quit                    # Exit GDB
```

## Configuration

### Create .gdbinit File

Create `~/.gdbinit` for startup commands:

```bash
# Set disassembly flavor to Intel syntax
set disassembly-flavor intel

# Don't ask for confirmation on quit
set confirm off

# Show assembly code with source
set disassemble-next-line on

# Pretty print structures
set print pretty on

# Demangle C++ symbols
set print asm-demangle on

# Pagination
set pagination off
```

### Project-Specific .gdbinit

Create `.gdbinit` in project directory:

```bash
# Breakpoint at _start
break _start

# Display registers after each step
display $rax
display $rsp
display $rip
```

## Useful Aliases

Add to `~/.gdbinit`:

```bash
# Alias for common commands
alias ll = "x/10i $rip"           # List instructions
alias ss = "stepi"                # Step instruction
alias rr = "run"                  # Run
alias cc = "continue"             # Continue
alias bb = "backtrace"            # Backtrace
alias ii = "info registers"       # Info registers
alias mm = "x/10x $rsp"           # Memory at RSP
```

## Debugging Assembly

### Basic Workflow

```bash
gdb ./program
(gdb) break _start
(gdb) run
(gdb) disassemble
(gdb) stepi
(gdb) info registers
(gdb) x/10x $rsp
(gdb) continue
(gdb) quit
```

### Inspect Registers

```bash
(gdb) info registers           # All registers
(gdb) print $rax               # Print RAX
(gdb) print $rax/x             # Print as hex
(gdb) print $rax/d             # Print as decimal
(gdb) print $rax/t             # Print as binary
```

### Examine Memory

```bash
(gdb) x/10x $rsp               # 10 hex values at RSP
(gdb) x/10i $rip               # 10 instructions at RIP
(gdb) x/s $rdi                 # String at RDI
(gdb) x/20c $rsi               # 20 characters at RSI
```

## Debugging C Programs

### Compile with Debug Symbols

```bash
gcc -g program.c -o program
```

### Debug

```bash
gdb ./program
(gdb) break main
(gdb) run
(gdb) step                     # Step into functions
(gdb) next                     # Step over functions
(gdb) print variable           # Print variable
(gdb) backtrace                # Show call stack
```

## Advanced Features

### Conditional Breakpoints

```bash
(gdb) break main if x > 5
(gdb) condition 1 x > 5        # Add condition to breakpoint 1
```

### Watchpoints

```bash
(gdb) watch variable           # Break when variable changes
(gdb) rwatch variable          # Break on read
(gdb) awatch variable          # Break on read or write
```

### Commands on Breakpoint

```bash
(gdb) break main
(gdb) commands 1
> print x
> print y
> continue
> end
```

## Troubleshooting

### "gdb: command not found"
- Install GDB: `sudo apt install gdb`
- Check PATH: `echo $PATH`

### "No debugging symbols found"
- Compile with `-g` flag: `gcc -g program.c -o program`
- Check file: `file program`

### "Cannot access memory at address"
- Address is invalid
- Use `info registers` to check register values
- Use `x/10x $rsp` to examine stack

### "Segmentation fault"
- Use GDB to find where it crashes
- Set breakpoint before crash
- Step through code
- Examine memory and registers

## Tips & Tricks

✅ **Use `stepi` for assembly** — step one instruction at a time

✅ **Use `nexti` to skip calls** — step over function calls

✅ **Use `display`** — automatically show values after each step

✅ **Use `x/10x $rsp`** — examine stack memory

✅ **Use `info registers`** — see all register values

✅ **Create .gdbinit** — automate startup commands

✅ **Use aliases** — create shortcuts for common commands

✅ **Use `disassemble /m`** — see assembly with source code

## Next Steps

- Learn GDB commands: `resources/cheatsheets/gdb-commands.md`
- Debug assembly: `learning/02-assembly-basics/`
- Debug exploits: `labs/lab-04-buffer-overflow/`

---

For more help: `man gdb` or https://sourceware.org/gdb/documentation/
