{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
     xdg.configFile = {
       "bat/config".source =
       config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/bat/config";
     };

     programs.bat = {
       enable = true;
       package = pkgs.bat;
     };

     stylix.targets.bat.enable = true;
   };
}

