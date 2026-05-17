[T-]
import "lib/basic/std.t"
val = "test_data"
tg2 = "t2.t"
[T0]
fat_arrow(data=val, tgt=tg2) ~> result
[T+]
show shall(result)
