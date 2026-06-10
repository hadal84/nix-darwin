{pkgs, config, lib, selfPath, ... }:

{
home-manager.users.hadal84 = { config, ... }: {
    xdg.configFile = {
    "cava/shaders".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/cava/shaders";

    "cava/themes".source =
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/cava/themes";
    };

    programs.cava = {
      enable=true;
      package=null;
      settings = {
        general = {
          "live-config" = 1; # Quoted because of the hyphen
          framerate = 120;
          bars = 0;
          center_align = 1;
        };

        input = {
          method = "coreaudio";
          source = "tap";
        };

        output = {
          method = "ncurses";
        };

        smoothing = {
          monstercat = 1;
          waves = 0;
          noise_reduction = 77;
        };
      };
    };

    stylix.targets.cava = {
      enable=true;
      colors.enable=true;
      rainbow.enable = true;
    };
  };
}
