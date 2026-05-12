[T-]
import "lib/basic/std.t"

[T0]
exec(cmd="bash _run_tests.sh 2>/dev/null | grep 'FAIL' | grep -v 'AST bug' | head -5") ~> new_fails
exec(cmd="echo '---learning---' >> ai_rules.txt && echo 'scan: ' >> ai_rules.txt") ~> logged
exec(cmd="wc -l ai_rules.txt | cut -d' ' -f1") ~> rule_count
exec(cmd="date '+%Y-%m-%d %H:%M'") ~> ts

[T+]
show shall(ts, rule_count, new_fails)
