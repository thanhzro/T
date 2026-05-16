[T-]
import "lib/basic/std.t"
import "lib/advanced/ml_t.t"
[T0]
softmax(arr=[27.0, -53.1, 6.3, 0.28]) ~> probs
argmax4(arr=probs) ~> ans
[T+]
show shall(probs)
show shall(ans)
