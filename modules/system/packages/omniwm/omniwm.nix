{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
       xdg.configFile = {
       "omniwm/settings.toml".source = 
         config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/omniwm/settings.toml";
       };
   };
}
