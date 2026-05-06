[T-]
# Bơm RAM bằng cách tạo mảng lồng mảng
# Mỗi "vail" sẽ tốn 256 bytes trong struct TValue
s = ["vailvailvailvailvailvailvailvailvailvail"] 
row = [s, s, s, s, s, s, s, s, s, s] # 10
matrix = [row, row, row, row, row, row, row, row, row, row] # 100

[T0]
# Nhân bản tọa độ trong T0 để VM phải cấp phát bộ nhớ mới
past(matrix) ~> P1
F(P1) {
    now ~> P2
    F(P2) {
        now ~> P3
        # Lệnh này ép VM copy giá trị vào tọa độ mới
        P3 >> O1
    }
}

[T+]
show "Da bom RAM xong, dang kiem tra..."
# shall(O1) lúc này sẽ chứa hàng ngàn bản sao của chuỗi s
