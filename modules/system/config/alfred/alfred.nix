{ config, pkgs, selfPath, ... }:

{
    home-manager.users.hadal84 = { config, osConfig, ... }: {
    home.file."Library/Application Support/Alfred/Alfred.alfredpreferences".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/alfred/Alfred.alfredpreferences";
  };
}
