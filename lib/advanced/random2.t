[T-]

func uuid() {
    exec(cmd="cat /proc/sys/kernel/random/uuid") ~> raw
    trim(str=raw) ~> out
}

func random_str(n) {
    past(n) ~> N
    toString(val=N) ~> ns
    exec(cmd="cat /dev/urandom | tr -dc a-z0-9 | head -c " + ns) ~> out
}

func random_hex(n) {
    past(n) ~> N
    toString(val=N) ~> ns
    exec(cmd="cat /dev/urandom | xxd -p | tr -d '\n' | head -c " + ns) ~> out
}

func coin_flip() {
    rand_int(min=0, max=1) ~> out
}

func dice(sides) {
    past(sides) ~> S
    rand_int(min=1, max=S) ~> out
}

func rand_float(lo, hi) {
    past(lo) ~> Lo
    past(hi) ~> Hi
    rand_int(min=0, max=10000) ~> ri
    ri / 10000 >> r
    Hi - Lo >> range
    r * range >> scaled
    scaled + Lo >> out
}

func rand_choice(arr) {
    past(arr) ~> A
    len(val=A) ~> n
    n - 1 >> n1
    rand_int(min=0, max=n1) ~> idx
    get(arr=A, idx=idx) ~> out
}

func rand_sample(arr, n) {
    past(arr) ~> A
    past(n) ~> N
    sort(arr=A) ~> sorted
    floor(val=N) ~> ni
    slice_arr(arr=sorted, from=0, to=ni) ~> out
}
