[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="./t tests/accumulator.t > _ref1.txt 2>/dev/null && ./t_bc tests/accumulator.t > _bc1.txt 2>/dev/null && diff _ref1.txt _bc1.txt > /dev/null && echo PASS || echo FAIL") ~> R1
exec(cmd="./t tests/sumavg.t > _ref2.txt 2>/dev/null && ./t_bc tests/sumavg.t > _bc2.txt 2>/dev/null && diff _ref2.txt _bc2.txt > /dev/null && echo PASS || echo FAIL") ~> R2
exec(cmd="./t tests/basic.t > _ref3.txt 2>/dev/null && ./t_bc tests/basic.t > _bc3.txt 2>/dev/null && diff _ref3.txt _bc3.txt > /dev/null && echo PASS || echo FAIL") ~> R3

[T+]
show shall(R1, R2, R3)
