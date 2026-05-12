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
