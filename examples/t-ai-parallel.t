[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="bash _parallel_test.sh") ~> results

[T+]
show shall(results)
