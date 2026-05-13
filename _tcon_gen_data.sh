#!/bin/bash
# T con generates training data from ai_rules.txt
OUTPUT="training_data.jsonl"
echo "" > $OUTPUT

while IFS= read -r rule; do
    # Skip empty lines and comments
    [[ -z "$rule" || "$rule" == "#"* ]] && continue
    
    # Extract bug pattern and fix
    BUG=$(echo "$rule" | cut -d':' -f1)
    FIX=$(echo "$rule" | cut -d':' -f2-)
    
    # Generate training pair
    echo "{\"instruction\": \"T language compiler bug: $BUG\", \"output\": \"Fix:$FIX\"}" >> $OUTPUT
done < ai_rules.txt

COUNT=$(wc -l < $OUTPUT)
echo "Generated $COUNT training pairs → $OUTPUT"
