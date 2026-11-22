tell application "System Events"
    set activeApp to name of first application process whose frontmost is true
    
    tell process activeApp
        click menu bar item 1 of menu bar 1
    end tell
end tell
