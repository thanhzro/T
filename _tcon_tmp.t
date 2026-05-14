[T-]
x = 42
s = "hello"
[T0]
0 >> is_n
0 >> is_s
Gate x (is_num) >> is_n
Gate s (is_str) >> is_s
[T+]
show shall(is_n, is_s)
