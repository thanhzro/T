#!/bin/bash
END=$(($(date +%s)+900))
ITER=0
mkdir -p _tcon_tmp_files

while [ $(date +%s) -lt $END ]; do
    ITER=$((ITER+1))
    echo "=== Iteration $ITER ==="
    
    FAILS=$(python3 check_runtime.py 2>/dev/null | grep "^FAIL" | grep -oP '\w+(?=\()' | sort -u)
    [ -z "$FAILS" ] && echo "ALL PASS!" && break
    
    for func in $FAILS; do
        (
            TMPF="_tcon_tmp_files/tq_${func}_$BASHPID.t"
            printf '[T-]\n[T0]\ntcon_query(query="%s failing wrong output") ~> r\n[T+]\nshow shall(r)\n' "$func" > "$TMPF"
            RULE=$(./t_bc "$TMPF" 2>/dev/null)
            rm -f "$TMPF"
            echo "[$func] → $RULE" >> _train_log.txt
        ) &
    done
    wait
    
    bash _tcon_learn.sh 2>/dev/null
    sleep 1
done

echo "Done: $ITER iterations, Rules: $(wc -l < ai_rules.txt)"
cat _train_log.txt | tail -10
