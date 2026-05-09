[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -c ^func lib/basic/*.t | grep -v std | grep -v :0") ~> raw_b
exec(cmd="grep -c ^func lib/intermediate/*.t | grep -v std | grep -v :0") ~> raw_i
exec(cmd="grep -c ^func lib/advanced/*.t | grep -v std | grep -v :0") ~> raw_a
split(str=raw_b, sep="\n") ~> basic
split(str=raw_i, sep="\n") ~> inter
split(str=raw_a, sep="\n") ~> adv
pop(arr=basic) ~> basic
pop(arr=inter) ~> inter
pop(arr=adv) ~> adv

[T+]
show shall(basic)
show shall(inter)
show shall(adv)
