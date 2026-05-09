[T-]

func get_json(url) {
    past(url) ~> U
    http_get(url=U) ~> out
}

func post_json(url, body) {
    past(url) ~> U
    past(body) ~> B
    http_post(url=U, body=B) ~> out
}

func fetch(url) {
    past(url) ~> U
    http_get(url=U) ~> raw
    len(val=raw) ~> size
    raw >> out
}

func api_get(base, path) {
    past(base) ~> B
    past(path) ~> P
    B + P >> url
    http_get(url=url) ~> out
}

func api_post(base, path, body) {
    past(base) ~> B
    past(path) ~> P
    past(body) ~> Body
    B + P >> url
    http_post(url=url, body=Body) ~> out
}


func ping(host) {
    past(host) ~> H
    exec(cmd="ping -c 1 -W 2 " + H + " > /dev/null 2>&1 && echo 1 || echo 0") ~> raw
    trim(str=raw) ~> n
    toNumber(val=n) ~> out
}

func dns_lookup(host) {
    past(host) ~> H
    exec(cmd="nslookup " + H + " | grep Address | tail -1 | awk '{print $2}'") ~> raw
    trim(str=raw) ~> out
}

func url_encode_str(str) {
    past(str) ~> S
    shell_escape(str=S) ~> esc
    write_file(path="url_tmp.sh", content="printf %s " + esc + " | python3 -c 'import sys,urllib.parse; print(urllib.parse.quote(sys.stdin.read()))'") ~> tmp
    exec(cmd="sh url_tmp.sh") ~> raw
    trim(str=raw) ~> out
}

func curl_post_json(url, json) {
    past(url) ~> U
    past(json) ~> J
    write_file(path="post_data.json", content=J) ~> tmp
    exec(cmd="curl -s -X POST -H Content-Type:application/json -d @post_data.json " + U) ~> out
}
