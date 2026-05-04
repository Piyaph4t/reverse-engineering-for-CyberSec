# Useful Links & Resources

## Official Documentation

### Assembly & Architecture
- **Intel x86-64 Manual** — https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4.pdf
- **AMD64 Architecture Manual** — https://www.amd.com/system/files/TechDocs/24593.pdf
- **System V AMD64 ABI** — https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI
- **NASM Manual** — https://www.nasm.us/doc/

### Linux & Syscalls
- **Linux Syscall Reference** — https://man7.org/linux/man-pages/man2/syscalls.2.html
- **Linux Man Pages** — https://man7.org/
- **Linux Kernel Documentation** — https://www.kernel.org/doc/

### Tools
- **Ghidra** — https://ghidra-sre.org/
- **GDB Manual** — https://sourceware.org/gdb/documentation/
- **radare2** — https://rada.re/
- **IDA Pro** — https://www.hex-rays.com/ida-pro/

---

## Learning Resources

### Online Courses
- **Coursera: Computer Architecture** — https://www.coursera.org/
- **edX: Assembly Language** — https://www.edx.org/
- **YouTube: Assembly Tutorials** — Search for "x86-64 assembly tutorial"

### Books
- **"Practical Reverse Engineering"** by Dang, Gazet, Bachaalany
- **"The Art of Software Security Testing"** by Wysopal et al.
- **"Hacking: The Art of Exploitation"** by Erickson
- **"Computer Systems: A Programmer's Perspective"** by Bryant & O'Hallaron
- **"The Intel Microprocessors"** by Barry Brey

### Websites
- **Reverse Engineering Stack Exchange** — https://reverseengineering.stackexchange.com/
- **Assembly Language Tutorial** — https://www.tutorialspoint.com/assembly_programming/
- **x86-64 Assembly Wikibook** — https://en.wikibooks.org/wiki/X86_Assembly

---

## CTF & Practice Platforms

### Beginner-Friendly
- **picoCTF** — https://picoctf.org/ (Carnegie Mellon University)
- **OverTheWire** — https://overthewire.org/ (Wargames)
- **HackTheBox** — https://www.hackthebox.com/ (Machines & Challenges)
- **TryHackMe** — https://tryhackme.com/ (Interactive labs)

### Intermediate & Advanced
- **CTFtime** — https://ctftime.org/ (CTF event calendar)
- **Pwnable.kr** — https://pwnable.kr/ (Binary exploitation)
- **Exploit.education** — https://exploit.education/ (Exploit development)
- **RingZero CTF** — https://ringzer0ctf.com/ (Challenges)

### Specific Topics
- **Cryptopals** — https://cryptopals.com/ (Cryptography)
- **OWASP WebGoat** — https://owasp.org/www-project-webgoat/ (Web security)
- **Bandit (OverTheWire)** — https://overthewire.org/wargames/bandit/ (Linux basics)

---

## Security & Exploitation

### Vulnerability Databases
- **CVE Details** — https://www.cvedetails.com/
- **NVD (National Vulnerability Database)** — https://nvd.nist.gov/
- **Exploit-DB** — https://www.exploit-db.com/

### Security Research
- **OWASP Top 10** — https://owasp.org/www-project-top-ten/
- **CWE (Common Weakness Enumeration)** — https://cwe.mitre.org/
- **CAPEC (Common Attack Pattern)** — https://capec.mitre.org/

### Exploitation Tools
- **Metasploit Framework** — https://www.metasploit.com/
- **Frida** — https://frida.re/ (Dynamic instrumentation)
- **pwntools** — https://docs.pwntools.com/ (Python exploitation library)
- **Ropper** — https://github.com/RoganDawes/Ropper (ROP gadget finder)

---

## Communities & Forums

### Discussion
- **Reddit: r/learnprogramming** — https://www.reddit.com/r/learnprogramming/
- **Reddit: r/reverseengineering** — https://www.reddit.com/r/reverseengineering/
- **Stack Overflow** — https://stackoverflow.com/
- **Reverse Engineering Stack Exchange** — https://reverseengineering.stackexchange.com/

### Discord & Chat
- **picoCTF Discord** — Community help and discussion
- **OverTheWire Discord** — Community support
- **Pwn College Discord** — https://pwn.college/

### Conferences & Events
- **DEF CON** — https://www.defcon.org/
- **Black Hat** — https://www.blackhat.com/
- **USENIX Security** — https://www.usenix.org/conference/usenixsecurity
- **CCS (ACM Conference on Computer and Communications Security)** — https://www.sigsac.org/ccs/

