[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func analyze_func(code) {
    past(code) ~> C
    contains(str=C, sub="Gate") ~> has_gate
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="exec") ~> has_exec
    contains(str=C, sub="past") ~> has_past
    contains(str=C, sub=">> out") ~> has_return
    str_count(str=C, sub="Gate") ~> gate_count
    str_count(str=C, sub="F(") ~> f_count
    1 - has_return >> no_return
    has_loop * (1 - has_gate) >> inf_loop_risk
    [] >> issues
    push(arr=issues, val="ok") ~> issues
    push(arr=issues, val="WARN: no return") ~> issues
    get(arr=issues, idx=no_return) ~> ret_warn
    [] >> loop_warn
    push(arr=loop_warn, val="ok") ~> loop_warn
    push(arr=loop_warn, val="WARN: loop no gate") ~> loop_warn
    get(arr=loop_warn, idx=inf_loop_risk) ~> lw
    [] >> exec_warn
    push(arr=exec_warn, val="ok") ~> exec_warn
    push(arr=exec_warn, val="INFO: uses exec") ~> exec_warn
    get(arr=exec_warn, idx=has_exec) ~> ew
    ret_warn + " | " + lw + " | " + ew >> out
}

[T0]
analyze_func(code="func f(x) { past(x) ~> V; V * 2 >> out }") ~> O1
analyze_func(code="func f(x) { loop { 1 >> x } }") ~> O2
analyze_func(code="func f(x) { exec(cmd=x) ~> out }") ~> O3

[T+]
show shall(O1, O2, O3)
