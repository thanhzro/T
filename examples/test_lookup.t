[T-]
import "lib/basic/std.t"
read("hocsinh.csv") ~> P1
ask ten = "Nhap ten: "

[T0]
lower(str=ten) ~> tenlow
F(P1) {
    split(str=now, sep=",") ~> parts
    get(arr=parts, idx=0) ~> name
    lower(str=name) ~> namelow
    Gate namelow (== tenlow) >> O1
}
first(arr=O1) ~> matched
split(str=matched, sep=",") ~> parts
get(arr=parts, idx=1) ~> diem

[T+]
show shall(diem) as "Diem cua {ten}: {}"
