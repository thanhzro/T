[T-]
import "lib/basic/std.t"
[T0]
file_read(path="ai_rules.txt") ~> rules
fromChar(code=10) ~> nl
split(str=rules, sep=nl) ~> lines
len(val=lines) ~> total
[T+]
show shall(total)
