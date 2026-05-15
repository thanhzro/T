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
