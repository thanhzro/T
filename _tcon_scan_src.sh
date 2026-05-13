#!/bin/bash
echo "=== T con source scan ==="
echo "--- strncpy without trim (trailing space risk):"
grep -n "strncpy" src/t_prog_compiler.c | grep -v "trim\|--\|0]" | head -10
echo "--- atof without strtod (variable name risk):"  
grep -n "atof(" src/t_prog_compiler.c | head -5
echo "=== Done ==="
