# Linux Syscalls Reference (x86-64)

## Syscall Invocation

```asm
mov rax, <syscall_number>
mov rdi, <arg1>
mov rsi, <arg2>
mov rdx, <arg3>
mov rcx, <arg4>
mov r8, <arg5>
mov r9, <arg6>
syscall
; Return value in RAX
; Error: RAX < 0 (negative error code)
```

## Common Syscalls

### Process Control

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 60 | exit | code | (no return) |
| 231 | exit_group | code | (no return) |
| 56 | clone | flags, stack, ptid, tls, ctid | pid |
| 57 | fork | (none) | pid |
| 59 | execve | filename, argv, envp | (no return) |
| 114 | wait4 | pid, status, options, rusage | pid |

### File I/O

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 0 | read | fd, buf, count | bytes_read |
| 1 | write | fd, buf, count | bytes_written |
| 2 | open | filename, flags, mode | fd |
| 3 | close | fd | 0 or error |
| 4 | stat | filename, statbuf | 0 or error |
| 5 | fstat | fd, statbuf | 0 or error |
| 8 | lseek | fd, offset, whence | offset |
| 13 | rt_sigaction | signum, act, oldact, sigsetsize | 0 or error |
| 14 | rt_sigprocmask | how, set, oldset, sigsetsize | 0 or error |

### File Operations

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 21 | access | filename, mode | 0 or error |
| 33 | dup2 | oldfd, newfd | newfd |
| 39 | mkdir | pathname, mode | 0 or error |
| 40 | rmdir | pathname | 0 or error |
| 87 | unlink | pathname | 0 or error |
| 82 | rename | oldpath, newpath | 0 or error |

### Memory Management

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 9 | mmap | addr, length, prot, flags, fd, offset | address |
| 11 | munmap | addr, length | 0 or error |
| 12 | brk | addr | current_brk |
| 10 | mprotect | addr, length, prot | 0 or error |

### Networking

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 41 | socket | domain, type, protocol | fd |
| 42 | connect | fd, addr, addrlen | 0 or error |
| 43 | accept | fd, addr, addrlen | fd |
| 44 | sendto | fd, buf, len, flags, addr, addrlen | bytes_sent |
| 45 | recvfrom | fd, buf, len, flags, addr, addrlen | bytes_received |
| 48 | shutdown | fd, how | 0 or error |
| 49 | setsockopt | fd, level, optname, optval, optlen | 0 or error |
| 50 | getsockopt | fd, level, optname, optval, optlen | 0 or error |

### Time

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 96 | gettimeofday | tv, tz | 0 or error |
| 228 | clock_gettime | clockid, tp | 0 or error |
| 35 | nanosleep | req, rem | 0 or error |

### Signals

| Number | Name | Args | Returns |
|--------|------|------|---------|
| 62 | kill | pid, sig | 0 or error |
| 37 | alarm | seconds | previous_alarm |

## Error Codes

When a syscall fails, RAX contains a negative error code:

```
-1   EPERM (Operation not permitted)
-2   ENOENT (No such file or directory)
-3   ESRCH (No such process)
-4   EINTR (Interrupted system call)
-5   EIO (I/O error)
-6   ENXIO (No such device or address)
-7   E2BIG (Argument list too long)
-8   ENOEXEC (Exec format error)
-9   EBADF (Bad file descriptor)
-10  ECHILD (No child processes)
-11  EAGAIN (Resource temporarily unavailable)
-12  ENOMEM (Out of memory)
-13  EACCES (Permission denied)
-14  EFAULT (Bad address)
-15  ENOTBLK (Block device required)
-16  EBUSY (Device or resource busy)
-17  EEXIST (File exists)
-18  EXDEV (Invalid cross-device link)
-19  ENODEV (No such device)
-20  ENOTDIR (Not a directory)
-21  EISDIR (Is a directory)
-22  EINVAL (Invalid argument)
```

## Common Syscall Examples

### sys_write (1)

Write to file descriptor.

```asm
mov rax, 1           ; sys_write
mov rdi, 1           ; fd = stdout
lea rsi, [msg]       ; buf
mov rdx, len         ; count
syscall
; RAX = bytes written
```

### sys_read (0)

Read from file descriptor.

```asm
mov rax, 0           ; sys_read
mov rdi, 0           ; fd = stdin
lea rsi, [buffer]    ; buf
mov rdx, 256         ; count
syscall
; RAX = bytes read
```

### sys_exit (60)

Terminate process.

```asm
mov rax, 60          ; sys_exit
mov rdi, 0           ; exit code
syscall
```

### sys_open (2)

Open file.

```asm
mov rax, 2           ; sys_open
lea rdi, [filename]  ; pathname
mov rsi, 0           ; flags (O_RDONLY)
mov rdx, 0o644       ; mode
syscall
; RAX = fd or error
```

### sys_close (3)

Close file descriptor.

```asm
mov rax, 3           ; sys_close
mov rdi, fd          ; fd
syscall
```

## File Flags (open syscall)

```
O_RDONLY    = 0
O_WRONLY    = 1
O_RDWR      = 2
O_CREAT     = 0o100
O_EXCL      = 0o200
O_TRUNC     = 0o1000
O_APPEND    = 0o2000
```

## File Modes (open syscall)

```
S_IRUSR = 0o400  (user read)
S_IWUSR = 0o200  (user write)
S_IXUSR = 0o100  (user execute)
S_IRGRP = 0o040  (group read)
S_IWGRP = 0o020  (group write)
S_IXGRP = 0o010  (group execute)
S_IROTH = 0o004  (other read)
S_IWOTH = 0o002  (other write)
S_IXOTH = 0o001  (other execute)
```

## Checking for Errors

```asm
mov rax, 2           ; sys_open
lea rdi, [filename]
mov rsi, 0
syscall
cmp rax, 0
jl error_handler     ; Jump if negative (error)
; RAX is now file descriptor
```

## Useful Commands

```bash
# List all syscalls
man 2 syscalls

# Get syscall number
grep "^#define __NR_" /usr/include/asm/unistd_64.h | grep write

# Trace syscalls
strace ./program

# See syscall arguments
strace -e trace=write ./program
```

---

For complete reference: `man 2 syscalls` or https://man7.org/linux/man-pages/man2/syscalls.2.html
