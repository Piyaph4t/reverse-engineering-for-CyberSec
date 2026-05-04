# System Calls: Talking to the Kernel

## Overview

So far, you've called C library functions. But **system calls** are different — they're the interface between user-space programs and the Linux kernel. This module teaches you how to make syscalls directly from assembly.

## What You'll Learn

- **What are system calls?**
- **How to invoke them (x86-64 and i386)**
- **Common syscalls (write, exit, read, open, close)**
- **Error handling**
- **Syscall conventions**

---

## 1. What Are System Calls?

A **system call** is a request from a user-space program to the kernel to perform a privileged operation:

```
User Program (Ring 3)
    ↓ syscall instruction
Kernel (Ring 0)
    ↓ performs operation
User Program (Ring 3)
    ↓ continues
```

### Why Syscalls?

- **Privilege:** Only kernel can access hardware
- **Security:** Kernel validates requests
- **Abstraction:** Programs don't need to know hardware details

### Examples

- `write()` — write to file/stdout
- `read()` — read from file/stdin
- `open()` — open a file
- `close()` — close a file
- `exit()` — terminate process
- `fork()` — create new process
- `execve()` — execute program

---

## 2. x86-64 Syscall Convention

### Invoking a Syscall

```asm
mov rax, <syscall_number>  ; Syscall ID
mov rdi, <arg1>            ; Argument 1
mov rsi, <arg2>            ; Argument 2
mov rdx, <arg3>            ; Argument 3
mov rcx, <arg4>            ; Argument 4
mov r8, <arg5>             ; Argument 5
mov r9, <arg6>             ; Argument 6
syscall                    ; Invoke kernel
; Return value in RAX
; Error flag in CF (carry flag)
```

### Key Differences from C Calls

| Aspect | C Call | Syscall |
|--------|--------|---------|
| Instruction | `call` | `syscall` |
| Return address | Pushed on stack | In RCX |
| Arguments | RDI, RSI, RDX, RCX, R8, R9 | RDI, RSI, RDX, RCX, R8, R9 |
| Return value | RAX | RAX |
| Error | Return -1 | Return negative error code |

---

## 3. Common x86-64 Syscalls

### sys_write (1)

Write to a file descriptor.

```asm
mov rax, 1           ; sys_write
mov rdi, 1           ; fd = stdout
lea rsi, [msg]       ; buf = pointer to message
mov rdx, len         ; count = message length
syscall
```

**C equivalent:** `write(1, msg, len)`

### sys_read (0)

Read from a file descriptor.

```asm
mov rax, 0           ; sys_read
mov rdi, 0           ; fd = stdin
lea rsi, [buffer]    ; buf = pointer to buffer
mov rdx, 256         ; count = max bytes to read
syscall
; RAX = bytes read
```

**C equivalent:** `read(0, buffer, 256)`

### sys_exit (60)

Terminate the process.

```asm
mov rax, 60          ; sys_exit
mov rdi, 0           ; exit code
syscall
```

**C equivalent:** `exit(0)`

### sys_open (2)

Open a file.

```asm
mov rax, 2           ; sys_open
lea rdi, [filename]  ; pathname
mov rsi, 0           ; flags = O_RDONLY
mov rdx, 0           ; mode (ignored for O_RDONLY)
syscall
; RAX = file descriptor (or negative error)
```

**C equivalent:** `open(filename, O_RDONLY)`

### sys_close (3)

Close a file descriptor.

```asm
mov rax, 3           ; sys_close
mov rdi, fd          ; fd
syscall
```

**C equivalent:** `close(fd)`

---

## 4. i386 Syscall Convention (32-bit)

### Invoking a Syscall

```asm
mov eax, <syscall_number>  ; Syscall ID
mov ebx, <arg1>            ; Argument 1
mov ecx, <arg2>            ; Argument 2
mov edx, <arg3>            ; Argument 3
mov esi, <arg4>            ; Argument 4
mov edi, <arg5>            ; Argument 5
int 0x80                   ; Invoke kernel (interrupt)
; Return value in EAX
```

### Key Differences

| Aspect | x86-64 | i386 |
|--------|--------|------|
| Instruction | `syscall` | `int 0x80` |
| Syscall IDs | Different | Different |
| Arguments | RDI, RSI, RDX, RCX, R8, R9 | EBX, ECX, EDX, ESI, EDI, EBP |

