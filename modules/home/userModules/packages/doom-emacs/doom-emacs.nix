{ inputs, nixpkgs, home-manager, config, pkgs, selfPath, ... }: 

let

stablePkgs = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system};

in

{
  programs.doom-emacs = {
    enable = true;
    emacs = stablePkgs.emacs;
    doomDir = ./doom.d;
    extraPackages = epkgs: [
      epkgs.base16-theme
      epkgs.treesit-grammars.with-all-grammars
    ];
  };

  services.emacs = {
    enable = true;
  };

  home.file.".config/doom/base16-stylix-theme.el".text = with config.lib.stylix.colors.withHashtag; ''
    (deftheme base16-stylix "Stylix auto-generated theme.")
    (require 'base16-theme)
    (base16-theme-define 'base16-stylix
      '(:base00 "${base00}" :base01 "${base01}" :base02 "${base02}" :base03 "${base03}"
        :base04 "${base04}" :base05 "${base05}" :base06 "${base06}" :base07 "${base07}"
        :base08 "${base08}" :base09 "${base09}" :base0A "${base0A}" :base0B "${base0B}"
        :base0C "${base0C}" :base0D "${base0D}" :base0E "${base0E}" :base0F "${base0F}"))
    (provide 'base16-stylix-theme)
  '';

  home.file.".config/doom/nix-paths.el".text = ''
  (setenv "DICPATH" "${pkgs.hunspellDicts.en-us}/share/hunspell:${pkgs.hunspellDicts.tr-tr}/share/hunspell") 
  
  (after! ispell
    (setq ispell-program-name "${pkgs.hunspell}/bin/hunspell"
          ispell-dictionary "en_US"))
  '';

  xdg.configFile = {
    "doom/img".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/home/userModules/packages/doom-emacs/doom.d/img";
  };
}
