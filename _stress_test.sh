#!/bin/bash
N=${1:-10}
echo "=== Spawning $N parallel T con ==="
for i in $(seq 1 $N); do
    { bash _run_test.sh tests/basic.t > _stress_$i.txt 2>/dev/null; } &
done
wait
PASS=$(grep -l "PASS" _stress_*.txt | wc -l)
FAIL=$(grep -l "FAIL" _stress_*.txt | wc -l)
echo "PASS=$PASS FAIL=$FAIL"
rm -f _stress_*.txt
