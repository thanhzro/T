[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
import "lib/advanced/t_codegen.t"
[T0]
compile_assign(line="x + 1 >> r") ~> instrs
fromChar(code=10) ~> nl
write_output(instrs=instrs, path="test_output.txt", nl=nl) ~> ok
[T+]
show shall(ok)
