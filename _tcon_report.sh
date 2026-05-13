#!/bin/bash
echo "========== T con Daily Report =========="
echo ""

# Step 1: Build
gcc src/t_prog_compiler.c -lm -o t_bc 2>/dev/null &
GCC_PID=$!

# Run all slow steps in parallel
wait $GCC_PID && echo "[1/6] Build: OK" || echo "[1/6] Build: FAIL"
bash _run_units_fast.sh 2>/dev/null > _unit_cache.txt &
bash _run_test.sh tests/accumulator.t > _p1.txt &
bash _run_test.sh tests/sumavg.t > _p2.txt &
bash _run_test.sh tests/basic.t > _p3.txt &
bash _run_test.sh tests/filter.t > _p4.txt &
bash _run_test.sh tests/advanced.t > _p5.txt &
bash _run_tests.sh 2>/dev/null > _tests_cache.txt &
wait

echo "[2/6] Unit tests..."
UPASS=$(grep -c "^PASS" _unit_cache.txt 2>/dev/null); UFAIL=$(grep -c "^FAIL" _unit_cache.txt 2>/dev/null); UTOT=$((UPASS+UFAIL)); echo "     PASS=$UPASS FAIL=$UFAIL Total=$UTOT"
echo "[3/6] Integration tests..."
echo "     accumulator: $(cat _p1.txt | tr '\n' ' ')"
echo "     sumavg:      $(cat _p2.txt | tr '\n' ' ')"
echo "     basic:       $(cat _p3.txt | tr '\n' ' ')"
echo "     filter:      $(cat _p4.txt | tr '\n' ' ')"
echo "     advanced:    $(cat _p5.txt | tr '\n' ' ')"
echo "[4/6] Function tests..."
echo "     $(tail -1 _tests_cache.txt)"
echo "[5/6] T con learning..."
FAILS=$(grep "FAIL.*mismatch" _tests_cache.txt 2>/dev/null) export FAILS=$(grep "FAIL.*mismatch" _tests_cache.txt 2>/dev/null)
bash _tcon_learn.sh
echo "[6/6] Source scan..."
bash _tcon_scan_src.sh 2>/dev/null | grep -E "risk|---"
echo ""
echo "========================================"
