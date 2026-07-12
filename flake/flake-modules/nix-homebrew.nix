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
      "barutsrb/homebrew-tap" = inputs.homebrew-barutsrb;
    };
    trust = {
      formulae = [

      ];
      casks = [
        "barutsrb/tap/omniwm"
      ];
      commands = [

      ];
      taps = [
        "barutsrb/tap"
      ];
    };
    mutableTaps = false;
  };

  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
}
