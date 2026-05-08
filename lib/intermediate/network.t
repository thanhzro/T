[T-]

func get(url) {
    past(url) ~> U
    http_get(url=U) ~> out
}

func post(url, data) {
    past(url) ~> U
    past(data) ~> D
    http_post(url=U, data=D) ~> out
}

func get_json(url, key) {
    past(url) ~> U
    past(key) ~> K
    http_get(url=U) ~> resp
    json_get(json=resp, key=K) ~> out
}
