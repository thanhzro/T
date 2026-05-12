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
else
    echo "FAIL $FUNC (expected: $REF, got: $BC)"
fi
