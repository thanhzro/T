[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
x = [1, 0, 1]
w1 = [[1, 0, 1], [0, 1, 0], [1, 1, 0]]
b1 = [0, 0, 0]
w2 = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
b2 = [0, 0, 0]
[T0]
ffn(x=x, w1=w1, b1=b1, w2=w2, b2=b2) ~> out
[T+]
show shall(out)
