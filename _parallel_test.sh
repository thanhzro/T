#!/bin/bash
{ ./t tests/accumulator.t > _r1.txt 2>/dev/null && ./t_bc tests/accumulator.t > _b1.txt 2>/dev/null && diff _r1.txt _b1.txt >/dev/null && echo PASS || echo FAIL; } > _p1.txt &
{ ./t tests/sumavg.t > _r2.txt 2>/dev/null && ./t_bc tests/sumavg.t > _b2.txt 2>/dev/null && diff _r2.txt _b2.txt >/dev/null && echo PASS || echo FAIL; } > _p2.txt &
{ ./t tests/basic.t > _r3.txt 2>/dev/null && ./t_bc tests/basic.t > _b3.txt 2>/dev/null && diff _r3.txt _b3.txt >/dev/null && echo PASS || echo FAIL; } > _p3.txt &
wait
cat _p1.txt _p2.txt _p3.txt
