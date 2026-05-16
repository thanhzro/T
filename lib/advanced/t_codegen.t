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

func compile_tilde(line) {
    past(line) ~> _L
    parse_tilde(line=_L) ~> _parts
    get(arr=_parts, idx=0) ~> _fname
    get(arr=_parts, idx=1) ~> _target
    get(arr=_parts, idx=2) ~> _args
    [] >> _instrs
    F(_args) {
        indexOf(str=now, sub="=") ~> _ep
        _ep + 1 >> _vs
        len(val=now) ~> _al
        slice(str=now, from=_vs, to=_al) ~> _val
        emit_load(vn=_val) ~> _instr
        push(arr=_instrs, val=_instr) ~> _instrs
    }
    len(val=_args) ~> _argc
    "" + _argc >> _argc_s
    emit_call(fname=_fname, argc=_argc_s) ~> _call
    push(arr=_instrs, val=_call) ~> _instrs
    emit_store(vn=_target) ~> _store
    push(arr=_instrs, val=_store) ~> _instrs
    _instrs >> out
}

func get_op_emit(op) {
    past(op) ~> _op
    indexOf(str=_op, sub=">=") ~> _pge
    indexOf(str=_op, sub="<=") ~> _ple
    indexOf(str=_op, sub="==") ~> _peq
    indexOf(str=_op, sub="!=") ~> _pne
    indexOf(str=_op, sub=">") ~> _pgt
    indexOf(str=_op, sub="<") ~> _plt
    0 >> _is_ge
    Gate _pge (== 0) >> _is_ge
    0 >> _is_le
    Gate _ple (== 0) >> _is_le
    0 >> _is_eq
    Gate _peq (== 0) >> _is_eq
    0 >> _is_ne
    Gate _pne (== 0) >> _is_ne
    0 >> _is_gt
    Gate _pgt (== 0) >> _is_gt
    1 - _is_ge >> _not_ge
    _not_ge * _is_gt >> _is_gt
    0 >> _is_lt
    Gate _plt (== 0) >> _is_lt
    1 - _is_le >> _not_le
    _not_le * _is_lt >> _is_lt
    _is_eq * 1 >> _c1
    _is_ne * 2 >> _c2
    _is_ge * 3 >> _c3
    _is_le * 4 >> _c4
    _is_gt * 5 >> _c5
    _is_lt * 6 >> _c6
    _c1 + _c2 >> _code
    _code + _c3 >> _code
    _code + _c4 >> _code
    _code + _c5 >> _code
    _code + _c6 >> _code
    _code >> out
}

func compile_gate(line) {
    past(line) ~> _L
    parse_gate(line=_L) ~> _parts
    get(arr=_parts, idx=0) ~> _var
    get(arr=_parts, idx=1) ~> _cond
    get(arr=_parts, idx=2) ~> _target
    split(str=_cond, sep=" ") ~> _ctoks
    get(arr=_ctoks, idx=0) ~> _op
    get(arr=_ctoks, idx=1) ~> _val
    [] >> _instrs
    emit_load(vn=_var) ~> _i1
    push(arr=_instrs, val=_i1) ~> _instrs
    emit_load(vn=_val) ~> _i2
    push(arr=_instrs, val=_i2) ~> _instrs
    get_op_emit(op=_op) ~> _opcode_n
    "" + _opcode_n >> _opcode_str
    push(arr=_instrs, val=_opcode_str) ~> _instrs
    "JUMP_IF_0 END" >> _jmp
    push(arr=_instrs, val=_jmp) ~> _instrs
    emit_store(vn=_target) ~> _i3
    push(arr=_instrs, val=_i3) ~> _instrs
    _instrs >> out
}
