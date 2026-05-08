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
