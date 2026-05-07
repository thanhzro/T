[T-]

[T0]
timestamp() ~> ts
format_date(ts=ts) ~> O1
format_time(ts=ts) ~> O2
format_datetime(ts=ts) ~> O3

[T+]
show shall(O1)
show shall(O2)
show shall(O3)
