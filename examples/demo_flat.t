[T-]
data = [[[[10, 60], [20, 70]], [[30, 80], [40, 90]]]]
[T0]
F(data) {
F(now) {
F(now) {
F(now) { Gate now (> 50) >> clean }
sum(arr=clean) ~> s
O1 + s >> O1
}
}
}
[T+]
show shall(O1)
