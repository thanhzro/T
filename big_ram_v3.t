[T-]
# Dùng chuỗi dài để tận dụng dòng 29 (256 bytes mỗi slot)
s = ["vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail_vail"]
a1 = [s, s, s, s, s, s, s, s, s, s]
a2 = [s, s, s, s, s, s, s, s, s, s]
a3 = [s, s, s, s, s, s, s, s, s, s]
a4 = [s, s, s, s, s, s, s, s, s, s]
a5 = [s, s, s, s, s, s, s, s, s, s]
a6 = [s, s, s, s, s, s, s, s, s, s]
a7 = [s, s, s, s, s, s, s, s, s, s]
a8 = [s, s, s, s, s, s, s, s, s, s]
a9 = [s, s, s, s, s, s, s, s, s, s]

[T0]
# Nạp 9 biến này vào 9 tọa độ khác nhau
past(a1) ~> P1
past(a2) ~> P2
past(a3) ~> P3
past(a4) ~> P4
past(a5) ~> P5
past(a6) ~> P6
past(a7) ~> P7
past(a8) ~> P8
past(a9) ~> P9

[T+]
show shall(P1)
