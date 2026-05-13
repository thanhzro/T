#!/bin/bash
# T con auto-fix pipeline: diagnose → generate fix → verify → commit
FUNC=$1

# Step 1: Diagnose
OUT=$(bash _tcon_fix.sh "$FUNC" 2>/dev/null)
ACTUAL=$(echo "$OUT" | grep "Output:" | cut -d"'" -f2)
echo "=== T con autofix: $FUNC = '$ACTUAL' ==="

# Step 2: Check known fix patterns from ai_rules
RULE=$(bash _tcon_intel.sh "$FUNC undefined gate default" 2>/dev/null | grep "\[" | head -1)
echo "Rule: $RULE"

# Step 3: Apply fix based on pattern
if echo "$RULE" | grep -q "Gate.*undefined"; then
    # Pattern: Gate undefined → add default value before Gate
    FUNC_FILE=$(grep -rln "^func $FUNC" lib/ 2>/dev/null | head -1)
    if [ -n "$FUNC_FILE" ]; then
        echo "Applying: add default before Gate in $FUNC_FILE"
        # Backup
        cp "$FUNC_FILE" "${FUNC_FILE}.bak"
        # Fix applied by T con
        python3 -c "
import re,sys
with open('$FUNC_FILE') as f: c=f.read()
# Find func and add 0>>out before Gate>>out
c=re.sub(r'(func $FUNC[^{]*\{[^}]*?)Gate (\w+) \(== 0\) >> out', r'\g<1>0 >> out\n    Gate \2 (== 0) >> out', c, flags=re.DOTALL)
new_c=re.sub(r'(func $FUNC[^{]*\{[^}]*?)Gate (\w+) \(== 0\) >> out', r'\g<1>0 >> out\n    Gate \2 (== 0) >> out', c, flags=re.DOTALL)
if new_c!=c:
    open('$FUNC_FILE','w').write(new_c)
    print('Fixed')
else:
    print('No match - different pattern')
"
        # Step 4: Verify
        bash _tcon_verify.sh 2>/dev/null | grep "Unit:"
    fi
fi
