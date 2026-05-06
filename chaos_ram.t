[T-]
# Nạp file 20MB vào tọa độ P1
read("big_data.txt") ~> P1

[T0]
# Chạy Fractal qua 20 triệu con số
past(P1) ~> P2
F(P2) {
    # Ép nó phải xử lý liên tục
    Gate now (> 0) >> O1
}

[T+]
show shall(O1)
