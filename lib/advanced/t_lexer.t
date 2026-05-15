[T-]
func tokenize_line(line) {
    past(line) ~> _L
    split(str=_L, sep=" ") ~> _parts
    [] >> _toks
    F(_parts) {
        push(arr=_toks, val=now) ~> _toks
    }
    [] >> _filtered
    F(_toks) { Gate now (!= "") >> _filtered }
    _filtered >> out
}
