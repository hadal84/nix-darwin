{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    enableReleaseChecks = false;

    image = ../wallpapers/jules.jpg;
    base16Scheme = ../euphoria/amoled.yaml;
    polarity = "dark";
  };
}

