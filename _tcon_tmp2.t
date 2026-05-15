[T-]
import "lib/basic/std.t"
import "lib/advanced/t_lexer.t"
line = "Gate x (> 3) >> result"
[T0]
tokenize_line(line=line) ~> r
[T+]
show shall(r)
