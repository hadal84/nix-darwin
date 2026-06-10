#!/usr/bin/env bash

export PATH="$HOME/.local/bin:/opt/homebrew/bin:/run/current-system/sw/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/OmniWM.app/Contents/MacOS:$PATH"

SID=$1

if [ "$SENDER" = "mouse.clicked" ]; then
    omniwmctl command switch-workspace "$SID"
    exit 0
fi

if [ "$SID" = "$TARGET_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
else
    sketchybar --set "$NAME" background.drawing=off
fi
