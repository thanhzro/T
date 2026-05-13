[T-]
import "lib/basic/std.t"
nums = [3, 1, 4, 1, 5, 9, 2, 6]
[T0]
sort(arr=nums) ~> r1
max_arr(arr=nums) ~> r2
sum(arr=nums) ~> r3
avg(arr=nums) ~> r4
[T+]
show shall(r1, r2, r3, r4)
