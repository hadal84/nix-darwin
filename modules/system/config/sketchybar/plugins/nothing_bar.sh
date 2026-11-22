#!/bin/sh
osascript <<'EOF'
tell application "System Events" to tell process "NothingBar"
  click menu bar item 1 of menu bar 2
  if (count of windows) > 0 then
    set {x, y} to position of window 1
    set position of window 1 to {x, 45}
  end if
end tell
EOF
