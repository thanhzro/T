[T-]
ten = "hello"

[T0]
chars(str=ten) ~> O1
charCode(str="A") ~> O2
fromChar(val=65) ~> O3

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
