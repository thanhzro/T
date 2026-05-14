#!/bin/bash
./t_bc --server > /dev/null 2>&1 &
sleep 0.3

while true; do
    FAILS=$(bash _run_units_fast.sh 2>/dev/null | grep "^FAIL" | awk '{print $2}' | sort -u)
    
    if [ -z "$FAILS" ]; then
        echo "$(date): ALL PASS - stress testing..."
        # Stress: run func tests để tìm bugs mới
        bash _run_tests_fast.sh 2>/dev/null | grep "^FAIL" | while read line; do
            func=$(echo $line | awk '{print $2}')
            TMPF="_tcon_tmp_files/q_$$.t"
            printf '[T-]\n[T0]\ntcon_query(query="%s failing") ~> r\n[T+]\nshow shall(r)\n' "$func" > "$TMPF"
            RULE=$(./t_client "$TMPF" 2>/dev/null)
            rm -f "$TMPF"
            [ -n "$RULE" ] && echo "[$func] → $RULE" >> _train_log.txt
        done
        bash _tcon_learn.sh 2>/dev/null | tail -1
        sleep 10
        continue
    fi
    
    for func in $FAILS; do
        bash _tcon_action.sh "$func" "$(./t_bc _tcon_tmp.t 2>/dev/null)" &
    done
    wait
    sleep 5
done
