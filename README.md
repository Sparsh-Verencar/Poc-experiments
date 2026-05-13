# LEX & YACC PROGRAMS (FLEX & BISON)
This repository contains Lex (Flex) and Yacc (Bison) programs used for Compiler Design experiments. Use the setup files to download flex, bison and GCC compiler.

[Refer to this video](https://youtu.be/GnpxL7mxwj8?si=XFMiFZTGz-nenWgg)

---

## PREREQUISITES

1. Flex (Lexical Analyzer)
2. Bison (Parser Generator)
3. GCC Compiler

**Windows users should use:**
- Command Prompt (cmd)
- OR Git Bash

**Note:**
PowerShell does NOT support input redirection using `<`

---

## FILE DESCRIPTIONS

| Filename | Purpose |
|----------|---------|
| `filename.l` | **Lexer rules file** (Flex input) |
| `filename.y` | **Grammar rules file** (Bison input) |
| `lex.yy.c` | **Generated lexer code** (from flex) |
| `y.tab.c` | **Generated parser code** (from bison) |
| `y.tab.h` | **Token definitions header** (from bison) |
| `output.exe` | **Compiled executable program** |
| `input.txt` | **Test input data file** |

---

## CLONE THE REPOSITORY

```bash
git clone <your-repository-url> .
cd <expt-folder>
```

---

## COMPILING A LEX PROGRAM ONLY

### Step 1: Generate C file using Flex
```bash
flex filename.l
```
**Creates:** `lex.yy.c`

### Step 2: Compile using GCC
```bash
gcc -o output lex.yy.c
```
**Creates:** `output.exe` (Windows) or `output` (Linux)

---

## COMPILING A LEX + YACC PROGRAM

### Step 1: Generate Parser using Bison
```bash
bison -d filename.y
```
**Creates:** 
- `y.tab.c` (parser code)
- `y.tab.h` (token header)

### Step 2: Generate Lexer using Flex
```bash
flex filename.l
```
**Creates:** `lex.yy.c` (lexer code)

### Step 3: Compile all together using GCC
```bash
gcc y.tab.c lex.yy.c -o output
```
**Creates:** `output.exe` (Windows) or `output` (Linux)

---

## RUN THE PROGRAM

### For keyboard input:
```bash
output
```

### For file input (input redirection):
```bash
output < input.txt
```

---

## GIVING FILE INPUT

Create a file named `input.txt` with content:

```
---input.txt---
india
japan
russia
usa
china
```

---

## METHOD 1: INPUT REDIRECTION (RECOMMENDED)

```bash
outputfilename < input.txt
```

**Works in:**
- Linux terminal
- Windows Command Prompt
- Git Bash

---

## WHERE TO PLACE FILES

All files must be in the same folder:

```
expt-folder
|-- filename.l          (Lexer rules)
|-- filename.y          (Grammar rules - if using Yacc)
|-- lex.yy.c            (Generated lexer)
|-- y.tab.c             (Generated parser - if using Yacc)
|-- y.tab.h             (Token header - if using Yacc)
|-- output.exe          (Compiled program)
|-- input.txt           (Test input)
```

---

## IMPORTANT NOTES

1. Flex reads input from standard input (stdin)
2. File redirection replaces keyboard input
3. No code changes required to accept file input
4. `yywrap()` must return 1 to indicate end of input
5. `-d` flag in Bison generates the `.h` header file

---

## COMMON COMMANDS SUMMARY

### LEX ONLY:
```bash
flex filename.l
gcc -o output lex.yy.c
output < input.txt
```

### LEX + YACC:
```bash
bison -d filename.y
flex filename.l
gcc y.tab.c lex.yy.c -o output
output < input.txt
```

---

## EXAMPLES

### Example 1: Lex Program
```bash
flex exp1.l
gcc -o exp1 lex.yy.c
exp1 < test.txt
```

### Example 2: Lex + Yacc Program (Calculator)
```bash
bison -d Calculator.y
flex calculator.l
gcc y.tab.c lex.yy.c -o calculator
calculator
```

---

## COMMON ERRORS

### Error: "The '<' operator is reserved for future use"
**Solution:** You are using PowerShell. Switch to Command Prompt or Git Bash.

### Error: "y.tab.c: No such file or directory"
**Solution:** Make sure you ran `bison -d filename.y` first

### Error: "lex.yy.c: No such file or directory"
**Solution:** Make sure you ran `flex filename.l`

---

## PURPOSE

These programs demonstrate:
- Lexical analysis (Lex/Flex)
- Syntax analysis (Yacc/Bison)
- Pattern matching using regular expressions
- Token identification
- Parser implementation
- Grammar-based language processing
- Compiler Design fundamentals

---

## QUICK REFERENCE

| Task | Command |
|------|---------|
| Generate lexer | `flex filename.l` |
| Generate parser | `bison -d filename.y` |
| Compile | `gcc y.tab.c lex.yy.c -o output` |
| Run with keyboard | `output` |
| Run with file | `output < input.txt` |

---

END
