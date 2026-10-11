#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/analyze.sh FILE" | tr -d '\r'
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: file $FILE does not exist" | tr -d '\r'
    exit 1
fi

ERROR_COUNT=$(grep -c "ERROR" "$FILE")
TOP_CODE=$(awk '{print $NF}' "$FILE" | awk -F= '{print $2}' | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

echo "Total ERROR: $ERROR_COUNT" | tr -d '\r'
echo "Top Code: $TOP_CODE" | tr -d '\r'
