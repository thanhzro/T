#!/bin/bash
QUERY="$1"
echo "=== T con Rule Engine ==="
echo "Query: $QUERY"
echo ""
echo "--- Matching rules:"
# Search multiple keywords from query
for word in $QUERY; do
    grep -i "$word" ai_rules.txt 2>/dev/null
done | sort -u | head -5
echo ""
echo "--- Related test failures:"
bash _run_tests.sh 2>/dev/null | grep "FAIL" | grep -i "$1" | head -3
echo "========================="
