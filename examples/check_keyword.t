[T-]
# Chuỗi đầu vào: "show 10" (mã ASCII: 115, 104, 111, 119)
arr input = [115, 104, 111, 119]

[T0]
past(input) ~> P1

# Fractal chảy qua từng ký tự
F(P1) {
    # Nếu ký tự hiện tại (now) là 's' (115), đánh dấu vào O1
    Gate now (== 115) >> O1
    
    # Nếu O1 đã có 's' và giờ gặp 'h' (104), đánh dấu vào O2
    # Cứ thế chảy qua để xác định đúng chữ "show"
    O1 + now >> O2
}

[T+]
# Nếu O2 ra kết quả đúng logic cộng dồn ASCII, nghĩa là đã khớp từ khóa!
show O2
