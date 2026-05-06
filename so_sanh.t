[T-]
# Giả sử P1 là mảng 1 triệu phần tử nạp từ file hoặc tạo sẵn
# Ở đây ta dùng past() để giả lập dòng chảy lớn
[T0]
# Logic đếm trong T (Data Pipeline)
F(P1) {
    Gate now (> 500000) >> O1
}
[T+]
show shall(O1)
