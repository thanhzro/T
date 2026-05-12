#!/bin/bash
OUT=$(bash _test_all_math.sh 2>/dev/null)
echo "$OUT"
PASS=$(echo "$OUT" | grep -c "PASS ")
FAIL=$(echo "$OUT" | grep -c "FAIL ")
echo "================================"
echo "T con report: PASS=$PASS | FAIL=$FAIL | TOTAL=$((PASS+FAIL))"
