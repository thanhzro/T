[T-]
# Chuối "show" (115, 104, 111, 119)
input = [115, 104, 111, 119]

[T0]
past(input) ~> P1
F(P1) {
    # Bước 1: Nếu gặp 's' (115), gán O1 = 1
    Gate now (== 115) >> O1
    
    # Bước 2: Nếu O1 đang là 1 VÀ ký tự hiện tại là 'h' (104)
    # Đây là logic AND vật lý của T
    Gate O1 (== 1) {
        Gate now (== 104) >> O2
    }
}

[T+]
# Nếu O2 ra 104 (hoặc 1 tùy cách bố gán), nghĩa là đã khớp đến chữ 'h'
show O2
