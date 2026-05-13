#!/bin/bash
echo "========== T con Daily Report =========="
echo ""

# Step 1: Build
echo "[1/6] Build t_bc..."
BUILD=$(gcc src/t_prog_compiler.c -lm -o t_bc 2>&1)
[ $? -eq 0 ] && echo "     OK" || echo "     FAIL: $BUILD"

# Run all slow steps in parallel
python3 check_runtime.py 2>/dev/null > _unit_cache.txt &
bash _run_test.sh tests/accumulator.t > _p1.txt &
bash _run_test.sh tests/sumavg.t > _p2.txt &
bash _run_test.sh tests/basic.t > _p3.txt &
bash _run_test.sh tests/filter.t > _p4.txt &
bash _run_test.sh tests/advanced.t > _p5.txt &
bash _run_tests.sh 2>/dev/null > _tests_cache.txt &
wait

echo "[2/6] Unit tests..."
echo "     $(tail -1 _unit_cache.txt)"
echo "[3/6] Integration tests..."
echo "     accumulator: $(cat _p1.txt | tr '\n' ' ')"
echo "     sumavg:      $(cat _p2.txt | tr '\n' ' ')"
echo "     basic:       $(cat _p3.txt | tr '\n' ' ')"
echo "     filter:      $(cat _p4.txt | tr '\n' ' ')"
echo "     advanced:    $(cat _p5.txt | tr '\n' ' ')"
echo "[4/6] Function tests..."
echo "     $(tail -1 _tests_cache.txt)"
echo "[5/6] T con learning..."
FAILS=$(grep "FAIL.*mismatch" _tests_cache.txt 2>/dev/null) bash _tcon_learn.sh
echo "[6/6] Source scan..."
bash _tcon_scan_src.sh 2>/dev/null | grep -E "risk|---"
echo ""
echo "========================================"
