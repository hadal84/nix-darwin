{ pkgs, config, inputs, ... }:

{
    homebrew = {
    enable=true;
    onActivation.cleanup = "zap"; # enforce strict declerativity

    casks = [
     "omniwm"
     "affinity"
     "android-file-transfer"
     "android-studio"
     "arduino-ide"
     "balenaetcher"
     "bambu-studio"
     "thunderbird"
     "bitwarden"
     "blender"
     "clash-verge-rev"
     "crystalfetch"
     "emacs-plus-app"
     "ente"
     "freecad"
     "google-drive"
     "grandperspective"
     "keka"
     "kid3"
     "kicad"
     "libreoffice"
     "localsend"
     "obs"
     "obsidian"
     "prismlauncher"
     "proton-mail-bridge"
     "qgis"
     "raspberry-pi-imager"
     "spotify"
     "stremio"
     "tor-browser"
     "transmission"
     "utm"
     "vlc"
     "zotero"
    ];

    brews = [
     "pure"
     "zellij"
     "nicotine-plus"
    ];

    taps = builtins.attrNames config.nix-homebrew.taps; 

 };
}
