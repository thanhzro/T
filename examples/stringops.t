[T-]
ten = "xin chao"
arr words = ["viet", "nam", "dep", "lam"]
dong = "80,90,70"

[T0]
len(val=ten) ~> P1
join(arr=words, sep=" ") ~> P2
split(str=dong, sep=",") ~> P3

[T+]
show shall(P1)
show shall(P2)
show shall(P3)
