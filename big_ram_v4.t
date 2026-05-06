[T-]
# Copy-paste chuỗi trực tiếp, đéo dùng biến 's' nữa
a = ["stress_6mb_vail_vail_vail_vail_vail_vail_vail", "stress_6mb_vail_vail_vail_vail_vail_vail_vail"]
b = ["stress_6mb_vail_vail_vail_vail_vail_vail_vail", "stress_6mb_vail_vail_vail_vail_vail_vail_vail"]
c = ["stress_6mb_vail_vail_vail_vail_vail_vail_vail", "stress_6mb_vail_vail_vail_vail_vail_vail_vail"]
d = ["stress_6mb_vail_vail_vail_vail_vail_vail_vail", "stress_6mb_vail_vail_vail_vail_vail_vail_vail"]
e = ["stress_6mb_vail_vail_vail_vail_vail_vail_vail", "stress_6mb_vail_vail_vail_vail_vail_vail_vail"]

[T0]
past(a) ~> P1
past(b) ~> P2
past(c) ~> P3
past(d) ~> P4
past(e) ~> P5

[T+]
show shall(P1)
