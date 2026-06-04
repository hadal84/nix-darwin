{pkgs, config, lib, selfPath, ... }:

{
  home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "wezterm/wezterm.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/wezterm/wezterm.lua";
    };
  };
}

