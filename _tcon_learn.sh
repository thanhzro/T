#!/bin/bash
# T con self-learning: detect mismatch bugs and log to ai_rules.txt
FAILS=${FAILS:-$(bash _run_tests.sh 2>/dev/null | grep "FAIL.*mismatch")}
while IFS= read -r line; do
    if [ -n "$line" ]; then
        FUNC=$(echo "$line" | grep -o 'FAIL [a-z_]*' | cut -d' ' -f2)
        LOC=$(echo "$line" | grep -o 'at: .*' | cut -d' ' -f2-)
        RULE="mismatch: $FUNC output differs t_bc vs AST - check $LOC"
        # Only add if not already in rules
        if ! grep -q "mismatch: $FUNC" ai_rules.txt; then
            echo "$RULE" >> ai_rules.txt
            echo "T con learned: $RULE"
        fi
    fi
done <<< "$FAILS"
echo "Rules total: $(wc -l < ai_rules.txt)"
