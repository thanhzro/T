#!/bin/bash
run() {
    bash _mk_test.sh "$1" "lib/basic/math.t" "$2" "$3" &
}
source _test_all_math.sh 2>/dev/null
wait
