#!/bin/bash

# Raycast metadata
# @raycast.schemaVersion 1
# @raycast.title edit-dotfiles
# @raycast.mode silent
# @raycast.icon 📝

code ~/dotfiles

# 設定を同期する
git pull
make create_symlink_to_home
make setup_karabiner
make setup_warp

echo "done"
