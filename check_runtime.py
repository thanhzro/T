import subprocess, sys

PASS = 0
FAIL = 0

def run_t(imports, t0_code, expected):
    global PASS, FAIL
    test = f'[T-]\n{imports}\n\n[T0]\n{t0_code}\n\n[T+]\nshow shall(O1)\n'
    open('_rt_test.t','w').write(test)
    r = subprocess.run(['./t','_rt_test.t'], capture_output=True, text=True, timeout=5)
    out = r.stdout.strip()
    if out == str(expected):
        PASS += 1
    else:
        FAIL += 1
        print(f"FAIL: {t0_code.strip()}")
        print(f"  expected: {expected}")
        print(f"  got:      {out}")

B = 'import "lib/basic/std.t"'
I = B + '\nimport "lib/intermediate/std.t"'
A = 'import "lib/advanced/std.t"'

# Basic math
run_t(B, 'abs(val=-5) ~> O1', 5)
run_t(B, 'pow(base=2, exp=8) ~> O1', 256)
run_t(B, 'ceil(val=3.2) ~> O1', 4)
run_t(B, 'floor(val=3.9) ~> O1', 3)
run_t(B, 'round(val=3.5) ~> O1', 4)
run_t(B, 'max2(a=3, b=7) ~> O1', 7)
run_t(B, 'min2(a=3, b=7) ~> O1', 3)
run_t(B, 'is_even(n=4) ~> O1', 1)
run_t(B, 'is_odd(n=7) ~> O1', 1)
run_t(B, 'safe_div(a=10, b=2) ~> O1', 5)
run_t(B, 'safe_div(a=10, b=0) ~> O1', 0)
run_t(B, 'cube(n=3) ~> O1', 27)

# Basic string
run_t(B, 'len(val="hello") ~> O1', 5)
run_t(B, 'upper(str="hello") ~> O1', 'HELLO')
run_t(B, 'lower(str="HELLO") ~> O1', 'hello')
run_t(B, 'trim(str="  hi  ") ~> O1', 'hi')
run_t(B, 'contains(str="hello", sub="ell") ~> O1', 1)
run_t(B, 'str_reverse(str="hello") ~> O1', 'olleh')
run_t(B, 'str_count(str="hello", sub="l") ~> O1', 2)
run_t(B, 'str_starts(str="hello", sub="hel") ~> O1', 1)
run_t(B, 'str_ends(str="hello", sub="llo") ~> O1', 1)
run_t(B, 'is_blank(str="  ") ~> O1', 1)
run_t(B, 'is_blank(str="hi") ~> O1', 0)

# Basic array
run_t(B, 'sum(arr=[1,2,3,4,5]) ~> O1', 15)
run_t(B, 'avg(arr=[1,2,3,4,5]) ~> O1', 3)
run_t(B, 'max_arr(arr=[3,1,4,1,5,9]) ~> O1', 9)
run_t(B, 'min_arr(arr=[3,1,4,1,5,9]) ~> O1', 1)
run_t(B, 'len(val=[1,2,3]) ~> O1', 3)
run_t(B, 'arr_first(arr=[10,20,30]) ~> O1', 10)
run_t(B, 'arr_last(arr=[10,20,30]) ~> O1', 30)
run_t(B, 'any_arr(arr=[0,0,1]) ~> O1', 1)
run_t(B, 'all_arr(arr=[1,1,1]) ~> O1', 1)
run_t(B, 'all_arr(arr=[1,0,1]) ~> O1', 0)

# Intermediate math
run_t(I, 'gcd(a=48, b=18) ~> O1', 6)
run_t(I, 'lcm(a=12, b=8) ~> O1', 24)
run_t(I, 'factorial(n=5) ~> O1', 120)
run_t(I, 'fibonacci(n=10) ~> O1', 55)
run_t(I, 'is_prime(n=17) ~> O1', 1)
run_t(I, 'is_prime(n=15) ~> O1', 0)
run_t(I, 'median(arr=[1,2,3,4,5]) ~> O1', 3)

# Intermediate string
run_t(I, 'capitalize(str="hello") ~> O1', 'Hello')
run_t(I, 'is_palindrome(str="racecar") ~> O1', 1)
run_t(I, 'is_palindrome(str="hello") ~> O1', 0)
run_t(I, 'str_count_words(str="hello world foo") ~> O1', 3)

# Type checks
run_t(B, 'is_error(val="!ERROR") ~> O1', 1)
run_t(B, 'is_error(val="hello") ~> O1', 0)
run_t(B, 'is_error(val=42) ~> O1', 0)


# Auto-generated
run_t(I, 'gcd(a=48, b=18) ~> O1', '6')
run_t(I, 'fibonacci(n=10) ~> O1', '55')
run_t(I, 'upper(str="hello") ~> O1', 'HELLO')
run_t(I, 'avg(arr=[1,2,3]) ~> O1', '2')
run_t(I, 'str_count(str="hello", sub="l") ~> O1', '2')
run_t(I, 'factorial(n=5) ~> O1', '120')
run_t(I, 'lcm(a=12, b=8) ~> O1', '24')
run_t(I, 'cube(n=3) ~> O1', '27')
run_t(I, 'max3(a=5, b=3, c=9) ~> O1', '9')
run_t(I, 'str_reverse(str="hello") ~> O1', 'olleh')


# Runner tests via template
template = open('_template.t').read()
runner_tests = [
    ("abs(val=-5) ~> O1", "5"),
    ("pow(base=2, exp=8) ~> O1", "256"),
    ("gcd(a=48, b=18) ~> O1", "6"),
    ("fibonacci(n=10) ~> O1", "55"),
    ("is_prime(n=17) ~> O1", "1"),
]
for code, expected in runner_tests:
    prog = template.replace('PLACEHOLDER', code)
    open('_t.t','w').write(prog)
    r = subprocess.run(['./t','_t.t'], capture_output=True, text=True)
    got = r.stdout.strip()
    if got == expected: PASS += 1
    else:
        FAIL += 1
        print(f"FAIL: {code} got={got} expected={expected}")

import os
os.remove('_rt_test.t')
print(f"\n{'='*40}")
print(f"PASS: {PASS} | FAIL: {FAIL} | Total: {PASS+FAIL}")
if FAIL == 0:
    print("All tests passed!")
else:
    print(f"{FAIL} test(s) failed!")
    sys.exit(1)
