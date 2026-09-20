{ pkgs, config, inputs, ... }:

let

  stablePkgs = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system};

in

{
  launchd.user.agents.emacs-macport = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-W" # Block until the app exits
        "/Users/hadal84/Applications/Home Manager Apps/Emacs.app"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/tmp/emacs-macport.out.log";
      StandardErrorPath = "/tmp/emacs-macport.err.log";
    };
  };
}
