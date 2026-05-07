[T-]
# Bơm mảng chuỗi liên tục để ngốn RAM nền
a = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
b = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
c = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
d = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
e = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
f = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
g = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
h = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
i = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]
j = ["stress_ram_vail_vail_vail", "test_6mb_test_6mb_test_6mb"]

[T0]
# Nạp dữ liệu vào tọa độ (mỗi tọa độ P là một slot RAM)
past(a) ~> P1
past(b) ~> P2
past(c) ~> P3
past(d) ~> P4
past(e) ~> P5
past(f) ~> P6
past(g) ~> P7
past(h) ~> P8
past(i) ~> P9
past(j) ~> P10

[T+]
# Dùng shall() để không bị lỗi !EMPTY_COORD
show shall(P1) as "Kiem tra RAM thanh cong: {}"
