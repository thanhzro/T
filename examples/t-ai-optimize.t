[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func optimize(code) {
    past(code) ~> C
    contains(str=C, sub="* 1") ~> mul_one
    contains(str=C, sub="+ 0") ~> add_zero
    contains(str=C, sub="- 0") ~> sub_zero
    contains(str=C, sub="/ 1") ~> div_one
    contains(str=C, sub="* 0") ~> mul_zero
    mul_one + add_zero >> r1
    r1 + sub_zero >> r2
    r2 + div_one >> r3
    r3 + mul_zero >> total
    clamp(val=total, lo=0, hi=1) ~> has_opt
    str_count(str=C, sub=">>") ~> flows
    str_count(str=C, sub="~>") ~> loads
    flows + loads >> ops
    Gate ops (> 5) >> complex
    isNumber(val=complex) ~> is_complex
    "OPT: remove redundant op (x*1=x, x+0=x, x*0=0)" >> opt_msg
    "OK: no obvious optimizations" >> ok_msg
    "WARN: complex pipeline - consider splitting" >> complex_msg
    [] >> opts
    push(arr=opts, val=ok_msg) ~> opts
    push(arr=opts, val=opt_msg) ~> opts
    get(arr=opts, idx=has_opt) ~> r_opt
    [] >> o2
    push(arr=o2, val=r_opt) ~> o2
    push(arr=o2, val=complex_msg) ~> o2
    get(arr=o2, idx=is_complex) ~> out
}

[T0]
optimize(code="A * 1 >> x") ~> O1
optimize(code="A + 0 >> x") ~> O2
optimize(code="A * B >> x") ~> O3
optimize(code="A >> B >> C >> D >> E >> F >> G >> out") ~> O4

[T+]
show shall(O1, O2, O3, O4)
