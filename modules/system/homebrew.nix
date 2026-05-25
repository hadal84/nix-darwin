{ pkgs, config, inputs, ... }:

{
    homebrew = {
    enable=true;
    onActivation.cleanup = "zap"; # enforce strict declerativity

    casks = [
     "omniwm"
    ];

    brews = [
     "pure"
     "zellij"
    ];

    taps = builtins.attrNames config.nix-homebrew.taps; 

 };
}
