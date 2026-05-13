#!/bin/bash
mkdir -p _tcon_tmp_files
while IFS=$'\t' read lib code exp; do
    (
        T="_tcon_tmp_files/u_$BASHPID.t"
        if [ "$lib" = "B" ]; then
            IMP='import "lib/basic/std.t"'
        else
            IMP='import "lib/basic/std.t"
import "lib/intermediate/std.t"'
        fi
        printf "[T-]\n%s\n[T0]\n%s\n[T+]\nshow shall(O1)\n" "$IMP" "$code" > "$T"
        OUT=$(timeout 3 ./t_client "$T" 2>/dev/null || timeout 3 ./t_bc "$T" 2>/dev/null)
        rm -f "$T"
        [ "$OUT" = "$exp" ] && echo "PASS" || echo "FAIL: $code got=$OUT expected=$exp"
    ) &
done < _unit_tests.txt
wait
