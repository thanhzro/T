#!/bin/bash
echo "=== T con Performance Profile ==="
grep "bash _mk_test" _test_all_math.sh | head -10 | while read line; do
    FUNC=$(echo "$line" | grep -o '"[a-z_]*"' | head -1 | tr -d '"')
    START=$(date +%s%N)
    eval "$line" 2>/dev/null | tail -1
    END=$(date +%s%N)
    MS=$(( (END-START)/1000000 ))
    echo "  $FUNC: ${MS}ms"
done
