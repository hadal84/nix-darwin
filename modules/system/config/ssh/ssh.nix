{ config, pkgs, selfPath, ... }:

{
  age.secrets.github-ssh-key = {
    file = ../../../../secrets/github-ssh-key.age;
    owner = "hadal84"; 
    group = "staff";
    mode = "0600";
    path = "/Users/hadal84/.ssh/id_ed25519";
  };

  age.secrets.phenoxide-ssh-key = {
    file = ../../../../secrets/phenoxide-ssh-key.age;
    owner = "hadal84";
    mode = "0600";
    path = "/Users/hadal84/.ssh/phenoxide.key";
  };

  age.secrets.ssh-config = {
    file = ../../../../secrets/ssh-config.age;
    owner = "hadal84";
    mode = "0600";
    path = "/Users/hadal84/.ssh/config";
  };
}
