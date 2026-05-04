# Ghidra Setup Guide

## Installation

### Prerequisites

- **Java 11 or later** — Ghidra requires Java
- **Linux, macOS, or Windows**

### Step 1: Install Java

#### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

#### Linux (Fedora/RHEL)

```bash
sudo dnf install java-11-openjdk
```

#### macOS

```bash
brew install openjdk@11
```

#### Windows

Download from [oracle.com](https://www.oracle.com/java/technologies/downloads/) or use:

```bash
choco install openjdk11
```

### Step 2: Verify Java Installation

```bash
java -version
# Output: openjdk version "11.x.x" or newer
```

### Step 3: Download Ghidra

1. Visit [ghidra-sre.org](https://ghidra-sre.org/)
2. Click "Download Ghidra"
3. Download the latest release (e.g., `ghidra_11.0_PUBLIC_20240101.zip`)

### Step 4: Extract Ghidra

```bash
unzip ghidra_11.0_PUBLIC_20240101.zip
cd ghidra_11.0_PUBLIC
```

### Step 5: Run Ghidra

```bash
./ghidraRun
```

On Windows:

```bash
ghidraRun.bat
```

## First Time Setup

### Create a Project

1. **File** → **New Project**
2. Choose project location
3. Enter project name
4. Click **Create**

### Import a Binary

1. **File** → **Import File**
2. Select binary file
3. Click **Import**
4. Click **Analyze** when prompted
5. Wait for analysis to complete

### Navigate the Interface

| Window | Purpose |
|--------|---------|
| **Listing** | Disassembly view |
| **Decompiler** | Pseudo-C code |
| **Symbol Tree** | Functions and variables |
| **Data Type Manager** | Structures and types |
| **References** | Where symbols are used |

## Basic Workflow

### Step 1: Open Binary

1. **File** → **Import File**
2. Select binary
3. Click **Analyze**

### Step 2: Explore Code

1. Click on function in **Symbol Tree**
2. View disassembly in **Listing**
3. View decompiled code in **Decompiler**

### Step 3: Rename Symbols

1. Right-click on function/variable
2. **Rename**
3. Enter new name

### Step 4: Create Comments

1. Click on instruction
2. Press `;` (semicolon)
3. Enter comment

### Step 5: Export Results

1. **File** → **Export Program**
2. Choose format (C, Java, etc.)
3. Click **Export**

## Useful Features

### Search for Strings

1. **Search** → **For Strings**
2. Enter search term
3. View results

### Find References

1. Right-click on symbol
2. **References** → **Show References**
3. View all uses

### Create Structures

1. **Window** → **Data Type Manager**
2. Right-click → **New Structure**
3. Define fields

### Set Data Types

1. Right-click on variable
2. **Data Type**
3. Choose type

### Rename Functions

1. Double-click function name
2. Enter new name
3. Press Enter

## Keyboard Shortcuts

```
G           - Go to address
L           - Create label
C           - Create comment
;           - Add inline comment
D           - Define data
U           - Undefine
X           - Show references
Ctrl+Shift+E - Edit function signature
```

## Tips & Tricks

✅ **Use the Decompiler** — easier than reading assembly

✅ **Rename symbols** — make code more readable

✅ **Add comments** — document your findings

✅ **Create structures** — understand data layouts

✅ **Search for strings** — find clues about functionality

✅ **Follow references** — trace code flow

✅ **Use bookmarks** — mark important locations

## Troubleshooting

### "Java not found"
- Install Java: `sudo apt install openjdk-11-jdk`
- Check PATH: `echo $PATH`

### "Ghidra won't start"
- Verify Java: `java -version`
- Check permissions: `chmod +x ghidraRun`
- Try: `./ghidraRun -J-Xmx4G` (increase memory)

### "Analysis is slow"
- Increase memory: `./ghidraRun -J-Xmx8G`
- Disable some analyzers: **Analysis** → **Auto Analyze**
- Close other applications

### "Can't import binary"
- Check file format: `file binary`
- Ensure it's a valid ELF/PE/Mach-O file
- Try importing as raw binary

## Advanced Features

### Script Console

1. **Window** → **Script Manager**
2. Create new script
3. Write Python/Java code
4. Run script

### Plugins

1. **File** → **Install Extensions**
2. Download plugins
3. Restart Ghidra

### Headless Mode

Run Ghidra without GUI:

```bash
./support/analyzeHeadless /path/to/project projectName -import binary.bin
```

## Next Steps

- Learn binary analysis: `learning/05-binary-analysis/`
- Analyze real binaries: `ctf-writeups/`
- Explore advanced features: Ghidra documentation

---

For more help: https://ghidra-sre.org/ or Ghidra built-in help
