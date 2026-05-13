#!/bin/bash
FAILS=${FAILS:-$(bash _run_tests.sh 2>/dev/null | grep "FAIL.*mismatch")}

# Process everything with awk - fast single pass
{
    echo "$FAILS"
    [ -f _train_log.txt ] && cat _train_log.txt
} | awk -v rules="$(cat ai_rules.txt)" '
/FAIL [a-z_]+ →|FAIL [a-z_]+ output/ {
    match($0, /FAIL ([a-z_]+)/, a)
    func=a[1]
    if(func && index(rules,"mismatch: "func)==0) {
        match($0, /at: (.*)/, b)
        rule="mismatch: "func" output differs t_bc vs AST - check "b[1]
        print rule >> "ai_rules.txt"
        rules=rules"\n"rule
        print "T con learned: "rule
    }
}
/^\[/ {
    match($0, /\[(\w+)\]/, a); func=a[1]
    sub(/.*→ */,""); rule=$0
    nr="tcon_learned: "func" → "rule
    if(func && index(rules,"tcon_learned: "func)==0) {
        rules=rules"\n"nr
    }
}
END { print "Rules total: " (system("wc -l < ai_rules.txt")+0) }
'
