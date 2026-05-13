#!/bin/bash
QUERY="$*"
echo "=== T con Intelligence ==="
echo "Query: $QUERY"
echo ""
echo "--- Top matches:"
awk -v q="$QUERY" '
BEGIN {
    n=split(tolower(q),words," ")
}
NF>0 {
    score=0
    line=tolower($0)
    for(i=1;i<=n;i++) {
        if(length(words[i])>=3 && index(line,words[i])>0)
            score++
    }
    if(score>0) print score"|"$0
}
' ai_rules.txt | sort -rn | head -5 | while IFS='|' read -r s r; do
    echo "[$s] $r"
done
echo "========================="
