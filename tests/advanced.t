[T-]
import "lib/basic/std.t"
import "lib/advanced/math3.t"
import "lib/advanced/string3.t"
import "lib/advanced/validate.t"
import "lib/advanced/crypto.t"

[T0]
round(val=3.7) ~> O1
ceil(val=3.2) ~> O2
pow(base=2, exp=8) ~> O3
sign(val=-5) ~> O4
starts_with(str="hello world", sub="hello") ~> O5
ends_with(str="hello world", sub="world") ~> O6
repeat(str="ab", n=3) ~> O7
is_email(str="test@gmail.com") ~> O8
is_url(str="https://github.com") ~> O9
hash_md5(str="hello") ~> O10
checksum(str="hello") ~> O11

[T+]
show shall(O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11)
