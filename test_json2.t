[T-]
import "lib/basic/std.t"
import "lib/advanced/process.t"
import "lib/advanced/json2.t"

[T0]
jq_get(json="{"name":"Alice","age":30}", key="name") ~> O1
jq_get_num(json="{"name":"Alice","age":30}", key="age") ~> O2
jq_keys(json="{"name":"Alice","age":30}") ~> O3

[T+]
show shall(O1, O2, O3)
