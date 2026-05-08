[T-]


func file_exists(path) {
    past(path) ~> P
    "test -f " + P + " && echo 1 || echo 0" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func file_size(path) {
    past(path) ~> P
    "wc -c < " + P >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func file_delete(path) {
    past(path) ~> P
    exec(cmd="rm -f " + P) ~> out
}

func http_get(url) {
    past(url) ~> U
    "curl -s " + U >> cmd
    exec(cmd=cmd) ~> out
}

func http_post(url, body) {
    past(url) ~> U
    past(body) ~> B
    shell_escape(str=B) ~> esc
    "curl -s -X POST -d " + esc + " " + U >> cmd
    exec(cmd=cmd) ~> out
}

func md5(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    "printf %s " + esc + " | md5sum | cut -d' ' -f1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}

func sha256(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    "printf %s " + esc + " | sha256sum | cut -d' ' -f1" >> cmd
    exec(cmd=cmd) ~> raw
    trim(str=raw) ~> out
}
