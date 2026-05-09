[T-]
import "lib/basic/std.t"

func complexity(code) {
    past(code) ~> C
    str_count(str=C, sub="loop") ~> loops
    str_count(str=C, sub="F(") ~> fractals
    str_count(str=C, sub="Gate") ~> gates
    str_count(str=C, sub="exec") ~> execs
    str_count(str=C, sub="func ") ~> funcs
    loops * 3 >> loop_score
    fractals * 2 >> frac_score
    gates * 1 >> gate_score
    execs * 2 >> exec_score
    loop_score + frac_score >> s1
    s1 + gate_score >> s2
    s2 + exec_score >> total
    Gate total (>= 10) >> high
    isNumber(val=high) ~> is_high
    Gate total (>= 5) >> med
    isNumber(val=med) ~> is_med
    toString(val=total) ~> ts
    [] >> levels
    push(arr=levels, val="LOW") ~> levels
    push(arr=levels, val="MED") ~> levels
    is_med + is_high >> lvl_idx
    clamp(val=lvl_idx, lo=0, hi=2) ~> li
    [] >> l2
    push(arr=l2, val="LOW") ~> l2
    push(arr=l2, val="MED") ~> l2
    push(arr=l2, val="HIGH") ~> l2
    get(arr=l2, idx=li) ~> level
    "score=" + ts + " [" + level + "]" >> out
}

[T0]
complexity(code="func f(x) { past(x)~>V; V*2>>out }") ~> O1
complexity(code="func f(arr) { F(arr) { Gate now(>0)>>now } arr>>out }") ~> O2
complexity(code="func f() { loop { Gate done(==1)>>done; exec(cmd=x)~>r } r>>out }") ~> O3

[T+]
show shall(O1, O2, O3)
