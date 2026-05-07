[T-]

[T0]
regex_match(str="hello123", pat="[0-9]+") ~> O1
regex_find(str="hello123world", pat="[0-9]+") ~> O2

[T+]
show shall(O1, O2)
