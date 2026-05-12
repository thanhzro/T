[T-]
import "lib/basic/std.t"

func scan_risk(code) {
    past(code) ~> C
    contains(str=C, sub="BVal") ~> b
    contains(str=C, sub="pop(vm)") ~> p
    b * p >> score
    clamp(val=score, lo=0, hi=3) ~> out
}

[T0]
exec(cmd="grep -rn 'BVal v = pop' src/") ~> danger
exec(cmd="cat src/t_bytecode.h") ~> src
scan_risk(code=danger) ~> s1
scan_risk(code=src) ~> s2

[T+]
show shall(s1, s2)
