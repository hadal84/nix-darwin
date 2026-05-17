{ config, pkgs, ... }:

{
  home.username = "hadal84";
  home.homeDirectory = /Users/hadal84;
  home.stateVersion = "25.11"; 
  programs.home-manager.enable = true;
  imports = [
    ./userModules/packages.nix
  ];
}
