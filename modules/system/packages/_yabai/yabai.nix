{pkgs, config, lib, selfPath, ... }:

{
    services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    extraConfig = builtins.readFile ./yabairc;
  };
}

