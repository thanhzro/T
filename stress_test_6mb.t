[T-]
# Khai báo mảng 22.000 phần tử để chiếm dụng RAM
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

[T0]
past(data) ~> P1
# Chạy Fractal để ép VM cấp phát bộ nhớ cho tọa độ
F(P1) {
    Gate now (> 0) >> O1
}

[T+]
# Không show hết vì sẽ lag terminal, chỉ check xem nó có sống không
show shall(O1)
