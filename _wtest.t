[T-]
"hello file" >> msg

[T0]
upper(str=msg) ~> O1

[T+]
show shall(O1)
write("out.txt") shall(O1)
