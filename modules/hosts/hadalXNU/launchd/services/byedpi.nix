{ pkgs, inputs, ... }:

let
  byedpi-master = inputs.nixpkgs-master.legacyPackages.${pkgs.stdenv.hostPlatform.system}.byedpi;
in
{
  launchd.user.agents.byedpi = {
    serviceConfig = {
      ProgramArguments = [ 
        "${byedpi-master}/bin/ciadpi" 
        "-i" "127.0.0.1" 
        "-p" "1080" 
        "-r" "1+s"
      ];
      RunAtLoad = true;
      KeepAlive = true;
      StandardErrorPath = "/tmp/byedpi.err.log";
      StandardOutPath = "/tmp/byedpi.out.log";
    };
  };
}
