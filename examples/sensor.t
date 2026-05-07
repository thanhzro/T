[T-]
data = [5, 15, 45, 0, 8, 50, 20]
val O2 = 0

[T0]
past(data) ~> P1

F(P1) {
    # Bước 1: Lọc lấy số >= 10. Số nhỏ hơn sẽ bị "ảo hóa" (killed)
    Gate now (>= 10) >> now
    
    # Bước 2: Nếu là số lớn (> 40), nhân đôi nó
    Gate now (> 40) >> O1
    O1 * 2 >> now
    
    # Bước 3: Cộng dồn vào O2 đã được mồi sẵn giá trị 0
    O2 + now >> O2
}

[T+]
show O2
