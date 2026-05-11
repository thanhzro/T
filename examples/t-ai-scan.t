[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func scan_code(code, rules) {
    past(code) ~> C
    past(rules) ~> R
    contains(str=R, sub="BVal") ~> r1
    contains(str=C, sub="BVal") ~> c1
    r1 * c1 >> match_bval
    contains(str=R, sub="iter") ~> r2
    contains(str=C, sub="iter_arr") ~> c2
    r2 * c2 >> match_iter
    contains(str=R, sub="arm64") ~> r3
    contains(str=C, sub="struct") ~> c3
    r3 * c3 >> match_arm
    match_bval + match_iter >> m1
    m1 + match_arm >> total
    clamp(val=total, lo=0, hi=1) ~> has_risk
    [] >> msgs
    push(arr=msgs, val="OK") ~> msgs
    push(arr=msgs, val="WARN: known bug!") ~> msgs
    get(arr=msgs, idx=has_risk) ~> out
}

[T0]
exec(cmd="cat ai_rules.txt 2>/dev/null") ~> memory
trim(str=memory) ~> memory
scan_code(code="BVal v = pop(vm);", rules=memory) ~> O1
scan_code(code="vm->iter_arr[top]", rules=memory) ~> O2
scan_code(code="int x = vm->ip++;", rules=memory) ~> O3
scan_code(code="struct TFunc fn;", rules=memory) ~> O4

[T+]
show shall(O1, O2, O3, O4)
