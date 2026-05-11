[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func check_line(line) {
    past(line) ~> L
    contains(str=L, sub="BVal") ~> has_bval
    contains(str=L, sub="pop(vm)") ~> has_pop
    contains(str=L, sub="iter_arr") ~> has_iter
    contains(str=L, sub="/*") ~> is_comment
    1 - is_comment >> not_comment
    has_bval * has_pop * not_comment >> risk1
    has_iter * not_comment >> risk2
    risk1 + risk2 >> total
    clamp(val=total, lo=0, hi=1) ~> has_risk
    "  RISK: " + L >> warn_line
    [] >> opts
    push(arr=opts, val="") ~> opts
    push(arr=opts, val=warn_line) ~> opts
    get(arr=opts, idx=has_risk) ~> out
}

[T0]
exec(cmd="grep -n 'BVal.*pop\|iter_arr' src/t_bytecode.h | head -20") ~> hits
check_line(line=hits) ~> O1

[T+]
show shall(hits, O1)
