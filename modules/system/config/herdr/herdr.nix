{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
       xdg.configFile = {
           "herdr/config.toml" = {
               source = config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/herdr/config.toml";
               force = true;
           };
       };
   };
}
