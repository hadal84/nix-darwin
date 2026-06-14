{
  pkgs,
  config,
  inputs,
  ...
}:

{
  home.username = "hadal84";
  home.homeDirectory = "/Users/hadal84";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  imports = [
    (inputs.import-tree ./userModules)
    inputs.zen-browser.homeModules.beta
    inputs.spicetify-nix.homeManagerModules.default
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];
}
