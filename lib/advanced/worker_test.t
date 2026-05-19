[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="gcc src/t_prog_compiler.c -lm -lpthread -o t_bc 2>&1 | grep -c error") ~> errs
shell_exec(cmd="python3 check_runtime.py 2>&1 | grep -c '^FAIL'") ~> fails
trim(str=errs) ~> errs
trim(str=fails) ~> fails
Gate errs (== "0") >> build_ok
Gate fails (== "0") >> test_ok
[T+]
show shall(build_ok)
show shall(test_ok)
