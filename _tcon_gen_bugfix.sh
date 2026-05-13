#!/bin/bash
OUTPUT="training_data.jsonl"

# Extract actual bug fix patterns from git log
git log --oneline | grep -i "fix\|bug" | head -20 | while read hash msg; do
    # Get what changed
    DIFF=$(git show $hash --stat | tail -3)
    echo "{\"instruction\": \"T compiler bug: $msg - what files changed?\", \"output\": \"$DIFF\"}" >> $OUTPUT
done

# Generate from ai_rules with more context
while IFS= read -r rule; do
    [[ -z "$rule" || "$rule" == "#"* ]] && continue
    KEY=$(echo "$rule" | cut -d':' -f1)
    VAL=$(echo "$rule" | cut -d':' -f2-)
    # Multiple question formats
    echo "{\"instruction\": \"How to fix '$KEY' in T language compiler?\", \"output\": \"$VAL\"}" >> $OUTPUT
    echo "{\"instruction\": \"T compiler symptom: $KEY - root cause?\", \"output\": \"Root cause:$VAL\"}" >> $OUTPUT
done < ai_rules.txt

echo "Total: $(wc -l < $OUTPUT) pairs"
