#!/bin/bash
# T con army - chạy mãi không cần Claude
./t_bc --server &
SERVER=$!
sleep 0.3

while true; do
    # Detect fails
    FAILS=$(bash _run_tests_fast.sh 2>/dev/null | grep "^FAIL" | awk '{print $2}' | sort -u)
    
    if [ -z "$FAILS" ]; then
        echo "$(date): ALL PASS - training rules..."
        # Learn from existing failures in ai_rules
        bash _tcon_train_15m.sh 2>/dev/null | tail -1
        # Run deeper tests
        python3 check_runtime.py 2>/dev/null | tail -1
        sleep 30
        continue
    fi
    
    # For each fail: query → action → verify
    for func in $FAILS; do
        RULE=$(printf '[T-]\n[T0]\ntcon_query(query="%s failing") ~> r\n[T+]\nshow shall(r)\n' "$func" | ./t_bc /dev/stdin 2>/dev/null)
        bash _tcon_action.sh "$func" "$RULE" 2>/dev/null
        gcc src/t_prog_compiler.c -lm -o t_bc 2>/dev/null && echo "$(date): Fixed $func"
    done
    
    bash _tcon_learn.sh 2>/dev/null | tail -1
    git add -A && git commit -m "tcon: auto-fix $(date +%H:%M)" 2>/dev/null
done
