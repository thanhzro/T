[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func check_risk(line) {
    past(line) ~> L
    contains(str=L, sub="BVal") ~> b
    contains(str=L, sub="return") ~> r
    contains(str=L, sub="make_") ~> mk
    b * r >> risk1
    b * mk >> risk2
    risk1 + risk2 >> total
    clamp(val=total, lo=0, hi=1) ~> risk
    "RISK: " + L >> warn
    [] >> o
    push(arr=o, val="safe") ~> o
    push(arr=o, val=warn) ~> o
    get(arr=o, idx=risk) ~> out
}

[T0]
exec(cmd="grep -n 'BVal' src/t_bytecode.h | grep -v '//' | head -5") ~> hits
check_risk(line=hits) ~> O1

[T+]
show shall(O1)
