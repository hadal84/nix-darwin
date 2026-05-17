{ pkgs, config, inputs, ... }:

{
  imports = [
    ./packages/ghostty/ghostty.nix
    ./packages/zellij/zellij.nix
  ];

  homebrew = {
    enable=true;

    casks = [
     "ghostty"
     "omniwm"
    ];

    brews = [
     "pure"
     "zellij"
    ];

   taps = builtins.attrNames config.nix-homebrew.taps; 

 };
}
