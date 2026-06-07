{pkgs, config, lib, selfPath, ... }:

let
  colors = config.lib.stylix.colors;
in
{
   home-manager.users.hadal84 = { config, ... }: {
       xdg.configFile = {
       "sketchybar/sketchybarrc".source = 
         config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/sketchybar/sketchybarrc";

       "sketchybar/plugins".source = 
         config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/sketchybar/plugins";

       "sketchybar/colors.sh".text = '' 
         #!/usr/bin/env bash

         export BAR="0xAA${colors.base00}"       
         export SURFACE="0xff${colors.base01}"    
         export BORDER="0xff${colors.base03}"     

         export TEXT_DIM="0xff${colors.base04}"   
         export TEXT="0xff${colors.base05}"       
         export TEXT_BRIGHT="0xff${colors.base07}" 

         export ACCENT_SYS="0xff${colors.base0C}"
         export ACCENT_PWR="0xff${colors.base0B}"
         export ACCENT_ERR="0xff${colors.base08}"
         export ACCENT_WRN="0xff${colors.base09}"

         export ACCENT_PRM="0xff${colors.base0D}"
         export ACCENT_SEC="0xff${colors.base0E}"

         '';
       };
   };

   services.sketchybar.enable=true;
 }
