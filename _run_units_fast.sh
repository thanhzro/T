#!/bin/bash
mkdir -p _tcon_tmp_files
PASS=0; FAIL=0
while IFS='|' read imp code exp; do
    (
        T="_tcon_tmp_files/u_$BASHPID.t"
        printf "[T-]\n%s\n[T0]\n%s\n[T+]\nshow shall(O1)\n" "$imp" "$code" > "$T"
        OUT=$(timeout 3 ./t_bc "$T" 2>/dev/null)
        rm -f "$T"
        [ "$OUT" = "$exp" ] && echo "PASS" || echo "FAIL: $code got=$OUT expected=$exp"
    ) &
done < _unit_tests.txt
wait
