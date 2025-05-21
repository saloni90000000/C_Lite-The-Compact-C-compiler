# C_Lite-:The Compact C compiler
# Mini C Compiler

This is a mini compiler for the C programming language, developed as part of an academic project under the subject *Compiler Design*. The main aim is to understand and implement the basic components of a compiler including **lexical analysis**, **syntax analysis**, and **intermediate code generation**.

> **Note:** This project is currently **incomplete** and under active development.

---

## Project Objective

To build a simplified version of a C compiler that takes a `.c` source file and performs the following:

- Tokenizes the input (lexical analysis)
- Checks for syntax validity (parsing)
- Displays tokens and grammar rules
- Generates intermediate representation (planned)
- Reports errors where applicable

---

## Technologies & Tools Used

- **C Programming Language** – Core implementation
- **Lex/Flex** – Lexical analyzer generator
- **Yacc/Bison** – Syntax analyzer (parser generator)
- **GCC** – For compiling C programs and generated code
- **Linux Environment / Terminal**

---

## Project Structure

```bash
Mini-C-Compiler/
├── lexer.l           # Lexical analyzer definitions
├── parser.y          # Yacc/Bison parser definitions
├── input.c           # Sample input C file
├── symbol_table.txt  # (Planned) symbol table output
├── intermediate.txt  # (Planned) intermediate code output
├── README.md         # Project documentation
To-Do / Incomplete Work

Add semantic analyzer for type checking

Implement symbol table (store variable info)

Generate intermediate representation (3AC)

Add more production rules (loops, if-else, functions)

Build a basic GUI for input/output (
