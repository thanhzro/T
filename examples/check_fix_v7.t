[T-]
m = [115, 104, 111, 119]

[T0]
past(m) ~> P1
F(P1) {
    # Nếu nhịp hiện tại là 's', đánh dấu O1
    Gate now (== 115) >> O1
    
    # Ở nhịp tiếp theo (khi now là 'h'), nếu O1 đã có giá trị
    # Ta dùng Gate O1 để mở đường, rồi mới dùng Gate now để kiểm tra
    Gate O1 (== 115) Gate now (== 104) now >> O2
}

[T+]
show shall(O2)
