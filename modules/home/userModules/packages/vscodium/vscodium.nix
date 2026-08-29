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
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "update.mode" = "none";
      };

      extensions = [
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ibm.zopeneditor
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.zowe.vscode-extension-for-zowe
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.wpilibsuite.vscode-wpilib
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ms-toolsai.jupyter
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ms-python.python
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ms-python.vscode-python-envs
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.ms-python.debugpy
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.leanprover.lean4
        inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace.tamasfe.even-better-toml
      ];
    };
  };
  stylix.targets.vscodium = {
    enable = true;
    colors.enable = true;
  };
}
