#!/bin/bash

# Raycast metadata
# @raycast.schemaVersion 1
# @raycast.title edit-dotfiles
# @raycast.mode silent
# @raycast.icon 📝

code ~/dotfiles

# 設定を同期する
git pull

echo "done"
