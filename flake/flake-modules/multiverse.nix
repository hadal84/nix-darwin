{ inputs, pkgs, selfPath, ... }:

{
  imports = [ inputs.multiverse.nixosModules.default ];

  multiverse = {
    enable = true;
    config.allowUnfree = true;

    pins = {
      emacs-macport = "29.4";
    };
  };
}
