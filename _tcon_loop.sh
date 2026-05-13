#!/bin/bash
N=${1:-3}
for i in $(seq 1 $N); do
    echo "=== T con iteration $i ==="
    bash _tcon_learn.sh
    bash _run_tests.sh 2>/dev/null | tail -1
done
