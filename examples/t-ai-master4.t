[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo '[1/6] Building...' >&2 && { time gcc src/t_prog_compiler.c -lm -o t_bc 2>&1 | tail -1; } 2>&1 | grep -E 'real|^$' | head -2") ~> build
exec(cmd="echo '[2/6] Unit tests...' >&2 && python3 check_runtime.py 2>&1 | tail -1") ~> units
exec(cmd="echo '[3/6] accumulator.t...' >&2 && { time bash -c './t tests/accumulator.t > _r1.txt 2>/dev/null && ./t_bc tests/accumulator.t > _b1.txt 2>/dev/null && diff _r1.txt _b1.txt >/dev/null && echo PASS || echo FAIL'; } 2>&1") ~> t1
exec(cmd="echo '[4/6] sumavg.t...' >&2 && { time bash -c './t tests/sumavg.t > _r2.txt 2>/dev/null && ./t_bc tests/sumavg.t > _b2.txt 2>/dev/null && diff _r2.txt _b2.txt >/dev/null && echo PASS || echo FAIL'; } 2>&1") ~> t2
exec(cmd="echo '[5/6] basic.t...' >&2 && { time bash -c './t tests/basic.t > _r3.txt 2>/dev/null && ./t_bc tests/basic.t > _b3.txt 2>/dev/null && diff _r3.txt _b3.txt >/dev/null && echo PASS || echo FAIL'; } 2>&1") ~> t3
exec(cmd="date '+%Y-%m-%d %H:%M'") ~> ts

[T+]
show shall(build, units, t1, t2, t3, ts)
