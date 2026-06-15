{
  inputs,
  pkgs,
  config,
  lib,
  selfPath,
  ...
}:

/*
  in my specific setup, vscodium is extensively used for corporate bullshit [including, but not limited to
                                                                               ibm z/os
                                                                               first robotics competition
                                                                               jupyter notebooks]
  and my personal work uses doom emacs. so therefore this part of the configuration includes random extensions from many random flakes.
*/

{
  home-manager.users.hadal84 =
    { config, pkgs, ... }:
    {
      programs.vscodium = {
        enable = true;
        package = null;

        profiles.default = {
          userSettings = {
            "telemetry.telemetryLevel" = "off";
            "update.mode" = "none";
          };

          extensions = [
            inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ibm.zopeneditor
            inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.zowe.vscode-extension-for-zowe
            inputs.frc-nix.packages.${pkgs.stdenv.hostPlatform.system}.vscode-wpilib
          ];
        };
      };
      stylix.targets.vscodium = {
        enable=true;
        colors.enable = true;
      };
    };
}
