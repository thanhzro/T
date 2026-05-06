[T-]
# Khai báo một mảng tĩnh chứa 2 triệu số 0 để chiếm chỗ
big_storage = [0] * 2000000 

[T0]
# Đơn giản là nạp nó vào một tọa độ
past(big_storage) ~> P1
F(P1) {
    now >> O1
}

[T+]
show shall(O1)
