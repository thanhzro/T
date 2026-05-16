[T-]
func emit_load(vn) {
    past(vn) ~> _v
    "LOAD " + _v >> out
}

func emit_store(vn) {
    past(vn) ~> _v
    "STORE " + _v >> out
}

func emit_push_num(val) {
    past(val) ~> _v
    "PUSH_NUM " + _v >> out
}

func emit_push_str(val) {
    past(val) ~> _v
    "PUSH_STR " + _v >> out
}

func emit_call(fname, argc) {
    past(fname) ~> _f
    past(argc) ~> _ac
    "CALL " + _f >> _c1
    _c1 + " " >> _c2
    _c2 + _ac >> out
}

func emit_add() { "ADD" >> out }
func emit_sub() { "SUB" >> out }
func emit_mul() { "MUL" >> out }
func emit_div() { "DIV" >> out }
func emit_eq() { "EQ" >> out }
func emit_neq() { "NEQ" >> out }
func emit_gt() { "GT" >> out }
func emit_lt() { "LT" >> out }
func emit_ge() { "GE" >> out }
func emit_le() { "LE" >> out }
func emit_return() { "RETURN" >> out }
func emit_halt() { "HALT" >> out }

func compile_assign(line) {
    past(line) ~> _L
    parse_assign(line=_L) ~> _parts
    len(val=_parts) ~> _n
    _n - 1 >> _last_idx
    get(arr=_parts, idx=_last_idx) ~> _target
    slice(str=_parts, from=0, to=_last_idx) ~> _expr_parts
    [] >> _instrs
    F(_expr_parts) {
        emit_load(vn=now) ~> _instr
        push(arr=_instrs, val=_instr) ~> _instrs
    }
    emit_store(vn=_target) ~> _store
    push(arr=_instrs, val=_store) ~> _instrs
    _instrs >> out
}
