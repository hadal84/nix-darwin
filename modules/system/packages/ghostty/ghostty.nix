{pkgs, config, lib, selfPath, ... }:

{
  home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "ghostty/config.ghostty".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/ghostty/config.ghostty";
    };
  };
}

