[T-]
read("hocsinh.txt") ~> P1

[T0]
past(P1) ~> P2
F(P2) { Gate now (>= 50) >> O1 }
avg(arr=P1) ~> O2
sum(arr=P1) ~> O3

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
write("ketqua.txt") shall(O1)
