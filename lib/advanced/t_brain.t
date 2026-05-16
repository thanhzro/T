[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"

func char_to_vec(c, emb_w, emb_h) {
    past(c) ~> _c
    past(emb_w) ~> _ew
    past(emb_h) ~> _eh
    charCode(str=_c) ~> _id
    _id * _eh >> _offset
    [] >> _vec
    range(n=_eh) ~> _r
    F(_r) {
        get(arr=_ew, idx=idx) ~> _e
        push(arr=_vec, val=_e) ~> _vec
    }
    _vec >> out
}

func generate(prompt, weights, bias, max_len) {
    past(prompt) ~> _p
    past(weights) ~> _w
    past(bias) ~> _b
    past(max_len) ~> _ml
    chars(str=_p) ~> _chars
    get(arr=_chars, idx=0) ~> _last_char
    charCode(str=_last_char) ~> _last_id
    _last_id >> out
}
