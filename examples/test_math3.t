[T-]
import "lib/basic/std.t"
import "lib/intermediate/math2.t"

[T0]
gcd(a=12, b=8) ~> O1
lcm(a=4, b=6) ~> O2
is_prime(n=17) ~> O3
factorial(n=5) ~> O4

[T+]
show shall(O1, O2, O3, O4)
