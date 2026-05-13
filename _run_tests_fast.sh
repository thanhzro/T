#!/bin/bash
mkdir -p _tcon_tmp_files
# Run all tests in parallel
grep "bash _mk_test.sh" _test_all_math.sh | while read line; do
    eval "$line > _tcon_tmp_files/t_$$.txt 2>/dev/null" &
done
wait
# Collect results
cat _tcon_tmp_files/t_*.txt 2>/dev/null
PASS=$(cat _tcon_tmp_files/t_*.txt 2>/dev/null | grep -c "PASS ")
FAIL=$(cat _tcon_tmp_files/t_*.txt 2>/dev/null | grep -c "FAIL ")
rm -f _tcon_tmp_files/t_*.txt
echo "================================"
echo "T con report: PASS=$PASS | FAIL=$FAIL | TOTAL=$((PASS+FAIL))"
