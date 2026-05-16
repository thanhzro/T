[T-]
import "lib/basic/std.t"
arr = ["func add() {", "body line", "}", "x = 10"]
[T0]
0 >> _start
0 >> _end
0 >> _i
F(arr) {
    indexOf(str=now, sub="func ") ~> _fp
    0 >> _fs
    Gate _fp (== 0) >> _fs
    _fs * _i >> _s2
    _start + _s2 >> _start
    indexOf(str=now, sub="}") ~> _ep
    0 >> _es
    Gate _ep (== 0) >> _es
    _es * _i >> _e2
    _end + _e2 >> _end
    _i + 1 >> _i
}
_end + 1 >> _eend
slice(str=arr, from=_start, to=_eend) ~> _body
[T+]
show shall(_body)
