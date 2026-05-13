#!/bin/bash
echo "=== T con Parallel CI ==="
{ bash _run_test.sh tests/accumulator.t > _p1.txt; } &
{ bash _run_test.sh tests/sumavg.t > _p2.txt; } &
{ bash _run_test.sh tests/basic.t > _p3.txt; } &
{ bash _run_test.sh tests/filter.t > _p4.txt; } &
wait
echo "accumulator: $(cat _p1.txt | tr '\n' ' ')"
echo "sumavg:      $(cat _p2.txt | tr '\n' ' ')"
echo "basic:       $(cat _p3.txt | tr '\n' ' ')"
echo "filter:      $(cat _p4.txt | tr '\n' ' ')"
echo "========================="
