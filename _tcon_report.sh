#!/bin/bash
echo "========== T con Daily Report =========="
echo ""

# Step 1: Build
# Only recompile if source changed
if [ src/t_prog_compiler.c -nt t_bc ] || [ src/t_bytecode.h -nt t_bc ] || [ src/t_natives.h -nt t_bc ]; then
    gcc src/t_prog_compiler.c -lm -lpthread -o t_bc 2>/dev/null &
    GCC_PID=$!
else
    GCC_PID=0
fi

# Run all slow steps in parallel
[ $GCC_PID -eq 0 ] && echo "[1/6] Build: cached" || (wait $GCC_PID && echo "[1/6] Build: OK" || echo "[1/6] Build: FAIL")
# Start server if not running
pgrep -f "t_bc --server" > /dev/null || (./t_bc --server > /dev/null 2>&1 & sleep 0.3)
bash _run_units_fast.sh 2>/dev/null > _unit_cache.txt &
bash _run_integration_fast.sh > _integration_cache.txt &
bash _run_tests_fast.sh 2>/dev/null > _tests_cache.txt &
wait

echo "[2/6] Unit tests..."
UPASS=$(grep -c "^PASS" _unit_cache.txt 2>/dev/null); UFAIL=$(grep -c "^FAIL" _unit_cache.txt 2>/dev/null); UTOT=$((UPASS+UFAIL)); echo "     PASS=$UPASS FAIL=$UFAIL Total=$UTOT"
echo "[3/6] Integration tests..."
cat _integration_cache.txt | sed 's/^/     /'
echo "[4/6] Function tests..."
echo "     $(tail -1 _tests_cache.txt)"
echo "[5/6] T con learning..."
FAILS=$(grep "FAIL.*mismatch" _tests_cache.txt 2>/dev/null) export FAILS=$(grep "FAIL.*mismatch" _tests_cache.txt 2>/dev/null)
bash _tcon_learn.sh
echo "[6/6] Source scan..."
bash _tcon_scan_src.sh 2>/dev/null | grep -E "risk|---"
echo ""
echo "========================================"
