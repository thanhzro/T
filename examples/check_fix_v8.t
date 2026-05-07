[T-]
m = [115, 104, 111, 119]

[T0]
past(m) ~> P1
F(P1) {
# Nếu là 's', bật O1
Gate now (== 115) >> O1

# Nếu O1 đã có (tức là nhịp trước là 's') và nhịp này là 'h'
# Ta kiểm tra O1, nếu đúng thì lấy 'now' nhét vào O2
Gate O1 (== 115) >> O3
Gate now (== 104) >> O4

# Chỉ khi cả O3 và O4 đều có giá trị (shall) thì O2 mới có
# Nhưng để đơn giản nhất cho Parser, con viết phẳng thế này:
Gate O3 (== 115) Gate O4 (== 104) >> O2
}

[T+]
show shall(O2)
