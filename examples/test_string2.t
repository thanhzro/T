[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"

[T0]
capitalize(str="hello world") ~> O1
count_words(str="hello world test") ~> O2
truncate(str="hello world", n=5) ~> O3
reverse_str(str="hello") ~> O4

[T+]
show shall(O1, O2, O3, O4)
