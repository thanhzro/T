[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo '[1/6] Building...' >&2 && gcc src/t_prog_compiler.c -lm -o t_bc 2>&1 | tail -1") ~> build
exec(cmd="echo '[2/6] Units...' >&2 && python3 check_runtime.py 2>&1 | tail -1") ~> units
exec(cmd="echo '[3/6] accumulator...' >&2 && bash _run_test.sh tests/accumulator.t") ~> t1
exec(cmd="echo '[4/6] sumavg...' >&2 && bash _run_test.sh tests/sumavg.t") ~> t2
exec(cmd="echo '[5/6] basic...' >&2 && bash _run_test.sh tests/basic.t") ~> t3
exec(cmd="date '+%Y-%m-%d %H:%M'") ~> ts

[T+]
show shall(build, units, t1, t2, t3, ts)
