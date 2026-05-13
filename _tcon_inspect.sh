#!/bin/bash
# T con string constant inspector
# Run with: bash _tcon_inspect.sh file.t funcname
FILE=$1
FUNC=${2:-""}
echo "=== T con String Inspector ==="
echo "File: $FILE"
./t_bc $FILE --trace 2>&1 | grep "FRAME\|  " | head -30
echo "=== Checking for trailing space issues ==="
grep -n "strncpy" src/t_prog_compiler.c | grep -v "//\|0]\|trim" | wc -l | xargs echo "Potential trailing space risks:"
