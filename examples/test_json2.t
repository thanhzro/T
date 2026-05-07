[T-]
import "lib/basic/std.t"
import "lib/intermediate/json.t"
json = "{\"name\": \"Thanh\", \"score\": 95}"

[T0]
json_get(json=json, key="name") ~> O1
json_get(json=json, key="score") ~> O2

[T+]
show shall(O1, O2)
