[T-]
import "lib/basic/std.t"
import "lib/intermediate/string2.t"
import "lib/intermediate/array.t"

[T0]
snake_case(str="Hello World Foo") ~> O1
camel_case(str="hello world foo") ~> O2

[T+]
show shall(O1, O2)
