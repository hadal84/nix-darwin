{ pkgs, config, ... }:

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
  ];
}
