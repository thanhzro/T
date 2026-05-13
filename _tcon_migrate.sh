#!/bin/bash
echo "=== Migrating from ./t to ./t_bc ==="

# Check which scripts still use ./t
echo "--- Scripts using ./t:"
grep -rl "\./t " . --include="*.sh" --include="*.py" | grep -v ".git" | head -10

echo "--- Test files using ./t as reference:"
grep -l "\./t " _run_test.sh _tcon_report.sh 2>/dev/null
