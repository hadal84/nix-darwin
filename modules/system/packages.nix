{ pkgs, config, ... }:

{
  imports = [
    ./fonts.nix
    ./homebrew.nix

    ./packages/zsh/zsh.nix
    ./packages/fetch/fetch.nix
    ./packages/skhd/skhd.nix
    ./packages/sketchybar/sketchybar.nix
    ./packages/yabai/yabai.nix
    ./packages/ghostty/ghostty.nix
  ];

  environment.systemPackages = with pkgs; [
   jq
   vim
   git
   lsd
   bat
   skhd
   yabai
   zoxide
   fastfetch
   sketchybar
   ghostty-bin
  ];
}
