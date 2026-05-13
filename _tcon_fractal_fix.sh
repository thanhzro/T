#!/bin/bash
FUNC=$1
DEPTH=${2:-0}
MAX_DEPTH=2

[ $DEPTH -ge $MAX_DEPTH ] && exit 0

echo "=== T con[$DEPTH]: $FUNC ==="

if [ $DEPTH -eq 0 ]; then
    # Only depth 0 writes fixes
    bash _tcon_autofix.sh "$FUNC" 2>/dev/null | tail -1
fi

if [ $DEPTH -eq 0 ]; then
    # T+ of depth 0 = diagnose next fails, spawn depth 1 to report only
    NEXT=$(python3 check_runtime.py 2>/dev/null | grep "^FAIL" | grep -oP '\w+(?=\()' | sort -u | head -3)
    for next in $NEXT; do
        bash _tcon_fractal_fix.sh "$next" 1 &
    done
    wait
fi
