[T-]
"hello" >> a
"world" >> b

[T0]
upper(str=a) ~> O1
upper(str=b) ~> O2

[T+]
show shall(O1, O2)
