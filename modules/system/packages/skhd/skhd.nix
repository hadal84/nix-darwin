{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
       xdg.configFile = {
       "skhd/skhdrc".source =
       config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/skhd/skhdrcOmniWM";
     };
   };

   services.skhd.enable=true;
}

