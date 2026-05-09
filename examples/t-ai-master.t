[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func ai_review(name, code) {
    past(name) ~> N
    past(code) ~> C
    contains(str=C, sub=">>out") ~> hr1
    contains(str=C, sub=">> out") ~> hr2
    hr1 + hr2 >> hrs
    clamp(val=hrs, lo=0, hi=1) ~> has_return
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="Gate") ~> has_gate
    contains(str=C, sub="exec") ~> has_exec
    str_count(str=C, sub="F(") ~> f_count
    has_loop * (1 - has_gate) >> inf_risk
    1 - has_return >> no_ret
    has_exec >> exec_used
    inf_risk + no_ret >> issue_score
    issue_score + exec_used >> total_issues
    str_count(str=C, sub="Gate") ~> gate_cnt
    str_count(str=C, sub="loop") ~> loop_cnt
    loop_cnt * 3 >> ls
    f_count * 2 >> fs
    gate_cnt >> gs
    ls + fs + gs >> complexity
    Gate complexity (>= 8) >> high
    isNumber(val=high) ~> ih
    Gate complexity (>= 4) >> med
    isNumber(val=med) ~> im
    ih + im >> ci
    clamp(val=ci, lo=0, hi=2) ~> ci2
    [] >> clvl
    push(arr=clvl, val="LOW") ~> clvl
    push(arr=clvl, val="MED") ~> clvl
    push(arr=clvl, val="HIGH") ~> clvl
    get(arr=clvl, idx=ci2) ~> clevel
    toString(val=total_issues) ~> tis
    toString(val=complexity) ~> cs
    "=== " + N + " ===" >> h
    "Complexity: " + cs + " [" + clevel + "]" >> c_line
    "Issues: " + tis >> i_line
    h + " | " + c_line + " | " + i_line >> out
}

[T0]
ai_review(name="safe_div", code="func f(a,b){past(a)~>A;past(b)~>B;A/B>>out}") ~> O1
ai_review(name="inf_loop", code="func f(){loop{1>>x}}") ~> O2
ai_review(name="http_get", code="func f(u){past(u)~>U;exec(cmd=U)~>out}") ~> O3

[T+]
show shall(O1, O2, O3)
