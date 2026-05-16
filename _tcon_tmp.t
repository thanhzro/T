[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
import "lib/advanced/t_codegen.t"
[T0]
compile_assign(line="x + 1 >> r") ~> instrs
[T+]
show shall(instrs)
