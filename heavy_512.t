[T-]
# Mảng 8 phần tử
arr m = [1, 1, 1, 1, 1, 1, 1, 1]

[T0]
past(m) ~> P1
# 8 * 8 * 8 = 512 nhịp chảy
F(P1) {
  F(P1) {
    F(P1) {
      O1 + 1 >> O1
    }
  }
}

[T+]
show O1
