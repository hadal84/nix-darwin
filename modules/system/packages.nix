{ pkgs, config, ... }:

{
  imports = [
    ./fonts.nix
    ./homebrew.nix
    ./packages/zsh/zsh.nix
    ./packages/fetch/fetch.nix
  ];

  environment.systemPackages = with pkgs; [
   vim
   git
   lsd
   bat
   zoxide
   fastfetch
  ];
}
