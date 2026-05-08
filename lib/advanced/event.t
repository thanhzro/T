[T-]

func event_emit(name, data) {
    past(name) ~> N
    past(data) ~> D
    timestamp() ~> ts
    toString(val=ts) ~> tss
    tss + "|" + N + "|" + D >> line
    shell_escape(str=line) ~> esc
    exec(cmd="echo " + esc + " >> events.log") ~> out
}

func event_log() {
    file_exists(path="events.log") ~> ok
    Gate ok (== 1) >> has
    isNumber(val=has) ~> h
    [] >> opts
    push(arr=opts, val="") ~> opts
    exec(cmd="cat events.log") ~> raw
    push(arr=opts, val=raw) ~> opts
    get(arr=opts, idx=h) ~> out
}

func event_clear() {
    file_delete(path="events.log") ~> out
}

func event_count() {
    file_exists(path="events.log") ~> ok
    Gate ok (== 1) >> has
    isNumber(val=has) ~> h
    [] >> opts
    push(arr=opts, val=0) ~> opts
    exec(cmd="wc -l < events.log") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> cnt
    push(arr=opts, val=cnt) ~> opts
    get(arr=opts, idx=h) ~> out
}
