{ pkgs, config, ... }:

{
  system.defaults.dock.persistent-apps = [
    "/Applications/Zen.app"
    "/Applications/Emacs.app"
    "/Applications/Nix Apps/Ghostty.app"
    "/Applications/Obsidian.app"
    "/Applications/Spotify.app"
    "/Applications/Thunderbird.app"
    "/Applications/Affinity.app"
    "/Applications/DaVinci Resolve.app" 
    "/Applications/Google Drive.app"
    "/Applications/UTM.app"
    "/Applications/Stremio.app"
    "/Applications/LibreOffice.app"
    "/Applications/LocalSend.app"
    "/System/Applications/Preview.app"
    "/Applications/OBS.app"
    "/Applications/Prism Launcher.app"
    "/Applications/Blender.app"
    "/Applications/Zotero.app"
    "/Applications/Goodnotes.app"
    "/System/Applications/Utilities/Activity Monitor.app"
    "/Applications/KiCad/KiCad.app"
    "/Applications/FreeCAD.app"
  ];
}
