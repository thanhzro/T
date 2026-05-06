[T-]
# Tầng 1: 10 phần tử (mỗi cái ~300 bytes)
a = ["stress", "ram", "vail", "vail", "vail", "vail", "vail", "vail", "vail", "vail"]

# Tầng 2: 10 x 10 = 100 phần tử
b = [a, a, a, a, a, a, a, a, a, a]

# Tầng 3: 100 x 10 = 1000 phần tử (~300 KB)
c = [b, b, b, b, b, b, b, b, b, b]

# Tầng 4: 1000 x 10 = 10.000 phần tử (~3 MB)
d = [c, c, c, c, c, c, c, c, c, c]

# Tầng 5: 10.000 x 2 = 20.000 phần tử (~6 MB)
# Đưa nó lên ngưỡng tử thần 6MB đây!
e = [d, d]

[T0]
# Nạp vào tọa độ để ép RAM giữ lại
past(e) ~> P1

[T+]
# Kiểm tra xem nó có sống để in ra không
show shall(P1) as "Kiem tra RAM Matrix: {}"