---

## Tools & Utilities

### Disassemblers & Decompilers
- **Ghidra** — https://ghidra-sre.org/ (Free, open-source)
- **IDA Pro** — https://www.hex-rays.com/ida-pro/ (Industry standard, paid)
- **Radare2** — https://rada.re/ (Open-source, powerful)
- **Capstone** — https://www.capstone-engine.org/ (Disassembly engine)

### Debuggers
- **GDB** — https://sourceware.org/gdb/ (GNU Debugger)
- **LLDB** — https://lldb.llvm.org/ (LLVM Debugger)
- **WinDbg** — https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/ (Windows)
- **x64dbg** — https://x64dbg.com/ (Windows)

### Binary Analysis
- **Binutils** — https://www.gnu.org/software/binutils/ (objdump, strings, nm)
- **Frida** — https://frida.re/ (Dynamic instrumentation)
- **Strace** — https://strace.io/ (Syscall tracer)
- **ltrace** — https://ltrace.org/ (Library call tracer)

### Exploitation
- **pwntools** — https://docs.pwntools.com/ (Python library)
- **ROPgadget** — https://github.com/JonathanSalwan/ROPgadget (ROP finder)
- **Ropper** — https://github.com/RoganDawes/Ropper (ROP gadget finder)
- **One_Gadget** — https://github.com/david942j/one_gadget (One-shot RCE)

---

## Checklists & Guides

### Reverse Engineering Checklist
- [ ] File type identification (`file`)
- [ ] String extraction (`strings`)
- [ ] Symbol table analysis (`nm`, `objdump -t`)
- [ ] Disassembly (`objdump`, `Ghidra`)
- [ ] Decompilation (`Ghidra`, `IDA`)
- [ ] Dynamic analysis (`GDB`, `strace`)
- [ ] Pattern recognition (loops, conditionals, calls)
- [ ] Documentation & writeup

### Binary Exploitation Checklist
- [ ] Vulnerability identification
- [ ] Proof of concept
- [ ] Payload development
- [ ] Bypass protections (ASLR, DEP, canaries)
- [ ] Shellcode writing
- [ ] Testing & verification
- [ ] Documentation

---

## Quick Command Reference

### File Analysis
```bash
file binary                    # Identify file type
strings binary                 # Extract strings
objdump -t binary              # Symbol table
objdump -d binary              # Disassembly
nm binary                      # Symbol names
```

### Dynamic Analysis
```bash
strace ./program               # Trace syscalls
ltrace ./program               # Trace library calls
gdb ./program                  # Debug with GDB
```

### Ghidra
```bash
ghidraRun                      # Start Ghidra
# File → New Project
# File → Import File
# Click Analyze
```

---

## Tips for Learning

✅ **Start with basics** — understand architecture first

✅ **Practice regularly** — solve one challenge per day

✅ **Read writeups** — learn from others' approaches

✅ **Join communities** — ask questions, help others

✅ **Build projects** — apply knowledge to real problems

✅ **Stay curious** — explore new tools and techniques

✅ **Document learning** — write notes and summaries

---

## Staying Updated

### Blogs & News
- **Krebs on Security** — https://krebsonsecurity.com/
- **Dark Reading** — https://www.darkreading.com/
- **Security Affairs** — https://securityaffairs.co/
- **Ars Technica Security** — https://arstechnica.com/security/

### Podcasts
- **Security Now** — https://www.grc.com/securitynow.htm
- **Darknet Diaries** — https://darknetdiaries.com/
- **The CyberWire Daily** — https://thecyberwire.com/

### Twitter/X Accounts to Follow
- @LiveOverflow (YouTube & Twitter)
- @IppSec (HackTheBox walkthroughs)
- @John_Hammond (CTF & security)
- @GynvaelEN (Security research)

---

## Getting Help

### When You're Stuck
1. **Read the documentation** — official docs first
2. **Search Stack Overflow** — likely someone asked before
3. **Check writeups** — see how others solved it
4. **Ask in communities** — be specific about your problem
5. **Debug systematically** — use GDB, strace, etc.

### How to Ask for Help
- **Be specific** — describe what you tried
- **Show your work** — include code/output
- **Provide context** — what are you trying to do?
- **Be respectful** — people help for free

---

## Next Steps

1. **Pick a platform** — start with picoCTF or OverTheWire
2. **Solve challenges** — apply what you learned
3. **Write writeups** — document your process
4. **Join communities** — connect with others
5. **Keep learning** — explore new topics
6. **Share knowledge** — help others learn

---

**Happy learning and hacking!** 🎯
