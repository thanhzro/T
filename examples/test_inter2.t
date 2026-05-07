[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/json.t"
nested = [[1,2],[3,4],[5]]
json = "{\"tags\": [\"A\",\"B\",\"C\"]}"

[T0]
flatten_deep(arr=nested) ~> O1
json_array(json=json, key="tags") ~> O2

[T+]
show shall(O1, O2)
