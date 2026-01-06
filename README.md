# MPL (My Programming Language) 🚀

MPL is a custom programming language designed as a **Controlled Natural Language (CNL)**. It mimics English sentence structures to make code more readable, avoiding cryptic symbols found in traditional languages like C or Java.

This project was developed as part of the **COM2043 - Programming Language Concepts** course at **Ankara University**. It implements a lexical analyzer (Lex) and a syntax analyzer (Yacc/Bison).

## 🌟 Key Features

- **English-Like Syntax:** Uses keywords like `Start.`, `Finish.`, `plus`, `times`, and `equals`.
- **Sentence Structure:** Every statement ends with a period (`.`) instead of a semicolon.
- **Control Flow:** Supports `if-then-else` and `while-do` loops that read naturally.
- [cite_start]**Ambiguity Resolution:** Handles the "Dangling Else" problem using precedence rules (`%nonassoc`) [cite: 71-72].
- [cite_start]**Cross-Platform Logic:** Custom implementation of `yywrap()` to avoid dependency on external libraries[cite: 68].

## 📄 Grammar & Syntax

[cite_start]MPL replaces standard mathematical symbols with English words[cite: 20]:

| Operator | MPL Keyword    |
| :------- | :------------- |
| `+`      | `plus`         |
| `-`      | `minus`        |
| `*`      | `times`        |
| `/`      | `divided by`   |
| `=`      | `equals`       |
| `>`      | `greater than` |
| `<`      | `less than`    |

### Example Code (`myprog.mpl`)

```text
Start.
integer count1.
float result.
integer x.

count1 equals 0.
x equals 50.

if count1 less than 10 then
    result equals 5 plus 3 times 2.
else
    result equals 0.

while count1 less than 5 do
    count1 equals count1 plus 1.

if x equals 50 and count1 equals 5 then
    x equals 100.

Finish.
```

## 🛠️ Installation & Compilation

**Clone the repository:**

````bash
git clone [https://github.com/Dionysos22/MPL_Compiler](https://github.com/Dionysos22/MPL_Compiler)
cd MPL_Compiler

You need **Flex**, **Bison**, and **GCC** installed on your system.
'''
### 1. Compile the Lexer
```bash
flex mpl.l
````

### 2. Compile the Parser

```bash
bison -dy mpl.y
# or "yacc -d mpl.y" depending on your environment
```

### 3. Build the Executable

```bash
gcc -o mpl y.tab.c
```

## 💻 Usage

### Windows (PowerShell)

Since standard input redirection (`<`) works differently in PowerShell, use the following pipeline:

```powershell
Get-Content myprog.mpl | .\mpl
```

### Linux / macOS

Standard redirection works on UNIX-based systems:

```bash
./mpl < myprog.mpl
```

## 📂 Project Structure

- [cite_start]`mpl.l`: Lexical analyzer definitions (Tokenizes inputs like `Start`, `if`, `plus`)[cite: 65, 75].
- [cite_start]`mpl.y`: Syntax analyzer and grammar rules (BNF notation)[cite: 69, 130].
- [cite_start]`myprog.mpl`: Sample source code written in MPL[cite: 202].

## 👤 Author

[cite_start]**Sarp Mataş** [cite: 11]
[cite_start]Computer Engineering Student @ Ankara University [cite: 5, 7]
