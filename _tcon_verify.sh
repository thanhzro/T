#!/bin/bash
# T con self-verify: compile → test → report
echo "=== T con verify ==="
gcc src/t_prog_compiler.c -lm -o t_bc 2>&1 | grep error | head -3
if [ $? -eq 0 ]; then
    RESULT=$(python3 check_runtime.py 2>/dev/null | tail -1)
    echo "Unit: $RESULT"
    bash _parallel_ci.sh 2>/dev/null | grep -E "PASS|FAIL"
else
    echo "BUILD FAILED - rollback"
    git checkout src/t_prog_compiler.c src/t_natives.h lib/
fi
