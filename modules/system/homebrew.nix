{ pkgs, config, inputs, ... }:

{
    homebrew = {
    enable=true;

    casks = [
     "omniwm"
     "alfred"
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
     "fuse-t"
     "grandperspective"
     "keka"
     "kid3"
     "kicad"
     "libreoffice"
     "localsend"
     "obs"
     "obsidian"
     "prismlauncher"
     "qgis"
     "raspberry-pi-imager"
     "stremio"
     "tor-browser"
     "transmission"
     "utm"
     "vlc"
     "zotero"
     "whatsapp"
     "zen"
    ];

    brews = [
     "pure"
     "zellij"
     "nicotine-plus"
    ];

    masApps = {
      "DaVinci Resolve" = 571213070;
      "Goodnotes" = 1444383602;
    };

    onActivation = {
      cleanup = "zap";
      
      extraFlags = [
        "--force-cleanup"
      ];
    };

    taps = builtins.attrNames config.nix-homebrew.taps; 
 };
}
