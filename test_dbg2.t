[T-]
import "lib/basic/std.t"

[T0]
data = '{"a":1}'
"echo '" + data + "' | jq '.a'" >> cmd
exec(cmd=cmd) ~> O1

[T+]
show shall(O1)
