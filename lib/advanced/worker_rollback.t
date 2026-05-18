[T-]
import "lib/basic/std.t"
[T0]
shell_exec(cmd="git checkout src/t_bytecode.h src/t_prog_compiler.c") ~> r
shell_exec(cmd="gcc src/t_prog_compiler.c -lm -lpthread -o t_bc 2>&1") ~> build
[T+]
show shall(r)
show shall(build)
