[T-]
func dot_product(a, b) {
    past(a) ~> _a
    past(b) ~> _b
    len(val=_a) ~> _n
    range(n=_n) ~> _idx
    0 >> _sum
    F(_idx) {
        get(arr=_a, idx=idx) ~> _ax
        get(arr=_b, idx=idx) ~> _bx
        _ax * _bx >> _prod
        _sum + _prod >> _sum
    }
    _sum >> out
}

func vec_add(a, b) {
    past(a) ~> _a
    past(b) ~> _b
    len(val=_a) ~> _n
    range(n=_n) ~> _idx
    [] >> _result
    F(_idx) {
        get(arr=_a, idx=idx) ~> _ax
        get(arr=_b, idx=idx) ~> _bx
        _ax + _bx >> _s
        push(arr=_result, val=_s) ~> _result
    }
    _result >> out
}

func vec_scale(a, s) {
    past(a) ~> _a
    past(s) ~> _s
    [] >> _result
    F(_a) {
        now * _s >> _v
        push(arr=_result, val=_v) ~> _result
    }
    _result >> out
}

func sigmoid(x) {
    past(x) ~> _x
    0 - _x >> _negx
    exp(val=_negx) ~> _ex
    1 + _ex >> _denom
    1 / _denom >> out
}

func relu(x) {
    past(x) ~> _x
    0 >> _r
    Gate _x (> 0) >> _r
    _x * _r >> _pos
    0 - _x >> _negx
    Gate _negx (> 0) >> _r2
    0 >> _zero
    _r2 * _zero >> _n2
    _pos + _n2 >> out
}

func vec_sum(arr) {
    past(arr) ~> _a
    0 >> _s
    F(_a) {
        _s + now >> _s
    }
    _s >> out
}

func softmax(arr) {
    past(arr) ~> _a
    [] >> _exp_arr
    F(_a) {
        exp(val=now) ~> _e
        push(arr=_exp_arr, val=_e) ~> _exp_arr
    }
    vec_sum(arr=_exp_arr) ~> _sum
    [] >> _result
    F(_exp_arr) {
        now / _sum >> _p
        push(arr=_result, val=_p) ~> _result
    }
    _result >> out
}

func vec_mean(arr) {
    past(arr) ~> _a
    vec_sum(arr=_a) ~> _s
    len(val=_a) ~> _n
    _s / _n >> out
}

func layer_norm(arr) {
    past(arr) ~> _a
    vec_mean(arr=_a) ~> _mean
    [] >> _diffs
    F(_a) {
        now - _mean >> _d
        _d * _d >> _d2
        push(arr=_diffs, val=_d2) ~> _diffs
    }
    vec_mean(arr=_diffs) ~> _var
    0.00001 >> _eps
    _var + _eps >> _var_eps
    sqrt(val=_var_eps) ~> _std
    [] >> _result
    F(_a) {
        now - _mean >> _d
        _d / _std >> _n
        push(arr=_result, val=_n) ~> _result
    }
    _result >> out
}

func mat_vec_mul(mat, vec) {
    past(mat) ~> _m
    past(vec) ~> _v
    [] >> _result
    F(_m) {
        dot_product(a=now, b=_v) ~> _d
        push(arr=_result, val=_d) ~> _result
    }
    _result >> out
}

func attention(q, k, v) {
    past(q) ~> _q
    past(k) ~> _k
    past(v) ~> _v
    len(val=_q) ~> _d
    sqrt(val=_d) ~> _scale
    dot_product(a=_q, b=_k) ~> _score
    _score / _scale >> _scaled
    [] >> _scores
    push(arr=_scores, val=_scaled) ~> _scores
    softmax(arr=_scores) ~> _weights
    get(arr=_weights, idx=0) ~> _w
    vec_scale(a=_v, s=_w) ~> out
}

func linear(x, weights, bias) {
    past(x) ~> _x
    past(weights) ~> _w
    past(bias) ~> _b
    mat_vec_mul(mat=_w, vec=_x) ~> _out
    vec_add(a=_out, b=_b) ~> out
}

func ffn(x, w1, b1, w2, b2) {
    past(x) ~> _x
    past(w1) ~> _w1
    past(b1) ~> _b1
    past(w2) ~> _w2
    past(b2) ~> _b2
    linear(x=_x, weights=_w1, bias=_b1) ~> _h
    [] >> _h_relu
    F(_h) {
        relu(x=now) ~> _r
        push(arr=_h_relu, val=_r) ~> _h_relu
    }
    linear(x=_h_relu, weights=_w2, bias=_b2) ~> out
}

func load_weights(path) {
    past(path) ~> _p
    file_read(path=_p) ~> _raw
    split(str=_raw, sep=",") ~> _tokens
    [] >> _weights
    F(_tokens) {
        _trim_c(str=now) ~> _t
        toNumber(val=_t) ~> _w
        push(arr=_weights, val=_w) ~> _weights
    }
    _weights >> out
}

