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
