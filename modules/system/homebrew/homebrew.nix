{
  pkgs,
  config,
  inputs,
  ...
}:

{
  homebrew = {
    enable = true;

    casks = [
      "omniwm"
      "alfred"
      "affinity"
      "android-studio"
      "arduino-ide"
      "balenaetcher"
      "android-file-transfer"
      "thunderbird"
      "blender"
      "grandperspective"
      "keka"
      "localsend"
      "prismlauncher"
      "qgis"
      "transmission"
      "utm"
      "zotero"
      "whatsapp"
      "kicad"
      "bambu-studio"
      "crystalfetch"
      "freecad"
      "fuse-t"
      "bitwarden"
      "ente"
      "kid3"
      "libreoffice"
      "whatcable"
      "obs"
      "raspberry-pi-imager"
      "stremio"
      "ungoogled-chromium"
      "vlc"
      "reaper"
      "robloxstudio"
      "roblox"
      "vesktop"
      "appcleaner"
      "electrum-ltc"
      "electrum"
      "monero-wallet"
      "heroic" # exclusively for slime rancher
      "intellij-idea" 
    ];

    brews = [
      "pure"
      "mingw-w64"
    ];

    masApps = {
     "DaVinci Resolve" = 571213070;
     "Goodnotes" = 1444383602;
    };

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true; # change to true when issue is resolved
      extraFlags = [
        "--force-cleanup"
      ];
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
