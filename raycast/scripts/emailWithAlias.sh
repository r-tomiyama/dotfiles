#!/bin/bash

# Raycast metadata
# @raycast.schemaVersion 1
# @raycast.title email-with-alias
# @raycast.mode silent
# @raycast.icon ✉️

email="ryoko.tomiyama+$(date +%Y%m%d%H%M%S)@workside.co.jp"
echo "$email" | pbcopy

osascript -e 'tell application "System Events" to keystroke "v" using command down'

echo "クリップボードに保存し、ペーストしました: $email"
