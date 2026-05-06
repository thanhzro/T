[T-]
ten = "xin chao viet nam"
tu = "chao"

[T0]
replace(str=ten, old="chao", new="hello") ~> O1
contains(str=ten, sub=tu) ~> O2

[T+]
show shall(O1)
show shall(O2)
