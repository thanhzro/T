[T-]
import "lib/basic/std.t"
nums = [3, 1, 4, 1, 5, 9, 2, 6]
dups = [3, 1, 2, 1, 3, 2, 4]

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
trim(str="  hello world  ") ~> O11
replace(str="hello world", old="world", new="T") ~> O12
unique(arr=dups) ~> O13
contains(str="hello", sub="ell") ~> O14

[T+]
show shall(O1, O2, O3, O4, O5, O6, O7, O8, O9, O10)
show shall(O11, O12, O13, O14)
