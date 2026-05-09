[T-]

func levenshtein(a, b) {
    past(a) ~> A
    past(b) ~> B
    shell_escape(str=A) ~> ea
    shell_escape(str=B) ~> eb
    "python3 -c \"import sys;a=" + ea + ";b=" + eb + ";print(sum(1 for i,j in zip(a,b) if i!=j)+abs(len(a)-len(b)))\"" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func similarity(a, b) {
    past(a) ~> A
    past(b) ~> B
    levenshtein(a=A, b=B) ~> dist
    len(val=A) ~> la
    len(val=B) ~> lb
    max2(a=la, b=lb) ~> mx
    dist / mx >> ratio
    1 - ratio >> out
}

func str_repeat(str, n) {
    past(str) ~> S
    past(n) ~> N
    floor(val=N) ~> ni
    range(n=ni) ~> idx
    F(idx) { S >> now }
    join(arr=idx, sep="") ~> out
}

func str_chunk(str, size) {
    past(str) ~> S
    past(size) ~> SZ
    len(val=S) ~> n
    n / SZ >> chunks_f
    ceil(val=chunks_f) ~> chunks
    range(n=chunks) ~> idx
    F(idx) {
        now * SZ >> from
        from + SZ >> to
        slice(str=S, from=from, to=to) ~> now
    }
    idx >> out
}
