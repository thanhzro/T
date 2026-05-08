[T-]

func queue_new() {
    [] >> out
}

func queue_push(q, val) {
    past(q) ~> Q
    past(val) ~> V
    push(arr=Q, val=V) ~> out
}

func queue_pop(q) {
    past(q) ~> Q
    get(arr=Q, idx=0) ~> out
}

func queue_dequeue(q) {
    past(q) ~> Q
    len(val=Q) ~> n
    Gate n (> 0) >> has
    isNumber(val=has) ~> ok
    slice_arr(arr=Q, from=1, to=n) ~> out
}

func stack_push(s, val) {
    past(s) ~> S
    past(val) ~> V
    push(arr=S, val=V) ~> out
}

func stack_pop(s) {
    past(s) ~> S
    len(val=S) ~> n
    n - 1 >> last
    get(arr=S, idx=last) ~> out
}

func stack_peek(s) {
    past(s) ~> S
    last(arr=S) ~> out
}

func stack_dequeue(s) {
    past(s) ~> S
    len(val=S) ~> n
    n - 1 >> last
    slice_arr(arr=S, from=0, to=last) ~> out
}

func is_empty_col(col) {
    past(col) ~> C
    len(val=C) ~> n
    Gate n (== 0) >> O1
    isNumber(val=O1) ~> out
}
