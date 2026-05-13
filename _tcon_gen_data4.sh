#!/bin/bash
OUTPUT="training_data.jsonl"

# From check_runtime.py test cases
python3 -c "
import re
with open('check_runtime.py') as f:
    content = f.read()
tests = re.findall(r\"run_t\([^,]+, '([^']+)', '?([^',)]+)'?\)\", content)
for code, expected in tests:
    print(f'{{\"instruction\": \"What does this T code return: {code}\", \"output\": \"Returns: {expected}\"}}')
" >> $OUTPUT

# From examples
ls examples/*.t 2>/dev/null | while read f; do
    NAME=$(basename $f .t)
    echo "{\"instruction\": \"What is examples/$NAME.t in T language?\", \"output\": \"T program: $NAME - example/demo program in T language repository\"}" >> $OUTPUT
done

COUNT=$(wc -l < $OUTPUT)
echo "Total: $COUNT pairs"