func multi_head_attention(q, k, v, num_heads) {
    past(q) ~> _q
    past(k) ~> _k
    past(v) ~> _v
    past(num_heads) ~> _h
    len(val=_q) ~> _d
    _d / _h >> _head_dim
    sqrt(val=_head_dim) ~> _scale
    dot_product(a=_q, b=_k) ~> _score
    _score / _scale >> _scaled
    [] >> _scores
    push(arr=_scores, val=_scaled) ~> _scores
    softmax(arr=_scores) ~> _weights
    get(arr=_weights, idx=0) ~> _w
    vec_scale(a=_v, s=_w) ~> out
}

func transformer_block(x, wq, wk, wv, w1, b1, w2, b2, num_heads) {
    past(x) ~> _x
    past(wq) ~> _wq
    past(wk) ~> _wk
    past(wv) ~> _wv
    past(w1) ~> _w1
    past(b1) ~> _b1
    past(w2) ~> _w2
    past(b2) ~> _b2
    past(num_heads) ~> _h
    mat_vec_mul(mat=_wq, vec=_x) ~> _q
    mat_vec_mul(mat=_wk, vec=_x) ~> _k
    mat_vec_mul(mat=_wv, vec=_x) ~> _v
    multi_head_attention(q=_q, k=_k, v=_v, num_heads=_h) ~> _attn
    vec_add(a=_x, b=_attn) ~> _res1
    layer_norm(arr=_res1) ~> _norm1
    ffn(x=_norm1, w1=_w1, b1=_b1, w2=_w2, b2=_b2) ~> _ff
    vec_add(a=_norm1, b=_ff) ~> _res2
    layer_norm(arr=_res2) ~> out
}

func char_tokenize(text) {
    past(text) ~> _t
    chars(str=_t) ~> out
}

func char_to_id(c) {
    past(c) ~> _c
    charCode(str=_c) ~> out
}

func embed(token_id, embedding_table) {
    past(token_id) ~> _id
    past(embedding_table) ~> _emb
    get(arr=_emb, idx=_id) ~> out
}

func lm_forward(tokens, emb_table, wq, wk, wv, w1, b1, w2, b2, num_heads) {
    past(tokens) ~> _toks
    past(emb_table) ~> _emb
    past(wq) ~> _wq
    past(wk) ~> _wk
    past(wv) ~> _wv
    past(w1) ~> _w1
    past(b1) ~> _b1
    past(w2) ~> _w2
    past(b2) ~> _b2
    past(num_heads) ~> _h
    get(arr=_toks, idx=0) ~> _last_tok
    get(arr=_emb, idx=_last_tok) ~> _x
    transformer_block(x=_x, wq=_wq, wk=_wk, wv=_wv, w1=_w1, b1=_b1, w2=_w2, b2=_b2, num_heads=_h) ~> _hidden
    softmax(arr=_hidden) ~> _logits
    len(val=_logits) ~> _n
    0 >> _max_val
    0 >> _max_idx
    0 >> _i
    F(_logits) {
        _i + 1 >> _i
    }
    _logits >> out
}

func mse_loss(pred, target) {
    past(pred) ~> _p
    past(target) ~> _t
    vec_sub(a=_p, b=_t) ~> _diff
    dot_product(a=_diff, b=_diff) ~> _sq
    len(val=_p) ~> _n
    _sq / _n >> out
}

func sigmoid_grad(x) {
    past(x) ~> _x
    sigmoid(x=_x) ~> _s
    1 - _s >> _one_minus
    _s * _one_minus >> out
}

func vec_sub(a, b) {
    past(a) ~> _a
    past(b) ~> _b
    len(val=_a) ~> _n
    range(n=_n) ~> _idx
    [] >> _result
    F(_idx) {
        get(arr=_a, idx=idx) ~> _ax
        get(arr=_b, idx=idx) ~> _bx
        _ax - _bx >> _d
        push(arr=_result, val=_d) ~> _result
    }
    _result >> out
}

func linear_grad(x, grad_out, weights) {
    past(x) ~> _x
    past(grad_out) ~> _g
    past(weights) ~> _w
    mat_vec_mul(mat=_w, vec=_g) ~> grad_input
    grad_input >> out
}

func sgd_update(weights, grad, lr) {
    past(weights) ~> _w
    past(grad) ~> _g
    past(lr) ~> _lr
    vec_scale(a=_g, s=_lr) ~> _delta
    [] >> _new_w
    F(_w) {
        get(arr=_delta, idx=idx) ~> _d
        now - _d >> _nw
        push(arr=_new_w, val=_nw) ~> _new_w
    }
    _new_w >> out
}