### i386 sys_write (4)

```asm
mov eax, 4           ; sys_write
mov ebx, 1           ; fd = stdout
lea ecx, [msg]       ; buf
mov edx, len         ; count
int 0x80
```

---

## 5. Error Handling

### x86-64 Error Convention

If a syscall fails, RAX contains a **negative error code**:

```asm
mov rax, 2           ; sys_open
lea rdi, [filename]
mov rsi, 0
syscall
; Check for error
cmp rax, 0
jl error_handler     ; Jump if negative (error)
; RAX is now file descriptor
```

### Common Error Codes

```
-1   EPERM (Operation not permitted)
-2   ENOENT (No such file or directory)
-13  EACCES (Permission denied)
-14  EFAULT (Bad address)
-22  EINVAL (Invalid argument)
```

---

## 6. Complete Example: Write to stdout

```asm
bits 64

section .data
    msg db 'Hello from syscall!', 0xa
    len equ $ - msg

section .text
    global _start

_start:
    ; Write to stdout
    mov rax, 1           ; sys_write
    mov rdi, 1           ; fd = stdout
    lea rsi, [msg]       ; buf = msg
    mov rdx, len         ; count = len
    syscall
    
    ; Exit
    mov rax, 60          ; sys_exit
    mov rdi, 0           ; exit code = 0
    syscall
```

### Build and Run

```bash
nasm -f elf64 syscall.asm -o syscall.o
gcc -no-pie syscall.o -o syscall
./syscall
```

---

## 7. Complete Example: Read from stdin

```asm
bits 64

section .bss
    buffer resb 256      ; Reserve 256 bytes for input

section .text
    global _start

_start:
    ; Read from stdin
    mov rax, 0           ; sys_read
    mov rdi, 0           ; fd = stdin
    lea rsi, [buffer]    ; buf = buffer
    mov rdx, 256         ; count = 256
    syscall
    ; RAX = bytes read
    
    ; Write back to stdout
    mov rdi, 1           ; fd = stdout
    mov rsi, rax         ; count = bytes read
    lea rax, [buffer]    ; buf = buffer
    mov rdx, rsi         ; rdx = count
    mov rsi, rax         ; rsi = buf
    mov rax, 1           ; sys_write
    syscall
    
    ; Exit
    mov rax, 60
    mov rdi, 0
    syscall
```

---

## 8. Syscall Reference Table

### x86-64 Common Syscalls

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 0 | read | fd, buf, count | bytes read |
| 1 | write | fd, buf, count | bytes written |
| 2 | open | path, flags, mode | fd or error |
| 3 | close | fd | 0 or error |
| 4 | stat | path, statbuf | 0 or error |
| 60 | exit | code | (no return) |
| 231 | exit_group | code | (no return) |

See `resources/cheatsheets/syscalls-reference.md` for complete list.

---

## 9. Debugging Syscalls

### Using strace

```bash
strace ./program
```

Shows all syscalls made by the program:

```
write(1, "Hello\n", 6)           = 6
exit_group(0)                    = ?
```

### Using GDB

```bash
gdb ./program
(gdb) break _start
(gdb) run
(gdb) stepi              # Step to syscall
(gdb) info registers     # Check RAX, RDI, RSI, RDX
(gdb) stepi              # Execute syscall
(gdb) info registers     # Check return value in RAX
```

---

## 10. Exercises

### Exercise 1: Write Multiple Lines

Write assembly that:
1. Writes "Line 1\n"
2. Writes "Line 2\n"
3. Writes "Line 3\n"
4. Exits

### Exercise 2: Read and Echo

Write assembly that:
1. Reads from stdin (up to 100 bytes)
2. Writes to stdout
3. Exits

### Exercise 3: Open and Read File

Write assembly that:
1. Opens a file
2. Reads from it
3. Writes to stdout
4. Closes the file
5. Exits

---

## 11. Resources

- **Linux Syscall Reference** — `resources/cheatsheets/syscalls-reference.md`
- **man pages** — `man 2 write`, `man 2 read`, etc.
- **strace manual** — `man strace`

---

## Next Steps

Now that you understand syscalls, move to **[Binary Analysis](../05-binary-analysis/)** to learn how to reverse engineer compiled binaries.
