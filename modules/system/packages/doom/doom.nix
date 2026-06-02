{pkgs, config, lib, selfPath, inputs, ... }:

{

  home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "doom".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/doom/doom.d";
    };

    home.file.".config/emacs".source = inputs.doomemacs-src;
  };
}

