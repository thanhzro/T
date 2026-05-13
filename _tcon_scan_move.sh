#!/bin/bash
echo "=== T con: What can move to lib? ==="

echo "--- t_natives.h: math functions (can be T lib):"
grep -o '"[a-z_]*"' src/t_natives.h | tr -d '"' | sort -u | grep -E "sin|cos|tan|log|exp|sqrt|ceil|floor|round|abs|pow" | head -10

echo "--- t_natives.h: string functions (can be T lib):"  
grep -o '"[a-z_]*"' src/t_natives.h | tr -d '"' | sort -u | grep -E "upper|lower|trim|replace|split|join|contains|starts|ends" | head -10

echo "--- t_natives.h: array functions (can be T lib):"
grep -o '"[a-z_]*"' src/t_natives.h | tr -d '"' | sort -u | grep -E "sort|reverse|flatten|unique|concat|slice" | head -10

echo "--- Core must stay in C:"
echo "push, get, len, exec, range_step, split, join (performance critical)"
