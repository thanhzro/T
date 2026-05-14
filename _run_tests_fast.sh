#!/bin/bash
run() {
    bash _mk_test.sh "$1" "lib/basic/math.t" "$2" "$3"
}

while read line; do
    eval "$line" &
done < <(grep -E "^run |^bash _mk_test" _test_all_math.sh)
wait
