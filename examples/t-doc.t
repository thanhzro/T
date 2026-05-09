[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="grep -rh '^func ' lib/basic/ | grep -v std | wc -l") ~> rb
exec(cmd="grep -rh '^func ' lib/intermediate/ | grep -v std | wc -l") ~> ri
exec(cmd="grep -rh '^func ' lib/advanced/ | grep -v std | wc -l") ~> ra
trim(str=rb) ~> bc
trim(str=ri) ~> ic
trim(str=ra) ~> ac
toNumber(val=bc) ~> bn
toNumber(val=ic) ~> cn
toNumber(val=ac) ~> an
bn + cn >> t1
t1 + an >> total
toString(val=total) ~> ts

"==============================" >> line
"  T LANGUAGE FUNCTION STATS  " >> title
"Total functions : " + ts >> s1
"Basic           : " + bc >> s2
"Intermediate    : " + ic >> s3
"Advanced        : " + ac >> s4

[T+]
show shall(line, title, line, s1, s2, s3, s4, line)
