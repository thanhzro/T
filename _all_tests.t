[T-]
import "lib/basic/std.t"
import "lib/intermediate/std.t"
[T0]
abs(val=-5) ~> R0
pow(base=2, exp=8) ~> R1
ceil(val=3.2) ~> R2
floor(val=3.9) ~> R3
round(val=3.5) ~> R4
max2(a=3, b=7) ~> R5
min2(a=3, b=7) ~> R6
is_even(n=4) ~> R7
is_odd(n=7) ~> R8
safe_div(a=10, b=2) ~> R9
safe_div(a=10, b=0) ~> R10
cube(n=3) ~> R11
len(val="hello") ~> R12
upper(str="hello") ~> R13
lower(str="HELLO") ~> R14
trim(str="  hi  ") ~> R15
contains(str="hello", sub="ell") ~> R16
str_reverse(str="hello") ~> R17
str_count(str="hello", sub="l") ~> R18
str_starts(str="hello", sub="hel") ~> R19
str_ends(str="hello", sub="llo") ~> R20
is_blank(str="  ") ~> R21
is_blank(str="hi") ~> R22
sum(arr=[1,2,3,4,5]) ~> R23
avg(arr=[1,2,3,4,5]) ~> R24
max_arr(arr=[3,1,4,1,5,9]) ~> R25
min_arr(arr=[3,1,4,1,5,9]) ~> R26
len(val=[1,2,3]) ~> R27
arr_first(arr=[10,20,30]) ~> R28
arr_last(arr=[10,20,30]) ~> R29
any_arr(arr=[0,0,1]) ~> R30
all_arr(arr=[1,1,1]) ~> R31
all_arr(arr=[1,0,1]) ~> R32
gcd(a=48, b=18) ~> R33
lcm(a=12, b=8) ~> R34
median(arr=[1,2,3,4,5]) ~> R35
capitalize(str="hello") ~> R36
is_palindrome(str="racecar") ~> R37
is_palindrome(str="hello") ~> R38
str_count_words(str="hello world foo") ~> R39
is_error(val="!ERROR") ~> R40
is_error(val="hello") ~> R41
is_error(val=42) ~> R42
gcd(a=48, b=18) ~> R43
upper(str="hello") ~> R44
avg(arr=[1,2,3]) ~> R45
str_count(str="hello", sub="l") ~> R46
lcm(a=12, b=8) ~> R47
cube(n=3) ~> R48
max3(a=5, b=3, c=9) ~> R49
str_reverse(str="hello") ~> R50
[T+]
show shall(R0)
show shall(R1)
show shall(R2)
show shall(R3)
show shall(R4)
show shall(R5)
show shall(R6)
show shall(R7)
show shall(R8)
show shall(R9)
show shall(R10)
show shall(R11)
show shall(R12)
show shall(R13)
show shall(R14)
show shall(R15)
show shall(R16)
show shall(R17)
show shall(R18)
show shall(R19)
show shall(R20)
show shall(R21)
show shall(R22)
show shall(R23)
show shall(R24)
show shall(R25)
show shall(R26)
show shall(R27)
show shall(R28)
show shall(R29)
show shall(R30)
show shall(R31)
show shall(R32)
show shall(R33)
show shall(R34)
show shall(R35)
show shall(R36)
show shall(R37)
show shall(R38)
show shall(R39)
show shall(R40)
show shall(R41)
show shall(R42)
show shall(R43)
show shall(R44)
show shall(R45)
show shall(R46)
show shall(R47)
show shall(R48)
show shall(R49)
show shall(R50)
