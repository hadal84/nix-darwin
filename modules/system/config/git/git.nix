{pkgs, config, lib, selfPath, ... }:

{
  home-manager.users.hadal84 = { config, ... }: {
    home.file.".gitconfig".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/git/gitconfig";
   };
}

