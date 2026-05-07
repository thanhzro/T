[T-]

[T0]
file_exists(path="README.md") ~> O1
file_exists(path="ghost.txt") ~> O2
file_size(path="README.md") ~> O3

[T+]
show shall(O1, O2, O3)
