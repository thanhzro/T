#!/bin/bash
TESTS=(
    "safe_div:import \"lib/basic/std.t\":safe_div(a=10, b=2) ~> O1:5"
    "str_reverse:import \"lib/basic/std.t\":str_reverse(str=\"hello\") ~> O1:olleh"
    "is_blank:import \"lib/basic/std.t\":is_blank(str=\"  \") ~> O1:1"
    "capitalize:import \"lib/basic/std.t\"
import \"lib/intermediate/std.t\":capitalize(str=\"hello\") ~> O1:Hello"
)
for test in "${TESTS[@]}"; do
    IFS=: read func imp code expected <<< "$test"
    cat > _tcon_tmp.t << TEND
[T-]
import $imp

[T0]
$code

[T+]
show shall(O1)
TEND
    OUT=$(timeout 2 ./t_bc _tcon_tmp.t 2>/dev/null)
    STATUS="✓"; [ "$OUT" != "$expected" ] && STATUS="✗"
    echo "$STATUS $func: got='$OUT' expected='$expected'"
done &
wait
