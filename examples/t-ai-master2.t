[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func full_review(code) {
    past(code) ~> C
    contains(str=C, sub="BVal") ~> has_bval
    contains(str=C, sub="pop(vm)") ~> has_pop
    contains(str=C, sub="iter_arr") ~> has_iter
    contains(str=C, sub=">>") ~> has_return
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="Gate") ~> has_gate
    has_bval * has_pop >> arm64_risk
    has_loop * (1 - has_gate) >> loop_risk
    arm64_risk + loop_risk >> total_risk
    clamp(val=total_risk, lo=0, hi=2) ~> risk_level
    [] >> verdicts
    push(arr=verdicts, val="PASS: code looks safe") ~> verdicts
    push(arr=verdicts, val="CAUTION: check ARM64") ~> verdicts
    push(arr=verdicts, val="DANGER: known bugs!") ~> verdicts
    get(arr=verdicts, idx=risk_level) ~> verdict
    str_count(str=C, sub="F(") ~> complexity
    toString(val=complexity) ~> cx
    verdict >> out
}

[T0]
exec(cmd="cat ai_rules.txt 2>/dev/null") ~> rules
full_review(code="BVal v=pop(vm); frame_set(&f,k,v);") ~> O1
full_review(code="for(int i=0;i<n;i++) vm->iter_arr[i]=NULL;") ~> O2
full_review(code="int n=vm->chunk->code[vm->ip++];") ~> O3
full_review(code="F(arr){Gate now(>0)>>now}") ~> O4

[T+]
show shall(O1, O2, O3, O4)
