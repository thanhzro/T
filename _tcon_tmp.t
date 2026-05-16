[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
import "lib/advanced/t_codegen.t"
[T0]
compile_tilde(line="split(str=src, sep=x) ~> result") ~> instrs
[T+]
show shall(instrs)
