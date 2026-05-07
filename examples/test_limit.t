[T-]
read("small_data.txt") ~> P1

[T0]
past(P1) ~> P2
F(P2) {
    # Lọc đơn giản để xem nó có trụ nổi không
    Gate now (> 128) >> O1
}

[T+]
show shall(O1)
