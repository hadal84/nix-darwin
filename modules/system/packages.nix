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
   delta
   rsync
   zoxide
   fastfetch
   sketchybar
   ghostty-bin
   darwin.trash

   (import ./_derivations/nicotine.nix { inherit stdenvNoCC; })
   (pkgs.callPackage ./_derivations/z-library.nix {})
  ];
}
