#!/bin/bash
OUTPUT="training_data.jsonl"

# From lib functions - generate Q&A pairs
grep -rn "^func " lib/basic/ lib/intermediate/ | while IFS= read -r line; do
    FILE=$(echo "$line" | cut -d':' -f1)
    FUNC=$(echo "$line" | grep -o 'func [a-z_]*' | cut -d' ' -f2)
    echo "{\"instruction\": \"What does $FUNC() do in T language?\", \"output\": \"T function defined in $FILE - processes input and returns result via 'out' variable\"}" >> $OUTPUT
done

# From native functions
grep -o '"[a-z_]*"' src/t_natives.h | sort -u | while IFS= read -r native; do
    NAME=$(echo $native | tr -d '"')
    echo "{\"instruction\": \"Is $NAME a built-in function in T language t_bc?\", \"output\": \"Yes, $NAME is registered as a native function in t_natives.h\"}" >> $OUTPUT
done

COUNT=$(wc -l < $OUTPUT)
echo "Total: $COUNT pairs"
