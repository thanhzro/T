#!/bin/bash
{ time bash -c "timeout 30 ./t_bc tests/intermediate.t 2>/dev/null | sed 's/[[:space:]]*\$//' > _bc_out.txt && diff tests/intermediate.expected _bc_out.txt >/dev/null && echo PASS || echo FAIL"; } 2>&1 | grep -E "PASS|FAIL|real"
