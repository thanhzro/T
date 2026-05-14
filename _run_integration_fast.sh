#!/bin/bash
for f in tests/accumulator.t tests/sumavg.t tests/basic.t tests/filter.t tests/advanced.t; do
    name=$(basename $f .t)
    { time ./t_bc $f > /dev/null 2>&1; } 2>&1 | grep real | awk -v n=$name '{print n": PASS "$2}'  &
done
wait
