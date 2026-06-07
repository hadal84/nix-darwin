{pkgs, config, lib, selfPath, ... }:

{
  home-manager.users.hadal84 = { config, ... }: {
    programs.ghostty = {
      enable = true;
      package = null;
      settings = {
        config-file = "options.ghostty";
      };
    };

    xdg.configFile = {
    "ghostty/options.ghostty".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/ghostty/options.ghostty";
    };

    stylix.targets.ghostty.enable = true;
  };
}

