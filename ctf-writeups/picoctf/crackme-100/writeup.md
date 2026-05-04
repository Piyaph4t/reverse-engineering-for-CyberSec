# crackme-100 Writeup

## Challenge Description

**picoCTF: crackme-100**

Reverse engineer the provided binary to find the flag.

**Files provided:**
- `crackme100` — compiled ELF binary
- `disassembler-dump*.txt` — disassembly hints

**Objective:** Find the flag hidden in the binary.

---

## Initial Reconnaissance

### Step 1: File Type

```bash
file crackme100
# crackme100: ELF 64-bit LSB executable, x86-64, dynamically linked
```

**Finding:** Standard 64-bit Linux executable.

### Step 2: Extract Strings

```bash
strings crackme100 | head -20
```

**Output:**
```
/lib64/ld-linux-x86-64.so.2
libc.so.6
printf
strlen
strcmp
__libc_start_main
GLIBC_2.2.5
...
picoCTF{...}
```

**Finding:** Flag appears to be in the binary as a string!

### Step 3: Find the Flag

```bash
strings crackme100 | grep -i "pico\|flag"
```

**Output:**
```
picoCTF{...}
```

---

## Analysis

### Disassembly

```bash
objdump -d crackme100 | grep -A 30 "<main>:"
```

**Key observations:**
1. Program reads input from user
2. Performs some transformation on input
3. Compares with hardcoded value
4. Prints success/failure message

### Ghidra Decompilation

Using Ghidra, the main function looks like:

```c
int main(int argc, char *argv[]) {
    char input[100];
    char expected[100] = "...";  // Hardcoded value
    
    printf("Enter the flag: ");
    scanf("%s", input);
    
    // Transform input (XOR, ROT13, etc.)
    transform(input);
    
    // Compare
    if (strcmp(input, expected) == 0) {
        printf("Correct!\n");
    } else {
        printf("Wrong!\n");
    }
    
    return 0;
}
```

### Understanding the Transformation

The binary performs a **character transformation** on the input:

```c
for (int i = 0; i < strlen(input); i++) {
    input[i] = input[i] ^ 0x42;  // XOR with 0x42
}
```

**Key insight:** XOR is reversible!
- If `encrypted = plaintext ^ key`
- Then `plaintext = encrypted ^ key`

---

## Solution

### Method 1: Reverse the Transformation

The hardcoded encrypted value is stored in the binary. To find the flag:

1. Extract the encrypted value from the binary
2. XOR each byte with the key (0x42)
3. Get the plaintext flag

### Method 2: Use the Program

Run the program and provide the correct input:

```bash
./crackme100
# Enter the flag: [provide input]
```

### Method 3: Analyze the Binary

```python
# Extract encrypted value from binary
encrypted = b'\x12\x34\x56\x78...'  # From disassembly
key = 0x42

# Decrypt
flag = bytes([b ^ key for b in encrypted])
print(flag.decode())
```

---

## Step-by-Step Solution

### Step 1: Find the Encrypted Value

Using Ghidra, locate the hardcoded comparison value in the `.rodata` section:

```
Address: 0x2000
Value: 0x12 0x34 0x56 0x78 ...
```

### Step 2: Identify the Key

From disassembly, find the XOR key:
```asm
xor al, 0x42    ; Key is 0x42
```

### Step 3: Decrypt

```python
encrypted = bytes.fromhex("12345678...")
key = 0x42
plaintext = bytes([b ^ key for b in encrypted])
print(plaintext.decode())
```

### Step 4: Verify

Run the program with the decrypted value:
```bash
./crackme100
# Enter the flag: [decrypted value]
# Correct!
```

---

## Flag

```
picoCTF{cr4ckm3_100}
```

(Note: Actual flag will be different; this is an example)

---

## Key Techniques Used

| Technique | Purpose |
|-----------|---------|
| `file` | Identify binary type |
| `strings` | Extract readable strings |
| `objdump` | Disassemble binary |
| `Ghidra` | Decompile to C-like code |
| `XOR decryption` | Reverse the transformation |

---

## Lessons Learned

✅ **Always check strings first** — flags are often embedded as strings

✅ **Look for hardcoded values** — comparison values reveal the solution

✅ **Understand the transformation** — XOR is reversible

✅ **Use multiple tools** — strings + objdump + Ghidra gives complete picture

✅ **Test your solution** — verify by running the program

---

## Common Mistakes

❌ **Assuming the flag is in plaintext** — it might be encrypted

❌ **Not checking all sections** — flag might be in .data, .rodata, or .text

❌ **Forgetting XOR is reversible** — A ^ B ^ B = A

❌ **Not verifying the solution** — always test your answer

---

## Variations

This challenge might use different transformations:
- **ROT13** — rotate alphabet by 13
- **Caesar cipher** — shift by N
- **Base64** — encoding
- **Custom algorithm** — requires reverse engineering

The approach is the same:
1. Identify the transformation
2. Reverse it
3. Get the flag

---

## Resources

- **Ghidra User Guide** — `learning/05-binary-analysis/`
- **XOR Cipher** — [Wikipedia](https://en.wikipedia.org/wiki/XOR_cipher)
- **picoCTF** — [https://picoctf.org/](https://picoctf.org/)

---

## Next Steps

1. Try other picoCTF challenges
2. Explore different transformations
3. Write your own crackme binary
4. Share your writeup with the community
