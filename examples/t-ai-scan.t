[T-]
import "lib/basic/std.t"

[T0]
exec_bc(cmd="gcc src/t_prog_compiler.c -lm -o t_bc 2>&1 | head -5") ~> build_out
exec_bc(cmd="python3 check_runtime.py 2>&1 | tail -3") ~> test_out
exec_bc(cmd="echo BUILD_DONE") ~> status

[T+]
show shall(build_out, test_out, status)
