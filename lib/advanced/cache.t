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

func cache_size() {
    exec(cmd="cat t_cache.json 2>/dev/null | grep -c ':' || echo 0") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func cache_keys() {
    exec(cmd="cat t_cache.json 2>/dev/null | grep -oP '"[^"]+":' | tr -d '":' ") ~> raw
    trim(str=raw) ~> out
}
