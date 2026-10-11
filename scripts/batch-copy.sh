#!/bin/bash
DEST="$1"
for file in "${@:2}"
do
  cp "$file" "$DEST"
done
