[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func check_line(line) {
    past(line) ~> L
    contains(str=L, sub="BVal") ~> has_bval
    contains(str=L, sub="pop(vm)") ~> has_pop
    contains(str=L, sub="iter_arr") ~> has_iter
    contains(str=L, sub="->arr") ~> has_arr
    contains(str=L, sub="/*") ~> is_comment
    1 - is_comment >> not_comment
    has_bval * has_pop * not_comment >> risk1
    has_iter * has_arr * not_comment >> risk2
    risk1 + risk2 >> total
    clamp(val=total, lo=0, hi=1) ~> has_risk
    "WARN: " + L >> warn_line
    [] >> opts
    push(arr=opts, val="OK") ~> opts
    push(arr=opts, val=warn_line) ~> opts
    get(arr=opts, idx=has_risk) ~> out
}

[T0]
check_line(line="/* BVal comment */") ~> O1
check_line(line="BVal *v = &stack[top];") ~> O2
check_line(line="BVal v = pop(vm);") ~> O3
check_line(line="vm->iter_arr[top]->arr = NULL;") ~> O4

[T+]
show shall(O1, O2, O3, O4)
