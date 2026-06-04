{pkgs, config, lib, selfPath, ... }:

{
home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "zellij/config.kdl".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/zellij/config.kdl";

    "zellij/themes".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/zellij/themes";

    "zellij/layouts".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/zellij/layouts";
    };
  };
}
