[T-]
import "lib/basic/std.t"
[T0]
exec_bc(cmd="gcc src/t_prog_compiler.c -lm -lpthread -o t_bc 2>&1") ~> build
exec_bc(cmd="python3 check_runtime.py 2>&1 | tail -2") ~> tests
[T+]
show shall(build)
show shall(tests)
