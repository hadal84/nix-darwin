{pkgs, config, lib, selfPath, ... }:

{
  programs.zsh.enable = true;

  home-manager.users.hadal84 = { config, ... }: {
    home.file.".zshrc".source = 
      config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/zsh/zshrc";

    home.file.".hushlogin" = {
    text = "";
    executable = false; 
    };
  };
}
