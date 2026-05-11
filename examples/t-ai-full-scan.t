[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

[T0]
exec(cmd="grep -rn 'BVal v = pop' src/") ~> danger
exec(cmd="grep -rn 'iter_arr' src/ | grep arr") ~> iter_risk

[T+]
show shall(danger, iter_risk)
