#!/bin/bash
# Run all tests in 1 process
./t_bc _all_tests.t 2>/dev/null > _all_actual.txt
paste _all_actual.txt _all_expected.txt | awk -F'\t' '
{
    if($1==$2) PASS++
    else { FAIL++; print "FAIL: got="$1" expected="$2 }
}
END { print "PASS="PASS" FAIL="FAIL" Total="PASS+FAIL }
'
