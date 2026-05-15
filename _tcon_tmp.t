[T-]
import "lib/basic/std.t"
import "lib/advanced/t_lexer.t"
src_line = "Gate x (> 3) >> result"
[T0]
tokenize_line(line=src_line) ~> tokens
[T+]
show shall(tokens)
