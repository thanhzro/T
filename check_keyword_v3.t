[T-]
arr input = [115, 104, 111, 119]

[T0]
past(input) ~> P1
F(P1) {
    # Nếu gặp 's', bơm 1 vào O1. 
    # Dùng += để nó giữ nguyên giá trị 1 kể cả khi 's' đã đi qua
    Gate now (== 115) {
        O1 + 1 >> O1
    }
    
    # Nếu O1 đã có tín hiệu (>= 1) và giờ gặp 'h' (104)
    Gate O1 (>= 1) {
        Gate now (== 104) >> O2
    }
}

[T+]
show O2
