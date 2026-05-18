[T-]
import "lib/basic/std.t"
s1 = "hello world"
s2 = "has -> arrow"
s3 = "has vm->chunk->code inside"
[T0]
len(val=s1) ~> r1
len(val=s2) ~> r2
len(val=s3) ~> r3
[T+]
show shall(r1)
show shall(r2)
show shall(r3)
