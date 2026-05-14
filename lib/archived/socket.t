[T-]

func tcp_send(host, port, msg) {
    past(host) ~> H
    past(port) ~> P
    past(msg) ~> M
    toString(val=P) ~> ps
    shell_escape(str=M) ~> em
    write_file(path="sock_tmp.sh", content="echo " + em + " | nc -w 3 " + H + " " + ps) ~> tmp
    exec(cmd="sh sock_tmp.sh") ~> out
}

func tcp_check(host, port) {
    past(host) ~> H
    past(port) ~> P
    toString(val=P) ~> ps
    exec(cmd="nc -zw 3 " + H + " " + ps + " && echo 1 || echo 0") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func http_download(url, path) {
    past(url) ~> U
    past(path) ~> P
    exec(cmd="curl -sL " + U + " -o " + P) ~> out
}

func ftp_list(host, user, pass) {
    past(host) ~> H
    past(user) ~> U
    past(pass) ~> PW
    exec(cmd="curl -s ftp://" + U + ":" + PW + "@" + H + "/") ~> out
}
