[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/intermediate/string2.t"
import "lib/intermediate/math2.t"
import "lib/intermediate/json.t"
import "lib/intermediate/datetime.t"
data = [3,1,4,1,5,9,2,6]
json = "{\"name\": \"Thanh\", \"score\": 95, \"tags\": [\"A\",\"B\"]}"

[T0]
chunk(arr=data, n=3) ~> O1
take(arr=data, n=3) ~> O2
drop(arr=data, n=3) ~> O3
groupBy(arr=data) ~> O4
gcd(a=12, b=8) ~> O5
lcm(a=4, b=6) ~> O6
is_prime(n=17) ~> O7
factorial(n=5) ~> O8
json_get(json=json, key="name") ~> O9
json_get(json=json, key="score") ~> O10
json_array(json=json, key="tags") ~> O11
capitalize(str="hello world") ~> O12
title(str="hello world") ~> O13
snake_case(str="Hello World") ~> O14
camel_case(str="hello world") ~> O15

[T+]
show shall(O1, O2, O3, O4)
show shall(O5, O6, O7, O8)
show shall(O9, O10, O11)
show shall(O12, O13, O14, O15)
