[T-]
func tokenize_line(line) {
    past(line) ~> _L
    split(str=_L, sep=" ") ~> _parts
    [] >> _toks
    F(_parts) { Gate now (!= "") >> _toks }
    _toks >> out
}

func tokenize(src) {
    past(src) ~> _src
    split(str=_src, sep="\n") ~> _lines
    [] >> _all
    F(_lines) {
        tokenize_line(line=now) ~> _toks
        push(arr=_all, val=_toks) ~> _all
    }
    _all >> out
}
