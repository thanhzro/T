[T-]
import "lib/basic/std.t"
msg = "hello world"

[T0]
chars(str=msg) ~> O1
F(O1) {
    idx % 2 >> rem
    Gate rem (== 0) >> now
    upper(str=now) ~> now
}
join(arr=O1, sep="") ~> O2

[T+]
show shall(O2)
