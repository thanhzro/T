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
