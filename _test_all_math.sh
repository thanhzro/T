#!/bin/bash
PASS=0; FAIL=0; SKIP=0

run() {
    bash _mk_test.sh "$1" "lib/basic/math.t" "$2" "$3"
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
bash _mk_test.sh "upper" "lib/basic/string.t" "str=hello" "" 2>/dev/null || true
bash _mk_test.sh "lower" "lib/basic/string.t" "str=HELLO" "" 2>/dev/null || true  
bash _mk_test.sh "trim" "lib/basic/string.t" "str=s" "s=\"  hi  \"" 2>/dev/null || true
bash _mk_test.sh "sort" "lib/basic/array.t" "arr=nums" "nums=[3,1,4,1,5]"
bash _mk_test.sh "reverse" "lib/basic/array.t" "arr=nums" "nums=[1,2,3]"
bash _mk_test.sh "first" "lib/basic/array.t" "arr=nums" "nums=[5,3,1]"
bash _mk_test.sh "last" "lib/basic/array.t" "arr=nums" "nums=[5,3,1]"
bash _mk_test.sh "push" "lib/basic/array.t" "arr=nums, val=9" "nums=[1,2,3]"
bash _mk_test.sh "len" "lib/basic/std.t" "val=nums" "nums=[1,2,3]"
echo "================================"
echo "Done."
