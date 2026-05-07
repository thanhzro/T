[T-]
import "lib/std.t"
msg = "hello"
shift = 3

[T0]
upper(str=msg) ~> O1
chars(str=O1) ~> O2
F(O2) {
    charCode(str=now) ~> O3
    O3 - 65 >> O4
    O4 + shift >> O5
    O5 % 26 >> O6
    O6 + 65 >> O7
    fromChar(val=O7) ~> now
}
join(arr=O2, sep="") ~> O8

[T+]
show shall(O8)
