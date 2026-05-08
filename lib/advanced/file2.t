[T-]

func file_read(path) {
    past(path) ~> P
    "cat " + P >> cmd
    exec(cmd=cmd) ~> out
}

func file_write(path, content) {
    past(path) ~> P
    past(content) ~> C
    "echo " + C + " > " + P >> cmd
    exec(cmd=cmd) ~> out
}

func file_append(path, content) {
    past(path) ~> P
    past(content) ~> C
    "echo " + C + " >> " + P >> cmd
    exec(cmd=cmd) ~> out
}

func dir_list(path) {
    past(path) ~> P
    "ls " + P >> cmd
    exec(cmd=cmd) ~> raw
    split(str=raw, sep="\n") ~> out
}

func dir_exists(path) {
    past(path) ~> P
    "test -d " + P + " && echo 1 || echo 0" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> t
    toNumber(val=t) ~> out
}

func file_lines(path) {
    past(path) ~> P
    file_read(path=P) ~> raw
    split(str=raw, sep="\n") ~> out
}

func file_count_lines(path) {
    past(path) ~> P
    "wc -l " + P >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> t
    split(str=t, sep=" ") ~> parts
    first(arr=parts) ~> n_str
    toNumber(val=n_str) ~> out
}

func file_append(path, content) {
    past(path) ~> P
    past(content) ~> C
    shell_escape(str=C) ~> esc
    exec(cmd="echo " + esc + " >> " + P) ~> out
}

func file_lines(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    split(str=raw, sep="\n") ~> parts
    pop(arr=parts) ~> out
}

func file_copy(src, dst) {
    past(src) ~> S
    past(dst) ~> D
    exec(cmd="cp " + S + " " + D) ~> out
}

func file_move(src, dst) {
    past(src) ~> S
    past(dst) ~> D
    exec(cmd="mv " + S + " " + D) ~> out
}
