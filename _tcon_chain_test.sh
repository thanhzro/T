#!/bin/bash
FUNC=$1
LIB=${2:-"lib/basic/std.t"}

# Get func body
BODY=$(grep -A10 "^func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | head -12)

# Extract each line and test in func context - parallel
echo "$BODY" | grep "~>" | while read line; do
    cat > _tcon_chain_$$.t << TEND
[T-]
import "$LIB"
func _test($FUNC params) {
    $line
    out >> out
}
[T0]
_test() ~> r
[T+]
show shall(r)
TEND
    OUT=$(timeout 2 ./t_bc _tcon_chain_$$.t 2>/dev/null)
    echo "  '$line' → '$OUT'" &
done
wait
rm -f _tcon_chain_$$.t
