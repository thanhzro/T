#!/bin/bash
echo "========== T con Daily Report =========="
echo ""
echo "[1/6] Build t_bc..."
BUILD=$(gcc src/t_prog_compiler.c -lm -o t_bc 2>&1)
[ $? -eq 0 ] && echo "     OK" || echo "     FAIL: $BUILD"

echo "[2/6] Unit tests..."
UNITS=$(python3 check_runtime.py 2>&1 | tail -1)
echo "     $UNITS"

echo "[3/6] Integration tests..."
R1=$(bash _run_test.sh tests/accumulator.t | tr '\n' ' ')
R2=$(bash _run_test.sh tests/sumavg.t | tr '\n' ' ')
R3=$(bash _run_test.sh tests/basic.t | tr '\n' ' ')
R4=$(bash _run_test.sh tests/filter.t | tr '\n' ' ')
echo "     accumulator: $R1"
echo "     sumavg:      $R2"
echo "     basic:       $R3"
echo "     filter:      $R4"

echo "[4/6] Function tests..."
FOUT=$(bash _run_tests.sh 2>/dev/null | tail -1)
echo "     $FOUT"

echo "[5/6] T con learning..."
bash _tcon_learn.sh

echo "[6/6] Source scan..."
bash _tcon_scan_src.sh 2>/dev/null | grep -E "risk|---"

echo ""
echo "========================================"
