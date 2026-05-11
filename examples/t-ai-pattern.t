[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

func detect_pattern(code) {
    past(code) ~> C
    contains(str=C, sub=">>") ~> has_flow
    contains(str=C, sub="~>") ~> has_load
    contains(str=C, sub="Gate") ~> has_gate
    contains(str=C, sub="F(") ~> has_frac
    contains(str=C, sub="loop") ~> has_loop
    contains(str=C, sub="past(") ~> has_past
    contains(str=C, sub="+") ~> has_add
    contains(str=C, sub="*") ~> has_mul
    has_gate * (1 - has_frac) >> is_gate_only
    has_frac * (1 - has_gate) >> is_frac_only
    has_gate * has_frac >> is_filter
    "PATTERN: assign → PUSH A, PUSH B, OP, STORE target" >> p_assign
    "PATTERN: gate → LOAD x, PUSH val, CMP, JUMP_IF_0" >> p_gate
    "PATTERN: fractal → ITER_START, body, ITER_NEXT, ITER_END" >> p_frac
    "PATTERN: filter → ITER_START, body, GATE, JUMP, ITER_NEXT" >> p_filter
    "PATTERN: loop → LABEL, body, GATE done, JUMP back" >> p_loop
    "PATTERN: func_call → PUSH args, CALL name argc" >> p_call
    "PATTERN: unknown" >> p_unk
    [] >> opts
    push(arr=opts, val=p_assign) ~> opts
    push(arr=opts, val=p_gate) ~> opts
    get(arr=opts, idx=is_gate_only) ~> r1
    [] >> o2
    push(arr=o2, val=r1) ~> o2
    push(arr=o2, val=p_frac) ~> o2
    get(arr=o2, idx=is_frac_only) ~> r2
    [] >> o3
    push(arr=o3, val=r2) ~> o3
    push(arr=o3, val=p_filter) ~> o3
    get(arr=o3, idx=is_filter) ~> r3
    [] >> o4
    push(arr=o4, val=r3) ~> o4
    push(arr=o4, val=p_loop) ~> o4
    get(arr=o4, idx=has_loop) ~> out
}

func emit_hint(code) {
    past(code) ~> C
    detect_pattern(code=C) ~> pat
    contains(str=C, sub=">>") ~> has_flow
    contains(str=C, sub="~>") ~> has_load
    "→ " + pat >> out
}

[T0]
emit_hint(code="A + B >> x") ~> O1
emit_hint(code="Gate x (> 0) >> O1") ~> O2
emit_hint(code="F(arr) { now * 2 >> now }") ~> O3
emit_hint(code="F(arr) { Gate now (> 0) >> now }") ~> O4
emit_hint(code="loop { Gate done (== 1) >> done }") ~> O5

[T+]
show shall(O1, O2, O3, O4, O5)
