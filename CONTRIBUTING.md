# Contributing to T Language

## Quick Start

    git clone https://github.com/thanhzro/T.git
    cd T
    gcc src/t_prog_compiler.c -lm -lpthread -o t_bc
    python3 check_runtime.py 2>&1 | grep "^FAIL"

No output = 48/48 tests pass.

## Rules

- T-first: implement in T before writing C native
- No debug prints in code
- After change: tests must pass
- Commit format: fix: feat: docs: refactor:

## Architecture

- src/t_prog_compiler.c - compiler + VM
- src/t_bytecode.h - bytecode VM
- src/t_natives.h - C native functions
- lib/ - T standard library
- lib/advanced/ - T con army workers
- scores/ - worker scores
- ai_rules.txt - army knowledge base

## T Con Army

    nohup ./run_army.sh > army.log 2>&1 &

Add self-healing: FIX:keyword:CMD:bash_command in ai_rules.txt
