#!/bin/bash
TEST=$1
TIMEOUT=${2:-15}
{ time bash -c "
OUT=\$(timeout $TIMEOUT ./t_bc $TEST 2>/dev/null | sed 's/[[:space:]]*\$//' | sed '/^\$/d')
if [ -n \"\$OUT\" ]; then echo PASS; else echo FAIL; fi
"; } 2>&1 | grep -E "PASS|FAIL|real"
