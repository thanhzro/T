#!/bin/bash
FUNC=$1
echo "=== T con auto-fix: $FUNC ==="

# Get signature
SIG=$(grep "^$FUNC:" _tcon_sigs.txt | cut -d: -f2)
if [ -z "$SIG" ]; then
    echo "No signature found for $FUNC"
    exit 1
fi

# Build test args from signature with default values
ARGS=""
IFS=',' read -ra PARAMS <<< "$SIG"
for p in "${PARAMS[@]}"; do
    case $p in
        n|val|a) ARGS="$ARGS $p=7," ;;
        b|hi) ARGS="$ARGS $p=3," ;;
        lo) ARGS="$ARGS $p=0," ;;
        str) ARGS="$ARGS $p=\"hello\"," ;;
        sub) ARGS="$ARGS $p=\"ell\"," ;;
        arr) ARGS="$ARGS $p=[1,2,3]," ;;
        sep) ARGS="$ARGS $p=\",\"," ;;
        *) ARGS="$ARGS $p=1," ;;
    esac
done
ARGS="${ARGS%,}"

echo "Testing: $FUNC($ARGS)"
cat > _tcon_tmp.t << TEND
[T-]
import "lib/basic/std.t"
[T0]
${FUNC}(${ARGS}) ~> O1
[T+]
show shall(O1)
TEND
ACTUAL=$(timeout 2 ./t_bc _tcon_tmp.t 2>/dev/null)
echo "Output: '$ACTUAL'"
