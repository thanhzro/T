[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/string2.t"
import "lib/intermediate/math2.t"

[T0]
chunk(arr=[1,2,3,4,5,6], n=2) ~> O1
take(arr=[1,2,3,4,5], n=3) ~> O2
drop(arr=[1,2,3,4,5], n=3) ~> O3
sliding_window(arr=[1,2,3,4,5], n=3) ~> O4
rotate(arr=[1,2,3,4,5], n=2) ~> O5
gcd(a=12, b=8) ~> O6
lcm(a=4, b=6) ~> O7
is_prime(n=17) ~> O8
factorial(n=5) ~> O9
fibonacci(n=10) ~> O10
capitalize(str="hello world") ~> O11
title(str="hello world") ~> O12
snake_case(str="Hello World") ~> O13
truncate(str="hello world", n=5) ~> O14

[T+]
show shall(O1, O2, O3, O4, O5)
show shall(O6, O7, O8, O9, O10)
show shall(O11, O12, O13, O14)
