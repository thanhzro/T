[T-]
import "lib/basic/std.t"
data = "{"name":"Alice","age":30}"

[T0]
regex_find(str=data, pat="\"name\":\"([A-Za-z]+)\"") ~> O1

[T+]
show shall(O1)
