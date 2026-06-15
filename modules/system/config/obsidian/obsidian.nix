{
  pkgs,
  config,
  lib,
  selfPath,
  ...
}:

{
  home-manager.users.hadal84 =
    { config, ... }:
    {
      programs.obsidian = {
        enable = true;
        cli.enable = true;
        package = null;

        defaultSettings = {
          app = {
            showInlineTitle = false;
          };
        };

        vaults = {
          "obsidian" = {
            target = "zumrutKitaplik/obsidian";
          };
        };
      };

      stylix.targets.obsidian = {
        enable = true;
        vaultNames = [ "obsidian" ];
      };
    };
}
