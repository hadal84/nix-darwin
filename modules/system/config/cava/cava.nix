{pkgs, config, lib, selfPath, ... }:

{
home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "cava/config".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/cava/config";

    "cava/shaders".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/cava/shaders";

    "cava/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/cava/themes";
    };
  };
}
