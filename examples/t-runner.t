[T-]
import "lib/basic/std.t"
import "lib/intermediate/array.t"

func run_test(code, expected) {
    past(code) ~> C
    past(expected) ~> E
    write_file(path="_code.txt", content=C) ~> t1
    "c=open('_template.t').read()" >> p1
    ".replace('PLACEHOLDER'," >> p2
    "open('_code.txt').read())" >> p3
    ";open('_t.t','w').write(c)" >> p4
    p1 + p2 + p3 + p4 >> script
    write_file(path="rc.py", content=script) ~> t2
    exec(cmd="python3 rc.py") ~> ignore
    exec(cmd="./t _t.t 2>/dev/null") ~> got
    trim(str=got) ~> g
    str_eq(a=g, b=E) ~> score
    [] >> opts
    push(arr=opts, val="FAIL: " + C) ~> opts
    push(arr=opts, val="PASS") ~> opts
    get(arr=opts, idx=score) ~> out
}

[T0]
run_test(code="abs(val=-5) ~> O1", expected="5") ~> R1
run_test(code="pow(base=2, exp=8) ~> O1", expected="256") ~> R2
run_test(code="gcd(a=48, b=18) ~> O1", expected="6") ~> R3
run_test(code="fibonacci(n=10) ~> O1", expected="55") ~> R4
run_test(code="is_prime(n=17) ~> O1", expected="1") ~> R5

[R1, R2, R3, R4, R5] >> results
arr_count_if(arr=results, val="PASS") ~> passed
len(val=results) ~> total
toString(val=passed) ~> ps
toString(val=total) ~> ts
ps + "/" + ts + " tests passed" >> summary

[T+]
show shall(R1, R2, R3, R4, R5, summary)
