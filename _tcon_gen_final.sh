#!/bin/bash
OUTPUT="training_data.jsonl"

# T language syntax examples
cat >> $OUTPUT << 'EOJSON'
{"instruction": "How to declare a variable in T language?", "output": "Use >> operator: value >> varname. Example: 42 >> x or \"hello\" >> msg"}
{"instruction": "How to call a function in T language?", "output": "Use ~> for result: func(arg=val) ~> result. Example: sort(arr=nums) ~> sorted"}
{"instruction": "What is T- section in T language?", "output": "T- is past/declarations section: imports, variable declarations, function definitions"}
{"instruction": "What is T0 section in T language?", "output": "T0 is present/execution section: where computation happens"}
{"instruction": "What is T+ section in T language?", "output": "T+ is future/output section: show shall(var) to output results"}
{"instruction": "How to loop over array in T language?", "output": "Use F() loop: F(arr) { body using 'now' as current element }"}
{"instruction": "How to filter array in T language?", "output": "Use Gate inside F(): F(arr) { Gate now (>= value) >> result }"}
{"instruction": "How to import library in T language?", "output": "In T- section: import \"lib/basic/std.t\""}
{"instruction": "What does show shall() do in T language?", "output": "show shall(O1, O2) outputs final results in T+ section - the official output contract"}
{"instruction": "How to write infinite loop with exit in T language?", "output": "Use loop { body Gate condition (== 0) >> done } - Gate exits when condition true"}
{"instruction": "What is Gate in T language?", "output": "Gate is conditional filter: Gate subject (op value) >> target - executes only when condition true"}
{"instruction": "How to concatenate strings in T?", "output": "Use + operator: str1 + str2 >> result or inside expression: \"hello\" + name >> greeting"}
{"instruction": "What is past() in T language?", "output": "past(var) ~> alias - creates local alias for parameter inside function body"}
{"instruction": "How to check if string contains substring in T?", "output": "contains(str=s, sub=sub) ~> result - returns 1 if found, 0 if not"}
{"instruction": "What is the T language philosophy?", "output": "T- (past) + T0 (present) + T+ (future) = complete execution context. Every T program has all 3 sections"}
{"instruction": "How does T con self-improve?", "output": "T con runs tests, detects failures, appends rules to ai_rules.txt, spawns parallel T con for next iteration"}
EOJSON

echo "Total: $(wc -l < $OUTPUT) pairs"
