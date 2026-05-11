[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func analyze_for_bytecode(code) {
    past(code) ~> C
    contains(str=C, sub="F(") ~> has_f
    contains(str=C, sub="Gate") ~> has_gate
    contains(str=C, sub="~>") ~> has_load
    contains(str=C, sub=">>") ~> has_flow
    contains(str=C, sub="past(") ~> has_past
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="import") ~> has_import
    str_count(str=C, sub="F(") ~> f_count
    str_count(str=C, sub="~>") ~> call_count
    f_count * 2 >> f_score
    call_count * 1 >> call_score
    f_score + call_score >> complexity
    Gate complexity (>= 6) >> high
    isNumber(val=high) ~> is_high
    Gate complexity (>= 3) >> med
    isNumber(val=med) ~> is_med
    is_high + is_med >> ci
    clamp(val=ci, lo=0, hi=2) ~> ci2
    [] >> levels
    push(arr=levels, val="LOW") ~> levels
    push(arr=levels, val="MED") ~> levels
    push(arr=levels, val="HIGH") ~> levels
    get(arr=levels, idx=ci2) ~> level
    "BYTECODE: " + level >> b_line
    has_f * 1 >> bf
    has_gate * 1 >> bg
    has_load * 1 >> bl
    "OPCODES: " >> ops
    Gate bf (== 1) >> o1
    isNumber(val=o1) ~> io1
    [] >> oa
    push(arr=oa, val=ops) ~> oa
    push(arr=oa, val=ops + "ITER ") ~> oa
    get(arr=oa, idx=io1) ~> ops
    Gate bg (== 1) >> o2
    isNumber(val=o2) ~> io2
    [] >> ob
    push(arr=ob, val=ops) ~> ob
    push(arr=ob, val=ops + "JUMP ") ~> ob
    get(arr=ob, idx=io2) ~> ops
    Gate bl (== 1) >> o3
    isNumber(val=o3) ~> io3
    [] >> oc
    push(arr=oc, val=ops) ~> oc
    push(arr=oc, val=ops + "CALL ") ~> oc
    get(arr=oc, idx=io3) ~> ops
    b_line + " | " + ops >> out
}

[T0]
analyze_for_bytecode(code="F(arr) { Gate now (> 0) >> now }") ~> O1
analyze_for_bytecode(code="abs(val=x) ~> O1") ~> O2
analyze_for_bytecode(code="x + y >> z") ~> O3

[T+]
show shall(O1, O2, O3)
