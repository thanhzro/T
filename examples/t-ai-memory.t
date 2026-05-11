[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func learn(pattern, fix_msg, sev) {
    past(pattern) ~> P
    past(fix_msg) ~> FM
    past(sev) ~> S
    "PATTERN=" + P >> p1
    p1 + " FIX=" >> p2
    p2 + FM >> p3
    p3 + " SEV=" >> p4
    p4 + S >> out
}

func recall(code, memory) {
    past(code) ~> C
    past(memory) ~> M
    contains(str=M, sub="BVal") ~> m1
    contains(str=C, sub="BVal") ~> c1
    m1 * c1 >> match1
    contains(str=M, sub="iter") ~> m2
    contains(str=C, sub="iter") ~> c2
    m2 * c2 >> match2
    match1 + match2 >> total
    clamp(val=total, lo=0, hi=1) ~> matched
    [] >> opts
    push(arr=opts, val="OK: no known bug") ~> opts
    push(arr=opts, val="WARN: known ARM64 bug") ~> opts
    get(arr=opts, idx=matched) ~> out
}

[T0]
learn(pattern="BVal by value", fix_msg="output pointer", sev="HIGH") ~> L1
learn(pattern="iter in VM struct", fix_msg="use global", sev="HIGH") ~> L2
recall(code="BVal v = pop(vm);", memory=L1) ~> R1
recall(code="int x = vm->top;", memory=L1) ~> R2
recall(code="vm->iter_arr[top]", memory=L2) ~> R3

[T+]
show shall(L1, L2, R1, R2, R3)
