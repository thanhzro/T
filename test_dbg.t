[T-]

[T0]
exec(cmd="echo test123") ~> O1
exec(cmd="jq --version") ~> O2

[T+]
show shall(O1, O2)
