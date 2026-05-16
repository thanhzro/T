[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"
import "lib/advanced/format.t"

[T0]
exec(cmd="./t examples/t-ai-testgen.t") ~> gen_out
split(str=gen_out, sep="\n") ~> test_lines
pop(arr=test_lines) ~> test_lines
len(val=test_lines) ~> n_tests

exec(cmd="python3 check_runtime.py 2>&1 | tail -3") ~> runtime_out
exec(cmd="python3 check_conflicts.py") ~> conflict_out

timestamp() ~> ts
toString(val=ts) ~> ts_str
toString(val=n_tests) ~> nt_str

"=== T PIPELINE REPORT ===" >> h1
"Time    : " + ts_str >> h2
"Tests   : " + nt_str + " generated" >> h3
"Runtime : " + runtime_out >> h4
"Checks  : " + conflict_out >> h5

[T+]
show shall(h1, h2, h3, h4, h5)
