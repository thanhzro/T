#!/bin/bash
# T con auto-diagnose and learn from failures
python3 check_runtime.py 2>/dev/null | grep "^FAIL" | while IFS= read -r line; do
    FUNC=$(echo "$line" | grep -oP '\w+(?=\()' | head -1)
    [ -z "$FUNC" ] && continue
    
    # Auto-diagnose
    NATIVE=$(grep "\"$FUNC\"" src/t_natives.h 2>/dev/null | head -1)
    TLIB=$(grep -rn "^func $FUNC" lib/ 2>/dev/null | head -1)
    DEPS=$(grep -A8 "^func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | grep "~>" | grep -oP '\w+(?=\()' | head -3 | tr '\n' ',')
    
    if [ -z "$NATIVE" ] && [ -z "$TLIB" ]; then
        RULE="missing: $FUNC not in natives or T lib - needs implementation"
    elif [ -z "$NATIVE" ] && [ -n "$TLIB" ]; then
        RULE="tlib_only: $FUNC in T lib depends on: $DEPS - check if deps work in t_bc"
    else
        RULE="native_exists: $FUNC registered but failing - check param passing"
    fi
    
    if ! grep -q "auto: $FUNC" ai_rules.txt; then
        echo "auto: $RULE" >> ai_rules.txt
        echo "T con learned: $RULE"
    fi
done
echo "Rules: $(wc -l < ai_rules.txt)"
