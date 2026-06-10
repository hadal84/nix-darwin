{pkgs, config, lib, selfPath, ... }:

{
  home-manager.users.hadal84 = { config, ... }: {
    programs.fastfetch = {
    enable = true;
    package = null;

      settings = let
        r = config.lib.stylix.colors.base0D-rgb-r;
        g = config.lib.stylix.colors.base0D-rgb-g;
        b = config.lib.stylix.colors.base0D-rgb-b;
        keyColor = "38;2;${r};${g};${b}";
        in {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      
      logo = {
        type = "kitty-direct";
        height = 10;
        width = 22;
        source = ./images/nixglass.png; 
        padding = {
          top = 2;
          right = 3;
        };
      };

      display = {
        separator = " •  ";
      };

      modules = [
        "break"
        "break"
        {
          type = "title";
          color = {
            user = keyColor;
            at = keyColor;
            host = keyColor;
          };
        }
        "break"
        {
          type = "os";
          key = "macOS          ";
          keyColor = keyColor;
        }
        {
          type = "kernel";
          key = "darwin         ";
          keyColor = keyColor;
        }
        {
          type = "packages";
          format = "{} (nix-darwin)";
          key = "packages       ";
          keyColor = keyColor;
        }
        {
          type = "shell";
          key = "unix shell     ";
          keyColor = keyColor;
        }
        {
          type = "terminal";
          key = "terminal       ";
          keyColor = keyColor;
        }
        {
          type = "wm";
          format = "omniWM";
          key = "window manager ";
          keyColor = keyColor;
        }
        {
          type = "command";
          key = "nix version    ";
          text = "nix --version | awk '{print $3}'";
          keyColor = keyColor;
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
        "break"
      ];
     };
   };
  };
}