func train_step(x, target, weights, bias, lr) {
    past(x) ~> _x
    past(target) ~> _t
    past(weights) ~> _w
    past(bias) ~> _b
    past(lr) ~> _lr
    linear(x=_x, weights=_w, bias=_b) ~> _pred
    mse_loss(pred=_pred, target=_t) ~> _loss
    vec_sub(a=_pred, b=_t) ~> _grad_out
    [] >> _new_w
    F(_w) {
        get(arr=_grad_out, idx=idx) ~> _gi
        vec_scale(a=now, s=_gi) ~> _row_grad
        sgd_update(weights=now, grad=_row_grad, lr=_lr) ~> _new_row
        push(arr=_new_w, val=_new_row) ~> _new_w
    }
    _new_w >> out
}

func mat_update_3(mat, grad, lr) {
    past(mat) ~> _m
    past(grad) ~> _g
    past(lr) ~> _lr
    get(arr=_m, idx=0) ~> _r0
    get(arr=_m, idx=1) ~> _r1
    get(arr=_m, idx=2) ~> _r2
    get(arr=_g, idx=0) ~> _g0
    get(arr=_g, idx=1) ~> _g1
    get(arr=_g, idx=2) ~> _g2
    vec_scale(a=_r0, s=_g0) ~> _rg0
    vec_scale(a=_r1, s=_g1) ~> _rg1
    vec_scale(a=_r2, s=_g2) ~> _rg2
    sgd_update(weights=_r0, grad=_rg0, lr=_lr) ~> _nr0
    sgd_update(weights=_r1, grad=_rg1, lr=_lr) ~> _nr1
    sgd_update(weights=_r2, grad=_rg2, lr=_lr) ~> _nr2
    [] >> _new_m
    push(arr=_new_m, val=_nr0) ~> _new_m
    push(arr=_new_m, val=_nr1) ~> _new_m
    push(arr=_new_m, val=_nr2) ~> _new_m
    _new_m >> out
}

func greedy_sample(logits) {
    past(logits) ~> _l
    len(val=_l) ~> _n
    0 >> _max_val
    0 >> _max_idx
    get(arr=_l, idx=0) ~> _max_val
    range(n=_n) ~> _r
    F(_r) {
        get(arr=_l, idx=idx) ~> _v
        0 >> _is_max
        Gate _v (> _max_val) >> _is_max
        _is_max * idx >> _new_idx
        _max_val + _is_max >> _max_val
    }
    _max_idx >> out
}

func argmax4(arr) {
    past(arr) ~> _a
    get(arr=_a, idx=0) ~> _v0
    get(arr=_a, idx=1) ~> _v1
    get(arr=_a, idx=2) ~> _v2
    get(arr=_a, idx=3) ~> _v3
    _v0 >> _best_val
    0 >> _is1
    Gate _v1 (> _best_val) >> _is1
    _best_val + _is1 >> _best_val
    0 >> _is2
    Gate _v2 (> _best_val) >> _is2
    _best_val + _is2 >> _best_val
    0 >> _is3
    Gate _v3 (> _best_val) >> _is3
    0 >> _not1
    1 - _is1 >> _not1
    0 >> _not2
    1 - _is2 >> _not2
    0 >> _not3
    1 - _is3 >> _not3
    _not1 * _not2 >> _is0
    _is0 * _not3 >> _is0
    _is0 * 0 >> _s0
    _is1 * 1 >> _s1
    _is2 * 2 >> _s2
    _is3 * 3 >> _s3
    _s0 + _s1 >> _out
    _out + _s2 >> _out
    _out + _s3 >> out
}

func mat_update_4(mat, grad, x, lr) {
    past(mat) ~> _m
    past(grad) ~> _g
    past(x) ~> _x
    past(lr) ~> _lr
    get(arr=_m, idx=0) ~> _r0
    get(arr=_m, idx=1) ~> _r1
    get(arr=_m, idx=2) ~> _r2
    get(arr=_m, idx=3) ~> _r3
    get(arr=_g, idx=0) ~> _g0
    get(arr=_g, idx=1) ~> _g1
    get(arr=_g, idx=2) ~> _g2
    get(arr=_g, idx=3) ~> _g3
    vec_scale(a=_x, s=_g0) ~> _rg0
    vec_scale(a=_x, s=_g1) ~> _rg1
    vec_scale(a=_x, s=_g2) ~> _rg2
    vec_scale(a=_x, s=_g3) ~> _rg3
    sgd_update(weights=_r0, grad=_rg0, lr=_lr) ~> _nr0
    sgd_update(weights=_r1, grad=_rg1, lr=_lr) ~> _nr1
    sgd_update(weights=_r2, grad=_rg2, lr=_lr) ~> _nr2
    sgd_update(weights=_r3, grad=_rg3, lr=_lr) ~> _nr3
    [] >> _new_m
    push(arr=_new_m, val=_nr0) ~> _new_m
    push(arr=_new_m, val=_nr1) ~> _new_m
    push(arr=_new_m, val=_nr2) ~> _new_m
    push(arr=_new_m, val=_nr3) ~> _new_m
    _new_m >> out
}
