{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
       xdg.configFile = {
       "sketchybar/sketchybarrc".source = 
         config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/sketchybar/sketchybarrc";

       "sketchybar/plugins".source = 
         config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/packages/sketchybar/plugins";
       };
   };

   services.sketchybar.enable=true;
}
