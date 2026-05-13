#!/bin/bash
FUNCS=(
"chunk(arr=[1,2,3,4,5,6], n=2) ~> O1"
"take(arr=[1,2,3,4,5], n=3) ~> O1"
"drop(arr=[1,2,3,4,5], n=3) ~> O1"
"gcd(a=12, b=8) ~> O1"
"lcm(a=4, b=6) ~> O1"
"is_prime(n=17) ~> O1"
"factorial(n=5) ~> O1"
"fibonacci(n=10) ~> O1"
"capitalize(str=s) ~> O1"
"title(str=s) ~> O1"
"snake_case(str=s) ~> O1"
"sliding_window(arr=[1,2,3,4,5], n=3) ~> O1"
)
for func in "${FUNCS[@]}"; do
    echo -n "Testing ${func%% *}... "
    cat > _itmp.t << TEND
[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/string2.t"
import "lib/intermediate/math2.t"
s = "hello world"
[T0]
$func
[T+]
show shall(O1)
TEND
    result=$(timeout 2 ./t_bc _itmp.t 2>/dev/null)
    [ $? -eq 124 ] && echo "TIMEOUT" || echo "OK: $result"
done
