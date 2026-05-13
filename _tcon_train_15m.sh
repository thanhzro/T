#!/bin/bash
END=$(($(date +%s)+900))
ITER=0
mkdir -p _tcon_tmp_files

while [ $(date +%s) -lt $END ]; do
    ITER=$((ITER+1))
    FAILS=$(bash _run_tests_fast.sh 2>/dev/null | grep "^FAIL" | grep -oP 'Testing (\w+)' | awk '{print $2}' | sort -u)
    [ -z "$FAILS" ] && echo "ALL PASS! Iter=$ITER" && break
    echo "Iter $ITER: $(echo $FAILS | wc -w) fails"
    
    for func in $FAILS; do
        (
            TMPF="_tcon_tmp_files/tq_${func}_$BASHPID.t"
            printf '[T-]\n[T0]\ntcon_query(query="%s failing wrong output t_bc") ~> r\n[T+]\nshow shall(r)\n' "$func" > "$TMPF"
            RULE=$(./t_client "$TMPF" 2>/dev/null)
            rm -f "$TMPF"
            [ -n "$RULE" ] && echo "[$func] → $RULE" >> _train_log.txt
        ) &
    done
    wait
    bash _tcon_learn.sh 2>/dev/null | tail -1
done
echo "Done: $ITER iter, Rules: $(wc -l < ai_rules.txt)"
cat _train_log.txt | sort -u | head -10
