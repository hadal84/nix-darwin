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

         export BASE00="0xAA${colors.base00}"       
         export BASE01="0xff${colors.base01}"    
         export BASE02="0xff${colors.base02}"    
         export BASE03="0xff${colors.base03}"     
         export BASE04="0xff${colors.base04}"   
         export BASE05="0xff${colors.base05}"       
         export BASE06="0xff${colors.base06}"       
         export BASE07="0xff${colors.base07}" 
         export BASE08="0xff${colors.base08}" 
         export BASE09="0xff${colors.base09}" 

         export BASE0A="0xff${colors.base0A}"
         export BASE0B="0xff${colors.base0B}"
         export BASE0C="0xff${colors.base0C}"
         export BASE0D="0xff${colors.base0D}"
         export BASE0E="0xff${colors.base0E}"
         export BASE0F="0xff${colors.base0F}"
         '';
       };
   };

   services.sketchybar.enable=true;
 }
