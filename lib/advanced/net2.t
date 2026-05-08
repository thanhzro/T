[T-]
import "lib/basic/std.t"

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

func ping(url) {
    past(url) ~> U
    http_get(url=U) ~> res
    len(val=res) ~> n
    Gate n (> 0) >> O1
    isNumber(val=O1) ~> out
}
