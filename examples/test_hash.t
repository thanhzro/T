[T-]

[T0]
md5(str="hello") ~> O1
sha256(str="hello") ~> O2
path_join(a="/home", b="user") ~> O3
path_basename(path="/home/user/file.txt") ~> O4
path_dirname(path="/home/user/file.txt") ~> O5

[T+]
show shall(O1, O2, O3, O4, O5)
