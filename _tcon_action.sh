#!/bin/bash
FUNC=$1
RULE=$2

# Match rule to action
case "$RULE" in
    *"native missing"*|*"not in t_bc"*)
        echo "ACTION: add_native"
        bash _tcon_add_native.sh "$FUNC" 2>/dev/null
        ;;
    *"Gate.*undefined"*|*"isNumber(undefined)"*)
        echo "ACTION: fix_gate"
        bash _tcon_autofix.sh "$FUNC" 2>/dev/null
        ;;
    *"array-in-func"*)
        echo "ACTION: add_native"
        bash _tcon_add_native.sh "$FUNC" 2>/dev/null
        ;;
    *"T lib"*|*"tlib_only"*)
        echo "ACTION: diagnose_deps"
        bash _tcon_diagnose.sh "$FUNC" 2>/dev/null | tail -3
        ;;
    *)
        echo "ACTION: unknown - skip"
        ;;
esac
