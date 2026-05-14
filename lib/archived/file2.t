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


func file_count_lines(path) {
    past(path) ~> P
    "wc -l " + P >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> t
    split(str=t, sep=" ") ~> parts
    first(arr=parts) ~> n_str
    toNumber(val=n_str) ~> out
}


func file_lines(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    exec(cmd="grep . " + P + " | tr -s \"\n\"") ~> raw2
    split(str=raw2, sep="\n") ~> parts
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

func file_ext(path) {
    past(path) ~> P
    split(str=P, sep=".") ~> parts
    len(val=parts) ~> n
    n - 1 >> last
    get(arr=parts, idx=last) ~> out
}

func file_basename(path) {
    past(path) ~> P
    split(str=P, sep="/") ~> parts
    len(val=parts) ~> n
    n - 1 >> last
    get(arr=parts, idx=last) ~> out
}

func file_dir(path) {
    past(path) ~> P
    split(str=P, sep="/") ~> parts
    len(val=parts) ~> n
    n - 1 >> last
    slice_arr(arr=parts, from=0, to=last) ~> dir_parts
    join(arr=dir_parts, sep="/") ~> out
}

func file_read_lines(path) {
    past(path) ~> P
    exec(cmd="cat " + P) ~> raw
    trim(str=raw) ~> clean
    split(str=clean, sep="\n") ~> out
}
