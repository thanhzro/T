#!/bin/bash
echo "=== Generating rules from git history ==="
git log --oneline | grep -i "fix\|bug\|revert\|restore" | head -20 | while read hash msg; do
    # Extract pattern from commit message
    echo "git_fix: $msg" >> ai_rules.txt
    echo "Added: $msg"
done
echo "Rules total: $(wc -l < ai_rules.txt)"
