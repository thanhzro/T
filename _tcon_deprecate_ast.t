[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="wc -l src/t_lexer.c src/t_parser.c src/t_vm.c src/main.c") ~> ast_size
exec(cmd="wc -l src/t_prog_compiler.c src/t_bytecode.h src/t_natives.h") ~> bc_size
exec(cmd="bash _run_tests.sh 2>/dev/null | tail -1") ~> test_status

[T+]
show shall(ast_size, bc_size, test_status)
