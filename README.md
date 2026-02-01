
LEX PROGRAMS (FLEX)

This repository contains Lex (Flex) programs used for Compiler Design experiments.

------------------------------------------------------------
PREREQUISITES
------------------------------------------------------------

1. Flex
2. GCC Compiler

Windows users should use:
- Command Prompt (cmd)
- OR Git Bash

Note:
PowerShell does NOT support input redirection using <

------------------------------------------------------------
CLONE THE REPOSITORY
------------------------------------------------------------
```
git clone <your-repository-url> .

cd <expt-folder>
```
------------------------------------------------------------
COMPILING A LEX PROGRAM
------------------------------------------------------------

Step 1: Generate C file using Flex
```
flex filename.l
```
This command creates:

lex.yy.c

------------------------------------------------------------

Step 2: Compile using GCC
```
gcc -o <give-output-file-name> lex.yy.c
```
This creates:
```
<give-output-file-name>.exe (Windows)
output     (Linux)
```

------------------------------------------------------------
RUN THE PROGRAM
------------------------------------------------------------

For keyboard input:
```
./output
```
------------------------------------------------------------
GIVING FILE INPUT
------------------------------------------------------------

Create a file named input.txt with content like:
```
---input.txt---
india
japan
russia
usa
china
```
------------------------------------------------------------

METHOD 1: INPUT REDIRECTION (RECOMMENDED)
```
outputfilename < input.txt
```
Works in:
- Linux terminal
- Windows Command Prompt
- Git Bash


------------------------------------------------------------
WHERE TO PLACE FILES
------------------------------------------------------------

All files must be in the same folder:
```
expt-folder
|-- filename.l
|-- lex.yy.c
|-- output.exe
|-- input.txt
```
------------------------------------------------------------
IMPORTANT NOTES
------------------------------------------------------------

1. Flex reads input from standard input (stdin)
2. File redirection replaces keyboard input
3. No code changes are required to accept file input
4. yywrap() must return 1 to indicate end of input

------------------------------------------------------------
COMMON COMMANDS SUMMARY
------------------------------------------------------------
```
flex filename.l
gcc -o output lex.yy.c
output < input.txt
```
------------------------------------------------------------
EXAMPLE
------------------------------------------------------------
```
flex exp1.l
gcc -o exp1 lex.yy.c
exp1 < test.txt
```
------------------------------------------------------------
COMMON ERROR
------------------------------------------------------------

If you see:
```
"The '<' operator is reserved for future use"
```
You are using PowerShell.
Switch to Command Prompt or Git Bash.

------------------------------------------------------------
PURPOSE
------------------------------------------------------------

These programs demonstrate:

- Lexical analysis
- Pattern matching using regular expressions
- Line counting
- Identifier validation
- File-based input handling
- Compiler Design fundamentals

------------------------------------------------------------
END
------------------------------------------------------------
