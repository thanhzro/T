[T-]
import "lib/basic/std.t"
nums = [3, 1, 4, 1, 5, 9, 2, 6]
words = ["banana", "apple", "cherry"]

[T0]
sort(arr=nums) ~> O1
reverse(arr=nums) ~> O2
max_arr(arr=nums) ~> O3
min_arr(arr=nums) ~> O4
sum(arr=nums) ~> O5
first(arr=nums) ~> O6
last(arr=nums) ~> O7
upper(str="hello") ~> O8
padLeft(str="42", n=5, ch="0") ~> O9
pow(base=2, exp=8) ~> O10

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
show shall(O4)
show shall(O5)
show shall(O6)
show shall(O7)
show shall(O8)
show shall(O9)
show shall(O10)
