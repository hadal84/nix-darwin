{
  inputs,
  pkgs,
  config,
  lib,
  selfPath,
  ...
}:

{
  nixpkgs.overlays = [ inputs.obsidian-extensions.overlays.default ];

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
            settings = {
              app.vimMode = true;
              cssSnippets = [
                {
                  name = "hide-scrollbar";
                  text = ''
                    ::-webkit-scrollbar { display: none; }
                    .cm-scroller, .markdown-preview-view { scrollbar-width: none; }
                  '';
                }
              ];
              communityPlugins = with pkgs.obsidianPlugins; [
                table-editor-obsidian
                obsidian-full-calendar
                obsidian-tasks-plugin
                hybrid-line-numbers
              ];
            };
          };
        };
      };

      stylix.targets.obsidian = {
        enable = true;
        vaultNames = [ "obsidian" ];
      };
    };
}
