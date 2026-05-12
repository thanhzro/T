#!/bin/bash
FUNC=$1
IMPORT=$2
ARGS=$3
SETUP=$4
cat > _tmp.t << TEND
[T-]
import "$IMPORT"
$SETUP
[T0]
$FUNC($ARGS) ~> r
[T+]
show shall(r)
TEND
REF=$(./t _tmp.t 2>/dev/null)
BC=$(./t_bc _tmp.t 2>/dev/null)
if [ "$REF" = "$BC" ]; then
    echo "PASS $FUNC"
elif [ -z "$REF" ] && [ -z "$BC" ]; then
    echo "SKIP $FUNC (both empty)"
elif [ -z "$REF" ]; then
    LINE=$(grep -n "func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | head -1)
    echo "FAIL $FUNC → AST bug at: $LINE"
    echo "     t_bc=$BC (likely correct)"
else
    LINE=$(grep -n "func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | head -1)
    echo "FAIL $FUNC → mismatch at: $LINE"
    echo "     ./t=$REF | ./t_bc=$BC"
fi
