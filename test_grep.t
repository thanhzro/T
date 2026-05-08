[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo hello123 | grep -oP '[0-9]+'") ~> O1

[T+]
show shall(O1)
