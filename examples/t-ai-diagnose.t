[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="echo 'SYMPTOM: function returns wrong value in t_bc'") ~> symptom
exec(cmd="grep -i 'native\|port\|missing' ai_rules.txt | head -5") ~> rules
exec(cmd="bash _run_tests.sh 2>/dev/null | grep FAIL | head -5") ~> fails
exec(cmd="bash _tcon_scan_src.sh 2>/dev/null | tail -5") ~> risks

[T+]
show shall(symptom, rules, fails, risks)
