{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    enableReleaseChecks = false;

    image = ../wallpapers/jules.jpg;
    base16Scheme = ../base16/euphoria/amoled.yaml;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.caskaydia-mono;
        name = "Caskaydia Mono Nerd Font";
      };
      sizes = {
        applications = 18;
      };
    };
  };
}

