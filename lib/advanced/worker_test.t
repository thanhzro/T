[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="gcc src/t_prog_compiler.c -lm -lpthread -o t_bc 2>&1 | grep error") ~> build
shell_exec(cmd="python3 check_runtime.py 2>&1 | tail -2") ~> tests
[T+]
show shall(build)
show shall(tests)
