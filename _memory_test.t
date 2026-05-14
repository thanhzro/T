[T-]
import "lib/basic/std.t"
[T0]
past("_memory.txt") ~> prev_str
toNumber(val=prev_str) ~> prev
prev + 1 >> current
[T+]
show shall(current)
write("_memory.txt") shall(current)
