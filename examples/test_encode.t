[T-]

[T0]
to_hex(str="hello") ~> O1
from_hex(str="68656c6c6f") ~> O2
to_base64(str="hello") ~> O3

[T+]
show shall(O1, O2, O3)
