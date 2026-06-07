{pkgs, config, lib, selfPath, ... }:

{
home-manager.users.hadal84 = { config, ... }: {
    programs.vesktop = {
      enable=true;
      package=null;
    };

    stylix.targets.vesktop = {
      enable=true;
    };
  };
}
