{pkgs, config, lib, selfPath, ... }:

{
   home-manager.users.hadal84 = { config, ... }: {
     programs.btop = {
       enable = true;
       package = pkgs.btop;
       settings = {
         theme_background = false;
         vim_keys = false;
       };
     };

     stylix.targets.btop.enable = true;
   };
}

