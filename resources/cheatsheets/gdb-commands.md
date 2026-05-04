# GDB (GNU Debugger) Quick Reference

## Starting GDB

```bash
gdb ./program                   # Start debugger
gdb ./program core              # Debug with core dump
gdb -p <pid>                    # Attach to running process
```

## Basic Commands

```bash
(gdb) run [args]                # Run program with arguments
(gdb) quit                      # Exit GDB
(gdb) help [command]            # Get help on command
(gdb) info [topic]              # Get information
```

## Breakpoints

```bash
(gdb) break main                # Break at function
(gdb) break *0x1000             # Break at address
(gdb) break file.c:10           # Break at line 10
(gdb) break function if x > 5   # Conditional breakpoint
(gdb) info breakpoints          # List breakpoints
(gdb) delete 1                  # Delete breakpoint 1
(gdb) disable 1                 # Disable breakpoint 1
(gdb) enable 1                  # Enable breakpoint 1
(gdb) clear main                # Clear breakpoint at main
```

## Execution Control

```bash
(gdb) continue                  # Continue execution
(gdb) step                      # Step into (line-by-line)
(gdb) stepi                     # Step one instruction
(gdb) next                      # Step over (skip functions)
(gdb) nexti                     # Next instruction
(gdb) finish                    # Run until return
(gdb) until <line>              # Run until line
(gdb) jump <address>            # Jump to address
```

## Inspecting State

```bash
(gdb) info registers            # Show all registers
(gdb) info registers rax        # Show specific register
(gdb) print $rax                # Print RAX value
(gdb) print $rax/x              # Print as hex
(gdb) print $rax/d              # Print as decimal
(gdb) print $rax/t              # Print as binary
(gdb) disassemble               # Disassemble current function
(gdb) disassemble main          # Disassemble function
(gdb) disassemble /m main       # Disassemble with source
```

## Memory Inspection

```bash
(gdb) x/10x $rsp                # 10 hex values at RSP
(gdb) x/10i $rip                # 10 instructions at RIP
(gdb) x/10d $rax                # 10 decimal values
(gdb) x/s $rdi                  # String at RDI
(gdb) x/20c $rsi                # 20 characters at RSI
(gdb) x/10b $rbp                # 10 bytes at RBP
```

### Memory Format Codes

```
x   - hexadecimal
d   - decimal
u   - unsigned decimal
o   - octal
t   - binary
f   - floating point
a   - address
i   - instruction
c   - character
s   - string
```

### Memory Size Codes

```
b   - byte (1 byte)
h   - halfword (2 bytes)
w   - word (4 bytes)
g   - giant (8 bytes)
```

## Watchpoints

```bash
(gdb) watch variable            # Break when variable changes
(gdb) watch $rax                # Break when RAX changes
(gdb) rwatch variable           # Break on read
(gdb) awatch variable           # Break on read or write
(gdb) info watchpoints          # List watchpoints
```

## Stack Inspection

```bash
(gdb) backtrace                 # Show call stack
(gdb) frame 0                   # Select frame 0
(gdb) info frame                # Show current frame info
(gdb) info locals               # Show local variables
(gdb) info args                 # Show function arguments
```

## Examining Code

```bash
(gdb) list                      # List source code
(gdb) list main                 # List function
(gdb) list file.c:10            # List around line 10
(gdb) disassemble main          # Disassemble function
(gdb) disassemble /m main       # With source code
```

## Modifying State

```bash
(gdb) set $rax = 0x1000         # Set register value
(gdb) set variable x = 10       # Set variable
(gdb) set {int}0x1000 = 42      # Set memory value
(gdb) call function()           # Call function
```

## Useful Tricks

### Print Formatted Output

```bash
(gdb) printf "%d\n", $rax       # Print with format
(gdb) printf "%s\n", $rdi       # Print string
(gdb) printf "0x%x\n", $rax     # Print as hex
```

### Examine Multiple Registers

```bash
(gdb) info registers            # All registers
(gdb) info registers rax rbx rcx # Specific registers
```

### Set Conditional Breakpoint

```bash
(gdb) break main if x > 5
(gdb) condition 1 x > 5         # Add condition to breakpoint 1
```

### Repeat Last Command

```bash
(gdb) <Enter>                   # Repeats last command
```

### Search Memory

```bash
(gdb) find /b 0x1000, 0x2000, 0x41 0x42 0x43
```

## Debugging Assembly

### Step Through Assembly

```bash
(gdb) stepi                     # Step one instruction
(gdb) nexti                     # Next instruction
(gdb) disassemble               # Show current function
```

### Inspect Registers After Each Instruction

```bash
(gdb) display $rax              # Show RAX after each step
(gdb) display $rsp              # Show RSP after each step
(gdb) undisplay 1               # Remove display 1
```

### Set Breakpoint at Address

```bash
(gdb) break *0x1000             # Break at address
(gdb) run                       # Run to breakpoint
(gdb) stepi                     # Step instruction
```

## Common Workflows

### Debug Assembly Program

```bash
gdb ./program
(gdb) break _start
(gdb) run
(gdb) disassemble
(gdb) stepi
(gdb) info registers
(gdb) x/10x $rsp
```

### Debug C Program

```bash
gcc -g program.c -o program     # Compile with debug symbols
gdb ./program
(gdb) break main
(gdb) run
(gdb) step
(gdb) print variable
(gdb) backtrace
```

### Find Buffer Overflow

```bash
gdb ./vulnerable
(gdb) run $(python3 -c "print('A'*100)")
(gdb) info registers            # Check RIP value
(gdb) backtrace                 # See corrupted stack
```

## Tips

✅ Use `stepi` for assembly-level debugging

✅ Use `nexti` to skip over function calls

✅ Use `x/10x $rsp` to inspect stack

✅ Use `display` to watch values automatically

✅ Use `set print asm-demangle on` for C++ symbols

✅ Use `set disassembly-flavor intel` for Intel syntax

✅ Create `.gdbinit` file for startup commands

---

For more help: `man gdb` or `https://sourceware.org/gdb/documentation/`
