[T-]
# Mỗi dòng này tạo ra 1 TArray, mỗi phần tử là 256 bytes
# Mình tạo thật nhiều biến để lấp đầy Frame
a = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
b = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
c = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
d = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
e = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
f = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]
g = ["stress", "ram", "test", "vail", "t-lang", "vail", "vail", "vail"]

[T0]
# Nạp hết đống này vào tọa độ để VM phải giữ trong RAM
past(a) ~> P1
past(b) ~> P2
past(c) ~> P3
past(d) ~> P4
past(e) ~> P5
past(f) ~> P6
past(g) ~> P7

[T+]
show "Da nap xon du lieu"
