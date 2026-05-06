[T-]
m = [115, 104, 111, 119]

[T0]
past(m) ~> P1
F(P1) {
    # Nếu gặp 's', nạp 115 vào O1 để làm mồi
    Gate now (== 115) >> O1
    
    # Nếu O1 đã có 115 VÀ lúc này now là 104 ('h'), nạp vào O2
    # T viết cho AI nên nó ưu tiên sự tường minh này
    Gate O1 (== 115 && now == 104) >> O2
}

[T+]
show shall(O2)
