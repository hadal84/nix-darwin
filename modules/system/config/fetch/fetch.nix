{pkgs, config, lib, selfPath, ... }:

{
home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "fastfetch/config.jsonc".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/fetch/config.jsonc";

    "fastfetch/images".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/fetch/images";
    };
  };
}

