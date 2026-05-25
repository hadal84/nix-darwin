#!/usr/bin/env bash

if [ "$1" = "$TARGET_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on
else
    sketchybar --set "$NAME" background.drawing=off
fi
