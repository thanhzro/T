#!/bin/bash
FUNC=$1
IMPORT=$2
ARGS=$3
SETUP=$4
cat > _tmp_$$.t << TEND
[T-]
import "$IMPORT"
$SETUP
[T0]
$FUNC($ARGS) ~> r
[T+]
show shall(r)
TEND
BC=$(./t_bc _tmp_$$.t 2>/dev/null)
rm -f _tmp_$$.t
echo -n "Testing $FUNC... "
if [ -n "$BC" ]; then
    echo "PASS $FUNC"
else
    LINE=$(grep -n "func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | head -1)
    echo "FAIL $FUNC → no output at: $LINE"
    echo "     ./t_bc=$BC"
fi
