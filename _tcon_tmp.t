[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
txt = "hello T"
[T0]
char_tokenize(text=txt) ~> tokens
[T+]
show shall(tokens)
