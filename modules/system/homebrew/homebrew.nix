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
      "clash-verge-rev"
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
      "tor-browser"
      "ungoogled-chromium"
      "vlc"
      "robloxstudio"
      "roblox"
    ];

    brews = [
      "pure"
      "zellij"
      "nicotine-plus"
    ];

    masApps = {
      "DaVinci Resolve" = 571213070;
      "Goodnotes" = 1444383602;
      "WireGuard" = 1451685025;
    };

    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = true;
      extraFlags = [
        "--force-cleanup"
      ];
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
