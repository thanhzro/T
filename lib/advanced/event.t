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
    0 >> h
    Gate ok (== 1) >> h
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
    0 >> h
    Gate ok (== 1) >> h
    [] >> opts
    push(arr=opts, val=0) ~> opts
    exec(cmd="wc -l < events.log") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> cnt
    push(arr=opts, val=cnt) ~> opts
    get(arr=opts, idx=h) ~> out
}


func event_last(log_path) {
    past(log_path) ~> P
    exec(cmd="tail -1 " + P + " 2>/dev/null") ~> raw
    trim(str=raw) ~> out
}

func event_search(log_path, keyword) {
    past(log_path) ~> P
    past(keyword) ~> K
    exec(cmd="grep " + K + " " + P + " 2>/dev/null | wc -l") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}
