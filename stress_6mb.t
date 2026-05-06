[T-]
# Tạo 10 mảng, mỗi mảng 200 phần tử = 2000 tọa độ TValue
# Mỗi TValue kèm string 256 bytes sẽ ngốn RAM thật
a = ["stress test ram"] * 200
b = ["stress test ram"] * 200
c = ["stress test ram"] * 200
d = ["stress test ram"] * 200
e = ["stress test ram"] * 200

[T0]
# Nạp chồng dữ liệu vào tọa độ
past(a) ~> P1
past(b) ~> P2
past(c) ~> P3
past(d) ~> P4
past(e) ~> P5

[T+]
show shall(P1)
