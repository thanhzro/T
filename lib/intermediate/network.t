[T-]

func http_fetch(url) {
    past(url) ~> U
    http_get(url=U) ~> out
}

func http_send(url, data) {
    past(url) ~> U
    past(data) ~> D
    http_post(url=U, body=D) ~> out
}

func fetch_json(url, key) {
    past(url) ~> U
    past(key) ~> K
    http_get(url=U) ~> resp
    json_get(json=resp, key=K) ~> out
}
