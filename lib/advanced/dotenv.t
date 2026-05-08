[T-]

func env_load(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    split(str=raw, sep="\n") ~> lines
    F(lines) {
        Gate now (contains "=") >> has_eq
        isNumber(val=has_eq) ~> ok
        Gate ok (== 1) >> valid
        isNumber(val=valid) ~> v
        [] >> opts
        push(arr=opts, val="") ~> opts
        push(arr=opts, val=now) ~> opts
        get(arr=opts, idx=v) ~> now
    }
    lines >> out
}

func env_get_val(line) {
    past(line) ~> L
    split(str=L, sep="=") ~> parts
    get(arr=parts, idx=1) ~> out
}

func env_get_key(line) {
    past(line) ~> L
    split(str=L, sep="=") ~> parts
    get(arr=parts, idx=0) ~> out
}

func dotenv_read(path, key) {
    past(path) ~> P
    past(key) ~> K
    exec(cmd="grep ^" + K + "= " + P + " | cut -d= -f2") ~> raw
    trim(str=raw) ~> out
}
