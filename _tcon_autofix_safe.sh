#!/bin/bash
# Safe: one func at a time, verify after each
FUNCS=$(python3 check_runtime.py 2>/dev/null | grep "^FAIL" | grep -oP '\w+(?=\()' | sort -u)
for func in $FUNCS; do
    echo -n "Fixing $func... "
    bash _tcon_autofix.sh "$func" 2>/dev/null | grep -E "Fixed|Unit:"
    # Verify after each fix
    RESULT=$(python3 check_runtime.py 2>/dev/null | grep "PASS:" | grep -oP '\d+')
    echo "  → PASS=$RESULT"
done
