#!/bin/bash
FUNC=$1
echo "=== T con trace: $FUNC ==="
DEPS=$(grep -A8 "^func $FUNC" lib/basic/math.t lib/basic/string.t 2>/dev/null | grep "~>" | grep -oP '\w+(?=\()' | sort -u)
for dep in $DEPS; do
    SIG=$(grep "^$dep:" _tcon_sigs.txt | cut -d: -f2)
    [ -z "$SIG" ] && continue
    ARGS="" 
    IFS=',' read -ra PARAMS <<< "$SIG"
    for p in "${PARAMS[@]}"; do
        case $p in
            n|val|a) ARGS="$ARGS $p=7," ;;
            b|hi) ARGS="$ARGS $p=3," ;;
            lo) ARGS="$ARGS $p=0," ;;
            *) ARGS="$ARGS $p=1," ;;
        esac
    done
    ARGS="${ARGS%,}"
    cat > _tcon_tmp.t << TEND
[T-]
import "lib/basic/std.t"
[T0]
${dep}(${ARGS}) ~> O1
[T+]
show shall(O1)
TEND
    OUT=$(timeout 2 ./t_bc _tcon_tmp.t 2>/dev/null)
    echo "  $dep($ARGS) = '$OUT'"
done
