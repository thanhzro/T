[T-]
data = "name:Alice"

[T0]
regex_find(str=data, pat="name:([A-Za-z]+)") ~> O1

[T+]
show shall(O1)
