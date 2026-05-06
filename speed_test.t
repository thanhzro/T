[T-]
# Khai báo mảng thủ công, không dùng dấu nhân *
data = [1, 1, 1, 1, 1]

[T0]
past(data) ~> P1
F(P1) {
    # Kiểm tra đơn giản nhất
    Gate now (== 1) >> O1
}

[T+]
show shall(O1)
