[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func analyze_func(code) {
    past(code) ~> C
    contains(str=C, sub=">>out") ~> hr1
    contains(str=C, sub=">> out") ~> hr2
    hr1 + hr2 >> hr_score
    clamp(val=hr_score, lo=0, hi=1) ~> has_return
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="Gate") ~> has_gate
    contains(str=C, sub="exec") ~> has_exec
    1 - has_return >> no_return
    has_loop * (1 - has_gate) >> inf_loop_risk
    [] >> issues
    push(arr=issues, val="") ~> issues
    push(arr=issues, val="WARN:no_return ") ~> issues
    get(arr=issues, idx=no_return) ~> w1
    [] >> i2
    push(arr=i2, val=w1) ~> i2
    push(arr=i2, val=w1 + "WARN:inf_loop ") ~> i2
    get(arr=i2, idx=inf_loop_risk) ~> w2
    [] >> i3
    push(arr=i3, val=w2) ~> i3
    push(arr=i3, val=w2 + "INFO:uses_exec") ~> i3
    get(arr=i3, idx=has_exec) ~> out
}

func suggest_fix(issues) {
    past(issues) ~> I
    contains(str=I, sub="no_return") ~> r1
    contains(str=I, sub="inf_loop") ~> r2
    contains(str=I, sub="uses_exec") ~> r3
    [] >> fixes
    Gate r1 (== 1) >> f1
    isNumber(val=f1) ~> if1
    [] >> o1
    push(arr=o1, val=fixes) ~> o1
    push(arr=o1, val="→ Add '>> out'") ~> o1
    get(arr=o1, idx=if1) ~> fixes
    Gate r2 (== 1) >> f2
    isNumber(val=f2) ~> if2
    [] >> o2
    push(arr=o2, val=fixes) ~> o2
    push(arr=o2, val=fixes + " + Gate termination") ~> o2
    get(arr=o2, idx=if2) ~> fixes
    Gate r3 (== 1) >> f3
    isNumber(val=f3) ~> if3
    [] >> o3
    push(arr=o3, val=fixes) ~> o3
    push(arr=o3, val=fixes + " + T-pure alt") ~> o3
    get(arr=o3, idx=if3) ~> fixes
    len(val=fixes) ~> flen
    Gate flen (== 0) >> clean
    isNumber(val=clean) ~> ic
    [] >> result
    push(arr=result, val=fixes) ~> result
    push(arr=result, val="✓ Clean") ~> result
    get(arr=result, idx=ic) ~> out
}

func lint(name, code) {
    past(name) ~> N
    past(code) ~> C
    analyze_func(code=C) ~> issues
    suggest_fix(issues=issues) ~> fix
    "[ " + N + " ] " + fix >> out
}

[T0]
lint(name="safe_div", code="func f(a,b) { past(a)~>A; safe_div(a=A,b=0)>>out }") ~> O1
lint(name="inf_loop", code="func f() { loop { 1>>x } }") ~> O2
lint(name="clean_fn", code="func f(x) { past(x)~>V; V*2>>out }") ~> O3
lint(name="exec_fn", code="func f(x) { exec(cmd=x)~>out }") ~> O4

[T+]
show shall(O1, O2, O3, O4)
