#!/bin/bash
OUTPUT="training_data.jsonl"

# From git log - extract bug fixes
git log --oneline | grep -i "fix\|bug\|feat" | while IFS= read -r line; do
    HASH=$(echo "$line" | cut -d' ' -f1)
    MSG=$(echo "$line" | cut -d' ' -f2-)
    echo "{\"instruction\": \"T language: $MSG\", \"output\": \"commit: $HASH\"}" >> $OUTPUT
done

# From test results - generate fix pairs
bash _run_tests.sh 2>/dev/null | grep "FAIL" | while IFS= read -r line; do
    FUNC=$(echo "$line" | grep -o 'FAIL [a-z_]*' | cut -d' ' -f2)
    LOC=$(echo "$line" | grep -o 'at: .*')
    echo "{\"instruction\": \"T language t_bc: $FUNC returns wrong value\", \"output\": \"Check $LOC - likely missing native or AST bug\"}" >> $OUTPUT
done

COUNT=$(wc -l < $OUTPUT)
echo "Total training pairs: $COUNT"
