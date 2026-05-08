[T-]

func download(url, path) {
    past(url) ~> U
    past(path) ~> P
    "curl -sL " + U + " -o " + P >> cmd
    exec(cmd=cmd) ~> out
}

func download_text(url) {
    past(url) ~> U
    "curl -sL " + U >> cmd
    exec(cmd=cmd) ~> out
}

func wget(url, path) {
    past(url) ~> U
    past(path) ~> P
    "wget -q " + U + " -O " + P >> cmd
    exec(cmd=cmd) ~> out
}

func http_status(url) {
    past(url) ~> U
    write_file(path="status_cmd.sh", content="curl -sI " + U + " | head -1 | cut -d' ' -f2") ~> tmp
    exec(cmd="sh status_cmd.sh") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func http_headers(url) {
    past(url) ~> U
    "curl -sI " + U >> cmd
    exec(cmd=cmd) ~> out
}
