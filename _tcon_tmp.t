[T-]
import "lib/basic/std.t"
import "lib/advanced/t_codegen.t"
myvar = "x"
[T0]
emit_load(vn=myvar) ~> r1
emit_add() ~> r2
emit_store(vn="result") ~> r3
[T+]
show shall(r1)
show shall(r2)
show shall(r3)
