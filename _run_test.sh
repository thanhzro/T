#!/bin/bash
TEST=$1
TMPID=$$
TIMEOUT=${2:-15}
{ time bash -c "timeout $TIMEOUT ./t_bc $TEST 2>/dev/null | sed 's/[[:space:]]*\$//' | sed '/^$/d' > _ref_${TMPID}.txt && timeout $TIMEOUT ./t_bc $TEST 2>/dev/null | sed 's/[[:space:]]*\$//' | sed '/^$/d' > _bc_${TMPID}.txt && diff _ref_${TMPID}.txt _bc_${TMPID}.txt >/dev/null && echo PASS || echo FAIL"; } 2>&1 | grep -E "PASS|FAIL|real"
rm -f _ref_${TMPID}.txt _bc_${TMPID}.txt
