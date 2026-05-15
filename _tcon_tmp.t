[T-]
import "lib/basic/std.t"
str = "hello world"
sub = "world"
[T0]
len(val=sub) ~> _sl
-1 >> _found
range(n=12) ~> _idx
F(_idx) {
    Gate _found (> -1) >> done
    now + _sl >> _e
    slice(str=str, from=now, to=_e) ~> _c
    0 >> _m
    Gate _c (== sub) >> _m
    1 - _m >> _k
    _found * _k >> _o
    now * _m >> _nw
    _o + _nw >> _found
}
[T+]
show shall(_found)
