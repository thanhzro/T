[T-]

func shell(cmd) {
    past(cmd) ~> C
    exec(cmd=C) ~> out
}

func ls(path) {
    past(path) ~> P
    "ls " + P >> cmd
    exec(cmd=cmd) ~> raw
    split(str=raw, sep="\n") ~> parts
    pop(arr=parts) ~> out
}

func cat(path) {
    past(path) ~> P
    "cat " + P >> cmd
    exec(cmd=cmd) ~> out
}

func which(bin) {
    past(bin) ~> B
    "which " + B >> cmd
    exec(cmd=cmd) ~> out
}

func pwd() {
    exec(cmd="pwd") ~> out
}

func proc_count() {
    exec(cmd="ps aux | wc -l") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func env_list() {
    exec(cmd="env | head -20") ~> raw
    split(str=raw, sep="\n") ~> out
}
