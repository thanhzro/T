#!/bin/bash
echo "=== T Con Army Demo ==="
echo ""
echo "1. Current state:"
cat scores/worker_test.score
echo " tests passed in last cycle"
echo ""
echo "2. Breaking lower() function..."
python3 -c "
c=open('lib/basic/string.t').read()
open('lib/basic/string.t','w').write(c.replace('O1 + 32','O1 + 99'))
"
echo "Done. Tests now failing:"
python3 check_runtime.py 2>&1 | grep "^FAIL"
echo ""
echo "3. Running T con army self-heal..."
./t_bc lib/advanced/worker_analyze.t 2>/dev/null
./t_bc lib/advanced/worker_fix_from_rules.t 2>/dev/null
echo ""
echo "4. After self-heal:"
python3 check_runtime.py 2>&1 | grep "^FAIL" || echo "ALL PASS - Army fixed the bug!"
