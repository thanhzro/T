# Contributing to T

## Build

Clone and build:

    git clone https://github.com/thanhzro/T.git
    cd T
    make

## Project structure

    src/        — Interpreter source (C)
    lib/        — Standard library (written in T)
    tests/      — Test programs

## Core files

- src/t_lexer.c — Tokenizer
- src/t_parser.c — Parser, builds AST
- src/t_vm.c — Virtual machine, executes AST
- src/t_types.h — Shared type definitions

## Every T program has three sections

    [T-]   Static data — defined once, never changed
    [T0]   Logic — pipelines, F(), Gate, functions
    [T+]   Output — show only, no logic

## F() modes

F() detects its mode automatically:

- Accumulate: O1 + now >> O1
- Filter: Gate now (> 0) >> O1
- Transform: ... ~> now
- Conditional Transform: Gate ... >> now + ~> now

## Running tests

    make test

## Reporting bugs

Open an issue on GitHub with:
- T version
- Code that reproduces the bug
- Expected vs actual output
