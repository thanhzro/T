#!/bin/bash
FUNC=$1
echo "=== T con diagnose: $FUNC ==="

# Step 1: Check if native exists
echo "--- Native registration:"
grep "\"$FUNC\"" src/t_natives.h | head -3

# Step 2: Check T lib implementation  
echo "--- T lib location:"
grep -rn "^func $FUNC" lib/ 2>/dev/null | head -3

# Step 3: Check ai_rules for known issues
echo "--- Known rules:"
bash _tcon_intel.sh "$FUNC" 2>/dev/null | grep "\[" | head -3

# Step 4: Quick test
echo "--- Test result:"
grep -A5 "^func $FUNC" lib/basic/*.t lib/intermediate/*.t 2>/dev/null | head -6
