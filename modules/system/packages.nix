{ pkgs, config, pkgs-stable, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
   jq
   vim
   git
   lsd
   bat
   skhd
   tree
   lavat
   zoxide
   fastfetch
   sketchybar
   ghostty-bin

   (import ./_derivations/nicotine.nix { inherit stdenvNoCC; })
   (pkgs.callPackage ./_derivations/z-library.nix {})
  ];
}
