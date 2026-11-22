{ inputs, config, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "hadal84";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "bestk1ngarthur/homebrew-nothingbar" = inputs.nothing-bar;
    };
    trust = {
      formulae = [

      ];
      casks = [
      ];
      commands = [

      ];
      taps = [
      ];
    };
    mutableTaps = false;
  };

  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
}
