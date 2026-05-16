[T-]
import "lib/basic/std.t"
import "lib/advanced/t_parser.t"
[T0]
parse_gate(line="Gate x (> 0) >> result") ~> parts
[T+]
show shall(parts)
