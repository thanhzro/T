#!/bin/bash
# Run all tests in parallel batches
bash _test_all_math.sh 2>/dev/null > _math_cache.txt
OUT=$(cat _math_cache.txt)
echo "$OUT"
PASS=$(echo "$OUT" | grep -c "PASS ")
FAIL=$(echo "$OUT" | grep -c "FAIL ")
echo "================================"
echo "T con report: PASS=$PASS | FAIL=$FAIL | TOTAL=$((PASS+FAIL))"
