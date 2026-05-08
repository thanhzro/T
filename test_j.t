[T-]
import "lib/basic/std.t"
import "lib/intermediate/json.t"
data = "{"name":"Alice","age":30}"

[T0]
json_get(json=data, key="name") ~> O1

[T+]
show shall(O1)
