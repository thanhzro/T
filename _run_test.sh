#!/bin/bash
TEST=$1
{ time bash -c "./t $TEST 2>/dev/null | sed 's/[[:space:]]*\$//' > _ref.txt && ./t_bc $TEST 2>/dev/null | sed 's/[[:space:]]*\$//' > _bc.txt && diff _ref.txt _bc.txt >/dev/null && echo PASS || echo FAIL"; } 2>&1 | grep -E "PASS|FAIL|real"
