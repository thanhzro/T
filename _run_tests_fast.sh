#!/bin/bash
# Extract and run each test in parallel
source <(grep "^run()" _test_all_math.sh)

grep -E "^run |^bash _mk_test" _test_all_math.sh | while read line; do
    eval "$line &"
done
wait | grep -E "PASS|FAIL"
