[T-]

func cache_set(key, val) {
    past(key) ~> K
    past(val) ~> V
    write_file(path=K + ".cache", content=V) ~> out
}

func cache_get(key) {
    past(key) ~> K
    file_exists(path=K + ".cache") ~> ok
    Gate ok (== 1) >> has
    isNumber(val=has) ~> h
    [] >> opts
    push(arr=opts, val="") ~> opts
    exec(cmd="cat " + K + ".cache") ~> raw
    trim(str=raw) ~> val
    push(arr=opts, val=val) ~> opts
    get(arr=opts, idx=h) ~> out
}

func cache_del(key) {
    past(key) ~> K
    file_delete(path=K + ".cache") ~> out
}

func cache_has(key) {
    past(key) ~> K
    file_exists(path=K + ".cache") ~> out
}
