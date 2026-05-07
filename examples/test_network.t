[T-]

[T0]
http_get(url="https://httpbin.org/get") ~> O1
len(val=O1) ~> O2

[T+]
show shall(O2)
