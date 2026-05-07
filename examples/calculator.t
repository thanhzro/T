[T-]
import "lib/basic/std.t"
ask a = "Nhap so a: "
ask op = "Phep tinh (+,-,*,/): "
ask b = "Nhap so b: "

[T0]
toNumber(val=a) ~> na
toNumber(val=b) ~> nb
na + nb >> cong
na - nb >> tru
na * nb >> nhan
na / nb >> chia
Gate op (== "+") >> g1
Gate op (== "-") >> g2
Gate op (== "*") >> g3
Gate op (== "/") >> g4

[T+]
show shall(g1) as "{a} + {b} = {cong}"
show shall(g2) as "{a} - {b} = {tru}"
show shall(g3) as "{a} * {b} = {nhan}"
show shall(g4) as "{a} / {b} = {chia}"
