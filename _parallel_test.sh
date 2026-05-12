#!/bin/bash
{ ./t tests/accumulator.t 2>/dev/null | sed 's/[[:space:]]*$//' > _r1.txt && ./t_bc tests/accumulator.t 2>/dev/null | sed 's/[[:space:]]*$//' > _b1.txt && diff _r1.txt _b1.txt >/dev/null && echo PASS || echo FAIL; } > _p1.txt &
{ ./t tests/sumavg.t 2>/dev/null | sed 's/[[:space:]]*$//' > _r2.txt && ./t_bc tests/sumavg.t 2>/dev/null | sed 's/[[:space:]]*$//' > _b2.txt && diff _r2.txt _b2.txt >/dev/null && echo PASS || echo FAIL; } > _p2.txt &
{ ./t tests/basic.t 2>/dev/null | sed 's/[[:space:]]*$//' > _r3.txt && ./t_bc tests/basic.t 2>/dev/null | sed 's/[[:space:]]*$//' > _b3.txt && diff _r3.txt _b3.txt >/dev/null && echo PASS || echo FAIL; } > _p3.txt &
wait
cat _p1.txt _p2.txt _p3.txt
