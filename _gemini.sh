#!/bin/bash
KEY=$(cat .env | cut -d'=' -f2)
CONTEXT="T language basics:
- T- = past/imports/declarations
- T0 = present/execution
- T+ = future/output via show shall()
- show X = print X
- F(arr) { body } = loop over array"
QUESTION=$(cat "$1")
PROMPT="$CONTEXT

Question: $QUESTION"
curl -s "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$KEY" \
  -H "Content-Type: application/json" \
  -d "{\"contents\":[{\"parts\":[{\"text\":$(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$PROMPT")}]}]}" \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['candidates'][0]['content']['parts'][0]['text'])"
