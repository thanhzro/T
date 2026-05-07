[T-]
matrix = [[1, 2, 3], [4, 5, 6]]

[T0]
F(matrix) {
    F(now) {
        now * 2 >> now
    }
    # In từng hàng ngay khi nó vừa được xử lý xong
    show now
}

[T+]
# Không cần show matrix ở đây vì nó sẽ ra [, ]
