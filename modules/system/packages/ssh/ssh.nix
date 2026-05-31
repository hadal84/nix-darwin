{ config, pkgs, age,... }:

{
  age.secrets.github-ssh-key = {
    file = ../../../../secrets/github-ssh-key.age;
    owner = "hadal84"; 
    group = "staff";
    mode = "0600";
  };

  home-manager.users.hadal84 = { config, osConfig, ... }: {
    home.file.".ssh/id_ed25519".source =
      config.lib.file.mkOutOfStoreSymlink osConfig.age.secrets.github-ssh-key.path;
  };  
}
