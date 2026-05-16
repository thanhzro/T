[T-]
func parse_line(line) {
    past(line) ~> _L
    split(str=_L, sep=" ") ~> _toks
    [] >> _tokens
    F(_toks) { Gate now (!= "") >> _tokens }
    _tokens >> out
}

func get_line_type(tokens) {
    past(tokens) ~> _toks
    get(arr=_toks, idx=0) ~> _first
    _first >> out
}

func get_tminus(src) {
    past(src) ~> _src
    indexOf(str=_src, sub="[T0]") ~> _t0p
    slice(str=_src, from=0, to=_t0p) ~> _tm_src
    split(str=_tm_src, sep="\n") ~> out
}

func get_tzero(src) {
    past(src) ~> _src
    indexOf(str=_src, sub="[T0]") ~> _t0p
    indexOf(str=_src, sub="[T+]") ~> _tpp
    slice(str=_src, from=_t0p, to=_tpp) ~> _t0_src
    split(str=_t0_src, sep="\n") ~> out
}

func get_tplus(src) {
    past(src) ~> _src
    indexOf(str=_src, sub="[T+]") ~> _tpp
    len(val=_src) ~> _srclen
    slice(str=_src, from=_tpp, to=_srclen) ~> _tp_src
    split(str=_tp_src, sep="\n") ~> out
}

func is_func_def(line) {
    past(line) ~> _L
    indexOf(str=_L, sub="func ") ~> _pos
    0 >> out
    Gate _pos (== 0) >> out
    1 >> out
}

func get_func_name(line) {
    past(line) ~> _L
    slice(str=_L, from=5, to=99) ~> _rest
    indexOf(str=_rest, sub="(") ~> _lp
    slice(str=_rest, from=0, to=_lp) ~> out
}

func get_func_params(line) {
    past(line) ~> _L
    indexOf(str=_L, sub="(") ~> _lp
    indexOf(str=_L, sub=")") ~> _rp
    _lp + 1 >> _start
    slice(str=_L, from=_start, to=_rp) ~> _pstr
    split(str=_pstr, sep=", ") ~> out
}

func get_func_bodies(lines) {
    past(lines) ~> _lines
    [] >> _body
    0 >> _in_func
    F(_lines) {
        now >> _line
        indexOf(str=_line, sub="func ") ~> _is_fd
        0 >> _fd
        Gate _is_fd (== 0) >> _fd
        indexOf(str=_line, sub="}") ~> _is_end
        0 >> _end
        Gate _is_end (== 0) >> _end
        _fd + _in_func >> _in_func
        Gate _in_func (> 0) >> _body
        _line >> _body
        _end * _in_func >> _stop
        0 >> _in_func
        Gate _stop (== 0) >> _in_func
        _in_func >> _in_func
    }
    _body >> out
}

func build_symbol_table(lines) {
    past(lines) ~> _lines
    [] >> _tmp_all
    F(_lines) { Gate now (!= "") >> _tmp_all }
    [] >> _funcs
    F(_tmp_all) {
        indexOf(str=now, sub="func ") ~> _fp
        Gate _fp (== 0) >> _funcs
        now >> _funcs
    }
    _funcs >> out
}

func classify_t0_line(line) {
    past(line) ~> _L
    indexOf(str=_L, sub="Gate ") ~> _gate
    0 >> _is_gate
    Gate _gate (== 0) >> _is_gate
    indexOf(str=_L, sub="F(") ~> _f
    0 >> _is_f
    Gate _f (== 0) >> _is_f
    indexOf(str=_L, sub="~>") ~> _til
    0 >> _is_til
    Gate _til (> -1) >> _is_til
    indexOf(str=_L, sub=">>") ~> _arr
    0 >> _is_arr
    Gate _arr (> -1) >> _is_arr
    _is_til * 2 >> _s2
    _is_f * 4 >> _s4
    _is_gate * 8 >> _s8
    _is_arr + _s2 >> _tmp
    _tmp + _s4 >> _tmp
    _tmp + _s8 >> out
}

func parse_assign(line) {
    past(line) ~> _L
    indexOf(str=_L, sub=">>") ~> _ap
    slice(str=_L, from=0, to=_ap) ~> _expr
    _ap + 2 >> _tp
    len(val=_L) ~> _ll
    slice(str=_L, from=_tp, to=_ll) ~> _target
    _trim_c(str=_expr) ~> _expr
    _trim_c(str=_target) ~> _target
    split(str=_expr, sep=" ") ~> _parts
    push(arr=_parts, val=_target) ~> _parts
    _parts >> out
}

func parse_tilde(line) {
    past(line) ~> _L
    indexOf(str=_L, sub="~>") ~> _tp
    slice(str=_L, from=0, to=_tp) ~> _call
    _tp + 2 >> _ts
    len(val=_L) ~> _ll
    slice(str=_L, from=_ts, to=_ll) ~> _target
    _trim_c(str=_call) ~> _call
    _trim_c(str=_target) ~> _target
    indexOf(str=_call, sub="(") ~> _lp
    slice(str=_call, from=0, to=_lp) ~> _fname
    _lp + 1 >> _as
    len(val=_call) ~> _cl
    _cl - 1 >> _ae
    slice(str=_call, from=_as, to=_ae) ~> _args
    split(str=_args, sep=", ") ~> _arglist
    [] >> _result
    push(arr=_result, val=_fname) ~> _result
    push(arr=_result, val=_target) ~> _result
    push(arr=_result, val=_arglist) ~> _result
    _result >> out
}

func parse_gate(line) {
    past(line) ~> _L
    indexOf(str=_L, sub="Gate ") ~> _gp
    5 >> _vs
    indexOf(str=_L, sub=" (") ~> _lp
    slice(str=_L, from=_vs, to=_lp) ~> _var
    _lp + 2 >> _ops
    indexOf(str=_L, sub=")") ~> _rp
    slice(str=_L, from=_ops, to=_rp) ~> _cond
    indexOf(str=_L, sub=">>") ~> _ap
    _ap + 2 >> _ts
    len(val=_L) ~> _ll
    slice(str=_L, from=_ts, to=_ll) ~> _target
    _trim_c(str=_var) ~> _var
    _trim_c(str=_cond) ~> _cond
    _trim_c(str=_target) ~> _target
    [] >> _result
    push(arr=_result, val=_var) ~> _result
    push(arr=_result, val=_cond) ~> _result
    push(arr=_result, val=_target) ~> _result
    _result >> out
}
