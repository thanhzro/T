#!/bin/bash
PASS=0; FAIL=0; SKIP=0

run() {
    bash _mk_test.sh "$1" "lib/basic/math.t" "$2" "$3" &
}

run "sum" "arr=nums" "nums=[3,1,4,1,5]"
run "avg" "arr=nums" "nums=[3,1,4,1,5]"
run "max_arr" "arr=nums" "nums=[3,1,9,2]"
run "min_arr" "arr=nums" "nums=[3,1,9,2]"
run "pow" "base=2, exp=8" ""
run "abs" "val=-7" ""
run "round" "val=3.7" ""
run "ceil" "val=3.2" ""
run "sqrt" "val=16" ""
run "clamp" "val=15, lo=0, hi=10" ""
bash _mk_test.sh "lower" "lib/basic/string.t" 'str="HELLO"' "" 2>/dev/null || true   &
bash _mk_test.sh "trim" "lib/basic/string.t" 'str="  hi  "' "" 2>/dev/null || true &
bash _mk_test.sh "sort" "lib/basic/array.t" "arr=nums" "nums=[3,1,4,1,5]" &
bash _mk_test.sh "reverse" "lib/basic/array.t" "arr=nums" "nums=[1,2,3]" &
bash _mk_test.sh "first" "lib/basic/array.t" "arr=nums" "nums=[5,3,1]" &
bash _mk_test.sh "last" "lib/basic/array.t" "arr=nums" "nums=[5,3,1]" &
bash _mk_test.sh "push" "lib/basic/array.t" "arr=nums, val=9" "nums=[1,2,3]" &
bash _mk_test.sh "len" "lib/basic/std.t" "val=nums" "nums=[1,2,3]" &
echo "================================"
echo "Done."
echo "================================"
echo "Done."
bash _mk_test.sh "upper" "lib/basic/string.t" 'str="hello"' "" &
bash _mk_test.sh "lower" "lib/basic/string.t" 'str="HELLO"' "" &
bash _mk_test.sh "trim" "lib/basic/string.t" 'str="  hi  "' "" &
bash _mk_test.sh "replace" "lib/basic/string.t" "str=s, old=o, new=n" "s=\"hello world\" &
o=\" \"
n=\"_\""
bash _mk_test.sh "contains" "lib/basic/string.t" "str=s, sub=ell" "s=\"hello\"" &
bash _mk_test.sh "split" "lib/basic/string.t" "str=s, sep=o" "s=\"hello world\"" &
bash _mk_test.sh "join" "lib/basic/array.t" "arr=nums, sep=s" "nums=[1,2,3] &
s=\",\""
bash _mk_test.sh "flatten" "lib/basic/array.t" "arr=nums" "nums=[1,2,3]" &
# Edge cases
bash _mk_test.sh "abs" "lib/basic/math.t" "val=0" "" &
bash _mk_test.sh "abs" "lib/basic/math.t" "val=-100" "" &
bash _mk_test.sh "max" "lib/basic/math.t" "a=-1, b=-5" "" &
bash _mk_test.sh "min" "lib/basic/math.t" "a=0, b=0" "" &
bash _mk_test.sh "safe_div" "lib/basic/math.t" "a=0, b=5" "" &
bash _mk_test.sh "is_even" "lib/basic/math.t" "n=0" "" &
bash _mk_test.sh "is_odd" "lib/basic/math.t" "n=1" "" &
bash _mk_test.sh "contains" "lib/basic/string.t" 'str="hello", sub="hello"' "" &
bash _mk_test.sh "contains" "lib/basic/string.t" 'str="hello", sub="xyz"' "" &
# Complex cases
bash _mk_test.sh "is_palindrome" "lib/intermediate/std.t" 'str="racecar"' "" &
bash _mk_test.sh "is_palindrome" "lib/intermediate/std.t" 'str="hello"' "" &
bash _mk_test.sh "str_count" "lib/basic/string.t" 'str="hello", sub="l"' "" &
bash _mk_test.sh "capitalize" "lib/intermediate/string2.t" 'str="hello world"' "" &
bash _mk_test.sh "str_reverse" "lib/basic/string.t" 'str="abcde"' "" &
