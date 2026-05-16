[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
import "lib/advanced/t_codegen.t"
[T0]
compile_gate(line="Gate x (> 0) >> result") ~> instrs
[T+]
show shall(instrs)
