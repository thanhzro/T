#!/bin/bash
OUTPUT="training_data.jsonl"

# Generate input/output pairs by running actual T programs
cat > _train_tmp.t << 'TEND'
[T-]
import "lib/basic/std.t"
nums = [3, 1, 4, 1, 5, 9, 2, 6]
[T0]
sort(arr=nums) ~> r1
max_arr(arr=nums) ~> r2
sum(arr=nums) ~> r3
avg(arr=nums) ~> r4
[T+]
show shall(r1, r2, r3, r4)
TEND

OUTPUT_VAL=$(./t_bc _train_tmp.t 2>/dev/null)
echo "{\"instruction\": \"T code: sort/max/sum/avg of [3,1,4,1,5,9,2,6]\", \"output\": \"$OUTPUT_VAL\"}" >> $OUTPUT

echo "Total: $(wc -l < $OUTPUT) pairs"
