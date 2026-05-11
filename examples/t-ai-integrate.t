[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func check_integrate_risk(code) {
    past(code) ~> C
    contains(str=C, sub="BVal") ~> has_bval
    contains(str=C, sub="struct") ~> has_struct
    contains(str=C, sub="return") ~> has_return
    contains(str=C, sub="->arr") ~> has_arr_access
    contains(str=C, sub="pop(vm)") ~> has_pop
    contains(str=C, sub="push(vm") ~> has_push
    contains(str=C, sub="frame_set") ~> has_fset
    contains(str=C, sub="iter") ~> has_iter
    has_bval * 3 >> r1
    has_struct * 2 >> r2
    has_pop * 3 >> r3
    has_arr_access * 3 >> r4
    r1 + r2 + r3 + r4 >> risk_score
    clamp(val=risk_score, lo=0, hi=10) ~> rs
    Gate rs (>= 6) >> high_risk
    isNumber(val=high_risk) ~> is_high
    Gate rs (>= 3) >> med_risk
    isNumber(val=med_risk) ~> is_med
    is_high + is_med >> ri
    clamp(val=ri, lo=0, hi=2) ~> ri2
    [] >> risks
    push(arr=risks, val="SAFE") ~> risks
    push(arr=risks, val="CAUTION: ARM64 struct risk") ~> risks
    push(arr=risks, val="DANGER: ARM64 bug likely") ~> risks
    get(arr=risks, idx=ri2) ~> risk_level
    toString(val=rs) ~> rs_str
    "Risk=" + rs_str + " " + risk_level >> out
}

func suggest_fix(code) {
    past(code) ~> C
    contains(str=C, sub="pop(vm)") ~> has_pop
    contains(str=C, sub="BVal v)") ~> pass_by_val
    contains(str=C, sub="return.*BVal") ~> ret_bval
    has_pop * 1 >> p1
    pass_by_val * 1 >> p2
    p1 + p2 >> score
    clamp(val=score, lo=0, hi=2) ~> s
    [] >> fixes
    push(arr=fixes, val="OK: no ARM64 issues") ~> fixes
    push(arr=fixes, val="FIX: use vm->stack[--vm->top] instead of pop()") ~> fixes
    push(arr=fixes, val="FIX: use output pointer, avoid BVal by value") ~> fixes
    get(arr=fixes, idx=s) ~> out
}

[T0]
check_integrate_risk(code="BVal pop(VM*vm){return vm->stack[--vm->top];}") ~> O1
check_integrate_risk(code="frame_set(&f, k, val); vm->iter_arr[top]") ~> O2
check_integrate_risk(code="int n = vm->chunk->code[vm->ip++];") ~> O3
suggest_fix(code="BVal v = pop(vm); frame_set(&f, k, v);") ~> O4
suggest_fix(code="vm->stack[--vm->top]; frame_get(&f,k,&out);") ~> O5

[T+]
show shall(O1, O2, O3, O4, O5)
